DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0持仓盈亏查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0HoldingPandL;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0HoldingPandL(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_init_date int,
    IN p_query_opor_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    select

    /* t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号}, */
    t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no,

    /* SUM(t.{当前数量}) as {当前数量}, */
    SUM(t.curr_qty) as curr_qty,

    /* SUM(t.{开仓市值}) as {开仓市值}, */
    SUM(t.open_posi_value) as open_posi_value,

    /* SUM(t.{平仓数量}) as {平仓数量}, */
    SUM(t.close_posi_qty) as close_posi_qty,

    /* SUM(t.{平仓市值}) as {平仓市值}, */
    SUM(t.close_posi_market_value) as close_posi_market_value,

    /* SUM(t.{实现盈亏}) as {实现盈亏}, */
    SUM(t.realize_pandl) as realize_pandl,

    /* SUM(t.{隔夜盈亏}) as {隔夜盈亏}, */
    SUM(t.over_night_pandl) as over_night_pandl,

    /* SUM(t.{开仓市值} + t.{平仓市值}) as {交易金额}, */
    SUM(t.open_posi_value + t.close_posi_market_value) as trade_amt,

    /* SUM(case when t.{多空类型}=1 then t.{当前数量}- t.{平仓数量} when t.{多空类型}=2 then -1*(t.{当前数量}- t.{平仓数量}) end) as {持仓数量}, */
    SUM(case when t.lngsht_type=1 then t.curr_qty- t.close_posi_qty when t.lngsht_type=2 then -1*(t.curr_qty- t.close_posi_qty) end) as posi_qty,

    /* SUM(t.{当前数量} - t.{平仓数量}) as {未平仓数量}, */
    SUM(t.curr_qty - t.close_posi_qty) as un_close_posi_qty,

    /* SUM(t.{当前数量}+if(t.{持仓状态}=3,0,t.{平仓数量})) as {交易数量}, */
    SUM(t.curr_qty+if(t.posi_status=3,0,t.close_posi_qty)) as trade_qty,

    /* SUM(t.{开仓费用}+t.{平仓费用}) as {全部费用}, */
    SUM(t.open_posi_fee+t.close_posi_fee) as all_fee,

    /* IFNULL(SUM(t.{实现盈亏}) / sum(t.{平仓市值}),0) as {收益率}, */
    IFNULL(SUM(t.realize_pandl) / sum(t.close_posi_market_value),0) as yield_rate,

    /* SUM(t.{实现盈亏}+t.{隔夜盈亏}) as {累计实现盈亏} */
    SUM(t.realize_pandl+t.over_night_pandl) as sum_realize_pandl

    /* from ~报表_资管报表_T0_证券持仓明细表^ t where (t.{机构编号} = @操作员机构编号#) */
    from db_rpts.vi_tdset0_stock_posi_detail t where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and (@资产账户编号# = 0 or t.{资产账户编号} = @资产账户编号#) */
    and (v_asset_acco_no = 0 or t.asset_acco_no = v_asset_acco_no)
    #and t.{持仓状态}<>《持仓状态-已作废》

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@查询操作员编号# = 0 or t.{操作员编号} = @查询操作员编号#) */
    and (v_query_opor_no = 0 or t.opor_no = v_query_opor_no)

    /* group by t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号} */
    group by t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0券源持仓报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0SourceStockHoldingPositionReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0SourceStockHoldingPositionReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_init_date int,
    IN p_query_opor_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_busi_config_str varchar(64);
    declare v_T0_limit_method int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_busi_config_str = " ";
    SET v_T0_limit_method = 0;

    
    label_pro:BEGIN
    

    /* select t.{业务控制配置串} into @机构业务控制配置串# from db_dc.tb_base_co_info t where t.{机构编号} = @操作员机构编号#; */
    select t.busi_config_str into v_co_busi_config_str from db_dc.tb_base_co_info t where t.co_no = v_opor_co_no;

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* select f_get_init_date() as {初始化日期}, */
    select f_get_init_date() as init_date,

    /* t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{证券代码编号},t.{市场编号}, */
    t.pd_no,t.exch_group_no,t.asset_acco_no,t.stock_code_no,t.exch_no,

    /* if(@T0限额方式# = 《T0限额方式-限额》, t.{券源数量}, t.{券源数量} + t.{数量差额}) as {券源数量}, */
    if(v_T0_limit_method = 1, t.source_stock_qty, t.source_stock_qty + t.diff_qty) as source_stock_qty,

    /* IFNULL(b.{总多头当前数量},0) as {总多头当前数量}, */
    IFNULL(b.total_long_curr_qty,0) as total_long_curr_qty,

    /* IFNULL(b.{总空头当前数量},0) as {总空头当前数量}, */
    IFNULL(b.total_short_curr_qty,0) as total_short_curr_qty,

    /* IFNULL(b.{总多头开仓市值},0) as {总多头开仓市值}, */
    IFNULL(b.total_long_open_posi_value,0) as total_long_open_posi_value,

    /* IFNULL(b.{总空头开仓市值},0) as {总空头开仓市值}, */
    IFNULL(b.total_short_open_posi_value,0) as total_short_open_posi_value,

    /* IFNULL(b.{总多头开仓费用},0) as {总多头开仓费用}, */
    IFNULL(b.total_long_open_posi_fee,0) as total_long_open_posi_fee,

    /* IFNULL(b.{总空头开仓费用},0) as {总空头开仓费用}, */
    IFNULL(b.total_short_open_posi_fee,0) as total_short_open_posi_fee,

    /* IFNULL(b.{总多头平仓市值},0) as {总多头平仓市值}, */
    IFNULL(b.total_long_close_posi_value,0) as total_long_close_posi_value,

    /* IFNULL(b.{总空头平仓市值},0) as {总空头平仓市值}, */
    IFNULL(b.total_short_close_posi_value,0) as total_short_close_posi_value,

    /* IFNULL(b.{总多头平仓数量},0) as {总多头平仓数量}, */
    IFNULL(b.total_long_close_posi_qty,0) as total_long_close_posi_qty,

    /* IFNULL(b.{总空头平仓数量},0) as {总空头平仓数量}, */
    IFNULL(b.total_short_close_posi_qty,0) as total_short_close_posi_qty,

    /* IFNULL(b.{总多头平仓费用},0) as {总多头平仓费用}, */
    IFNULL(b.total_long_close_posi_fee,0) as total_long_close_posi_fee,

    /* IFNULL(b.{总空头平仓费用},0) as {总空头平仓费用}, */
    IFNULL(b.total_short_close_posi_fee,0) as total_short_close_posi_fee,

    /* IFNULL(b.{总实现盈亏},0) as {总实现盈亏}, */
    IFNULL(b.total_realize_pandl,0) as total_realize_pandl,

    /* IFNULL(b.{多头当前数量},0) as {多头当前数量}, */
    IFNULL(b.long_curr_qty,0) as long_curr_qty,

    /* IFNULL(b.{空头当前数量},0) as {空头当前数量}, */
    IFNULL(b.short_curr_qty,0) as short_curr_qty,

    /* IFNULL(b.{多头开仓市值},0) as {多头开仓市值}, */
    IFNULL(b.long_open_posi_value,0) as long_open_posi_value,

    /* IFNULL(b.{空头开仓市值},0) as {空头开仓市值}, */
    IFNULL(b.short_open_posi_value,0) as short_open_posi_value,

    /* IFNULL(b.{多头开仓费用},0) as {多头开仓费用}, */
    IFNULL(b.long_open_posi_fee,0) as long_open_posi_fee,

    /* IFNULL(b.{空头开仓费用},0) as {空头开仓费用}, */
    IFNULL(b.short_open_posi_fee,0) as short_open_posi_fee,

    /* IFNULL(b.{多头平仓数量},0) as {多头平仓数量}, */
    IFNULL(b.long_close_posi_qty,0) as long_close_posi_qty,

    /* IFNULL(b.{空头平仓数量},0) as {空头平仓数量}, */
    IFNULL(b.short_close_posi_qty,0) as short_close_posi_qty,

    /* IFNULL(b.{多头平仓市值},0) as {多头平仓市值}, */
    IFNULL(b.long_close_posi_value,0) as long_close_posi_value,

    /* IFNULL(b.{空头平仓市值},0) as {空头平仓市值}, */
    IFNULL(b.short_close_posi_value,0) as short_close_posi_value,

    /* IFNULL(b.{多头平仓费用},0) as {多头平仓费用}, */
    IFNULL(b.long_close_posi_fee,0) as long_close_posi_fee,

    /* IFNULL(b.{空头平仓费用},0) as {空头平仓费用}, */
    IFNULL(b.short_close_posi_fee,0) as short_close_posi_fee,

    /* IFNULL(b.{实现盈亏},0) as {实现盈亏}, */
    IFNULL(b.realize_pandl,0) as realize_pandl,

    /* IFNULL(b.{隔夜盈亏},0) as {隔夜盈亏}, */
    IFNULL(b.over_night_pandl,0) as over_night_pandl,

    /* IFNULL((t.{总开仓费用} + t.{总平仓费用}),0) as {全部费用}, */
    IFNULL((t.total_open_posi_fee + t.total_close_posi_fee),0) as all_fee,

    /* IFNULL(b.{总实现盈亏} / (b.{总多头平仓市值} + b.{总空头平仓市值}),0) as {收益率}, */
    IFNULL(b.total_realize_pandl / (b.total_long_close_posi_value + b.total_short_close_posi_value),0) as yield_rate,

    /* IFNULL(t.{累计实现盈亏},0) as {累计实现盈亏} */
    IFNULL(t.sum_realize_pandl,0) as sum_realize_pandl

    /* from ~报表_资管报表_T0_操作员券源设置表^ t */
    from db_rpts.vi_tdset0_opor_stock_source t

     /* left join ~报表_资管报表_T0_证券持仓汇总表^ b on (t.{机构编号},t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{股东代码编号}) = (b.{机构编号},b.{产品编号},b.{交易组编号},b.{资产账户编号},b.{市场编号},b.{证券代码编号},b.{股东代码编号}) and (b.{操作员编号} = @操作员编号#) */
     left join db_rpts.vi_tdset0_stock_posi_sum b on (t.co_no,t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.stock_acco_no) = (b.co_no,b.pd_no,b.exch_group_no,b.asset_acco_no,b.exch_no,b.stock_code_no,b.stock_acco_no) and (b.opor_no = v_opor_no)

    /* where (t.{机构编号} = @操作员机构编号#) */
    where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and (@资产账户编号# = 0 or t.{资产账户编号} = @资产账户编号#) */
    and (v_asset_acco_no = 0 or t.asset_acco_no = v_asset_acco_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@查询操作员编号# = 0 or t.{操作员编号} = @查询操作员编号#) */
    and (v_query_opor_no = 0 or t.opor_no = v_query_opor_no)
    # and t.{当前数量} > 0
    # group by t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{证券代码编号},t.{市场编号}
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0账户交易汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0UnitTradeTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0UnitTradeTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);
    declare v_pd_no int;
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(',@查询条件#); */
    set v_query_cond = concat('(',v_query_cond);

    /* [按条件拼字符串][@查询条件#][@机构编号串#<>"0"][' or a.{机构编号} in (',@机构编号串#,')'] */
    if v_co_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.co_no in (',v_co_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号串#<>"0"][' or a.{产品编号} in (',@产品编号串#,')'] */
    if v_pd_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.pd_no in (',v_pd_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0"][' or a.{交易组编号} in (',@交易组编号串#,')'] */
    if v_exch_group_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.exch_group_no in (',v_exch_group_no_str,')');
    end if;


    /* set @查询条件# = concat(@查询条件#,')'); */
    set v_query_cond = concat(v_query_cond,')');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

     /* set @查询条件# = "1=1"; */
     set v_query_cond = "1=1";
    end if;

    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and a.{产品编号}="',@产品编号#,'"'] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.pd_no="',v_pd_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and a.{交易组编号}="',@交易组编号#,'"'] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.exch_group_no="',v_exch_group_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>0][' and a.{资产账户编号}="',@资产账户编号#,'"'] */
    if v_asset_acco_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.asset_acco_no="',v_asset_acco_no,'"');
    end if;


    /* set @查询条件# = concat(@查询条件#,' and a.{机构编号}=',@操作员机构编号#); */
    set v_query_cond = concat(v_query_cond,' and a.co_no=',v_opor_co_no);

    /* [执行语句][concat('select a.{产品编号} as {产品编号},a.{交易组编号} as {交易组编号},a.{资产账户编号} as {资产账户编号},Round(ifnull(b.{期初金额},0),2) as {期初金额},0 as {持仓市值},Round(ifnull(SUM(a.{开仓市值}+ a.{平仓市值}),0),2) as {交易金额},Round(ifnull(SUM(a.{实现盈亏}),0),2) as {当日盈亏},Round(ifnull(SUM(a.{开仓费用}+a.{平仓费用}),0),2) as {全部费用},ifnull(Round(ifnull(SUM(a.{实现盈亏}),0) / sum(a.{平仓市值}),5),0) as {收益率} from ~报表_资管报表_T0_证券持仓明细表^ a,~报表_资管报表_产品证券-资金-交易组资金表^ b where a.{产品编号} = b.{产品编号} and a.{交易组编号} = b.{交易组编号} and a.{机构编号} = b.{机构编号} and a.{资产账户编号} = b.{资产账户编号} and a.{操作员编号} = ',@操作员编号#,' and ',@查询条件#,' group by a.{产品编号},a.{交易组编号},a.{资产账户编号}')] */
    set @tmp_sql = concat('select a.pd_no as pd_no,a.exch_group_no as exch_group_no,a.asset_acco_no as asset_acco_no,Round(ifnull(b.begin_amt,0),2) as begin_amt,0 as posi_market_value,Round(ifnull(SUM(a.open_posi_value+ a.close_posi_market_value),0),2) as trade_amt,Round(ifnull(SUM(a.realize_pandl),0),2) as today_pandl,Round(ifnull(SUM(a.open_posi_fee+a.close_posi_fee),0),2) as all_fee,ifnull(Round(ifnull(SUM(a.realize_pandl),0) / sum(a.close_posi_market_value),5),0) as yield_rate from db_rpts.vi_tdset0_stock_posi_detail a,db_rpts.vi_pdseca_exgp_capit b where a.pd_no = b.pd_no and a.exch_group_no = b.exch_group_no and a.co_no = b.co_no and a.asset_acco_no = b.asset_acco_no and a.opor_no = ',v_opor_no,' and ',v_query_cond,' group by a.pd_no,a.exch_group_no,a.asset_acco_no');
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

# 原子_报表_资管报表_T+0持仓盈亏历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryHisT0HoldingPandL;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryHisT0HoldingPandL(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    select

    /* t.{初始化日期}, */
    t.init_date,

    /* t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号}, */
    t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no,

    /* SUM(t.{当前数量}) as {当前数量}, */
    SUM(t.curr_qty) as curr_qty,

    /* SUM(t.{开仓市值}) as {开仓市值}, */
    SUM(t.open_posi_value) as open_posi_value,

    /* SUM(t.{平仓数量}) as {平仓数量}, */
    SUM(t.close_posi_qty) as close_posi_qty,

    /* SUM(t.{平仓市值}) as {平仓市值}, */
    SUM(t.close_posi_market_value) as close_posi_market_value,

    /* SUM(t.{实现盈亏}) as {实现盈亏}, */
    SUM(t.realize_pandl) as realize_pandl,

    /* SUM(t.{隔夜盈亏}) as {隔夜盈亏}, */
    SUM(t.over_night_pandl) as over_night_pandl,

    /* SUM(t.{开仓市值} + t.{平仓市值}) as {交易金额}, */
    SUM(t.open_posi_value + t.close_posi_market_value) as trade_amt,

    /* SUM(case when t.{多空类型}=1 then t.{当前数量}- t.{平仓数量} when t.{多空类型}=2 then -1*(t.{当前数量}- t.{平仓数量}) end) as {持仓数量}, */
    SUM(case when t.lngsht_type=1 then t.curr_qty- t.close_posi_qty when t.lngsht_type=2 then -1*(t.curr_qty- t.close_posi_qty) end) as posi_qty,

    /* SUM(t.{当前数量}+if(t.{持仓状态}=3,0,t.{平仓数量})) as {交易数量}, */
    SUM(t.curr_qty+if(t.posi_status=3,0,t.close_posi_qty)) as trade_qty,

    /* SUM(t.{开仓费用}+t.{平仓费用}) as {全部费用}, */
    SUM(t.open_posi_fee+t.close_posi_fee) as all_fee,

    /* IFNULL(SUM(t.{实现盈亏}) / sum(t.{平仓市值}),0) as {收益率}, */
    IFNULL(SUM(t.realize_pandl) / sum(t.close_posi_market_value),0) as yield_rate,

    /* SUM(t.{实现盈亏}+t.{隔夜盈亏}) as {累计实现盈亏} */
    SUM(t.realize_pandl+t.over_night_pandl) as sum_realize_pandl

    /* from ~报表_资管报表_T0_证券持仓明细表历史^ t where (t.{机构编号} = @操作员机构编号#) */
    from db_rpts.vi_tdset0_stock_posi_detail_his t where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and (@资产账户编号# = 0 or t.{资产账户编号} = @资产账户编号#) */
    and (v_asset_acco_no = 0 or t.asset_acco_no = v_asset_acco_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)
    #and t.{持仓状态}<>《持仓状态-已作废》

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@查询操作员编号# = 0 or t.{操作员编号} = @查询操作员编号#) */
    and (v_query_opor_no = 0 or t.opor_no = v_query_opor_no)

    /* and t.{初始化日期} between @开始日期# and @结束日期# */
    and t.init_date between v_begin_date and v_end_date

    /* group by t.{初始化日期},t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号} */
    group by t.init_date,t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0券源持仓报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryHisT0SourceStockHoldingPositionReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryHisT0SourceStockHoldingPositionReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_busi_config_str varchar(64);
    declare v_T0_limit_method int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_busi_config_str = " ";
    SET v_T0_limit_method = 0;

    
    label_pro:BEGIN
    

    /* select t.{业务控制配置串} into @机构业务控制配置串# from db_dc.tb_base_co_info t where t.{机构编号} = @操作员机构编号#; */
    select t.busi_config_str into v_co_busi_config_str from db_dc.tb_base_co_info t where t.co_no = v_opor_co_no;

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);
    select

    /* t.{初始化日期}, */
    t.init_date,

    /* t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{证券代码编号},t.{市场编号}, */
    t.pd_no,t.exch_group_no,t.asset_acco_no,t.stock_code_no,t.exch_no,

    /* if(@T0限额方式# = 《T0限额方式-限额》, t.{券源数量}, t.{券源数量} + t.{数量差额}) as {券源数量}, */
    if(v_T0_limit_method = 1, t.source_stock_qty, t.source_stock_qty + t.diff_qty) as source_stock_qty,

    /* IFNULL(b.{总多头当前数量},0) as {总多头当前数量}, */
    IFNULL(b.total_long_curr_qty,0) as total_long_curr_qty,

    /* IFNULL(b.{总空头当前数量},0) as {总空头当前数量}, */
    IFNULL(b.total_short_curr_qty,0) as total_short_curr_qty,

    /* IFNULL(b.{总多头开仓市值},0) as {总多头开仓市值}, */
    IFNULL(b.total_long_open_posi_value,0) as total_long_open_posi_value,

    /* IFNULL(b.{总空头开仓市值},0) as {总空头开仓市值}, */
    IFNULL(b.total_short_open_posi_value,0) as total_short_open_posi_value,

    /* IFNULL(b.{总多头开仓费用},0) as {总多头开仓费用}, */
    IFNULL(b.total_long_open_posi_fee,0) as total_long_open_posi_fee,

    /* IFNULL(b.{总空头开仓费用},0) as {总空头开仓费用}, */
    IFNULL(b.total_short_open_posi_fee,0) as total_short_open_posi_fee,

    /* IFNULL(b.{总多头平仓市值},0) as {总多头平仓市值}, */
    IFNULL(b.total_long_close_posi_value,0) as total_long_close_posi_value,

    /* IFNULL(b.{总空头平仓市值},0) as {总空头平仓市值}, */
    IFNULL(b.total_short_close_posi_value,0) as total_short_close_posi_value,

    /* IFNULL(b.{总多头平仓数量},0) as {总多头平仓数量}, */
    IFNULL(b.total_long_close_posi_qty,0) as total_long_close_posi_qty,

    /* IFNULL(b.{总空头平仓数量},0) as {总空头平仓数量}, */
    IFNULL(b.total_short_close_posi_qty,0) as total_short_close_posi_qty,

    /* IFNULL(b.{总多头平仓费用},0) as {总多头平仓费用}, */
    IFNULL(b.total_long_close_posi_fee,0) as total_long_close_posi_fee,

    /* IFNULL(b.{总空头平仓费用},0) as {总空头平仓费用}, */
    IFNULL(b.total_short_close_posi_fee,0) as total_short_close_posi_fee,

    /* IFNULL(b.{总实现盈亏},0) as {总实现盈亏}, */
    IFNULL(b.total_realize_pandl,0) as total_realize_pandl,

    /* IFNULL(b.{多头当前数量},0) as {多头当前数量}, */
    IFNULL(b.long_curr_qty,0) as long_curr_qty,

    /* IFNULL(b.{空头当前数量},0) as {空头当前数量}, */
    IFNULL(b.short_curr_qty,0) as short_curr_qty,

    /* IFNULL(b.{多头开仓市值},0) as {多头开仓市值}, */
    IFNULL(b.long_open_posi_value,0) as long_open_posi_value,

    /* IFNULL(b.{空头开仓市值},0) as {空头开仓市值}, */
    IFNULL(b.short_open_posi_value,0) as short_open_posi_value,

    /* IFNULL(b.{多头开仓费用},0) as {多头开仓费用}, */
    IFNULL(b.long_open_posi_fee,0) as long_open_posi_fee,

    /* IFNULL(b.{空头开仓费用},0) as {空头开仓费用}, */
    IFNULL(b.short_open_posi_fee,0) as short_open_posi_fee,

    /* IFNULL(b.{多头平仓数量},0) as {多头平仓数量}, */
    IFNULL(b.long_close_posi_qty,0) as long_close_posi_qty,

    /* IFNULL(b.{空头平仓数量},0) as {空头平仓数量}, */
    IFNULL(b.short_close_posi_qty,0) as short_close_posi_qty,

    /* IFNULL(b.{多头平仓市值},0) as {多头平仓市值}, */
    IFNULL(b.long_close_posi_value,0) as long_close_posi_value,

    /* IFNULL(b.{空头平仓市值},0) as {空头平仓市值}, */
    IFNULL(b.short_close_posi_value,0) as short_close_posi_value,

    /* IFNULL(b.{多头平仓费用},0) as {多头平仓费用}, */
    IFNULL(b.long_close_posi_fee,0) as long_close_posi_fee,

    /* IFNULL(b.{空头平仓费用},0) as {空头平仓费用}, */
    IFNULL(b.short_close_posi_fee,0) as short_close_posi_fee,

    /* IFNULL(b.{实现盈亏},0) as {实现盈亏}, */
    IFNULL(b.realize_pandl,0) as realize_pandl,

    /* IFNULL(b.{隔夜盈亏},0) as {隔夜盈亏}, */
    IFNULL(b.over_night_pandl,0) as over_night_pandl,

    /* IFNULL((t.{总开仓费用} + t.{总平仓费用}),0) as {全部费用}, */
    IFNULL((t.total_open_posi_fee + t.total_close_posi_fee),0) as all_fee,

    /* IFNULL(b.{总实现盈亏} / (b.{总多头平仓市值} + b.{总空头平仓市值}),0) as {收益率}, */
    IFNULL(b.total_realize_pandl / (b.total_long_close_posi_value + b.total_short_close_posi_value),0) as yield_rate,

    /* IFNULL(t.{累计实现盈亏},0) as {累计实现盈亏} */
    IFNULL(t.sum_realize_pandl,0) as sum_realize_pandl

    /* from ~报表_资管报表_T0_操作员券源设置表历史^ t */
    from db_rpts.vi_tdset0_opor_stock_source_his t

     /* left join ~报表_资管报表_T0_证券持仓汇总表历史^ b on (t.{初始化日期},t.{机构编号},t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{股东代码编号}) = (b.{初始化日期},b.{机构编号},b.{产品编号},b.{交易组编号},b.{资产账户编号},b.{市场编号},b.{证券代码编号},b.{股东代码编号}) and (b.{操作员编号} = @操作员编号#) */
     left join db_rpts.vi_tdset0_stock_posi_sum_his b on (t.init_date,t.co_no,t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.stock_acco_no) = (b.init_date,b.co_no,b.pd_no,b.exch_group_no,b.asset_acco_no,b.exch_no,b.stock_code_no,b.stock_acco_no) and (b.opor_no = v_opor_no)

    /* where (t.{机构编号} = @操作员机构编号#) */
    where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and (@资产账户编号# = 0 or t.{资产账户编号} = @资产账户编号#) */
    and (v_asset_acco_no = 0 or t.asset_acco_no = v_asset_acco_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@查询操作员编号# = 0 or t.{操作员编号} = @查询操作员编号#) */
    and (v_query_opor_no = 0 or t.opor_no = v_query_opor_no)

    /* and t.{初始化日期} between @开始日期# and @结束日期# */
    and t.init_date between v_begin_date and v_end_date
    # and t.{当前数量} > 0
    # group by t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{证券代码编号},t.{市场编号}
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0账户交易汇总历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryHisT0UnitTradeTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryHisT0UnitTradeTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);
    declare v_pd_no int;
    declare v_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(',@查询条件#); */
    set v_query_cond = concat('(',v_query_cond);

    /* [按条件拼字符串][@查询条件#][@机构编号串#<>"0"][' or {机构编号} in (',@机构编号串#,')'] */
    if v_co_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or co_no in (',v_co_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号串#<>"0"][' or {产品编号} in (',@产品编号串#,')'] */
    if v_pd_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or pd_no in (',v_pd_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0"][' or {交易组编号} in (',@交易组编号串#,')'] */
    if v_exch_group_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or exch_group_no in (',v_exch_group_no_str,')');
    end if;


    /* set @查询条件# = concat(@查询条件#,'  limit 65535)'); */
    set v_query_cond = concat(v_query_cond,'  limit 65535)');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

     /* set @查询条件# = "1=1"; */
     set v_query_cond = "1=1";
    end if;

    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and {产品编号}="',@产品编号#,'"'] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and pd_no="',v_pd_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and {交易组编号}="',@交易组编号#,'"'] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and exch_group_no="',v_exch_group_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>0][' and {资产账户编号}="',@资产账户编号#,'"'] */
    if v_asset_acco_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and asset_acco_no="',v_asset_acco_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@查询操作员编号#<>0][' and {操作员编号}=',@查询操作员编号#] */
    if v_query_opor_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and opor_no=',v_query_opor_no);
    end if;


    /* set @查询条件# = concat(@查询条件#,' and {操作员编号} = ',@操作员编号#,' and {初始化日期} >=',@开始日期#,' and {初始化日期}<=',@结束日期#,' and {机构编号}=',@操作员机构编号#); */
    set v_query_cond = concat(v_query_cond,' and opor_no = ',v_opor_no,' and init_date >=',v_begin_date,' and init_date<=',v_end_date,' and co_no=',v_opor_co_no);

    /* [执行语句][concat('select {初始化日期},{产品编号},{交易组编号},{资产账户编号},Round(ifnull({期初金额},0),2) as {期初金额},Round(ifnull({持仓市值},0),2) as {持仓市值},Round(ifnull({交易金额},0),2) as {交易金额},Round(ifnull({全部费用},0),2) as {全部费用},Round(ifnull({实现盈亏},0),2) as {当日盈亏},ifnull(Round(ifnull({实现盈亏},0) / {平仓市值},5),0) as {收益率} from ~报表_资管报表_交易证券-T0-账户交易信息历史表^ where ',@查询条件#)] */
    set @tmp_sql = concat('select init_date,pd_no,exch_group_no,asset_acco_no,Round(ifnull(begin_amt,0),2) as begin_amt,Round(ifnull(posi_market_value,0),2) as posi_market_value,Round(ifnull(trade_amt,0),2) as trade_amt,Round(ifnull(all_fee,0),2) as all_fee,Round(ifnull(realize_pandl,0),2) as today_pandl,ifnull(Round(ifnull(realize_pandl,0) / close_posi_market_value,5),0) as yield_rate from db_rpts.vi_tdset0_trade_total_his where ',v_query_cond);
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

# 原子_报表_资管报表_报表产品持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_ReportProductPositionQuery;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_ReportProductPositionQuery(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* SELECT
 a.{产品编号},
 a.{市场编号},
 a.{证券代码编号},b.{证券类型},
 sum( a.{当前数量} - a.{成交占用数量} + a.{成交释放数量} ) AS {持仓数量},
 sum(a.{成交释放数量}) AS {当日买入数量},
 sum(a.{成交占用数量}) AS {当日卖出数量},
 ifnull( sum(a.{成本金额}) / sum( a.{当前数量} - a.{成交占用数量} + a.{成交释放数量}), 0) AS {成本价},
 b.{最新价} AS {今收盘价},
 f_get_hk_amt(a.{初始化日期},a.{市场编号},sum( (a.{当前数量} - a.{成交占用数量} + a.{成交释放数量})) *f_get_marketprice(a.{证券代码编号},b.stock_code,b.exch_no,b.net_price)) AS {持仓市值}
FROM
 ~报表_资管报表_视图-证券基础数据-证券行情表^ b,
 ~报表_资管报表_视图-数据-产品-资产账户-持仓^ a
WHERE
 a.{市场编号} = b.{市场编号}
AND a.{证券代码编号} = b.{证券代码编号}
AND (a.{机构编号} = @操作员机构编号#) and (@产品编号# = 0 or a.{产品编号} = @产品编号#) and (@市场编号# = 0 or a.{市场编号} = @市场编号#) and (@证券代码编号# = 0 or a.{证券代码编号} = @证券代码编号#)  and (@证券类型# = 0 or b.{证券类型} = @证券类型#) 
AND (a.{期初数量}<>0 or a.{当前数量} <> 0 
 or a.{成交占用数量}<>0 or a.{成交释放数量}<>0 or a.{冻结数量}<>0 or a.{解冻数量}<>0)
GROUP BY
 a.{产品编号},
 a.{市场编号},
 a.{证券代码编号}
ORDER BY
 a.{产品编号},
 a.{市场编号},
 a.{证券代码编号};
 */
    SELECT
     a.pd_no,
     a.exch_no,
     a.stock_code_no,b.stock_type,
     sum( a.curr_qty - a.strike_capt_qty + a.strike_releas_qty ) AS posi_qty,
     sum(a.strike_releas_qty) AS today_buy_qty,
     sum(a.strike_capt_qty) AS today_sell_qty,
     ifnull( sum(a.cost_amt) / sum( a.curr_qty - a.strike_capt_qty + a.strike_releas_qty), 0) AS cost_price,
     b.last_price AS today_close_price,
     f_get_hk_amt(a.init_date,a.exch_no,sum( (a.curr_qty - a.strike_capt_qty + a.strike_releas_qty)) *f_get_marketprice(a.stock_code_no,b.stock_code,b.exch_no,b.net_price)) AS posi_market_value
    FROM
     db_rpts.vi_basesedt_stock_quot b,
     db_rpts.vi_dt_pd_asac_posi a
    WHERE
     a.exch_no = b.exch_no
    AND a.stock_code_no = b.stock_code_no
    AND (a.co_no = v_opor_co_no) and (v_pd_no = 0 or a.pd_no = v_pd_no) and (v_exch_no = 0 or a.exch_no = v_exch_no) and (v_stock_code_no = 0 or a.stock_code_no = v_stock_code_no)  and (v_stock_type = 0 or b.stock_type = v_stock_type) 
    AND (a.begin_qty<>0 or a.curr_qty <> 0 
     or a.strike_capt_qty<>0 or a.strike_releas_qty<>0 or a.frozen_qty<>0 or a.unfroz_qty<>0)
    GROUP BY
     a.pd_no,
     a.exch_no,
     a.stock_code_no
    ORDER BY
     a.pd_no,
     a.exch_no,
     a.stock_code_no;
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_报表机构持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_ReportCompanyPositionQuery;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_ReportCompanyPositionQuery(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no_str varchar(2048);
    declare v_co_no int;
    declare v_update_preci_type int;
    declare v_crncy_type varchar(3);
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
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no_str = " ";
    SET v_co_no = 0;
    SET v_update_preci_type = 0;
    SET v_crncy_type = "CNY";
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录串][报表_资管报表_产品-账户-产品信息表][{产品编号}][@产品编号串#][{机构编号}=@机构编号#] */
    select group_concat(pd_no) into v_pd_no_str from db_rpts.vi_pdacco_pd_info where co_no=v_co_no;


    /* if @产品编号串# is not null then */
    if v_pd_no_str is not null then

     /* set @更新精度#=1; */
     set v_update_preci_type=1;

     /* set @本币币种#="CNY"; */
     set v_crncy_type="CNY";
    end if;

    /* SELECT
 a.{市场编号},
 a.{证券代码编号},
 b.{证券类型},
 sum(
 a.{当前数量} - a.{成交占用数量}+ a.{成交释放数量}
 ) AS {持仓数量},
 sum(a.{成交释放数量}) AS {当日买入数量},
 sum(a.{成交占用数量}) AS {当日卖出数量},
b.{最新价} as {今收盘价},
 f_get_hk_amt(a.{初始化日期},a.{市场编号},sum(
 a.{当前数量} - a.{成交占用数量} + a.{成交释放数量}
 )*f_get_marketprice(a.stock_code_no,b.stock_code,b.exch_no,b.net_price)) as {持仓市值},
ifnull(
f_get_hk_amt(a.{初始化日期},a.{市场编号},	sum(
 a.{当前数量} - a.{成交占用数量} + a.{成交释放数量}
 )*f_get_marketprice(a.stock_code_no,b.stock_code,b.exch_no,b.net_price))/@净资产#,0) as {持仓净值占比}
FROM
 ~报表_资管报表_视图-数据-产品-资产账户-持仓^ a,
 ~报表_资管报表_视图-证券基础数据-证券行情表^ b
WHERE a.{市场编号} = b.{市场编号}
AND a.{证券代码编号} = b.{证券代码编号}
AND (a.{期初数量}<>0 or a.{当前数量} <>0 
or a.{成交占用数量}<>0 or a.{成交释放数量}<>0 or a.{冻结数量}<>0 or a.{解冻数量}<>0)
AND (a.{机构编号} = @操作员机构编号#) and (@市场编号# = 0 or a.{市场编号} = @市场编号#) and (@证券代码编号# = 0 or a.{证券代码编号} = @证券代码编号#)  and (@证券类型# = 0 or b.{证券类型} = @证券类型#) 
GROUP BY
 a.{市场编号},
 b.{证券类型},
 a.{证券代码编号}
order by 
 a.{市场编号},
 b.{证券类型},
 a.{证券代码编号}; */
    SELECT
     a.exch_no,
     a.stock_code_no,
     b.stock_type,
     sum(
     a.curr_qty - a.strike_capt_qty+ a.strike_releas_qty
     ) AS posi_qty,
     sum(a.strike_releas_qty) AS today_buy_qty,
     sum(a.strike_capt_qty) AS today_sell_qty,
    b.last_price as today_close_price,
     f_get_hk_amt(a.init_date,a.exch_no,sum(
     a.curr_qty - a.strike_capt_qty + a.strike_releas_qty
     )*f_get_marketprice(a.stock_code_no,b.stock_code,b.exch_no,b.net_price)) as posi_market_value,
    ifnull(
    f_get_hk_amt(a.init_date,a.exch_no,	sum(
     a.curr_qty - a.strike_capt_qty + a.strike_releas_qty
     )*f_get_marketprice(a.stock_code_no,b.stock_code,b.exch_no,b.net_price))/v_nav_asset,0) as posi_nav_ratio
    FROM
     db_rpts.vi_dt_pd_asac_posi a,
     db_rpts.vi_basesedt_stock_quot b
    WHERE a.exch_no = b.exch_no
    AND a.stock_code_no = b.stock_code_no
    AND (a.begin_qty<>0 or a.curr_qty <>0 
    or a.strike_capt_qty<>0 or a.strike_releas_qty<>0 or a.frozen_qty<>0 or a.unfroz_qty<>0)
    AND (a.co_no = v_opor_co_no) and (v_exch_no = 0 or a.exch_no = v_exch_no) and (v_stock_code_no = 0 or a.stock_code_no = v_stock_code_no)  and (v_stock_type = 0 or b.stock_type = v_stock_type) 
    GROUP BY
     a.exch_no,
     b.stock_type,
     a.stock_code_no
    order by 
     a.exch_no,
     b.stock_type,
     a.stock_code_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_报表产品持仓交易汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_ReportProductPositionTradeQuery;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_ReportProductPositionTradeQuery(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    
    # set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#);

    /* set @汇率# = f_get_hk_avg_rate(f_get_init_date(), 3); */
    set v_exch_rate = f_get_hk_avg_rate(f_get_init_date(), 3);
    select
    t.*,

    /* ifnull(a.{买入数量},0) as {当日买入数量}, */
    ifnull(a.buy_qty,0) as today_buy_qty,

    /* ifnull(a.{买入金额},0) as {当日买入金额}, */
    ifnull(a.buy_amt,0) as today_buy_amt,

    /* ifnull(a.{买入成交价},0) as {当日买入价格}, */
    ifnull(a.buy_strike_price,0) as today_buy_price,

    /* ifnull(a.{买入开始时间},0) as {买入开始时间}, */
    ifnull(a.buy_begin_time,0) as buy_begin_time,

    /* ifnull(a.{买入结束时间},0) as {买入结束时间}, */
    ifnull(a.buy_end_time,0) as buy_end_time,

    /* ifnull(a.{卖出数量},0) as {当日卖出数量}, */
    ifnull(a.sell_qty,0) as today_sell_qty,

    /* ifnull(a.{销售金额},0) as {当日卖出金额}, */
    ifnull(a.sell_amt,0) as today_sell_amt,

    /* ifnull(a.{卖出成交价},0) as {当日卖出价格}, */
    ifnull(a.sell_strike_price,0) as today_sell_price,

    /* ifnull(a.{卖出开始时间},0) as {卖出开始时间}, */
    ifnull(a.sell_begin_time,0) as sell_begin_time,

    /* ifnull(a.{卖出结束时间},0) as {卖出结束时间} */
    ifnull(a.sell_end_time,0) as sell_end_time
    from (

    /* select t.{机构编号}, t.{产品编号}, t.{证券代码编号}, t.{市场编号}, t.{投资类型},t.{证券类型} */
    select t.co_no, t.pd_no, t.stock_code_no, t.exch_no, t.invest_type,t.stock_type

    /* , sum(ifnull(t.{期初数量},0)) as {昨日持仓数量} */
    , sum(ifnull(t.begin_qty,0)) as pre_holding_qty

    /* , sum(ifnull(t.{当前数量},0)) as {持仓数量} */
    , sum(ifnull(t.curr_qty,0)) as posi_qty

     /* , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as {全价} */
     , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as full_price

     /* , sum(if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0))) as {债券应收利息} */
     , sum(if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0))) as bond_receivable_amt

     /* , sum(ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.{投资类型} = 3, t.{公允价格},stq.{最新价}) * @汇率# , if(t.{投资类型} = 3, t.{公允价格},stq.{最新价}))),0)) as {持仓市值} */
     , sum(ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.invest_type = 3, t.fair_price,stq.last_price) * v_exch_rate , if(t.invest_type = 3, t.fair_price,stq.last_price))),0)) as posi_market_value

     /* , sum(ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * @汇率# , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0)) as {全价持仓市值} */
     , sum(ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * v_exch_rate , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0)) as full_holding_amt

     /* , stq.{最新价} as {今收盘价} , stq.{昨收盘价} */
     , stq.last_price as today_close_price , stq.pre_close_price

      /* , stq.{最新价}, stq.{成交数量} as {行情成交数量}, stq.{成交金额} as {行情成交金额} */
      , stq.last_price, stq.strike_qty as quot_strike_qty, stq.strike_amt as quot_strike_amt
    # from ~报表_资管报表_产品持仓查询表^ t

    /* from ~报表_资管报表_产品持仓查询表^ t */
    from db_rpts.tb_rptasset_pd_posi t

     /* left join db_dc.tb_basesedt_stock_quot stq on (t.{证券代码编号}) = (stq.{证券代码编号}) */
     left join db_dc.tb_basesedt_stock_quot stq on (t.stock_code_no) = (stq.stock_code_no)
    where

    /* (t.{机构编号}=@操作员机构编号#) and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    (t.co_no=v_opor_co_no) and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券类型# = 0 or t.{证券类型} = @证券类型#) */
    and (v_stock_type = 0 or t.stock_type = v_stock_type)

    /* and (t.{机构编号},t.{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (t.co_no,t.pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)

    /* group by t.{机构编号}, t.{产品编号}, t.{证券代码编号}, t.{市场编号} */
    group by t.co_no, t.pd_no, t.stock_code_no, t.exch_no
     ) t

    /* left join ~报表_资管报表_视图-汇总-产品-证券-成交^ a on (t.{机构编号},t.{产品编号},t.{证券代码编号}) = (a.{机构编号},a.{产品编号},a.{证券代码编号}) and t.{投资类型} = 1 */
    left join db_rpts.vi_sum_pd_stock_strike a on (t.co_no,t.pd_no,t.stock_code_no) = (a.co_no,a.pd_no,a.stock_code_no) and t.invest_type = 1

    /* where (a.{成交金额} <> 0 or t.{昨日持仓数量} <>0 or a.{买入数量}<>0 or a.{卖出数量}<>0 ) */
    where (a.strike_amt <> 0 or t.pre_holding_qty <>0 or a.buy_qty<>0 or a.sell_qty<>0 )

    /* order by {持仓市值} desc */
    order by posi_market_value desc
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_产品账户证券重仓股持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryProductPositionTop;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryProductPositionTop(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_count int,
    IN p_config_value varchar(2048),
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
    declare v_row_count int;
    declare v_config_value varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_update_preci_type int;
    declare v_stock_asset decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_count = p_row_count;
    SET v_config_value = p_config_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_update_preci_type = 0;
    SET v_stock_asset = 0;
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    
    ##[原子_获取产品编码]

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @更新精度#=1; */
    set v_update_preci_type=1;
    #[原子_获取产品净资产]
    commit;

    /* [执行语句][concat("select a.{证券代码编号},a.{市场编号},sum(a.{期初数量}) as {期初数量},b.{最新价},sum(a.{当前数量}) as {当前数量},(case when b.{公允价格} > 0 then b.{公允价格} else b.{最新价} end)*sum(a.{当前数量}) as {持仓市值},sum(a.{成本金额}) as {成本金额},ifnull(sum(a.{成本金额})/sum(a.{当前数量}),0) as {成本价},sum(a.{实现盈亏}) as {实现盈亏},b.{最新价}*sum(a.{当前数量})-sum(a.{成本金额}) as {浮动盈亏},ifnull((b.{最新价}*sum(a.{当前数量})-sum(a.{成本金额}))/abs(sum(a.{成本金额})),0) as {浮动盈亏比例},ifnull(b.{最新价}*sum(a.{当前数量})/",@股票资产#,",0) as {市值占比},ifnull(b.{最新价}*sum(a.{当前数量})/",@净资产#,",0) as {净值占比} from ~报表_资管报表_公共-用户-操作员信息表^ a,~报表_资管报表_视图-证券基础数据-证券行情表^ b where b.{市场编号}=a.{市场编号} and a.{证券代码编号}=b.{证券代码编号} and b.{资产类型} in (11,51,52,53,54,55) and a.{机构编号}=",@机构编号#," and a.{产品编号}=",@产品编号#," group by a.{产品编号},a.{市场编号},a.{证券代码编号} having sum(a.{当前数量})<>0 order by (case when b.{公允价格} > 0 then b.{公允价格} else b.{最新价} end)*sum(a.{当前数量}) desc limit ",@指定行数#)] */
    set @tmp_sql = concat("select a.stock_code_no,a.exch_no,sum(a.begin_qty) as begin_qty,b.last_price,sum(a.curr_qty) as curr_qty,(case when b.fair_price > 0 then b.fair_price else b.last_price end)*sum(a.curr_qty) as posi_market_value,sum(a.cost_amt) as cost_amt,ifnull(sum(a.cost_amt)/sum(a.curr_qty),0) as cost_price,sum(a.realize_pandl) as realize_pandl,b.last_price*sum(a.curr_qty)-sum(a.cost_amt) as float_pandl,ifnull((b.last_price*sum(a.curr_qty)-sum(a.cost_amt))/abs(sum(a.cost_amt)),0) as float_pandl_ratio,ifnull(b.last_price*sum(a.curr_qty)/",v_stock_asset,",0) as market_value_ratio,ifnull(b.last_price*sum(a.curr_qty)/",v_nav_asset,",0) as nav_ratio from db_rpts.vi_pdsepo_asac_posi a,db_rpts.vi_basesedt_stock_quot b where b.exch_no=a.exch_no and a.stock_code_no=b.stock_code_no and b.asset_type in (11,51,52,53,54,55) and a.co_no=",v_co_no," and a.pd_no=",v_pd_no," group by a.pd_no,a.exch_no,a.stock_code_no having sum(a.curr_qty)<>0 order by (case when b.fair_price > 0 then b.fair_price else b.last_price end)*sum(a.curr_qty) desc limit ",v_row_count);
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

# 原子_报表_资管报表_交易单元证券重仓股持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryUniteQuitiesPositionTop;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryUniteQuitiesPositionTop(
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
    IN p_row_count int,
    IN p_config_value varchar(2048),
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
    declare v_exch_group_no int;
    declare v_row_count int;
    declare v_config_value varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_update_preci_type int;
    declare v_stock_asset decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_count = p_row_count;
    SET v_config_value = p_config_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_update_preci_type = 0;
    SET v_stock_asset = 0;
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    
    ##[原子_获取产品编码]
    #[原子_获取交易单元]

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @更新精度#=1; */
    set v_update_preci_type=1;
    #[原子_获取单元净资产]
    commit;

    /* [执行语句][concat("select a.{证券代码编号},a.{市场编号},(case when b.{公允价格} > 0 then b.{公允价格} else b.{最新价} end)*sum(a.{当前数量}) as {持仓市值},sum(a.{期初数量}) as {期初数量},sum(a.{当前数量}) as {当前数量},sum(a.{成本金额}) as {成本金额},sum(a.{实现盈亏}) as {实现盈亏},b.{最新价},ifnull(sum(a.{成本金额})/sum(a.{当前数量}),0) as {成本价},b.{最新价}*sum(a.{当前数量})-sum(a.{成本金额}) as {浮动盈亏},ifnull((b.{最新价}*sum(a.{当前数量})-sum(a.{成本金额}))/abs(sum(a.{成本金额})),0) as {浮动盈亏比例},ifnull(b.{最新价}*sum(a.{当前数量})/",@股票资产#,",0) as {市值占比},ifnull(b.{最新价}*sum(a.{当前数量})/",@净资产#,",0) as {净值占比} from ~报表_资管报表_产品证券-持仓-交易组持仓表^ a ,~报表_资管报表_视图-证券基础数据-证券行情表^ b where a.{市场编号}=b.{市场编号} and a.{证券代码编号}=b.{证券代码编号} and b.{资产类型} in (11,51,52,53,54,55) and a.{机构编号}=",@机构编号#," and a.{产品编号}=",@产品编号#," and a.{交易组编号}=",@交易组编号#," group by a.{交易组编号},a.{市场编号},a.{证券代码编号} having sum(a.{当前数量})<>0 order by (case when b.{公允价格} > 0 then b.{公允价格} else b.{最新价} end)*sum(a.{当前数量}) desc limit ",@指定行数#)] */
    set @tmp_sql = concat("select a.stock_code_no,a.exch_no,(case when b.fair_price > 0 then b.fair_price else b.last_price end)*sum(a.curr_qty) as posi_market_value,sum(a.begin_qty) as begin_qty,sum(a.curr_qty) as curr_qty,sum(a.cost_amt) as cost_amt,sum(a.realize_pandl) as realize_pandl,b.last_price,ifnull(sum(a.cost_amt)/sum(a.curr_qty),0) as cost_price,b.last_price*sum(a.curr_qty)-sum(a.cost_amt) as float_pandl,ifnull((b.last_price*sum(a.curr_qty)-sum(a.cost_amt))/abs(sum(a.cost_amt)),0) as float_pandl_ratio,ifnull(b.last_price*sum(a.curr_qty)/",v_stock_asset,",0) as market_value_ratio,ifnull(b.last_price*sum(a.curr_qty)/",v_nav_asset,",0) as nav_ratio from db_rpts.vi_pdsepo_exgp_posi a ,db_rpts.vi_basesedt_stock_quot b where a.exch_no=b.exch_no and a.stock_code_no=b.stock_code_no and b.asset_type in (11,51,52,53,54,55) and a.co_no=",v_co_no," and a.pd_no=",v_pd_no," and a.exch_group_no=",v_exch_group_no," group by a.exch_group_no,a.exch_no,a.stock_code_no having sum(a.curr_qty)<>0 order by (case when b.fair_price > 0 then b.fair_price else b.last_price end)*sum(a.curr_qty) desc limit ",v_row_count);
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

# 原子_报表_资管报表_证券持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_EquitiesPositionSummary;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_EquitiesPositionSummary(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);

    /* set @汇率# = f_get_hk_avg_rate(f_get_init_date(), 3); */
    set v_exch_rate = f_get_hk_avg_rate(f_get_init_date(), 3);
    SELECT

     /* m.{记录序号} AS {记录序号},f_get_init_date() AS {初始化日期},m.{机构编号}, */
     m.row_id AS row_id,f_get_init_date() AS init_date,m.co_no,

     /* m.{市场编号},m.{证券代码编号},m.{投资类型},m.{证券类型}, */
     m.exch_no,m.stock_code_no,m.invest_type,m.stock_type,

    /* m.{期初数量},m.{当前数量},m.{冻结数量},m.{解冻数量}, */
    m.begin_qty,m.curr_qty,m.frozen_qty,m.unfroz_qty,

     /* m.{成本金额},m.{实现盈亏},m.{利息成本金额},m.{利息收益},m.{交易端可用数量},m.{指令端可用数量},m.{指令占用数量},m.{指令释放数量},m.{交易占用数量},m.{交易释放数量},m.{成交占用数量},m.{成交释放数量},m.{静态可用数量} */
     m.cost_amt,m.realize_pandl,m.intrst_cost_amt,m.intrst_pandl,m.trade_avail_qty,m.comm_avail_qty,m.comm_capt_qty,m.comm_releas_qty,m.trade_capt_qty,m.trade_releas_qty,m.strike_capt_qty,m.strike_releas_qty,m.static_avail_qty

    /* , ifnull(m.{持仓市值}/a.{净资产},0) AS {持仓净值占比},ifnull((m.{持仓市值} - m.{成本金额}),0) / {成本金额} AS {盈亏比例},ifnull(m.{成本金额}/m.{当前数量},0) AS {成本价} */
    , ifnull(m.posi_market_value/a.nav_asset,0) AS posi_nav_ratio,ifnull((m.posi_market_value - m.cost_amt),0) / cost_amt AS pandl_ratio,ifnull(m.cost_amt/m.curr_qty,0) AS cost_price

    /* , (m.{持仓市值} - m.{成本金额}) as {浮动盈亏} */
    , (m.posi_market_value - m.cost_amt) as float_pandl

    /* , ifnull(a.{净资产},0) AS {净资产},m.{质押数量},m.{债券应收利息},m.{持仓市值},m.{全价持仓市值} */
    , ifnull(a.nav_asset,0) AS nav_asset,m.impawn_qty,m.bond_receivable_amt,m.posi_market_value,m.full_holding_amt

    /* , if(m.{投资类型} = 3, ifnull(m.{持仓市值} / m.{当前数量},0) , m.{最新价}) as {最新价} */
    , if(m.invest_type = 3, ifnull(m.posi_market_value / m.curr_qty,0) , m.last_price) as last_price
     FROM (

      /* SELECT  t.{机构编号},t.{市场编号},t.{证券代码编号},t.{投资类型},t.{证券类型} */
      SELECT  t.co_no,t.exch_no,t.stock_code_no,t.invest_type,t.stock_type

    /* ,max(t.{记录序号}) AS {记录序号},SUM(t.{期初数量}) AS {期初数量},SUM(t.{当前数量}) AS {当前数量},SUM(t.{冻结数量}) AS {冻结数量},SUM(t.{解冻数量}) AS {解冻数量} */
    ,max(t.row_id) AS row_id,SUM(t.begin_qty) AS begin_qty,SUM(t.curr_qty) AS curr_qty,SUM(t.frozen_qty) AS frozen_qty,SUM(t.unfroz_qty) AS unfroz_qty

    /* , stq.{最新价} */
    , stq.last_price

    /* , SUM(t.{成本金额}) AS {成本金额},SUM(t.{实现盈亏}) AS {实现盈亏},SUM(t.{利息成本金额}) AS {利息成本金额},SUM(t.{利息收益}) AS {利息收益},SUM(t.{交易端可用数量}) AS {交易端可用数量},SUM(t.{指令端可用数量})  AS {指令端可用数量},SUM(t.{指令占用数量}) AS {指令占用数量},SUM(t.{指令释放数量}) AS {指令释放数量},SUM(t.{交易占用数量}) AS {交易占用数量},SUM(t.{交易释放数量}) AS {交易释放数量},SUM(t.{成交占用数量}) AS {成交占用数量},SUM(t.{成交释放数量}) AS {成交释放数量},SUM(t.{静态可用数量}) AS {静态可用数量},SUM(t.{质押数量}) AS {质押数量} */
    , SUM(t.cost_amt) AS cost_amt,SUM(t.realize_pandl) AS realize_pandl,SUM(t.intrst_cost_amt) AS intrst_cost_amt,SUM(t.intrst_pandl) AS intrst_pandl,SUM(t.trade_avail_qty) AS trade_avail_qty,SUM(t.comm_avail_qty)  AS comm_avail_qty,SUM(t.comm_capt_qty) AS comm_capt_qty,SUM(t.comm_releas_qty) AS comm_releas_qty,SUM(t.trade_capt_qty) AS trade_capt_qty,SUM(t.trade_releas_qty) AS trade_releas_qty,SUM(t.strike_capt_qty) AS strike_capt_qty,SUM(t.strike_releas_qty) AS strike_releas_qty,SUM(t.static_avail_qty) AS static_avail_qty,SUM(t.impawn_qty) AS impawn_qty

    /* , SUM( if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0))) AS {债券应收利息} */
    , SUM( if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0))) AS bond_receivable_amt

    /* , SUM( if(t.{投资类型} = 3, t.{大宗交易持仓市值},ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.{投资类型} = 3, t.{公允价格}, stq.{最新价}) * @汇率# , if(t.{投资类型} = 3, t.{公允价格}, stq.{最新价}))),0)) ) AS {持仓市值} */
    , SUM( if(t.invest_type = 3, t.block_trade_posi_market_value,ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.invest_type = 3, t.fair_price, stq.last_price) * v_exch_rate , if(t.invest_type = 3, t.fair_price, stq.last_price))),0)) ) AS posi_market_value

    /* , SUM(  if(t.{投资类型} = 3, t.{大宗交易持仓市值}, ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * @汇率# , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0) )) AS {全价持仓市值} */
    , SUM(  if(t.invest_type = 3, t.block_trade_posi_market_value, ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * v_exch_rate , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0) )) AS full_holding_amt

      /* from  ~报表_资管报表_交易组持仓查询表^ t */
      from  db_rpts.tb_rptasset_exgrp_posi t

     /* left join db_dc.tb_basesedt_stock_quot stq on (t.{证券代码编号}) = (stq.{证券代码编号}) */
     left join db_dc.tb_basesedt_stock_quot stq on (t.stock_code_no) = (stq.stock_code_no)

      /* WHERE (t.{机构编号}=@操作员机构编号#) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) */
      WHERE (t.co_no=v_opor_co_no) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no)

     /* and (t.{当前数量} <> 0 or t.{期初数量} <> 0) */
     and (t.curr_qty <> 0 or t.begin_qty <> 0)

     /* and (t.{机构编号},t.{产品编号},t.{交易组编号} ) in (select {机构编号},{产品编号},{交易组编号}  from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) */
     and (t.co_no,t.pd_no,t.exch_group_no ) in (select co_no,pd_no,exch_group_no  from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no)

      /* GROUP BY t.{机构编号},t.{市场编号},t.{证券代码编号},t.{投资类型},t.{证券类型} */
      GROUP BY t.co_no,t.exch_no,t.stock_code_no,t.invest_type,t.stock_type
     ) m

     /* left join ( SELECT  a.{机构编号},sum(a.{净资产}) as {净资产} from ~报表_资管报表_交易组资产查询表^ a */
     left join ( SELECT  a.co_no,sum(a.nav_asset) as nav_asset from db_rpts.tb_rptasset_exgrp_asset a

      /* WHERE (a.{机构编号}=@操作员机构编号#) */
      WHERE (a.co_no=v_opor_co_no)

     /* and (a.{机构编号},a.{产品编号},a.{交易组编号} ) in (select {机构编号},{产品编号},{交易组编号}  from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) */
     and (a.co_no,a.pd_no,a.exch_group_no ) in (select co_no,pd_no,exch_group_no  from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no)

     /* group by a.{机构编号} */
     group by a.co_no

    /* ) a on (a.{机构编号}) = (m.{机构编号}) */
    ) a on (a.co_no) = (m.co_no)

     /* where {记录序号} > @记录序号# */
     where row_id > v_row_id

    /* and {记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_历史证券持仓汇总查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_EquitiesPositionSummary_His;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_EquitiesPositionSummary_His(
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
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_type int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);
    SELECT

     /* m.{记录序号} AS {记录序号},m.{初始化日期} AS {初始化日期},m.{机构编号},m.{市场编号},m.{证券代码编号},m.{投资类型},m.{证券类型},m.{最新价},m.{期初数量},m.{当前数量},m.{冻结数量},m.{解冻数量},m.{成本金额},m.{实现盈亏},m.{利息成本金额},m.{利息收益},0 AS {交易端可用数量},0 AS {指令端可用数量},0 AS {指令占用数量},0 AS {指令释放数量},0 AS {交易占用数量},0 AS {交易释放数量},0 AS {成交占用数量},0 AS {成交释放数量},0 AS {静态可用数量},ifnull(a.{净资产},0) AS {净资产},m.{质押数量},m.{债券应收利息},m.{持仓市值},m.{浮动盈亏},m.{全价持仓市值},ifnull(m.{持仓市值}/a.{净资产},0) AS {持仓净值占比},ifnull((m.{持仓市值} - m.{成本金额}),0) / {成本金额} AS {盈亏比例},ifnull(m.{成本金额}/m.{当前数量},0) AS {成本价} */
     m.row_id AS row_id,m.init_date AS init_date,m.co_no,m.exch_no,m.stock_code_no,m.invest_type,m.stock_type,m.last_price,m.begin_qty,m.curr_qty,m.frozen_qty,m.unfroz_qty,m.cost_amt,m.realize_pandl,m.intrst_cost_amt,m.intrst_pandl,0 AS trade_avail_qty,0 AS comm_avail_qty,0 AS comm_capt_qty,0 AS comm_releas_qty,0 AS trade_capt_qty,0 AS trade_releas_qty,0 AS strike_capt_qty,0 AS strike_releas_qty,0 AS static_avail_qty,ifnull(a.nav_asset,0) AS nav_asset,m.impawn_qty,m.bond_receivable_amt,m.posi_market_value,m.float_pandl,m.full_holding_amt,ifnull(m.posi_market_value/a.nav_asset,0) AS posi_nav_ratio,ifnull((m.posi_market_value - m.cost_amt),0) / cost_amt AS pandl_ratio,ifnull(m.cost_amt/m.curr_qty,0) AS cost_price
     FROM (

      /* SELECT  t.{机构编号},t.{市场编号},t.{证券代码编号},t.{投资类型},t.{证券类型},t.{初始化日期},max({最新价}) AS {最新价},max({记录序号}) AS {记录序号},SUM(t.{期初数量}) AS {期初数量},SUM(t.{当前数量}) AS {当前数量},SUM(t.{冻结数量}) AS {冻结数量},SUM(t.{解冻数量}) AS {解冻数量},SUM(t.{成本金额}) AS {成本金额},SUM(t.{实现盈亏}) AS {实现盈亏},SUM(t.{利息成本金额}) AS {利息成本金额},SUM(t.{利息收益}) AS {利息收益},SUM(t.{质押数量}) AS {质押数量},SUM(t.{债券应收利息}) AS {债券应收利息},SUM(t.{持仓市值}) AS {持仓市值},SUM(t.{浮动盈亏}) AS {浮动盈亏},SUM(t.{全价持仓市值}) AS {全价持仓市值} */
      SELECT  t.co_no,t.exch_no,t.stock_code_no,t.invest_type,t.stock_type,t.init_date,max(last_price) AS last_price,max(row_id) AS row_id,SUM(t.begin_qty) AS begin_qty,SUM(t.curr_qty) AS curr_qty,SUM(t.frozen_qty) AS frozen_qty,SUM(t.unfroz_qty) AS unfroz_qty,SUM(t.cost_amt) AS cost_amt,SUM(t.realize_pandl) AS realize_pandl,SUM(t.intrst_cost_amt) AS intrst_cost_amt,SUM(t.intrst_pandl) AS intrst_pandl,SUM(t.impawn_qty) AS impawn_qty,SUM(t.bond_receivable_amt) AS bond_receivable_amt,SUM(t.posi_market_value) AS posi_market_value,SUM(t.float_pandl) AS float_pandl,SUM(t.full_holding_amt) AS full_holding_amt

      /* from  ~报表_资管报表_交易组持仓查询历表^ t */
      from  db_rpts.tb_rptasset_exgrp_posi_his t

      /* WHERE  t.{初始化日期} between @开始日期# and @结束日期# */
      WHERE  t.init_date between v_begin_date and v_end_date

      /* and (t.{机构编号}=@操作员机构编号#) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) */
      and (t.co_no=v_opor_co_no) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no)

      /* and (t.{当前数量} <> 0 or t.{期初数量} <> 0) */
      and (t.curr_qty <> 0 or t.begin_qty <> 0)

      /* and (t.{机构编号},t.{产品编号},t.{交易组编号} ) in (select {机构编号},{产品编号},{交易组编号}  from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) */
      and (t.co_no,t.pd_no,t.exch_group_no ) in (select co_no,pd_no,exch_group_no  from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no)

      /* GROUP BY t.{初始化日期},t.{机构编号},t.{市场编号},t.{证券代码编号},t.{投资类型},t.{证券类型} */
      GROUP BY t.init_date,t.co_no,t.exch_no,t.stock_code_no,t.invest_type,t.stock_type
     ) m

     /* left join ( SELECT  a.{初始化日期},a.{机构编号},sum(a.{净资产}) as {净资产} from ~报表_资管报表_交易组资产查询历表^ a */
     left join ( SELECT  a.init_date,a.co_no,sum(a.nav_asset) as nav_asset from db_rpts.tb_rptasset_exgrp_asset_his a

      /* WHERE (a.{机构编号}=@操作员机构编号#) */
      WHERE (a.co_no=v_opor_co_no)

     /* and (a.{初始化日期} between @开始日期# and @结束日期#) */
     and (a.init_date between v_begin_date and v_end_date)

     /* and (a.{机构编号},a.{产品编号},a.{交易组编号} ) in (select {机构编号},{产品编号},{交易组编号}  from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) */
     and (a.co_no,a.pd_no,a.exch_group_no ) in (select co_no,pd_no,exch_group_no  from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no)

     /* group by a.{初始化日期},a.{机构编号} */
     group by a.init_date,a.co_no

    /* ) a on (a.{初始化日期},a.{机构编号}) = (m.{初始化日期},m.{机构编号}) */
    ) a on (a.init_date,a.co_no) = (m.init_date,m.co_no)

     /* where {记录序号} > @记录序号# */
     where row_id > v_row_id

    /* and {记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0账户盈亏报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);
    declare v_query_str text;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";
    SET v_query_str = " ";
    SET v_exe_sql_str = " ";

    
    label_pro:BEGIN
    

    /* [按条件拼字符串][@查询条件#][1=1][' and t.{机构编号}=',@操作员机构编号#] */
    if 1=1 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.co_no=',v_opor_co_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询操作员编号#<> 0][' and t.{操作员编号}=',@查询操作员编号#] */
    if v_query_opor_no<> 0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.opor_no=',v_query_opor_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询开始日期#<>0][' and t.{初始化日期}>=',@查询开始日期#] */
    if v_qry_begin_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.init_date>=',v_qry_begin_date);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询结束日期#<>0][' and t.{初始化日期}<=',@查询结束日期#] */
    if v_qry_end_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.init_date<=',v_qry_end_date);
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and t.{产品编号}=',@产品编号#] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.pd_no=',v_pd_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and t.{交易组编号}=',@交易组编号#] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.exch_group_no=',v_exch_group_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@市场编号#<>0][' and t.{市场编号}=',@市场编号#] */
    if v_exch_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.exch_no=',v_exch_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@证券代码编号#<>0][' and t.{证券代码编号}=',@证券代码编号#] */
    if v_stock_code_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.stock_code_no=',v_stock_code_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>0][' and t.{资产账户编号}=',@资产账户编号#] */
    if v_asset_acco_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.asset_acco_no=',v_asset_acco_no);
    end if;

    # 产品权限
    #[按条件拼字符串][@查询条件#][@操作员编号#<>0]['  and {持仓状态} <>  3 and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = ',@操作员编号#,')']

    /* [按条件拼字符串][@查询条件#][@操作员编号#<>0]['  and  ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = ',@操作员编号#,')'] */
    if v_opor_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,'  and  (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = ',v_opor_no,')');
    end if;


    /* set @查询语句# = ""; */
    set v_query_str = "";

    /* set @查询语句# = concat(ifnull(@查询语句#,""),"t.{初始化日期} as {初始化日期},t.{证券代码}"); */
    set v_query_str = concat(ifnull(v_query_str,""),"t.init_date as init_date,t.stock_code");

    /* set @查询语句# =  concat(@查询语句#,",ifnull(SUM(t.{开仓市值} + t.{平仓市值}),0) as {交易金额},ifnull(SUM(t.{平仓市值}),0) as {平仓市值},SUM(t.{开仓费用}+t.{平仓费用}) as {全部费用}"); */
    set v_query_str =  concat(v_query_str,",ifnull(SUM(t.open_posi_value + t.close_posi_market_value),0) as trade_amt,ifnull(SUM(t.close_posi_market_value),0) as close_posi_market_value,SUM(t.open_posi_fee+t.close_posi_fee) as all_fee");

    /* set @查询语句# = concat(@查询语句#,",sum(if(t.{多空类型} =1,t.{当前数量},t.{平仓数量})) as {买入数量},sum(if(t.{多空类型} =1,t.{平仓数量},t.{当前数量})) as {卖出数量},sum(if(t.{多空类型} =1,t.{开仓市值},t.{平仓市值})) as {买入金额},sum(if(t.{多空类型} =1,t.{平仓市值},t.{开仓市值})) as {卖出金额},sum(if(t.{多空类型} =1,(t.{当前数量} - t.{平仓数量}),(t.{平仓数量} - t.{当前数量}))) as {数量差额}"); */
    set v_query_str = concat(v_query_str,",sum(if(t.lngsht_type =1,t.curr_qty,t.close_posi_qty)) as buy_qty,sum(if(t.lngsht_type =1,t.close_posi_qty,t.curr_qty)) as sell_qty,sum(if(t.lngsht_type =1,t.open_posi_value,t.close_posi_market_value)) as buy_amt,sum(if(t.lngsht_type =1,t.close_posi_market_value,t.open_posi_value)) as sellout_amt,sum(if(t.lngsht_type =1,(t.curr_qty - t.close_posi_qty),(t.close_posi_qty - t.curr_qty))) as diff_qty");

    /* set @查询语句# = concat(@查询语句#,",SUM(t.{实现盈亏}) as {实现盈亏},SUM(t.{隔夜盈亏}) as {隔夜盈亏}"); */
    set v_query_str = concat(v_query_str,",SUM(t.realize_pandl) as realize_pandl,SUM(t.over_night_pandl) as over_night_pandl");

    /* set @查询语句# = concat(@查询语句#,",SUM(t.{开仓市值}) as {开仓市值},SUM(t.{平仓数量}) as {平仓数量},SUM(t.{当前数量}) as {当前数量} "); */
    set v_query_str = concat(v_query_str,",SUM(t.open_posi_value) as open_posi_value,SUM(t.close_posi_qty) as close_posi_qty,SUM(t.curr_qty) as curr_qty ");

    /* set @查询语句# = concat(@查询语句#,",SUM(t.{当前数量}+if(t.{持仓状态}=3,0,t.{平仓数量})) as {交易数量},IFNULL(SUM(t.{实现盈亏}) / sum(t.{平仓市值}),0) as {收益率},SUM(t.{实现盈亏}+t.{隔夜盈亏}) as {累计实现盈亏} "); */
    set v_query_str = concat(v_query_str,",SUM(t.curr_qty+if(t.posi_status=3,0,t.close_posi_qty)) as trade_qty,IFNULL(SUM(t.realize_pandl) / sum(t.close_posi_market_value),0) as yield_rate,SUM(t.realize_pandl+t.over_night_pandl) as sum_realize_pandl ");

    /* set @查询语句# = concat(@查询语句#,",SUM(case when t.{多空类型}=1 then t.{当前数量}- t.{平仓数量} when t.{多空类型}=2 then -1*(t.{当前数量}- t.{平仓数量}) end) as {持仓数量}"); */
    set v_query_str = concat(v_query_str,",SUM(case when t.lngsht_type=1 then t.curr_qty- t.close_posi_qty when t.lngsht_type=2 then -1*(t.curr_qty- t.close_posi_qty) end) as posi_qty");

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* set @查询语句# = concat(@查询语句#," from ~报表_资管报表_T0_证券持仓明细表^ t where ",@查询条件#); */
    set v_query_str = concat(v_query_str," from db_rpts.vi_tdset0_stock_posi_detail t where ",v_query_cond);
    else

    /* set @查询语句# = concat(@查询语句#," from ~报表_资管报表_T0_证券持仓明细表历史^ t where ",@查询条件#); */
    set v_query_str = concat(v_query_str," from db_rpts.vi_tdset0_stock_posi_detail_his t where ",v_query_cond);
    end if;

    /* if @汇总方式# = 2 then */
    if v_sum_type = 2 then

    /* set @执行语句# = concat('select t.{产品编号} as {产品编号},t.{交易组编号} as {交易组编号},0 as {操作员编号},0 as {证券代码编号},0 as {市场编号},t.{资产账户编号},',@查询语句#,' group by t.{初始化日期},t.{产品编号},t.{交易组编号}'); */
    set v_exe_sql_str = concat('select t.pd_no as pd_no,t.exch_group_no as exch_group_no,0 as opor_no,0 as stock_code_no,0 as exch_no,t.asset_acco_no,',v_query_str,' group by t.init_date,t.pd_no,t.exch_group_no');

    /* elseif @汇总方式# = 3 then */
    elseif v_sum_type = 3 then

    /* set @执行语句# = concat('select 0 as {产品编号},0 as {交易组编号},t.{操作员编号} as {操作员编号},0 as {证券代码编号},0 as {市场编号},0 as {资产账户编号},',@查询语句#,' group by t.{初始化日期},t.{操作员编号}'); */
    set v_exe_sql_str = concat('select 0 as pd_no,0 as exch_group_no,t.opor_no as opor_no,0 as stock_code_no,0 as exch_no,0 as asset_acco_no,',v_query_str,' group by t.init_date,t.opor_no');

    /* elseif @汇总方式# =  4 then */
    elseif v_sum_type =  4 then

    /* set @执行语句# = concat('select 0 as {产品编号},0 as {交易组编号},t.{操作员编号} as {操作员编号},t.{证券代码编号} as {证券代码编号},t.{市场编号} as {市场编号},0 as {资产账户编号},',@查询语句#,' group by t.{初始化日期},t.{操作员编号},t.{证券代码编号},t.{市场编号}'); */
    set v_exe_sql_str = concat('select 0 as pd_no,0 as exch_group_no,t.opor_no as opor_no,t.stock_code_no as stock_code_no,t.exch_no as exch_no,0 as asset_acco_no,',v_query_str,' group by t.init_date,t.opor_no,t.stock_code_no,t.exch_no');
    else

    /* set @执行语句# = concat('select t.{产品编号} as {产品编号},0 as {交易组编号},0 as {操作员编号},0 as {证券代码编号},0 as {市场编号},0 as {资产账户编号},',@查询语句#,' group by t.{初始化日期},t.{产品编号}'); */
    set v_exe_sql_str = concat('select t.pd_no as pd_no,0 as exch_group_no,0 as opor_no,0 as stock_code_no,0 as exch_no,0 as asset_acco_no,',v_query_str,' group by t.init_date,t.pd_no');
    end if;

    /* set @执行语句# = concat(@执行语句#," order by {初始化日期},{产品编号},{交易组编号},{操作员编号},{市场编号}  limit 65535"); */
    set v_exe_sql_str = concat(v_exe_sql_str," order by init_date,pd_no,exch_group_no,opor_no,exch_no  limit 65535");

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

# 原子_报表_资管报表_T+0账户盈亏报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryHisT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryHisT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0账户敞口报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0UnitExposureReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0UnitExposureReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);
    declare v_query_str text;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";
    SET v_query_str = " ";
    SET v_exe_sql_str = " ";

    
    label_pro:BEGIN
    

    /* [按条件拼字符串][@查询条件#][1=1][' and a.{机构编号}=',@操作员机构编号#] */
    if 1=1 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.co_no=',v_opor_co_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询操作员编号#<> 0][' and a.{操作员编号}=',@查询操作员编号#] */
    if v_query_opor_no<> 0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.opor_no=',v_query_opor_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询开始日期#<>0][' and a.{初始化日期}>=',@查询开始日期#] */
    if v_qry_begin_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.init_date>=',v_qry_begin_date);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询结束日期#<>0][' and a.{初始化日期}<=',@查询结束日期#] */
    if v_qry_end_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.init_date<=',v_qry_end_date);
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and a.{产品编号}=',@产品编号#] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.pd_no=',v_pd_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and a.{交易组编号}=',@交易组编号#] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.exch_group_no=',v_exch_group_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@市场编号#<>0][' and a.{市场编号}=',@市场编号#] */
    if v_exch_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.exch_no=',v_exch_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@证券代码编号#<>0][' and a.{证券代码编号}=',@证券代码编号#] */
    if v_stock_code_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.stock_code_no=',v_stock_code_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>0][' and a.{资产账户编号}=',@资产账户编号#] */
    if v_asset_acco_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.asset_acco_no=',v_asset_acco_no);
    end if;

    # 产品权限

    /* [按条件拼字符串][@查询条件#][@操作员编号#<>0][' and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = ',@操作员编号#,')'] */
    if v_opor_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = ',v_opor_no,')');
    end if;


    /* set @查询语句# = ""; */
    set v_query_str = "";

    /* set @查询语句# = concat(ifnull(@查询语句#,""),"a.{初始化日期} as {初始化日期}"); */
    set v_query_str = concat(ifnull(v_query_str,""),"a.init_date as init_date");

    /* set @查询语句# = concat(@查询语句# ,",SUM(a.{开仓市值}) as {开仓市值},SUM(a.{开仓费用}) as {开仓费用},SUM(a.{平仓数量}) as {平仓数量},SUM(a.{平仓市值}) as {平仓市值},SUM(a.{平仓费用}) as {平仓费用}"); */
    set v_query_str = concat(v_query_str ,",SUM(a.open_posi_value) as open_posi_value,SUM(a.open_posi_fee) as open_posi_fee,SUM(a.close_posi_qty) as close_posi_qty,SUM(a.close_posi_market_value) as close_posi_market_value,SUM(a.close_posi_fee) as close_posi_fee");

    /* set @查询语句# = concat(@查询语句#,",SUM(a.{当前数量}) as {当前数量},SUM(a.{实现盈亏}) as {实现盈亏},SUM(a.{隔夜盈亏}) as {隔夜盈亏}"); */
    set v_query_str = concat(v_query_str,",SUM(a.curr_qty) as curr_qty,SUM(a.realize_pandl) as realize_pandl,SUM(a.over_night_pandl) as over_night_pandl");

    /* set @查询语句# = concat(@查询语句#,",SUM(a.{当前数量} - a.{平仓数量}) as {未平仓数量},SUM(a.{当前数量} - a.{平仓数量})*sq.{最新价} as {未平仓市值}"); */
    set v_query_str = concat(v_query_str,",SUM(a.curr_qty - a.close_posi_qty) as un_close_posi_qty,SUM(a.curr_qty - a.close_posi_qty)*sq.last_price as un_close_marke_value");

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* set @查询语句# = concat(@查询语句#," from ~报表_资管报表_T0_证券持仓明细表^ a "); */
    set v_query_str = concat(v_query_str," from db_rpts.vi_tdset0_stock_posi_detail a ");

    /* set @查询语句# = concat(@查询语句#," join ~报表_资管报表_视图-证券基础数据-证券行情表^ sq on (a.{证券代码编号}) = (sq.{证券代码编号}) "); */
    set v_query_str = concat(v_query_str," join db_rpts.vi_basesedt_stock_quot sq on (a.stock_code_no) = (sq.stock_code_no) ");
    else

    /* set @查询语句# = concat(@查询语句#," from ~报表_资管报表_T0_证券持仓明细表历史^ a "); */
    set v_query_str = concat(v_query_str," from db_rpts.vi_tdset0_stock_posi_detail_his a ");

    /* set @查询语句# = concat(@查询语句#," join ~报表_资管报表_视图-证券基础数据-历史证券行情表^ sq on (a.{证券代码编号},a.{初始化日期}) = (sq.{证券代码编号},sq.{初始化日期}) "); */
    set v_query_str = concat(v_query_str," join db_rpts.vi_basesedt_stock_quot_his sq on (a.stock_code_no,a.init_date) = (sq.stock_code_no,sq.init_date) ");
    end if;

    /* set @查询语句# = concat(@查询语句#," where ",@查询条件#); */
    set v_query_str = concat(v_query_str," where ",v_query_cond);

    /* if @汇总方式# = 2 then */
    if v_sum_type = 2 then

    /* set @执行语句# = concat('select a.{初始化日期} as {初始化日期},a.{产品编号} as {产品编号},a.{交易组编号} as {交易组编号},0 as {操作员编号},a.{市场编号},a.{证券代码编号},0 as {资产账户编号},' ,@查询语句#,' group by a.{初始化日期},a.{产品编号},a.{交易组编号},a.{市场编号},a.{证券代码编号}'); */
    set v_exe_sql_str = concat('select a.init_date as init_date,a.pd_no as pd_no,a.exch_group_no as exch_group_no,0 as opor_no,a.exch_no,a.stock_code_no,0 as asset_acco_no,' ,v_query_str,' group by a.init_date,a.pd_no,a.exch_group_no,a.exch_no,a.stock_code_no');

    /* elseif @汇总方式# = 3 then */
    elseif v_sum_type = 3 then

    /* set @执行语句# = concat('select a.{初始化日期} as {初始化日期},0 as {产品编号},0 as {交易组编号},a.{操作员编号} as {操作员编号},a.{市场编号} as {市场编号},a.{证券代码编号},0 as {资产账户编号},' ,@查询语句#,' group by a.{初始化日期},a.{操作员编号},a.{市场编号},a.{证券代码编号}'); */
    set v_exe_sql_str = concat('select a.init_date as init_date,0 as pd_no,0 as exch_group_no,a.opor_no as opor_no,a.exch_no as exch_no,a.stock_code_no,0 as asset_acco_no,' ,v_query_str,' group by a.init_date,a.opor_no,a.exch_no,a.stock_code_no');
    else

    /* set @执行语句# = concat('select a.{初始化日期} as {初始化日期},a.{产品编号} as {产品编号},0 as {交易组编号},0 as {操作员编号},a.{市场编号},a.{证券代码编号},0 as {资产账户编号},' ,@查询语句#,' group by a.{初始化日期},a.{产品编号},a.{市场编号},a.{证券代码编号}'); */
    set v_exe_sql_str = concat('select a.init_date as init_date,a.pd_no as pd_no,0 as exch_group_no,0 as opor_no,a.exch_no,a.stock_code_no,0 as asset_acco_no,' ,v_query_str,' group by a.init_date,a.pd_no,a.exch_no,a.stock_code_no');
    end if;

    /* set @执行语句# = concat(@执行语句#," order by {初始化日期},{产品编号},{交易组编号},{操作员编号},{市场编号} limit 65535"); */
    set v_exe_sql_str = concat(v_exe_sql_str," order by init_date,pd_no,exch_group_no,opor_no,exch_no limit 65535");

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

# 原子_报表_资管报表_T+0账户敞口报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryHisT0UnitExposureReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryHisT0UnitExposureReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_证券成交流水明细查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_trd_secu_execution_query;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_trd_secu_execution_query(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_type int,
    IN p_row_count int,
    IN p_query_cond varchar(2048),
    IN p_sort_type int,
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
    declare v_query_type int;
    declare v_row_count int;
    declare v_query_cond varchar(2048);
    declare v_sort_type int;
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
    SET v_query_type = p_query_type;
    SET v_row_count = p_row_count;
    SET v_query_cond = p_query_cond;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

    /* if @查询方式# = 2 then */
    if v_query_type = 2 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},{交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 3 then */
    elseif v_query_type = 3 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


     /* elseif @查询方式# = 4 then */
     elseif v_query_type = 4 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},{操作员编号} as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 5 then */
    elseif v_query_type = 5 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},' ' as {产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    else

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},{交易组编号},{申报日期},{通道编号},{指令序号},{订单日期},{订单时间},{申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},{成交价格},{订单方向},{订单价格},{订单数量},{成交日期},{成交时间},{成交编号},{成交数量},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{记录序号},{操作员编号} as {业务操作员编号},{债券计提利息},{净价标志},{成交金额}+{债券计提利息} as {全价成交金额},{成交价格} as {成交均价},{体外指令标志},{记录有效标志},{记录序号} as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,strike_price as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,strike_price as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    end if;
    else

    /* if @查询方式# = 2 then */
    if v_query_type = 2 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},{交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 3 then */
    elseif v_query_type = 3 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 4 then */
    elseif v_query_type = 4 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},{操作员编号} as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 5 then */
    elseif v_query_type = 5 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},' ' as {产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},{订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    else

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表][{机构编号},{产品编号},{交易组编号},{申报日期},{通道编号},{指令序号},{订单日期},{订单时间},{申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},{成交价格},{订单方向},{订单价格},{订单数量},{成交日期},{成交时间},{成交编号},{成交数量},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{记录序号},{操作员编号} as {业务操作员编号},{债券计提利息},{净价标志},{成交金额}+{债券计提利息} as {全价成交金额},{成交价格} as {成交均价},{体外指令标志},{记录有效标志},{记录序号} as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,strike_price as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,strike_price as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_证券成交流水历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_trd_secu_HisExecutionQuery;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_trd_secu_HisExecutionQuery(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_type int,
    IN p_row_count int,
    IN p_query_cond varchar(2048),
    IN p_sort_type int,
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
    declare v_query_type int;
    declare v_row_count int;
    declare v_query_cond varchar(2048);
    declare v_sort_type int;
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
    SET v_query_type = p_query_type;
    SET v_row_count = p_row_count;
    SET v_query_cond = p_query_cond;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式# = 2 then */
    if v_sort_type = 2 then

    /* if @查询方式# = 2 then */
    if v_query_type = 2 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},{交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),0),4) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),0),4) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),0),4) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 3 then */
    elseif v_query_type = 3 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 4 then */
    elseif v_query_type = 4 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},{操作员编号} as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 5 then */
    elseif v_query_type = 5 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},' ' as {产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},min({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,min(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    else

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},{交易组编号},{申报日期},{通道编号},{指令序号},{订单日期},{订单时间},{申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},{成交价格},{订单方向},{订单价格},{订单数量},{成交日期},{成交时间},{成交编号},{成交数量},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{记录序号},{操作员编号} as {业务操作员编号},{债券计提利息},{净价标志},{成交金额}+{债券计提利息} as {全价成交金额},ifnull(Round({成交金额}/{成交数量},4),0) as {成交均价},{体外指令标志},{记录有效标志},{记录序号} as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,ifnull(Round(strike_amt/strike_qty,4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,ifnull(Round(strike_amt/strike_qty,4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    end if;
    else

    /* if @查询方式# = 2 then */
    if v_query_type = 2 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},{交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),0),4) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),0),4) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),0),4) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 3 then */
    elseif v_query_type = 3 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 4 then */
    elseif v_query_type = 4 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},{操作员编号} as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,opor_no as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;


    /* elseif @查询方式# = 5 then */
    elseif v_query_type = 5 then

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},' ' as {产品编号},' ' as {交易组编号},0 as {申报日期},{通道编号},0 as {指令序号},0 as {订单日期},0 as {订单时间},0 as {申报编号},' ' as {资产账户编号},' ' as {股东代码编号},{市场编号},{证券类型},{证券代码编号},Round(sum({成交金额})/sum({成交数量}),4) as {成交价格},{订单方向},0 as {订单价格},0 as {订单数量},{成交日期},0 as {成交时间},0 as {成交编号},sum({成交数量}) as {成交数量},sum({成交金额}) as {成交金额},sum({全部费用}) as {全部费用},sum({印花税}) as {印花税},sum({过户费}) as {过户费},sum({经手费}) as {经手费},sum({证管费}) as {证管费},sum({其他费用}) as {其他费用},sum({交易佣金}) as {交易佣金},sum({其他佣金}) as {其他佣金},max({记录序号}) as {记录序号},0 as {业务操作员编号},sum({债券计提利息}) as {债券计提利息},'0' as {净价标志},sum({成交金额}+{债券计提利息}) as {全价成交金额},ifnull(Round(sum({成交金额})/sum({成交数量}),4),0) as {成交均价},{体外指令标志},{记录有效标志},0 as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,' ' as pd_no,' ' as exch_group_no,0 as report_date,pass_no,0 as comm_id,0 as order_date,0 as order_time,0 as report_no,' ' as asset_acco_no,' ' as stock_acco_no,exch_no,stock_type,stock_code_no,Round(sum(strike_amt)/sum(strike_qty),4) as strike_price,order_dir,0 as order_price,0 as order_qty,strike_date,0 as strike_time,0 as strike_no,sum(strike_qty) as strike_qty,sum(strike_amt) as strike_amt,sum(all_fee) as all_fee,sum(stamp_tax) as stamp_tax,sum(trans_fee) as trans_fee,sum(brkage_fee) as brkage_fee,sum(SEC_charges) as SEC_charges,sum(other_fee) as other_fee,sum(trade_commis) as trade_commis,sum(other_commis) as other_commis,max(row_id) as row_id,0 as busi_opor_no,sum(bond_accr_intrst) as bond_accr_intrst,'0' as net_price_flag,sum(strike_amt+bond_accr_intrst) as full_execution_amt,ifnull(Round(sum(strike_amt)/sum(strike_qty),4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,0 as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    else

     /* [执行查询语句][报表_资管报表_交易证券-报盘-成交表-历史][{机构编号},{产品编号},{交易组编号},{申报日期},{通道编号},{指令序号},{订单日期},{订单时间},{申报编号},{资产账户编号},{股东代码编号},{市场编号},{证券类型},{证券代码编号},{成交价格},{订单方向},{订单价格},{订单数量},{成交日期},{成交时间},{成交编号},{成交数量},{成交金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{其他佣金},{记录序号},{操作员编号} as {业务操作员编号},{债券计提利息},{净价标志},{成交金额}+{债券计提利息} as {全价成交金额},ifnull(Round({成交金额}/{成交数量},4),0) as {成交均价},{体外指令标志},{记录有效标志},{记录序号} as {成交序号}][@查询条件#][@指定行数#] */
     if v_row_count = -1 then
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,ifnull(Round(strike_amt/strike_qty,4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond);
     else
         set @tmp_sql = CONCAT("select co_no,pd_no,exch_group_no,report_date,pass_no,comm_id,order_date,order_time,report_no,asset_acco_no,stock_acco_no,exch_no,stock_type,stock_code_no,strike_price,order_dir,order_price,order_qty,strike_date,strike_time,strike_no,strike_qty,strike_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,other_commis,row_id,opor_no as busi_opor_no,bond_accr_intrst,net_price_flag,strike_amt+bond_accr_intrst as full_execution_amt,ifnull(Round(strike_amt/strike_qty,4),0) as strike_aver_price,exter_comm_flag,record_valid_flag,row_id as strike_id from db_rpts.vi_tdserp_strike_his where ",v_query_cond," limit ",v_row_count);
     end if;
     PREPARE stmt from @tmp_sql;
     EXECUTE stmt;
     set @tmp_sql = '';
     DEALLOCATE PREPARE stmt;

    end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0账户月盈亏报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Month_QueryT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Month_QueryT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_busi_opor_no int,
    IN p_sum_type int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_sum_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0账户月盈亏报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Month_QueryHisT0UnitPandlReport;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Month_QueryHisT0UnitPandlReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_busi_opor_no int,
    IN p_sum_type int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_sum_type int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);
    declare v_query_str text;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";
    SET v_query_str = " ";
    SET v_exe_sql_str = " ";

    
    label_pro:BEGIN
    

    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(',@查询条件#); */
    set v_query_cond = concat('(',v_query_cond);

    /* [按条件拼字符串][@查询条件#][@机构编号串#<>"0"][' or a.{机构编号} in (',@机构编号串#,')'] */
    if v_co_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.co_no in (',v_co_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号串#<>"0"][' or a.{产品编号} in (',@产品编号串#,')'] */
    if v_pd_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.pd_no in (',v_pd_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0"][' or a.{交易组编号} in (',@交易组编号串#,')'] */
    if v_exch_group_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.exch_group_no in (',v_exch_group_no_str,')');
    end if;


    /* set @查询条件# = concat(@查询条件#,')'); */
    set v_query_cond = concat(v_query_cond,')');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

     /* set @查询条件# = "1=1"; */
     set v_query_cond = "1=1";
    end if;

    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and a.{产品编号}=',@产品编号#] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.pd_no=',v_pd_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and a.{交易组编号}=',@交易组编号#] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.exch_group_no=',v_exch_group_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@业务操作员编号#<> 0][' and a.{操作员编号}=',@业务操作员编号#] */
    if v_busi_opor_no<> 0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.opor_no=',v_busi_opor_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@开始日期#<>0][' and a.{初始化日期}>="',@开始日期#,'"'] */
    if v_begin_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.init_date>="',v_begin_date,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@结束日期#<>0][' and a.{初始化日期}<="',@结束日期#,'"'] */
    if v_end_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.init_date<="',v_end_date,'"');
    end if;


    /* set @查询语句# = "ifnull(sum(a.{交易金额}),0) as {交易金额},ifnull(sum(a.{平仓市值}),0) as {平仓市值},Round(ifnull(sum(a.{实现盈亏}),0),2) as {当月盈亏},Round(ifnull(sum(a.{全部费用}),0),2) as {全部费用}"; */
    set v_query_str = "ifnull(sum(a.trade_amt),0) as trade_amt,ifnull(sum(a.close_posi_market_value),0) as close_posi_market_value,Round(ifnull(sum(a.realize_pandl),0),2) as month_pandl,Round(ifnull(sum(a.all_fee),0),2) as all_fee";

    /* set @查询语句# = concat(@查询语句#,",Round(ifnull(sum(a.{买入金额}),0),2) as {买入金额},Round(ifnull(sum(a.{销售金额}),0),2) as {销售金额}"); */
    set v_query_str = concat(v_query_str,",Round(ifnull(sum(a.buy_amt),0),2) as buy_amt,Round(ifnull(sum(a.sell_amt),0),2) as sell_amt");

    /* set @查询语句# = concat(@查询语句#,",Round(ifnull(SUM(a.{实现盈亏})/SUM(a.{平仓市值}),0),4) as {收益率},0 as {撤单率}"); */
    set v_query_str = concat(v_query_str,",Round(ifnull(SUM(a.realize_pandl)/SUM(a.close_posi_market_value),0),4) as yield_rate,0 as cancel_rate");

    /* set @查询语句# = concat(@查询语句#," from ~报表_资管报表_交易证券-T0-账户交易信息历史表^ a where ",@查询条件#); */
    set v_query_str = concat(v_query_str," from db_rpts.vi_tdset0_trade_total_his a where ",v_query_cond);

    /* if @汇总方式# = 2 then */
    if v_sum_type = 2 then

    /* set @执行语句# = concat('select left(a.{初始化日期},6) as {当前月份},a.{产品编号} as {产品编号},a.{交易组编号} as {交易组编号},0 as {操作员编号},',@查询语句#,' group by left(a.{初始化日期},6),a.{产品编号},a.{交易组编号}'); */
    set v_exe_sql_str = concat('select left(a.init_date,6) as curr_month,a.pd_no as pd_no,a.exch_group_no as exch_group_no,0 as opor_no,',v_query_str,' group by left(a.init_date,6),a.pd_no,a.exch_group_no');

    /* elseif @汇总方式# = 3 then */
    elseif v_sum_type = 3 then

    /* set @执行语句# = concat('select left(a.{初始化日期},6) as {当前月份},0 as {产品编号},0 as {交易组编号},a.{操作员编号} as {操作员编号},',@查询语句#,' group by left(a.{初始化日期},6),a.{操作员编号}'); */
    set v_exe_sql_str = concat('select left(a.init_date,6) as curr_month,0 as pd_no,0 as exch_group_no,a.opor_no as opor_no,',v_query_str,' group by left(a.init_date,6),a.opor_no');
    else

    /* set @执行语句# = concat('select left(a.{初始化日期},6) as {当前月份},a.{产品编号} as {产品编号},0 as {交易组编号},0 as {操作员编号},',@查询语句#,' group by left(a.{初始化日期},6),a.{产品编号}'); */
    set v_exe_sql_str = concat('select left(a.init_date,6) as curr_month,a.pd_no as pd_no,0 as exch_group_no,0 as opor_no,',v_query_str,' group by left(a.init_date,6),a.pd_no');
    end if;

    /* set @执行语句# = concat(@执行语句#," order by {当前月份},{产品编号},{交易组编号},{操作员编号}  limit 65535"); */
    set v_exe_sql_str = concat(v_exe_sql_str," order by curr_month,pd_no,exch_group_no,opor_no  limit 65535");

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

# 原子_报表_资管报表_T+0账户盈亏专用报表查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_QueryT0UnitPandlSpecialReport;;
DELIMITER ;;
CREATE PROCEDURE pra_QueryT0UnitPandlSpecialReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select  f_get_init_date() as {初始化日期}, */
    select  f_get_init_date() as init_date,

    /* t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号}, */
    t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no,

    /* SUM(t.{当前数量}) as {当前数量}, */
    SUM(t.curr_qty) as curr_qty,

    /* SUM(t.{开仓市值}) as {开仓市值}, */
    SUM(t.open_posi_value) as open_posi_value,

    /* SUM(t.{平仓数量}) as {平仓数量}, */
    SUM(t.close_posi_qty) as close_posi_qty,

    /* SUM(t.{平仓市值}) as {平仓市值}, */
    SUM(t.close_posi_market_value) as close_posi_market_value,

    /* SUM(t.{实现盈亏}) as {实现盈亏}, */
    SUM(t.realize_pandl) as realize_pandl,

    /* SUM(t.{隔夜盈亏}) as {隔夜盈亏}, */
    SUM(t.over_night_pandl) as over_night_pandl,

    /* SUM(t.{当前数量} - t.{平仓数量}) as {未平仓数量}, */
    SUM(t.curr_qty - t.close_posi_qty) as un_close_posi_qty,

    /* SUM(t.{开仓市值} - t.{平仓市值}) as {未平仓市值}, */
    SUM(t.open_posi_value - t.close_posi_market_value) as un_close_marke_value,

    /* SUM(t.{开仓市值} + t.{平仓市值}) as {交易金额}, */
    SUM(t.open_posi_value + t.close_posi_market_value) as trade_amt,

    /* SUM(case when t.{多空类型}=1 then t.{当前数量}- t.{平仓数量} when t.{多空类型}=2 then -1*(t.{当前数量}- t.{平仓数量}) end) as {持仓数量}, */
    SUM(case when t.lngsht_type=1 then t.curr_qty- t.close_posi_qty when t.lngsht_type=2 then -1*(t.curr_qty- t.close_posi_qty) end) as posi_qty,

    /* SUM(t.{当前数量}+t.{平仓数量}) as {交易数量}, */
    SUM(t.curr_qty+t.close_posi_qty) as trade_qty,

    /* SUM(t.{开仓费用}+t.{平仓费用}) as {全部费用}, */
    SUM(t.open_posi_fee+t.close_posi_fee) as all_fee,

    /* IFNULL(SUM(t.{实现盈亏}) / sum(t.{平仓市值}),0) as {收益率}, */
    IFNULL(SUM(t.realize_pandl) / sum(t.close_posi_market_value),0) as yield_rate,

    /* SUM(t.{实现盈亏}+t.{隔夜盈亏}) as {累计实现盈亏} */
    SUM(t.realize_pandl+t.over_night_pandl) as sum_realize_pandl

    /* from ~报表_资管报表_T0_证券持仓明细表历史^ t where (t.{机构编号} = @操作员机构编号#) */
    from db_rpts.vi_tdset0_stock_posi_detail_his t where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and (@资产账户编号# = 0 or t.{资产账户编号} = @资产账户编号#) */
    and (v_asset_acco_no = 0 or t.asset_acco_no = v_asset_acco_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@查询操作员编号# = 0 or t.{操作员编号} = @查询操作员编号#) */
    and (v_query_opor_no = 0 or t.opor_no = v_query_opor_no)

    /* group by t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号}  limit 65535 */
    group by t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no  limit 65535
    ;
    #民享增强交易盈亏报表需求：1、按操作员、股票代码、日期汇总；2、隔夜仓但当日无平仓操作的不显示（筛选条件：操作员+日期+代码+产品编码+单元编码）  ，有平仓操作需要显示；   --开仓时间不为init_date，并且新增的字段为空3、未平仓完的数据实现盈亏为0，累计盈亏为0
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0账户盈亏专用报表历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_QueryHisT0UnitPandlSpecialReport;;
DELIMITER ;;
CREATE PROCEDURE pra_QueryHisT0UnitPandlSpecialReport(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
    IN p_sum_type int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_sum_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_sum_type = p_sum_type;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select t.{初始化日期}, */
    select t.init_date,

    /* t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号}, */
    t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no,

    /* SUM(t.{当前数量}) as {当前数量}, */
    SUM(t.curr_qty) as curr_qty,

    /* SUM(t.{开仓市值}) as {开仓市值}, */
    SUM(t.open_posi_value) as open_posi_value,

    /* SUM(t.{平仓数量}) as {平仓数量}, */
    SUM(t.close_posi_qty) as close_posi_qty,

    /* SUM(t.{平仓市值}) as {平仓市值}, */
    SUM(t.close_posi_market_value) as close_posi_market_value,

    /* SUM(t.{实现盈亏}) as {实现盈亏}, */
    SUM(t.realize_pandl) as realize_pandl,

    /* SUM(t.{隔夜盈亏}) as {隔夜盈亏}, */
    SUM(t.over_night_pandl) as over_night_pandl,

    /* SUM(t.{当前数量} - t.{平仓数量}) as {未平仓数量}, */
    SUM(t.curr_qty - t.close_posi_qty) as un_close_posi_qty,

    /* SUM(t.{开仓市值} - t.{平仓市值}) as {未平仓市值}, */
    SUM(t.open_posi_value - t.close_posi_market_value) as un_close_marke_value,

    /* SUM(t.{开仓市值} + t.{平仓市值}) as {交易金额}, */
    SUM(t.open_posi_value + t.close_posi_market_value) as trade_amt,

    /* SUM(case when t.{多空类型}=1 then t.{当前数量}- t.{平仓数量} when t.{多空类型}=2 then -1*(t.{当前数量}- t.{平仓数量}) end) as {持仓数量}, */
    SUM(case when t.lngsht_type=1 then t.curr_qty- t.close_posi_qty when t.lngsht_type=2 then -1*(t.curr_qty- t.close_posi_qty) end) as posi_qty,

    /* SUM(t.{当前数量}+t.{平仓数量}) as {交易数量}, */
    SUM(t.curr_qty+t.close_posi_qty) as trade_qty,

    /* SUM(t.{开仓费用}+t.{平仓费用}) as {全部费用}, */
    SUM(t.open_posi_fee+t.close_posi_fee) as all_fee,

    /* IFNULL(SUM(t.{实现盈亏}) / sum(t.{平仓市值}),0) as {收益率}, */
    IFNULL(SUM(t.realize_pandl) / sum(t.close_posi_market_value),0) as yield_rate,

    /* SUM(t.{实现盈亏}+t.{隔夜盈亏}) as {累计实现盈亏} */
    SUM(t.realize_pandl+t.over_night_pandl) as sum_realize_pandl

    /* from ~报表_资管报表_T0_证券持仓明细表历史^ t where (t.{机构编号} = @操作员机构编号#) */
    from db_rpts.vi_tdset0_stock_posi_detail_his t where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and (@资产账户编号# = 0 or t.{资产账户编号} = @资产账户编号#) */
    and (v_asset_acco_no = 0 or t.asset_acco_no = v_asset_acco_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@查询操作员编号# = 0 or t.{操作员编号} = @查询操作员编号#) */
    and (v_query_opor_no = 0 or t.opor_no = v_query_opor_no)

    /* group by t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{操作员编号} limit  65535 */
    group by t.pd_no,t.exch_group_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.opor_no limit  65535
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # A股可用资金 = 当前金额(产品证券模块)+ 解冻金额(产品证券模块)- 冻结金额 (产品证券模块)+ 成交释放金额(交易证券模块) - 成交占用金额(交易证券模块)+沪深可用调整金额(产品证券模块)+ 金额核对差额(产品证券模块) - 成交占用金额(交易证券模块；币种：HK)* 卖出参考汇率 - 交易占用金额(交易证券模块)
    # [获取表全记录][报表_资管报表_视图-查询产品资产][{初始化日期},{产品编号},{产品总份额},{当前份额},{净资产},{单位净值},{昨日净值},{净值波动},{现金资产},{股票资产},{债券资产},{基金资产},{回购资产},{其他资产},{港股通资产},{期货资产},{可分配金额},{本币币种},{当日盈亏},{当日收益率},{可提现金额},{股票资产占比},{证券占比},{基金资产占比},{累计应付金额},{累计应收金额}][({机构编号}=@操作员机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#)]
    select
     t.*

    /* from ~报表_资管报表_产品资产查询表^ t where (t.{机构编号} = @操作员机构编号#) */
    from db_rpts.tb_rptasset_pd_capit_asset t where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#)  limit 65535 */
    and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)  limit 65535
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_ExGrp_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_ExGrp_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no int,
    IN p_exch_group_no_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # 交易证券_账户_交易组业务资金表 tb_tdseac_exgp_busi_capit
    # 交易证券_账户_交易组业务资金表 tb_tdseac_exgp_busi_capit
    # [获取表全记录][报表_资管报表_视图-查询交易组资产][{初始化日期},{产品编号},{交易组编号},{净资产},{交易组产品份额},{单位净值},{昨日净值},{净值波动},{可用资金},{现金资产},{股票资产},{债券资产},{基金资产},{回购资产},{其他资产},{港股通资产},{期货资产},{可分配金额},{本币币种},{当日盈亏},{当日收益率},{累计实现收益},{累计收益率},{持股比例},{累计应付金额},{累计应收金额}][({机构编号}=@操作员机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#)]

    /* [获取表全记录][报表_资管报表_交易组资产查询表][字段][({机构编号}=@操作员机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, nav_asset, 
        exch_group_pd_share, unit_nav, pre_nav, nav_fluct, 
        cash_asset, stock_asset, bond_asset, fund_asset, 
        money_fund_asset, not_money_fund_asset, repo_asset, other_asset, 
        futu_asset, hk_thrgh_stock_asset, assign_avail_amt, crncy_type, 
        today_pandl, daily_pandl_ratio, total_realiz_pandl, total_realiz_pandl_ratio, 
        posi_ratio, total_rece_amt, total_payab_amt, avail_cash, 
        capit_bala, avail_amt, total_change_amt, futu_cash_asset, 
        total_cash_asset, stock_cash_asset, hk_avail_amt, total_fina_debt, 
        total_loan_debt from db_rpts.tb_rptasset_exgrp_asset where (co_no=v_opor_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no);


    /* --  {交易组可用金额} = {当前金额} + {沪深可用调整金额} - {冻结金额} + {解冻金额}+{金额核对差额}; */
    --  exgp_avail_amt = curr_amt + shsz_avail_change_amt - frozen_amt + unfroz_amt+amt_check_diff;

    /* --  {沪深交易可用金额} = {成交释放金额} - ({成交占用金额} + {交易占用金额}) */
    --  shsz_trade_avail_amt = strike_releas_amt - (strike_capt_amt + trade_capt_amt)

    /* --  {港股交易可用金额} = {成交释放金额} * f_get_hk_buy_rate(f_get_init_date(),3) - ({成交占用金额} + {交易占用金额}) * f_get_hk_sell_rate(f_get_init_date(),3) */
    --  hk_trade_avail_amt = strike_releas_amt * f_get_hk_buy_rate(f_get_init_date(),3) - (strike_capt_amt + trade_capt_amt) * f_get_hk_sell_rate(f_get_init_date(),3)
    --  可用-日初:

    /* --  set {可用金额} ={交易组可用金额}+{沪深交易可用金额} + */
    --  set avail_amt =exgp_avail_amt+shsz_trade_avail_amt +

    /* --                  {交易组T日当日港股卖出金额}-{交易组T日当日港股买入金额} + */
    --                  exgp_T_hk_sell_total_amt-exgp_T_hk_buy_total_amt +

    /* --                  least(0,{交易组T1日当日港股卖出金额}-{交易组T1日当日港股买入金额})+ */
    --                  least(0,exgp_T1_hk_sell_total_amt-exgp_T1_hk_buy_total_amt)+

    /* --                  least(0,greatest(0,{交易组T1日当日港股卖出金额}-{交易组T1日当日港股买入金额}) + {港股交易可用金额}); */
    --                  least(0,greatest(0,exgp_T1_hk_sell_total_amt-exgp_T1_hk_buy_total_amt) + hk_trade_avail_amt);
    --  日终： 交易组：

    /* -- set {可用金额} ={交易组可用金额}+{沪深交易可用金额} + */
    -- set avail_amt =exgp_avail_amt+shsz_trade_avail_amt +

    /* --                 least(0,{交易组T日当日港股卖出金额}-{交易组T日当日港股买入金额}) + */
    --                 least(0,exgp_T_hk_sell_total_amt-exgp_T_hk_buy_total_amt) +

    /* --                least(0,greatest(0,{交易组T日当日港股卖出金额}-{交易组T日当日港股买入金额})+{交易组T1日当日港股卖出金额}-{交易组T1日当日港股买入金额})+ */
    --                least(0,greatest(0,exgp_T_hk_sell_total_amt-exgp_T_hk_buy_total_amt)+exgp_T1_hk_sell_total_amt-exgp_T1_hk_buy_total_amt)+

    /* --                 least(0,greatest(0,greatest(0,{交易组T日当日港股卖出金额}-{交易组T日当日港股买入金额})+{交易组T1日当日港股卖出金额}-{交易组T1日当日港股买入金额}) + {港股交易可用金额}); */
    --                 least(0,greatest(0,greatest(0,exgp_T_hk_sell_total_amt-exgp_T_hk_buy_total_amt)+exgp_T1_hk_sell_total_amt-exgp_T1_hk_buy_total_amt) + hk_trade_avail_amt);
    --  资金余额=curr_amt+pre_settle_amt+amt_check_diff-A股买入金额+A股卖出金额-港股买入金额*卖出参考汇率+港股卖出金额*买入参考汇率
    

    /* --  {A股交易金额} = {成交释放金额} - {成交占用金额}; */
    --  stock_trade_amt = strike_releas_amt - strike_capt_amt;

    /* --  {港股通交易金额} = {成交释放金额}  * f_get_hk_buy_rate(f_get_init_date(),3) - {成交占用金额} * f_get_hk_sell_rate(f_get_init_date(),3); */
    --  hk_thrgh_trade_amt = strike_releas_amt  * f_get_hk_buy_rate(f_get_init_date(),3) - strike_capt_amt * f_get_hk_sell_rate(f_get_init_date(),3);

    /* --  {资金余额} = {当前金额} + {待交收金额} +{金额核对差额} + {A股交易金额} + {港股通交易金额}; */
    --  capit_bala = curr_amt + pre_settle_amt +amt_check_diff + stock_trade_amt + hk_thrgh_trade_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品资产_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Asset_His;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Asset_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_pd_no int;
    declare v_pd_no_str varchar(2048);
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # A股可用资金 = 当前金额(产品证券模块)+ 解冻金额(产品证券模块)- 冻结金额 (产品证券模块)+ 成交释放金额(交易证券模块) - 成交占用金额(交易证券模块)+沪深可用调整金额(产品证券模块)+ 金额核对差额(产品证券模块) - 成交占用金额(交易证券模块；币种：HK)* 卖出参考汇率 - 交易占用金额(交易证券模块)
    # [获取表全记录][报表_资管报表_视图-查询产品资产-历史][{初始化日期},{产品编号},{产品总份额},{当前份额},{净资产},{单位净值},{昨日净值},{净值波动},{现金资产},{股票资产},{债券资产},{基金资产},{回购资产},{其他资产},{港股通资产},{期货资产},{本币币种},{当日盈亏},{当日收益率},{可分配金额},{可提现金额},{可用资金},{股票资产占比},{证券占比},{基金资产占比},{累计应付金额},{累计应收金额}][({机构编号}=@操作员机构编号# and {初始化日期} between @开始日期# and @结束日期# ) and (@产品编号#=0 or {产品编号}=@产品编号#) and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#)]

    /* [获取表全记录][报表_资管报表_产品资产查询历表][字段][({机构编号}=@操作员机构编号# and {初始化日期} between @开始日期# and @结束日期# ) and (@产品编号#=0 or {产品编号}=@产品编号#) and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, pd_all_share, curr_share, 
        pre_share, begin_NAV, nav_asset, unit_nav, 
        pre_nav, nav_fluct, cash_asset, stock_asset, 
        bond_asset, fund_asset, not_money_fund_asset, repo_asset, 
        other_asset, futu_asset, hk_thrgh_stock_asset, assign_avail_amt, 
        crncy_type, today_pandl, daily_pandl_ratio, cash_out_amt, 
        stock_asset_ratio, fund_asset_ratio, securities_ratio, total_rece_amt, 
        total_payab_amt, money_fund_asset, stock_cost, bond_cost, 
        fund_cost, repo_cost, other_cost, futu_cost, 
        hk_thrgh_stock_cost, money_fund_cost, unit_nav_total, unit_divi_amt, 
        grp_row, last_month_pd_nav, out_acco, avail_cash, 
        capit_bala, avail_amt, total_change_amt, futu_cash_asset, 
        total_cash_asset, stock_cash_asset, capt_margin, total_fina_debt, 
        total_loan_debt from db_rpts.tb_rptasset_pd_capit_asset_his where (co_no=v_opor_co_no and init_date between v_begin_date and v_end_date ) and (v_pd_no=0 or pd_no=v_pd_no) and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询交易组资产_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_ExGrp_Asset_His;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_ExGrp_Asset_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_pd_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_pd_no = p_pd_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # A股可用资金 = 当前金额(产品证券模块)+ 解冻金额(产品证券模块)- 冻结金额 (产品证券模块)+ 成交释放金额(交易证券模块) - 成交占用金额(交易证券模块)+沪深可用调整金额(产品证券模块)+ 金额核对差额(产品证券模块) - 成交占用金额(交易证券模块；币种：HK)* 卖出参考汇率 - 交易占用金额(交易证券模块)
    # [获取表记录][报表_资管报表_视图-查询交易组资产-历史][{初始化日期},{产品编号},{交易组编号},{净资产},{交易组产品份额},{单位净值},{昨日净值},{净值波动},{可用资金},{现金资产},{股票资产},{债券资产},{基金资产},{回购资产},{其他资产},{期货资产},{港股通资产},{可分配金额},{本币币种},{当日盈亏},{当日收益率},{累计实现收益},{累计收益率},{持股比例},{累计应付金额},{累计应收金额}][({机构编号}=@操作员机构编号# and {初始化日期} between @开始日期# and @结束日期#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* [获取表记录][报表_资管报表_交易组资产查询历表][字段][({机构编号}=@操作员机构编号# and {初始化日期} between @开始日期# and @结束日期#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, nav_asset, 
        exch_group_pd_share, unit_nav, pre_nav, nav_fluct, 
        cash_asset, stock_asset, bond_asset, fund_asset, 
        money_fund_asset, not_money_fund_asset, repo_asset, other_asset, 
        futu_asset, hk_thrgh_stock_asset, assign_avail_amt, crncy_type, 
        today_pandl, daily_pandl_ratio, total_realiz_pandl, total_realiz_pandl_ratio, 
        posi_ratio, total_rece_amt, total_payab_amt, avail_cash, 
        capit_bala, avail_amt, total_change_amt, futu_cash_asset, 
        total_cash_asset, stock_cash_asset, hk_avail_amt, total_fina_debt, 
        total_loan_debt from db_rpts.tb_rptasset_exgrp_asset_his where (co_no=v_opor_co_no and init_date between v_begin_date and v_end_date) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, nav_asset, 
        exch_group_pd_share, unit_nav, pre_nav, nav_fluct, 
        cash_asset, stock_asset, bond_asset, fund_asset, 
        money_fund_asset, not_money_fund_asset, repo_asset, other_asset, 
        futu_asset, hk_thrgh_stock_asset, assign_avail_amt, crncy_type, 
        today_pandl, daily_pandl_ratio, total_realiz_pandl, total_realiz_pandl_ratio, 
        posi_ratio, total_rece_amt, total_payab_amt, avail_cash, 
        capit_bala, avail_amt, total_change_amt, futu_cash_asset, 
        total_cash_asset, stock_cash_asset, hk_avail_amt, total_fina_debt, 
        total_loan_debt from db_rpts.tb_rptasset_exgrp_asset_his where (co_no=v_opor_co_no and init_date between v_begin_date and v_end_date) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_产品_证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    
    # [获取表记录][报表_资管报表_产品持仓查询表][{记录序号},{初始化日期},{机构编号},{产品编号},{资产账户编号},{证券代码编号},{证券类型},{市场编号},{持仓市值},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{买入待交割数量},{卖出待交割数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{可用数量},{持仓净值占比},{净资产},{债券应收利息},{质押数量},{全价持仓市值}][({机构编号}=@操作员机构编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* set @指定行数# = if(@指定行数# = 0,65535,@指定行数#); */
    set v_row_count = if(v_row_count = 0,65535,v_row_count);

    /* set @汇率# = f_get_hk_avg_rate(f_get_init_date(), 3); */
    set v_exch_rate = f_get_hk_avg_rate(f_get_init_date(), 3);
    select
     t.*

     /* , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as {全价} */
     , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as full_price

     /* , if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0)) as {债券应收利息} */
     , if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0)) as bond_receivable_amt

     /* , ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.{投资类型} = 3, if(t.{公允价格}<0.001,stq.{最新价},t.{公允价格}),stq.{最新价}) * @汇率# , if(t.{投资类型} = 3, if(t.{公允价格}<0.001,stq.{最新价},t.{公允价格}),stq.{最新价}))),0) as {持仓市值} */
     , ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.invest_type = 3, if(t.fair_price<0.001,stq.last_price,t.fair_price),stq.last_price) * v_exch_rate , if(t.invest_type = 3, if(t.fair_price<0.001,stq.last_price,t.fair_price),stq.last_price))),0) as posi_market_value

     /* , ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * @汇率# , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0) as {全价持仓市值} */
     , ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * v_exch_rate , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0) as full_holding_amt

     /* , stq.{最新价} as {净价} , stq.{昨收盘价} */
     , stq.last_price as net_price , stq.pre_close_price

      /* , stq.{最新价}, stq.{成交数量} as {行情成交数量}, stq.{成交金额} as {行情成交金额} */
      , stq.last_price, stq.strike_qty as quot_strike_qty, stq.strike_amt as quot_strike_amt

    /* ,rk.{备注信息} */
    ,rk.remark_info

    /* from ~报表_资管报表_产品持仓查询表^ t */
    from db_rpts.tb_rptasset_pd_posi t

     /* left join db_dc.tb_basesedt_stock_quot stq on (t.{证券代码编号}) = (stq.{证券代码编号}) */
     left join db_dc.tb_basesedt_stock_quot stq on (t.stock_code_no) = (stq.stock_code_no)

    /* left join （select a.{证券代码编号},a.{机构编号},a.{维度类型编码},GROUP_CONCAT(b.{维度类型名称}) as {备注信息} from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b 
where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code  group by a.co_no,a.stock_code_no)  rk on (t.{证券代码编号}=rk.{证券代码编号}) and t.{机构编号}=rk.{机构编号} */
    left join (select a.stock_code_no,a.co_no,a.dime_type_code,GROUP_CONCAT(b.dime_type_name) as remark_info from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b 
    where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code  group by a.co_no,a.stock_code_no)  rk on (t.stock_code_no=rk.stock_code_no) and t.co_no=rk.co_no

    /* where (t.{机构编号} = @操作员机构编号#) and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    where (t.co_no = v_opor_co_no) and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and ({当前数量} <> 0 or {期初数量} <> 0) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) */
    and (curr_qty <> 0 or begin_qty <> 0) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no)

    /* and (t.{机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (t.co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_交易组_证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_ExGrp_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_ExGrp_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_exch_group_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_exch_group_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    
    # [获取表记录][报表_资管报表_交易组持仓查询表][字段][({机构编号}=@操作员机构编号#) and ({当前数量} <> 0 or {期初数量} <> 0) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#)  and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* set @指定行数# = if(@指定行数# = 0,65535,@指定行数#); */
    set v_row_count = if(v_row_count = 0,65535,v_row_count);

    /* set @汇率# = f_get_hk_avg_rate(f_get_init_date(), 3); */
    set v_exch_rate = f_get_hk_avg_rate(f_get_init_date(), 3);
    select
     t.*

     /* , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as {全价} */
     , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as full_price

     /* , if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0)) as {债券应收利息} */
     , if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0)) as bond_receivable_amt

     /* , ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.{投资类型} = 3, if(t.{公允价格}<0.001,stq.{最新价},t.{公允价格}),stq.{最新价}) * @汇率# ,if(t.{投资类型} = 3, if(t.{公允价格}<0.001,stq.{最新价},t.{公允价格}),stq.{最新价}))),0) as {持仓市值} */
     , ifnull(t.curr_qty * f_get_marketprice(t.stock_code_no,t.stock_code,t.exch_no,if(t.exch_no in (3,4), if(t.invest_type = 3, if(t.fair_price<0.001,stq.last_price,t.fair_price),stq.last_price) * v_exch_rate ,if(t.invest_type = 3, if(t.fair_price<0.001,stq.last_price,t.fair_price),stq.last_price))),0) as posi_market_value

     /* , ifnull(t.curr_qty *f_get_marketprice(t.stock_code_no, t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * @汇率# , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0) as {全价持仓市值} */
     , ifnull(t.curr_qty *f_get_marketprice(t.stock_code_no, t.stock_code,t.exch_no,if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * v_exch_rate , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst))),0) as full_holding_amt

     /* , stq.{最新价} as {净价} , stq.{昨收盘价} */
     , stq.last_price as net_price , stq.pre_close_price

      /* , stq.{最新价}, stq.{成交数量} as {行情成交数量}, stq.{成交金额} as {行情成交金额} */
      , stq.last_price, stq.strike_qty as quot_strike_qty, stq.strike_amt as quot_strike_amt

    /* ,rk.{备注信息} */
    ,rk.remark_info

    /* from ~报表_资管报表_交易组持仓查询表^ t */
    from db_rpts.tb_rptasset_exgrp_posi t

     /* left join db_dc.tb_basesedt_stock_quot stq on (t.{证券代码编号}) = (stq.{证券代码编号}) */
     left join db_dc.tb_basesedt_stock_quot stq on (t.stock_code_no) = (stq.stock_code_no)

    /* left join （select a.{证券代码编号},a.{机构编号},a.{维度类型编码},GROUP_CONCAT(b.{维度类型名称}) as {备注信息} from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b 
where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code  group by a.co_no,a.stock_code_no)  rk on (t.{证券代码编号}=rk.{证券代码编号}) and t.{机构编号}=rk.{机构编号} */
    left join (select a.stock_code_no,a.co_no,a.dime_type_code,GROUP_CONCAT(b.dime_type_name) as remark_info from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b 
    where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code  group by a.co_no,a.stock_code_no)  rk on (t.stock_code_no=rk.stock_code_no) and t.co_no=rk.co_no

    /* where (t.{机构编号} = @操作员机构编号#) and (@产品编号# = 0 or t.{产品编号} = @产品编号#) and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    where (t.co_no = v_opor_co_no) and (v_pd_no = 0 or t.pd_no = v_pd_no) and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and ({当前数量} <> 0 or {期初数量} <> 0) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) */
    and (curr_qty <> 0 or begin_qty <> 0) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no)

    /* and (t.{机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (t.co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no)

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_产品_证券持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Posi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Posi_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = if(@指定行数# = 0,65535,@指定行数#); */
    set v_row_count = if(v_row_count = 0,65535,v_row_count);
    #[获取表记录][报表_资管报表_产品持仓查询历表][{记录序号},{初始化日期},{机构编号},{产品编号},{资产账户编号},{证券代码编号},{证券类型},{市场编号},{持仓市值},{投资类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{买入待交割数量},{卖出待交割数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{可用数量},{持仓净值占比},{净资产},{债券应收利息},{质押数量},{全价持仓市值}][({机构编号}=@操作员机构编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and ({初始化日期} between @开始日期# and @结束日期#) and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* select t.*,rk.{备注信息} */
    select t.*,rk.remark_info

    /* from ~报表_资管报表_产品持仓查询历表^ t */
    from db_rpts.tb_rptasset_pd_posi_his t

    /* left join （select a.{证券代码编号},a.{机构编号},a.{维度类型编码},GROUP_CONCAT(b.{维度类型名称}) as {备注信息} from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b  
where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code  group by a.co_no,a.stock_code_no )  rk on (t.{证券代码编号}=rk.{证券代码编号}) and t.{机构编号}=rk.{机构编号} */
    left join (select a.stock_code_no,a.co_no,a.dime_type_code,GROUP_CONCAT(b.dime_type_name) as remark_info from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b  
    where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code  group by a.co_no,a.stock_code_no )  rk on (t.stock_code_no=rk.stock_code_no) and t.co_no=rk.co_no

    /* where (t.{机构编号} = @操作员机构编号#) */
    where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or {产品编号}=@产品编号#) */
    and (v_pd_no = 0 or pd_no=v_pd_no)

    /* and (@证券类型# = 0 or {证券类型}=@证券类型#) */
    and (v_stock_type = 0 or stock_type=v_stock_type)

    /* and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no)

    /* and ({初始化日期} between @开始日期# and @结束日期#) */
    and (init_date between v_begin_date and v_end_date)

    /* and (t.{机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (t.co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)

    /* and {记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_交易组_证券持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_ExGrp_Posi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_ExGrp_Posi_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_exch_group_no int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_exch_group_no int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #[获取表记录][报表_资管报表_交易组持仓查询历表][{记录序号},{初始化日期},{机构编号},{产品编号},{资产账户编号},{交易组编号},{市场编号},{投资类型},{证券代码编号},{证券类型},{期初数量},{当前数量},{冻结数量},{解冻数量},{交易端可用数量},{指令端可用数量},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{成本价},{最新价},{昨收盘价},{净资产},{持仓市值},{持仓净值占比},{全价持仓市值},{浮动盈亏},{盈亏比例},{债券应收利息},{质押数量}][({机构编号}=@操作员机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and ({初始化日期} between @开始日期# and @结束日期#) and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* set @指定行数# = if(@指定行数# = 0,65535,@指定行数#); */
    set v_row_count = if(v_row_count = 0,65535,v_row_count);

    /* select t.*,rk.{备注信息} */
    select t.*,rk.remark_info

    /* from ~报表_资管报表_交易组持仓查询历表^ t */
    from db_rpts.tb_rptasset_exgrp_posi_his t

    /* left join （select a.{证券代码编号},a.{机构编号},a.{维度类型编码},GROUP_CONCAT(b.{维度类型名称}) as {备注信息} from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b 
where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code   group by a.co_no,a.stock_code_no )  rk on (t.{证券代码编号}=rk.{证券代码编号}) and t.{机构编号}=rk.{机构编号} */
    left join (select a.stock_code_no,a.co_no,a.dime_type_code,GROUP_CONCAT(b.dime_type_name) as remark_info from  db_dc.tb_rksedm_user_dimension_stock a,db_dc.tb_rksedm_user_dimension_type b 
    where a.co_no=b.co_no and a.dime_type_code = b.dime_type_code   group by a.co_no,a.stock_code_no )  rk on (t.stock_code_no=rk.stock_code_no) and t.co_no=rk.co_no

    /* where (t.{机构编号} = @操作员机构编号#) */
    where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or {产品编号}=@产品编号#) */
    and (v_pd_no = 0 or pd_no=v_pd_no)

    /* and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) */
    and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)

    /* and (@证券类型# = 0 or {证券类型}=@证券类型#) */
    and (v_stock_type = 0 or stock_type=v_stock_type)

    /* and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no)

    /* and ({初始化日期} between @开始日期# and @结束日期#) */
    and (init_date between v_begin_date and v_end_date)

    /* and (t.{机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (t.co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no)

    /* and {记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_产品_期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pdfutu_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pdfutu_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_资管报表_视图-期货产品持仓][{记录序号},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志},{当前数量},{开仓价格},{盯市盈亏},{应收保证金},{成交释放数量},{今仓成交占用数量},{持仓市值},{持仓净值占比},{开仓均价}][({机构编号}=@操作员机构编号#) and  (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and ({产品编号} = @产品编号# or @产品编号# = 0) and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#)  and  {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,open_posi_price,marked_pandl,rece_margin,strike_releas_qty,today_strike_capt_qty,posi_market_value,posi_nav_ratio,open_aver_price from db_rpts.vi_futu_qry_pd_posi where (co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (pd_no = v_pd_no or v_pd_no = 0) and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)  and  row_id > v_row_id order by row_id;
    else
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,open_posi_price,marked_pandl,rece_margin,strike_releas_qty,today_strike_capt_qty,posi_market_value,posi_nav_ratio,open_aver_price from db_rpts.vi_futu_qry_pd_posi where (co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (pd_no = v_pd_no or v_pd_no = 0) and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)  and  row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_产品_期货持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pdfutu_Posi_his;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pdfutu_Posi_his(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_contrc_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select t.{记录序号},t.{初始化日期},t.{机构编号},t.{产品编号},t.{资产账户编号},t.{市场编号},t.{交易编码编号},t.{合约代码编号},t.{多空类型},t.{套保标志},t.{当前数量},t.{结算价} as {开仓价格},0 as {盯市盈亏},t.{应收保证金},0 as {成交释放数量},0 as {今仓成交占用数量},ifnull(t.curr_qty * t.sett_price * t.contrc_unit,0) as {持仓市值},ifnull( t.rece_margin / t.nav_asset, 0) as {持仓净值占比} ,ifnull(t.open_amount / t.curr_qty,0) as {开仓均价} from db_dc.tb_pdfupo_asac_posi_his t, db_dc.tb_pdacco_pd_limit c where t.{产品编号}=c.{产品编号} and c.{注销日期}=0 and (t.{机构编号}=@操作员机构编号#) and  (@合约代码编号# = 0 or t.{合约代码编号}=@合约代码编号#) and (t.{产品编号} = @产品编号# or @产品编号# = 0) and  (t.{初始化日期} between @开始日期# and @结束日期#) and (t.{机构编号},t.{产品编号}) in (select t.{机构编号},t.{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) and t.{记录序号} > @记录序号# order by t.{记录序号} limit @指定行数#; */
    select t.row_id,t.init_date,t.co_no,t.pd_no,t.asset_acco_no,t.exch_no,t.futu_acco_no,t.contrc_code_no,t.lngsht_type,t.hedge_type,t.curr_qty,t.sett_price as open_posi_price,0 as marked_pandl,t.rece_margin,0 as strike_releas_qty,0 as today_strike_capt_qty,ifnull(t.curr_qty * t.sett_price * t.contrc_unit,0) as posi_market_value,ifnull( t.rece_margin / t.nav_asset, 0) as posi_nav_ratio ,ifnull(t.open_amount / t.curr_qty,0) as open_aver_price from db_dc.tb_pdfupo_asac_posi_his t, db_dc.tb_pdacco_pd_limit c where t.pd_no=c.pd_no and c.abolish_date=0 and (t.co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or t.contrc_code_no=v_contrc_code_no) and (t.pd_no = v_pd_no or v_pd_no = 0) and  (t.init_date between v_begin_date and v_end_date) and (t.co_no,t.pd_no) in (select t.co_no,t.pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no) and t.row_id > v_row_id order by t.row_id limit v_row_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_交易组_期货持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Grpfutu_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Grpfutu_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_资管报表_视图-期货交易组持仓][{记录序号},{初始化日期},{机构编号},{产品编号},{资产账户编号},{交易组编号},{市场编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志},{当前数量},{开仓价格},{盯市盈亏},{应收保证金},{成交释放数量},{今仓成交占用数量},{持仓市值},{持仓净值占比},{开仓均价}][({机构编号}=@操作员机构编号#) and  (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#)  and  ({产品编号} = @产品编号# or @产品编号# = 0) and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_group_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,open_posi_price,marked_pandl,rece_margin,strike_releas_qty,today_strike_capt_qty,posi_market_value,posi_nav_ratio,open_aver_price from db_rpts.vi_futu_qry_grp_posi where (co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no)  and  (pd_no = v_pd_no or v_pd_no = 0) and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_group_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,open_posi_price,marked_pandl,rece_margin,strike_releas_qty,today_strike_capt_qty,posi_market_value,posi_nav_ratio,open_aver_price from db_rpts.vi_futu_qry_grp_posi where (co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no)  and  (pd_no = v_pd_no or v_pd_no = 0) and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_交易组_期货持仓_历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Grpfutu_Posi_his;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Grpfutu_Posi_his(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_contrc_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select  t.{记录序号},t.{初始化日期},t.{机构编号},t.{产品编号},t.{资产账户编号},t.{交易组编号},t.{市场编号},t.{交易编码编号},t.{合约代码编号},t.{多空类型},t.{套保标志},t.{当前数量},t.{结算价} as {开仓价格},0 as {盯市盈亏},t.{应收保证金},0 as {成交释放数量},0 as {今仓成交占用数量},ifnull(t.curr_qty * t.sett_price * t.contrc_unit,0) as {持仓市值},ifnull(t.rece_margin / t.nav_asset, 0)  as {持仓净值占比}, ifnull(t.open_amount / t.curr_qty,0) as {开仓均价} from db_dc.tb_pdfupo_exgp_posi_his t ,db_dc.tb_user_exch_group_info c where c.{注销日期}=0 and t.{交易组编号}=c.{交易组编号}  and (t.{机构编号}=@操作员机构编号#) and  (@合约代码编号# = 0 or t.{合约代码编号}=@合约代码编号#) and (t.{产品编号} = @产品编号# or @产品编号# = 0) and  (t.{初始化日期} between @开始日期# and @结束日期#) and (t.{交易组编号}) in (select {交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and t.{记录序号} > @记录序号# order by t.{记录序号} limit @指定行数#; */
    select  t.row_id,t.init_date,t.co_no,t.pd_no,t.asset_acco_no,t.exch_group_no,t.exch_no,t.futu_acco_no,t.contrc_code_no,t.lngsht_type,t.hedge_type,t.curr_qty,t.sett_price as open_posi_price,0 as marked_pandl,t.rece_margin,0 as strike_releas_qty,0 as today_strike_capt_qty,ifnull(t.curr_qty * t.sett_price * t.contrc_unit,0) as posi_market_value,ifnull(t.rece_margin / t.nav_asset, 0)  as posi_nav_ratio, ifnull(t.open_amount / t.curr_qty,0) as open_aver_price from db_dc.tb_pdfupo_exgp_posi_his t ,db_dc.tb_user_exch_group_info c where c.abolish_date=0 and t.exch_group_no=c.exch_group_no  and (t.co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or t.contrc_code_no=v_contrc_code_no) and (t.pd_no = v_pd_no or v_pd_no = 0) and  (t.init_date between v_begin_date and v_end_date) and (t.exch_group_no) in (select exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no) and t.row_id > v_row_id order by t.row_id limit v_row_count;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_交易组_期货持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Grpfutu_Posi_detail;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Grpfutu_Posi_detail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_contrc_code_no int,
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
    declare v_contrc_code_no int;
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_资管报表_视图-期货交易组持仓明细][{记录序号},{初始化日期},{机构编号},{产品编号},{资产账户编号},{交易组编号},{市场编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志},{当前数量},{开仓价格},{开仓日期},{开仓时间},{平仓盈亏},{盯市盈亏},{应收保证金}][({机构编号}=@操作员机构编号#) and  (@合约代码编号# = 0 or {合约代码编号}=@合约代码编号#) and ({产品编号} = @产品编号# or @产品编号# = 0) and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and  {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_group_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,open_posi_price,open_posi_date,open_posi_time,close_pandl,marked_pandl,rece_margin from db_rpts.vi_futu_qry_grp_posi_detail where (co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (pd_no = v_pd_no or v_pd_no = 0) and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no) and  row_id > v_row_id order by row_id;
    else
        select row_id,init_date,co_no,pd_no,asset_acco_no,exch_group_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,open_posi_price,open_posi_date,open_posi_time,close_pandl,marked_pandl,rece_margin from db_rpts.vi_futu_qry_grp_posi_detail where (co_no=v_opor_co_no) and  (v_contrc_code_no = 0 or contrc_code_no=v_contrc_code_no) and (pd_no = v_pd_no or v_pd_no = 0) and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no) and  row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询T0交易员开平仓明细历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QryHis_T0OporPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QryHis_T0OporPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_query_opor_no int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_cond varchar(2048);
    declare v_query_str text;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_cond = "1=1";
    SET v_query_str = " ";
    SET v_exe_sql_str = " ";

    
    label_pro:BEGIN
    

    /* [按条件拼字符串][@查询条件#][1=1][' and t.{机构编号}=',@操作员机构编号#] */
    if 1=1 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.co_no=',v_opor_co_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询操作员编号#<> 0][' and t.{操作员编号}=',@查询操作员编号#] */
    if v_query_opor_no<> 0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.opor_no=',v_query_opor_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询开始日期#<>0][' and t.{初始化日期}>=',@查询开始日期#] */
    if v_qry_begin_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.init_date>=',v_qry_begin_date);
    end if;


    /* [按条件拼字符串][@查询条件#][@查询结束日期#<>0][' and t.{初始化日期}<=',@查询结束日期#] */
    if v_qry_end_date<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.init_date<=',v_qry_end_date);
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and t.{产品编号}=',@产品编号#] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.pd_no=',v_pd_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and t.{交易组编号}=',@交易组编号#] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.exch_group_no=',v_exch_group_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@市场编号#<>0][' and t.{市场编号}=',@市场编号#] */
    if v_exch_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.exch_no=',v_exch_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@证券代码编号#<>0][' and t.{证券代码编号}=',@证券代码编号#] */
    if v_stock_code_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.stock_code_no=',v_stock_code_no);
    end if;


    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>0][' and t.{资产账户编号}=',@资产账户编号#] */
    if v_asset_acco_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and t.asset_acco_no=',v_asset_acco_no);
    end if;

    # 产品权限

    /* [按条件拼字符串][@查询条件#][@操作员编号#<>0][' and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = ',@操作员编号#,')'] */
    if v_opor_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = ',v_opor_no,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@操作员编号#<>0]['  and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ oprg where oprg.{操作员编号} = ',@操作员编号#,')'] */
    if v_opor_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,'  and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group oprg where oprg.opor_no = ',v_opor_no,')');
    end if;


    /* set @查询语句# = ""; */
    set v_query_str = "";

    /* set @查询语句# = concat(@查询语句#," select 1 as {开平方向}"); */
    set v_query_str = concat(v_query_str," select 1 as contrc_dir");

    /* set @查询语句# = concat(@查询语句#," ,t.{记录序号},t.{初始化日期},t.{操作员编号},t.{机构编号},t.{产品编号},t.{交易组编号},t.{市场编号},t.{股东代码编号},t.{证券代码编号},t.{资产账户编号},t.{多空类型}
"); */
    set v_query_str = concat(v_query_str," ,t.row_id,t.init_date,t.opor_no,t.co_no,t.pd_no,t.exch_group_no,t.exch_no,t.stock_acco_no,t.stock_code_no,t.asset_acco_no,t.lngsht_type
    ");

    /* set @查询语句# = concat(@查询语句#," ,t.{当前数量},t.{开仓日期},t.{开仓时间},t.{开仓价格},t.{开仓市值},t.{开仓费用},0 as {平仓日期},0 as {平仓时间},0 as {平仓价格}, 0 as {平仓市值},0 as {平仓费用},t.{成交编号},0 as {平仓数量},0 as {实现盈亏},t.{隔夜盈亏}"); */
    set v_query_str = concat(v_query_str," ,t.curr_qty,t.open_posi_date,t.open_posi_time,t.open_posi_price,t.open_posi_value,t.open_posi_fee,0 as close_posi_date,0 as close_posi_time,0 as close_posi_price, 0 as close_posi_market_value,0 as close_posi_fee,t.strike_no,0 as close_posi_qty,0 as realize_pandl,t.over_night_pandl");

    /* set @查询语句# = concat(@查询语句#," from ~报表_资管报表_T0_证券持仓明细表历史^ t where ","  t.{持仓状态}<>3 and ",@查询条件#); */
    set v_query_str = concat(v_query_str," from db_rpts.vi_tdset0_stock_posi_detail_his t where ","  t.posi_status<>3 and ",v_query_cond);
    # set @查询语句# = concat(@查询语句#,"  and (t.{初始化日期} = t.{开仓日期}) ");
    # set @查询语句# = concat(@查询语句#," and (t.{记录序号}) in (select MIN(x.{记录序号}) as {记录序号} from ~报表_资管报表_T0_证券持仓明细表历史^ x where ",replace(@查询条件#,'t.','x.'),"  GROUP BY x.{成交编号})");

    /* set @查询语句# = concat(@查询语句#," union all"); */
    set v_query_str = concat(v_query_str," union all");

    /* set @查询语句# = concat(@查询语句#," select 2 as {开平方向}"); */
    set v_query_str = concat(v_query_str," select 2 as contrc_dir");

    /* set @查询语句# = concat(@查询语句#," ,t.{记录序号},t.{初始化日期},t.{操作员编号},t.{机构编号},t.{产品编号},t.{交易组编号},t.{市场编号},t.{股东代码编号},t.{证券代码编号},t.{资产账户编号},t.{多空类型}
"); */
    set v_query_str = concat(v_query_str," ,t.row_id,t.init_date,t.opor_no,t.co_no,t.pd_no,t.exch_group_no,t.exch_no,t.stock_acco_no,t.stock_code_no,t.asset_acco_no,t.lngsht_type
    ");

    /* set @查询语句# = concat(@查询语句#,",0 as {当前数量},0 as {开仓日期},0 as {开仓时间},0 as {开仓价格},0 as {开仓市值},0 as {开仓费用},t.{平仓日期},t.{平仓时间},t.{平仓价格},t.{平仓市值},t.{平仓费用},t.{成交编号},t.{平仓数量},t.{实现盈亏},0 as {隔夜盈亏}"); */
    set v_query_str = concat(v_query_str,",0 as curr_qty,0 as open_posi_date,0 as open_posi_time,0 as open_posi_price,0 as open_posi_value,0 as open_posi_fee,t.close_posi_date,t.close_posi_time,t.close_posi_price,t.close_posi_market_value,t.close_posi_fee,t.strike_no,t.close_posi_qty,t.realize_pandl,0 as over_night_pandl");

    /* set @查询语句# = concat(@查询语句#," from ~报表_资管报表_T0_证券平仓成交明细表历史^ t where ",@查询条件#); */
    set v_query_str = concat(v_query_str," from db_rpts.vi_tdset0_close_posi_strike_detail_his t where ",v_query_cond);

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then

    /* set @查询语句# =replace(@查询语句#,'~报表_资管报表_T0_证券持仓明细表历史^','~报表_资管报表_T0_证券持仓明细表^'); */
    set v_query_str =replace(v_query_str,'db_rpts.vi_tdset0_stock_posi_detail_his','db_rpts.vi_tdset0_stock_posi_detail');

    /* set @查询语句# =replace(@查询语句#,'~报表_资管报表_T0_证券平仓成交明细表历史^','~报表_资管报表_T0_证券平仓成交明细表^'); */
    set v_query_str =replace(v_query_str,'db_rpts.vi_tdset0_close_posi_strike_detail_his','db_rpts.vi_tdset0_close_posi_strike_detail');
    end if;

    /* set @执行语句# = concat(@查询语句#," order by {成交编号} DESC  limit 65535"); */
    set v_exe_sql_str = concat(v_query_str," order by strike_no DESC  limit 65535");

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

# 原子_报表_资管报表_查询成交明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QryStrikeDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QryStrikeDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type_str varchar(2048),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_order_batch_no int,
    IN p_order_dir_str varchar(1024),
    IN p_exter_comm_flag int,
    IN p_record_valid_flag int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_combo_code varchar(32),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type_str varchar(2048);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_order_batch_no int;
    declare v_order_dir_str varchar(1024);
    declare v_exter_comm_flag int;
    declare v_record_valid_flag int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_combo_code varchar(32);
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type_str = p_stock_type_str;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_exter_comm_flag = p_exter_comm_flag;
    SET v_record_valid_flag = p_record_valid_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_combo_code = p_combo_code;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_no = 0;

    
    label_pro:BEGIN
    

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then
    select

    /* t.{记录序号},t.{操作员编号},t.{初始化日期},t.{机构编号},t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{通道编号},t.{外部账号},t.{市场编号},t.{股东代码编号},t.{证券代码编号},t.{证券类型},t.{指令序号},t.{指令批号},t.{成交日期},t.{成交时间},t.{成交编号},t.{申报日期},t.{申报编号},t.{订单日期},t.{订单时间},t.{订单序号},t.{订单批号},t.{订单方向},t.{订单价格},t.{订单数量},t.{成交数量},t.{成交价格},t.{成交金额},t.{全部费用},t.{印花税},t.{过户费},t.{经手费},t.{证管费},t.{其他费用},t.{交易佣金},t.{其他佣金},t.{交易征费},t.{交易费},t.{交易系统使用费},t.{股份交收费},t.{债券计提利息},t.{成交债券计提利息},t.{净价标志},t.{订单操作方式},t.{体外指令标志},t.{记录有效标志},t.{更新次数},t.{外部编号},t.{组合代码} */
    t.row_id,t.opor_no,t.init_date,t.co_no,t.pd_no,t.exch_group_no,t.asset_acco_no,t.pass_no,t.out_acco,t.exch_no,t.stock_acco_no,t.stock_code_no,t.stock_type,t.comm_id,t.comm_batch_no,t.strike_date,t.strike_time,t.strike_no,t.report_date,t.report_no,t.order_date,t.order_time,t.order_id,t.order_batch_no,t.order_dir,t.order_price,t.order_qty,t.strike_qty,t.strike_price,t.strike_amt,t.all_fee,t.stamp_tax,t.trans_fee,t.brkage_fee,t.SEC_charges,t.other_fee,t.trade_commis,t.other_commis,t.trade_tax,t.trade_cost_fee,t.trade_system_use_fee,t.stock_settle_fee,t.bond_accr_intrst,t.strike_bond_accr_intrst,t.net_price_flag,t.order_oper_way,t.exter_comm_flag,t.record_valid_flag,t.update_times,t.external_no,t.combo_code

     /* ,stq.{成交数量} as {行情成交数量}, stq.{成交金额} as {行情成交金额} */
     ,stq.strike_qty as quot_strike_qty, stq.strike_amt as quot_strike_amt

    /* from ~报表_资管报表_交易证券-报盘-成交表^ t */
    from db_rpts.vi_tdserp_strike t

     /* left join db_dc.tb_basesedt_stock_quot stq on (t.{证券代码编号}) = (stq.{证券代码编号}) */
     left join db_dc.tb_basesedt_stock_quot stq on (t.stock_code_no) = (stq.stock_code_no)

     /* where (t.{机构编号} = @机构编号#) */
     where (t.co_no = v_co_no)

     /* and (@业务操作员编号#=0 or t.{操作员编号}=@业务操作员编号#) and (@机构编号#=0 or t.{机构编号}=@机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) and (@交易组编号#=0 or t.{交易组编号}=@交易组编号#) and (@通道编号#=0 or t.{通道编号}=@通道编号#) and (@体外指令标志# = 0 or t.{体外指令标志} = @体外指令标志#) and (t.{记录有效标志}<>2) and  (@订单操作方式#=" " or t.{订单操作方式}=@订单操作方式#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",t.{市场编号},";"))>0) and (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",t.{证券类型},";"))>0) and (@指令序号#=0 or t.{指令序号}=@指令序号#) and (@指令批号#=0 or t.{指令批号}=@指令批号#) and (@订单批号#=0 or t.{订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",t.{订单方向},";"))>0) and (@组合代码# = " " or t.{组合代码} = @组合代码#) */
     and (v_busi_opor_no=0 or t.opor_no=v_busi_opor_no) and (v_co_no=0 or t.co_no=v_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no) and (v_exch_group_no=0 or t.exch_group_no=v_exch_group_no) and (v_pass_no=0 or t.pass_no=v_pass_no) and (v_exter_comm_flag = 0 or t.exter_comm_flag = v_exter_comm_flag) and (t.record_valid_flag<>2) and  (v_order_oper_way=" " or t.order_oper_way=v_order_oper_way) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",t.exch_no,";"))>0) and (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",t.stock_type,";"))>0) and (v_comm_id=0 or t.comm_id=v_comm_id) and (v_comm_batch_no=0 or t.comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or t.order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",t.order_dir,";"))>0) and (v_combo_code = " " or t.combo_code = v_combo_code)

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
    #    [获取表记录][报表_资管报表_交易证券-报盘-成交表][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#]
    else
     #   [获取表记录][报表_资管报表_交易证券-报盘-成交表-历史][字段][(@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and ( {初始化日期} between @查询开始日期# and @查询结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@体外指令标志# = 0 or {体外指令标志} = @体外指令标志#) and (@记录有效标志# = 0 or {记录有效标志}=@记录有效标志#) and  (@订单操作方式#=" " or {订单操作方式}=@订单操作方式#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",{市场编号},";"))>0) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",{证券类型},";"))>0) and (@指令序号#=0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",{订单方向},";"))>0) and (@组合代码# = " " or {组合代码} = @组合代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#]
    select

    /* t.{记录序号},t.{操作员编号},t.{初始化日期},t.{机构编号},t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{通道编号},t.{外部账号},t.{市场编号},t.{股东代码编号},t.{证券代码编号},t.{证券类型},t.{指令序号},t.{指令批号},t.{成交日期},t.{成交时间},t.{成交编号},t.{申报日期},t.{申报编号},t.{订单日期},t.{订单时间},t.{订单序号},t.{订单批号},t.{订单方向},t.{订单价格},t.{订单数量},t.{成交数量},t.{成交价格},t.{成交金额},t.{全部费用},t.{印花税},t.{过户费},t.{经手费},t.{证管费},t.{其他费用},t.{交易佣金},t.{其他佣金},t.{交易征费},t.{交易费},t.{交易系统使用费},t.{股份交收费},t.{债券计提利息},t.{成交债券计提利息},t.{净价标志},t.{订单操作方式},t.{体外指令标志},t.{记录有效标志},t.{更新次数},t.{外部编号},t.{组合代码} */
    t.row_id,t.opor_no,t.init_date,t.co_no,t.pd_no,t.exch_group_no,t.asset_acco_no,t.pass_no,t.out_acco,t.exch_no,t.stock_acco_no,t.stock_code_no,t.stock_type,t.comm_id,t.comm_batch_no,t.strike_date,t.strike_time,t.strike_no,t.report_date,t.report_no,t.order_date,t.order_time,t.order_id,t.order_batch_no,t.order_dir,t.order_price,t.order_qty,t.strike_qty,t.strike_price,t.strike_amt,t.all_fee,t.stamp_tax,t.trans_fee,t.brkage_fee,t.SEC_charges,t.other_fee,t.trade_commis,t.other_commis,t.trade_tax,t.trade_cost_fee,t.trade_system_use_fee,t.stock_settle_fee,t.bond_accr_intrst,t.strike_bond_accr_intrst,t.net_price_flag,t.order_oper_way,t.exter_comm_flag,t.record_valid_flag,t.update_times,t.external_no,t.combo_code

    /* , t.{行情成交数量}, t.{行情成交金额} */
    , t.quot_strike_qty, t.quot_strike_amt

    /* from ~历史_报表_资管报表_报表汇总产品证券成交^ t */
    from db_rpts_his.tb_rptsum_pd_stock_strike_his t

     /* where (t.{机构编号} = @机构编号#) */
     where (t.co_no = v_co_no)

     /* and (@业务操作员编号#=0 or t.{操作员编号}=@业务操作员编号#) and (@机构编号#=0 or t.{机构编号}=@机构编号#) and (@产品编号#=0 or t.{产品编号}=@产品编号#) and (@交易组编号#=0 or t.{交易组编号}=@交易组编号#) and (@通道编号#=0 or t.{通道编号}=@通道编号#) and (@体外指令标志# = 0 or t.{体外指令标志} = @体外指令标志#) and (t.{记录有效标志}<>2) and  (@订单操作方式#=" " or t.{订单操作方式}=@订单操作方式#) and (@市场编号串#=" " or instr(@市场编号串#,concat(";",t.{市场编号},";"))>0) and (@证券代码编号#=0 or t.{证券代码编号}=@证券代码编号#) and (@证券类型串#=" " or instr(@证券类型串#,concat(";",t.{证券类型},";"))>0) and (@指令序号#=0 or t.{指令序号}=@指令序号#) and (@指令批号#=0 or t.{指令批号}=@指令批号#) and (@订单批号#=0 or t.{订单批号}=@订单批号#) and (@订单方向串#=" " or instr(@订单方向串#,concat(";",t.{订单方向},";"))>0) and (@组合代码# = " " or t.{组合代码} = @组合代码#) */
     and (v_busi_opor_no=0 or t.opor_no=v_busi_opor_no) and (v_co_no=0 or t.co_no=v_co_no) and (v_pd_no=0 or t.pd_no=v_pd_no) and (v_exch_group_no=0 or t.exch_group_no=v_exch_group_no) and (v_pass_no=0 or t.pass_no=v_pass_no) and (v_exter_comm_flag = 0 or t.exter_comm_flag = v_exter_comm_flag) and (t.record_valid_flag<>2) and  (v_order_oper_way=" " or t.order_oper_way=v_order_oper_way) and (v_exch_no_str=" " or instr(v_exch_no_str,concat(";",t.exch_no,";"))>0) and (v_stock_code_no=0 or t.stock_code_no=v_stock_code_no) and (v_stock_type_str=" " or instr(v_stock_type_str,concat(";",t.stock_type,";"))>0) and (v_comm_id=0 or t.comm_id=v_comm_id) and (v_comm_batch_no=0 or t.comm_batch_no=v_comm_batch_no) and (v_order_batch_no=0 or t.order_batch_no=v_order_batch_no) and (v_order_dir_str=" " or instr(v_order_dir_str,concat(";",t.order_dir,";"))>0) and (v_combo_code = " " or t.combo_code = v_combo_code)

    /* and (t.{初始化日期} between @查询开始日期# and @查询结束日期#) */
    and (t.init_date between v_qry_begin_date and v_qry_end_date)

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0券源持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0SourceStockHoldingPosition;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0SourceStockHoldingPosition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_init_date int,
    IN p_query_opor_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    select

    /* t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{证券代码编号},t.{市场编号}, */
    t.pd_no,t.exch_group_no,t.asset_acco_no,t.stock_code_no,t.exch_no,

    /* (case when c.{限额设置状态} = 《限额设置状态-启用》 and c.{交易限额数量} >=0 and c.{限额设置类型}=《限额设置类型-外部》 then LEAST(t.{当前数量},IFNULL(c.{交易限额数量},0)) else t.{当前数量} end) as {券源数量}, */
    (case when c.limit_set_status = "1" and c.trade_limit_qty >=0 and c.limit_set_type=1 then LEAST(t.curr_qty,IFNULL(c.trade_limit_qty,0)) else t.curr_qty end) as source_stock_qty,

    /* (case when c.{限额设置状态} = 《限额设置状态-启用》 and c.{交易限额数量} >=0 and c.{限额设置类型}=《限额设置类型-外部》 then (LEAST(t.{当前数量},IFNULL(c.{交易限额数量},0))-(IFNULL(c.{交易释放数量},0) + IFNULL(c.{成交释放数量},0))) else (t.{当前数量} - (IFNULL(c.{交易释放数量},0) + IFNULL(c.{成交释放数量},0))) end) as {买入可用数量}, */
    (case when c.limit_set_status = "1" and c.trade_limit_qty >=0 and c.limit_set_type=1 then (LEAST(t.curr_qty,IFNULL(c.trade_limit_qty,0))-(IFNULL(c.trade_releas_qty,0) + IFNULL(c.strike_releas_qty,0))) else (t.curr_qty - (IFNULL(c.trade_releas_qty,0) + IFNULL(c.strike_releas_qty,0))) end) as buy_avail_qty,

    /* (case when c.{限额设置状态} = 《限额设置状态-启用》 and c.{交易限额数量} >=0 and c.{限额设置类型}=《限额设置类型-外部》 then LEAST((t.{当前数量}),(IFNULL(c.{交易限额数量},0) - (IFNULL(c.{交易占用数量},0) + IFNULL(c.{成交占用数量},0)))) else (t.{当前数量}) end) as {卖出可用数量}, */
    (case when c.limit_set_status = "1" and c.trade_limit_qty >=0 and c.limit_set_type=1 then LEAST((t.curr_qty),(IFNULL(c.trade_limit_qty,0) - (IFNULL(c.trade_capt_qty,0) + IFNULL(c.strike_capt_qty,0)))) else (t.curr_qty) end) as sell_avail_qty,

    /* (IFNULL(c.{成交释放数量},0) - IFNULL(c.{成交占用数量},0)) as {持仓数量}, */
    (IFNULL(c.strike_releas_qty,0) - IFNULL(c.strike_capt_qty,0)) as posi_qty,

    /* round(ifnull(sum(b.{实现盈亏}),0),2) as {当日盈亏}, */
    round(ifnull(sum(b.realize_pandl),0),2) as today_pandl,

    /* round(ifnull(sum(b.{开仓费用} + b.{平仓费用}),0),2) as {当日交易费} */
    round(ifnull(sum(b.open_posi_fee + b.close_posi_fee),0),2) as today_trade_fee

    /* from ~报表_资管报表_产品证券-持仓-交易组持仓表^ t */
    from db_rpts.vi_pdsepo_exgp_posi t

    /* left join ~报表_资管报表_T0_证券持仓明细表^ b on (t.{机构编号},t.{产品编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{股东代码编号}) = (b.{机构编号},b.{产品编号},b.{资产账户编号},b.{市场编号},b.{证券代码编号},b.{股东代码编号}) and (b.{操作员编号} = @操作员编号#) */
    left join db_rpts.vi_tdset0_stock_posi_detail b on (t.co_no,t.pd_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.stock_acco_no) = (b.co_no,b.pd_no,b.asset_acco_no,b.exch_no,b.stock_code_no,b.stock_acco_no) and (b.opor_no = v_opor_no)

    /* left join ~报表_资管报表_T0_操作员券源设置表^ c on (t.{机构编号},t.{产品编号},t.{资产账户编号},t.{市场编号},t.{证券代码编号},t.{股东代码编号}) = (c.{机构编号},c.{产品编号},c.{资产账户编号},c.{市场编号},c.{证券代码编号},c.{股东代码编号}) and (c.{操作员编号} = @操作员编号#) */
    left join db_rpts.vi_tdset0_opor_stock_source c on (t.co_no,t.pd_no,t.asset_acco_no,t.exch_no,t.stock_code_no,t.stock_acco_no) = (c.co_no,c.pd_no,c.asset_acco_no,c.exch_no,c.stock_code_no,c.stock_acco_no) and (c.opor_no = v_opor_no)

    /* where (t.{机构编号} = @操作员机构编号#) */
    where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and (@资产账户编号# = 0 or t.{资产账户编号} = @资产账户编号#) */
    and (v_asset_acco_no = 0 or t.asset_acco_no = v_asset_acco_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@操作员编号# = 0 or t.{操作员编号} = @查询操作员编号#) */
    and (v_opor_no = 0 or t.opor_no = v_query_opor_no)

    /* and t.{当前数量} > 0 */
    and t.curr_qty > 0

    /* group by t.{产品编号},t.{交易组编号},t.{资产账户编号},t.{证券代码编号},t.{市场编号}  limit 65535 */
    group by t.pd_no,t.exch_group_no,t.asset_acco_no,t.stock_code_no,t.exch_no  limit 65535
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_T+0持仓分笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0HoldingPositionDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0HoldingPositionDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_init_date int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_init_date int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_query_cond varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_init_date = p_init_date;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_query_cond = "1=1";

    
    label_pro:BEGIN
    

    /* if @产品编号# <> ' ' and @资产账户编号# <> ' ' then */
    if v_pd_no <> ' ' and v_asset_acco_no <> ' ' then

    /* select 
a.{证券代码编号} as {证券代码编号},
a.{市场编号} as {市场编号},
case when a.{多空类型}=1 then a.{当前数量}- a.{平仓数量} when a.{多空类型}=2 then -1*(a.{当前数量}- a.{平仓数量}) end as {持仓数量},
a.{当前数量} as {当前数量},
a.{开仓市值} as {开仓市值},
a.{开仓费用} as {开仓费用},
case when a.{开仓日期}<@初始化日期# then 0 when a.{开仓日期}>=@初始化日期# then a.{开仓时间} end as {开仓时间},
a.{产品编号} as {产品编号},a.{交易组编号} as {交易组编号},a.{资产账户编号} as {资产账户编号}
from ~报表_资管报表_T0_证券持仓明细表^ a 
where 
a.{机构编号} = @操作员机构编号#
and a.{操作员编号} = @操作员编号#
and a.{产品编号} = @产品编号#
and a.{资产账户编号} = @资产账户编号#
and a.{持仓状态} = '1'; */
    select 
    a.stock_code_no as stock_code_no,
    a.exch_no as exch_no,
    case when a.lngsht_type=1 then a.curr_qty- a.close_posi_qty when a.lngsht_type=2 then -1*(a.curr_qty- a.close_posi_qty) end as posi_qty,
    a.curr_qty as curr_qty,
    a.open_posi_value as open_posi_value,
    a.open_posi_fee as open_posi_fee,
    case when a.open_posi_date<v_init_date then 0 when a.open_posi_date>=v_init_date then a.open_posi_time end as open_posi_time,
    a.pd_no as pd_no,a.exch_group_no as exch_group_no,a.asset_acco_no as asset_acco_no
    from db_rpts.vi_tdset0_stock_posi_detail a 
    where 
    a.co_no = v_opor_co_no
    and a.opor_no = v_opor_no
    and a.pd_no = v_pd_no
    and a.asset_acco_no = v_asset_acco_no
    and a.posi_status = '1';
    else

    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(',@查询条件#); */
    set v_query_cond = concat('(',v_query_cond);

    /* [按条件拼字符串][@查询条件#][@机构编号串#<>"0"][' or a.{机构编号} in (',@机构编号串#,')'] */
    if v_co_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.co_no in (',v_co_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号串#<>"0"][' or a.{产品编号} in (',@产品编号串#,')'] */
    if v_pd_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.pd_no in (',v_pd_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0"][' or a.{交易组编号} in (',@交易组编号串#,')'] */
    if v_exch_group_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.exch_group_no in (',v_exch_group_no_str,')');
    end if;


    /* set @查询条件# = concat(@查询条件#,')'); */
    set v_query_cond = concat(v_query_cond,')');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

     /* set @查询条件# = "1=1"; */
     set v_query_cond = "1=1";
    end if;

    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>" "][' and a.{资产账户编号}="',@资产账户编号#,'"'] */
    if v_asset_acco_no<>" " then
        SET v_query_cond = CONCAT(v_query_cond,' and a.asset_acco_no="',v_asset_acco_no,'"');
    end if;


    /* set @查询条件# = concat(@查询条件#,' and a.{机构编号}=',@操作员机构编号#,' and a.{操作员编号}=',@操作员编号#); */
    set v_query_cond = concat(v_query_cond,' and a.co_no=',v_opor_co_no,' and a.opor_no=',v_opor_no);

    /* [执行语句][concat("select a.{证券代码编号} as {证券代码编号},a.{市场编号} as {市场编号},case when a.{多空类型}=1 then a.{当前数量}- a.{平仓数量} when a.{多空类型}=2 then -1*(a.{当前数量}- a.{平仓数量}) end as {持仓数量},a.{当前数量} as {当前数量},a.{开仓市值} as {开仓市值},a.{开仓费用} as {开仓费用},case when a.{开仓日期}<",@初始化日期#," then 0 when a.{开仓日期}>=",@初始化日期#," then a.{开仓时间} end as {开仓时间},a.{产品编号} as {产品编号},a.{交易组编号} as {交易组编号},a.{资产账户编号} as {资产账户编号} from ~报表_资管报表_T0_证券持仓明细表^ a where ",@查询条件#," and a.{持仓状态} = '1'  limit 65535")] */
    set @tmp_sql = concat("select a.stock_code_no as stock_code_no,a.exch_no as exch_no,case when a.lngsht_type=1 then a.curr_qty- a.close_posi_qty when a.lngsht_type=2 then -1*(a.curr_qty- a.close_posi_qty) end as posi_qty,a.curr_qty as curr_qty,a.open_posi_value as open_posi_value,a.open_posi_fee as open_posi_fee,case when a.open_posi_date<",v_init_date," then 0 when a.open_posi_date>=",v_init_date," then a.open_posi_time end as open_posi_time,a.pd_no as pd_no,a.exch_group_no as exch_group_no,a.asset_acco_no as asset_acco_no from db_rpts.vi_tdset0_stock_posi_detail a where ",v_query_cond," and a.posi_status = '1'  limit 65535");
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

# 原子_报表_资管报表_T+0持仓合笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0HoldingPositionCombi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0HoldingPositionCombi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
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
    declare v_co_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_query_cond varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_query_cond = "1=1";

    
    label_pro:BEGIN
    

    /* if @产品编号# <> 0 and @资产账户编号# <> 0 then */
    if v_pd_no <> 0 and v_asset_acco_no <> 0 then

    /* select 
a.{证券代码编号} as {证券代码编号},
a.{市场编号} as {市场编号},
SUM(case when a.{多空类型}=1 then a.{当前数量}- a.{平仓数量} when a.{多空类型}=2 then -1*(a.{当前数量}- a.{平仓数量}) end) as {持仓数量},
SUM(a.{当前数量}) as {当前数量},
SUM(a.{开仓市值}) as {开仓市值},
SUM(a.{开仓费用}) as {开仓费用},
Min(case when a.{开仓日期}<@初始化日期# then 0 when a.{开仓日期}>=@初始化日期# then a.{开仓时间} end) as {开仓时间},
a.{产品编号} as {产品编号},a.{交易组编号} as {交易组编号},a.{资产账户编号} as {资产账户编号}
from ~报表_资管报表_T0_证券持仓明细表^ a 
where 
a.{机构编号} = @操作员机构编号#
and a.{操作员编号} = @操作员编号#
and a.{产品编号} = @产品编号#
and a.{交易组编号} = @交易组编号#
and a.{资产账户编号} = @资产账户编号#
and a.{持仓状态} = '1'
group by
a.{产品编号},a.{资产账户编号},a.{证券代码编号},a.{市场编号},a.{多空类型} order by a.{证券代码编号},a.{产品编号},a.{资产账户编号}; */
    select 
    a.stock_code_no as stock_code_no,
    a.exch_no as exch_no,
    SUM(case when a.lngsht_type=1 then a.curr_qty- a.close_posi_qty when a.lngsht_type=2 then -1*(a.curr_qty- a.close_posi_qty) end) as posi_qty,
    SUM(a.curr_qty) as curr_qty,
    SUM(a.open_posi_value) as open_posi_value,
    SUM(a.open_posi_fee) as open_posi_fee,
    Min(case when a.open_posi_date<v_init_date then 0 when a.open_posi_date>=v_init_date then a.open_posi_time end) as open_posi_time,
    a.pd_no as pd_no,a.exch_group_no as exch_group_no,a.asset_acco_no as asset_acco_no
    from db_rpts.vi_tdset0_stock_posi_detail a 
    where 
    a.co_no = v_opor_co_no
    and a.opor_no = v_opor_no
    and a.pd_no = v_pd_no
    and a.exch_group_no = v_exch_group_no
    and a.asset_acco_no = v_asset_acco_no
    and a.posi_status = '1'
    group by
    a.pd_no,a.asset_acco_no,a.stock_code_no,a.exch_no,a.lngsht_type order by a.stock_code_no,a.pd_no,a.asset_acco_no;
    else

    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(',@查询条件#); */
    set v_query_cond = concat('(',v_query_cond);

    /* [按条件拼字符串][@查询条件#][@机构编号串#<>"0"][' or a.{机构编号} in (',@机构编号串#,')'] */
    if v_co_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.co_no in (',v_co_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号串#<>"0"][' or a.{产品编号} in (',@产品编号串#,')'] */
    if v_pd_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.pd_no in (',v_pd_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0"][' or a.{交易组编号} in (',@交易组编号串#,')'] */
    if v_exch_group_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.exch_group_no in (',v_exch_group_no_str,')');
    end if;


    /* set @查询条件# = concat(@查询条件#,')'); */
    set v_query_cond = concat(v_query_cond,')');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

     /* set @查询条件# = "1=1"; */
     set v_query_cond = "1=1";
    end if;

    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and a.{产品编号}="',@产品编号#,'"'] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.pd_no="',v_pd_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and a.{交易组编号}="',@交易组编号#,'"'] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.exch_group_no="',v_exch_group_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>0][' and a.{资产账户编号}="',@资产账户编号#,'"'] */
    if v_asset_acco_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.asset_acco_no="',v_asset_acco_no,'"');
    end if;


    /* set @查询条件# = concat(@查询条件#,' and a.{机构编号}=',@操作员机构编号#,' and a.{操作员编号}=',@操作员编号#); */
    set v_query_cond = concat(v_query_cond,' and a.co_no=',v_opor_co_no,' and a.opor_no=',v_opor_no);

    /* [执行语句][concat("select a.{证券代码编号} as {证券代码编号},a.{市场编号} as {市场编号},SUM(case when a.{多空类型}=1 then a.{当前数量}- a.{平仓数量} when a.{多空类型}=2 then -1*(a.{当前数量}- a.{平仓数量}) end) as {持仓数量},SUM(a.{当前数量}) as {当前数量},SUM(a.{开仓市值}) as {开仓市值},SUM(a.{开仓费用}) as {开仓费用},Min(case when a.{开仓日期}<",@初始化日期#," then 0 when a.{开仓日期}>=",@初始化日期#," then a.{开仓时间} end) as {开仓时间},a.{产品编号} as {产品编号},a.{交易组编号} as {交易组编号},a.{资产账户编号} as {资产账户编号} from ~报表_资管报表_T0_证券持仓明细表^ a where ",@查询条件#," and a.{持仓状态} = '1' group by a.{产品编号},a.{资产账户编号},a.{证券代码编号},a.{市场编号},a.{多空类型} order by a.{证券代码编号},a.{产品编号},a.{交易组编号},a.{资产账户编号} limit  65535")] */
    set @tmp_sql = concat("select a.stock_code_no as stock_code_no,a.exch_no as exch_no,SUM(case when a.lngsht_type=1 then a.curr_qty- a.close_posi_qty when a.lngsht_type=2 then -1*(a.curr_qty- a.close_posi_qty) end) as posi_qty,SUM(a.curr_qty) as curr_qty,SUM(a.open_posi_value) as open_posi_value,SUM(a.open_posi_fee) as open_posi_fee,Min(case when a.open_posi_date<",v_init_date," then 0 when a.open_posi_date>=",v_init_date," then a.open_posi_time end) as open_posi_time,a.pd_no as pd_no,a.exch_group_no as exch_group_no,a.asset_acco_no as asset_acco_no from db_rpts.vi_tdset0_stock_posi_detail a where ",v_query_cond," and a.posi_status = '1' group by a.pd_no,a.asset_acco_no,a.stock_code_no,a.exch_no,a.lngsht_type order by a.stock_code_no,a.pd_no,a.exch_group_no,a.asset_acco_no limit  65535");
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

# 原子_报表_资管报表_T+0账户汇总信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryT0UnitTradeInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryT0UnitTradeInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
    IN p_init_date int,
    IN p_exch_group_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_co_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_amt decimal(18,4),
    OUT p_trade_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_yield_rate decimal(18,12),
    OUT p_all_fee decimal(18,4),
    OUT p_avail_amt decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_init_date int;
    declare v_exch_group_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_amt decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_yield_rate decimal(18,12);
    declare v_all_fee decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_open_posi_value decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_cash_avail_date_type int;
    declare v_query_cond varchar(2048);
    declare v_tmp_query_cond varchar(2048);
    declare v_crncy_type varchar(3);
    declare v_unfroz_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_init_date = p_init_date;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_co_no_str = p_co_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_amt = 0;
    SET v_trade_qty = 0;
    SET v_realize_pandl = 0;
    SET v_yield_rate = 0;
    SET v_all_fee = 0;
    SET v_avail_amt = 0;
    SET v_open_posi_value = 0;
    SET v_frozen_amt = 0;
    SET v_curr_amt = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_cash_avail_date_type = 0;
    SET v_query_cond = "1=1";
    SET v_tmp_query_cond = "1=1";
    SET v_crncy_type = "CNY";
    SET v_unfroz_amt = 0;

    
    label_pro:BEGIN
    

    /* set @交易金额#=0; */
    set v_trade_amt=0;

    /* set @交易数量#=0; */
    set v_trade_qty=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @开仓市值#=0; */
    set v_open_posi_value=0;

    /* set @全部费用#=0; */
    set v_all_fee=0;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

    /* set @可用金额#=0; */
    set v_avail_amt=0;

    /* if @产品编号# <> 0 and @资产账户编号# <> 0 then */
    if v_pd_no <> 0 and v_asset_acco_no <> 0 then

    /* select 
SUM(a.{开仓市值}+ a.{平仓市值}) as {交易金额},
SUM(a.{当前数量}+ a.{平仓数量}) as {交易数量},
SUM(a.{实现盈亏}) as {实现盈亏},
SUM(a.{开仓市值}) as {开仓市值},
SUM(a.{开仓费用}+a.{平仓费用}) as {全部费用}
into @交易金额#,@交易数量#,@实现盈亏#,@开仓市值#,@全部费用#
from ~报表_资管报表_T0_证券持仓明细表^ a 
where 
a.{机构编号} = @操作员机构编号#
and a.{产品编号} = @产品编号#
and a.{交易组编号} = @交易组编号#
and a.{资产账户编号} = @资产账户编号#
and a.{操作员编号} = @操作员编号#; */
    select 
    SUM(a.open_posi_value+ a.close_posi_market_value) as trade_amt,
    SUM(a.curr_qty+ a.close_posi_qty) as trade_qty,
    SUM(a.realize_pandl) as realize_pandl,
    SUM(a.open_posi_value) as open_posi_value,
    SUM(a.open_posi_fee+a.close_posi_fee) as all_fee
    into v_trade_amt,v_trade_qty,v_realize_pandl,v_open_posi_value,v_all_fee
    from db_rpts.vi_tdset0_stock_posi_detail a 
    where 
    a.co_no = v_opor_co_no
    and a.pd_no = v_pd_no
    and a.exch_group_no = v_exch_group_no
    and a.asset_acco_no = v_asset_acco_no
    and a.opor_no = v_opor_no;

    /* SET @交易金额# = Round(ifnull(@交易金额#,0),2); */
    SET v_trade_amt = Round(ifnull(v_trade_amt,0),2);

    /* SET @交易数量# = ifnull(@交易数量#,0); */
    SET v_trade_qty = ifnull(v_trade_qty,0);

    /* SET @实现盈亏# = Round(ifnull(@实现盈亏#,0),2); */
    SET v_realize_pandl = Round(ifnull(v_realize_pandl,0),2);

    /* SET @开仓市值# = Round(ifnull(@开仓市值#,0),2); */
    SET v_open_posi_value = Round(ifnull(v_open_posi_value,0),2);

    /* SET @全部费用# = Round(ifnull(@全部费用#,0),2); */
    SET v_all_fee = Round(ifnull(v_all_fee,0),2);

    /* if @开仓市值# > 0 then */
    if v_open_posi_value > 0 then

     /* SET @收益率# = Round(@实现盈亏#/@开仓市值#,5); */
     SET v_yield_rate = Round(v_realize_pandl/v_open_posi_value,5);
    end if;

    /* SET @资金可用日期# = 1; */
    SET v_cash_avail_date_type = 1;
    #[原子_计算交易端证券资金可用]
    else

    /* set @查询条件# = "1<>1"; */
    set v_query_cond = "1<>1";

    /* set @查询条件# = concat('(',@查询条件#); */
    set v_query_cond = concat('(',v_query_cond);

    /* [按条件拼字符串][@查询条件#][@机构编号串#<>"0"][' or a.{机构编号} in (',@机构编号串#,')'] */
    if v_co_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.co_no in (',v_co_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@产品编号串#<>"0"][' or a.{产品编号} in (',@产品编号串#,')'] */
    if v_pd_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.pd_no in (',v_pd_no_str,')');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号串#<>"0"][' or a.{交易组编号} in (',@交易组编号串#,')'] */
    if v_exch_group_no_str<>"0" then
        SET v_query_cond = CONCAT(v_query_cond,' or a.exch_group_no in (',v_exch_group_no_str,')');
    end if;


    /* set @查询条件# = concat(@查询条件#,')'); */
    set v_query_cond = concat(v_query_cond,')');

    /* if @查询条件# = "(1<>1)" then */
    if v_query_cond = "(1<>1)" then

     /* set @查询条件# = "1=1"; */
     set v_query_cond = "1=1";
    end if;

    /* [按条件拼字符串][@查询条件#][@产品编号#<>0][' and a.{产品编号}="',@产品编号#,'"'] */
    if v_pd_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.pd_no="',v_pd_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@交易组编号#<>0][' and a.{交易组编号}="',@交易组编号#,'"'] */
    if v_exch_group_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.exch_group_no="',v_exch_group_no,'"');
    end if;


    /* [按条件拼字符串][@查询条件#][@资产账户编号#<>0][' and a.{资产账户编号}="',@资产账户编号#,'"'] */
    if v_asset_acco_no<>0 then
        SET v_query_cond = CONCAT(v_query_cond,' and a.asset_acco_no="',v_asset_acco_no,'"');
    end if;


    /* set @临时_查询条件# = concat(@查询条件#,' and a.{机构编号}=',@操作员机构编号#,' and a.{操作员编号} =' ,@操作员编号#); */
    set v_tmp_query_cond = concat(v_query_cond,' and a.co_no=',v_opor_co_no,' and a.opor_no =' ,v_opor_no);

    /* [创建临时表结构][temp_t0unittradeinfo_function][{交易金额} decimal(32,4),{交易数量} decimal(18,2),{实现盈亏} decimal(32,4),{开仓市值} decimal(32,4),{全部费用} decimal(32,4)] */
    drop table if EXISTS temp_t0unittradeinfo_function;
    create TEMPORARY table temp_t0unittradeinfo_function (trade_amt decimal(32,4),trade_qty decimal(18,2),realize_pandl decimal(32,4),open_posi_value decimal(32,4),all_fee decimal(32,4));


    /* [执行语句][concat("insert into temp_t0unittradeinfo_function ({交易金额},{交易数量},{实现盈亏},{开仓市值},{全部费用}) select SUM(a.{开仓市值}+ a.{平仓市值}) as {交易金额},SUM(a.{当前数量}+ a.{平仓数量}) as {交易数量},SUM(a.{实现盈亏}) as {实现盈亏},SUM(a.{开仓市值}) as {开仓市值},SUM(a.{开仓费用}+a.{平仓费用}) as {全部费用} from ~报表_资管报表_T0_证券持仓明细表^ a where ",@临时_查询条件#)] */
    set @tmp_sql = concat("insert into temp_t0unittradeinfo_function (trade_amt,trade_qty,realize_pandl,open_posi_value,all_fee) select SUM(a.open_posi_value+ a.close_posi_market_value) as trade_amt,SUM(a.curr_qty+ a.close_posi_qty) as trade_qty,SUM(a.realize_pandl) as realize_pandl,SUM(a.open_posi_value) as open_posi_value,SUM(a.open_posi_fee+a.close_posi_fee) as all_fee from db_rpts.vi_tdset0_stock_posi_detail a where ",v_tmp_query_cond);
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;


    /* select {交易金额},{交易数量},{实现盈亏},{开仓市值},{全部费用} into @交易金额#,@交易数量#,@实现盈亏#,@开仓市值#,@全部费用# from temp_t0unittradeinfo_function where 1=1 limit 1; */
    select trade_amt,trade_qty,realize_pandl,open_posi_value,all_fee into v_trade_amt,v_trade_qty,v_realize_pandl,v_open_posi_value,v_all_fee from temp_t0unittradeinfo_function where 1=1 limit 1;

    /* SET @交易金额# = Round(ifnull(@交易金额#,0),2); */
    SET v_trade_amt = Round(ifnull(v_trade_amt,0),2);

    /* SET @交易数量# = ifnull(@交易数量#,0); */
    SET v_trade_qty = ifnull(v_trade_qty,0);

    /* SET @实现盈亏# = Round(ifnull(@实现盈亏#,0),2); */
    SET v_realize_pandl = Round(ifnull(v_realize_pandl,0),2);

    /* SET @开仓市值# = Round(ifnull(@开仓市值#,0),2); */
    SET v_open_posi_value = Round(ifnull(v_open_posi_value,0),2);

    /* SET @全部费用# = Round(ifnull(@全部费用#,0),2); */
    SET v_all_fee = Round(ifnull(v_all_fee,0),2);

    /* if @开仓市值# > 0 then */
    if v_open_posi_value > 0 then

     /* SET @收益率# = Round(@实现盈亏#/@开仓市值#,5); */
     SET v_yield_rate = Round(v_realize_pandl/v_open_posi_value,5);
    end if;

    /* SET @资金可用日期# = 1; */
    SET v_cash_avail_date_type = 1;

    /* [创建临时表结构][temp_t0unitavailable_function][{当前金额} decimal(32,4),{解冻金额} decimal(32,4),{冻结金额} decimal(32,4)] */
    drop table if EXISTS temp_t0unitavailable_function;
    create TEMPORARY table temp_t0unitavailable_function (curr_amt decimal(32,4),unfroz_amt decimal(32,4),frozen_amt decimal(32,4));


    /* [执行语句][concat("insert into temp_t0unitavailable_function({当前金额},{冻结金额},{解冻金额}) select ifnull(sum({当前金额}),0) as {当前金额},ifnull(sum({冻结金额}),0) as {冻结金额},ifnull(sum({解冻金额}),0) as {解冻金额} from ~报表_资管报表_产品证券-资金-交易组资金表^ a where ",@查询条件#," and {本币币种}='",@本币币种#,"'")] */
    set @tmp_sql = concat("insert into temp_t0unitavailable_function(curr_amt,frozen_amt,unfroz_amt) select ifnull(sum(curr_amt),0) as curr_amt,ifnull(sum(frozen_amt),0) as frozen_amt,ifnull(sum(unfroz_amt),0) as unfroz_amt from db_rpts.vi_pdseca_exgp_capit a where ",v_query_cond," and crncy_type='",v_crncy_type,"'");
    PREPARE stmt from @tmp_sql;
    EXECUTE stmt;
    set @tmp_sql = '';
    DEALLOCATE PREPARE stmt;


    /* select {当前金额},{冻结金额},{解冻金额} into @当前金额#,@冻结金额#,@解冻金额# from temp_t0unitavailable_function where 1=1 limit 1; */
    select curr_amt,frozen_amt,unfroz_amt into v_curr_amt,v_frozen_amt,v_unfroz_amt from temp_t0unitavailable_function where 1=1 limit 1;

    /* SET @可用金额#=@当前金额#+@解冻金额#-@冻结金额#; */
    SET v_avail_amt=v_curr_amt+v_unfroz_amt-v_frozen_amt;

    /* if @资金可用日期#=1 then */
    if v_cash_avail_date_type=1 then

     /* set @可用金额#=@可用金额#; */
     set v_avail_amt=v_avail_amt;
    end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_amt = v_trade_amt;
    SET p_trade_qty = v_trade_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_yield_rate = v_yield_rate;
    SET p_all_fee = v_all_fee;
    SET p_avail_amt = v_avail_amt;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_获取单元证券持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_GetUnitPositionInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_GetUnitPositionInfo(
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
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_invest_type int,
    OUT p_stock_acco varchar(16),
    OUT p_asset_acco varchar(16),
    OUT p_curr_qty decimal(18,2),
    OUT p_frozen_qty decimal(18,2),
    OUT p_unfroz_qty decimal(18,2),
    OUT p_strike_capt_qty decimal(18,2),
    OUT p_cost_amt decimal(18,4),
    OUT p_intrst_cost_amt decimal(18,4)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_invest_type int;
    declare v_stock_acco varchar(16);
    declare v_asset_acco varchar(16);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_invest_type = 0;
    SET v_stock_acco = " ";
    SET v_asset_acco = " ";
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_stock_code_no = 0;
    SET v_stock_acco_no = 0;
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [表记录变量不检验][报表_资管报表_产品证券-持仓-交易组持仓表][{记录序号},{市场编号},{证券代码编号},{股东代码编号},{资产账户编号},{当前数量},{冻结数量},{解冻数量},{成本金额},{利息成本金额}][@记录序号#,@市场编号#,@证券代码编号#,@股东代码编号#,@资产账户编号#,@当前数量#,@冻结数量#,@解冻数量#,@成本金额#,@利息成本金额#][{机构编号}=@操作员机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {记录序号}>@查询记录序号# order by {记录序号}] */
    select row_id,exch_no,stock_code_no,stock_acco_no,asset_acco_no,curr_qty,frozen_qty,unfroz_qty,cost_amt,intrst_cost_amt into v_row_id,v_exch_no,v_stock_code_no,v_stock_acco_no,v_asset_acco_no,v_curr_qty,v_frozen_qty,v_unfroz_qty,v_cost_amt,v_intrst_cost_amt from db_rpts.vi_pdsepo_exgp_posi where co_no=v_opor_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and row_id>v_query_row_id order by row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_invest_type = v_invest_type;
    SET p_stock_acco = v_stock_acco;
    SET p_asset_acco = v_asset_acco;
    SET p_curr_qty = v_curr_qty;
    SET p_frozen_qty = v_frozen_qty;
    SET p_unfroz_qty = v_unfroz_qty;
    SET p_strike_capt_qty = v_strike_capt_qty;
    SET p_cost_amt = v_cost_amt;
    SET p_intrst_cost_amt = v_intrst_cost_amt;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询全部交易组
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryAllExchGroup;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryAllExchGroup(
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
    IN p_exch_group_status varchar(2),
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
    declare v_exch_group_no int;
    declare v_exch_group_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_status = p_exch_group_status;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][报表_资管报表_公共-用户-交易组信息表][{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@交易组状态#=" " or {交易组状态}=@交易组状态#)] */
    select exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no from db_rpts.vi_user_exch_group_info where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_group_status=" " or exch_group_status=v_exch_group_status);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询全部操作员信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QueryAllOperatorInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QueryAllOperatorInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_co_no int,
    IN p_is_trader int,
    IN p_opor_status_str varchar(64),
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
    declare v_query_opor_no int;
    declare v_co_no int;
    declare v_is_trader int;
    declare v_opor_status_str varchar(64);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no = p_co_no;
    SET v_is_trader = p_is_trader;
    SET v_opor_status_str = p_opor_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][报表_资管报表_视图-公共-用户-操作员信息表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, opor_name, opor_type, opor_pwd, 
        opor_status, create_opor, conta_addr, oper_rights, 
        phone_number, email, is_trader, trader_no, 
        allow_login_type, allow_oper_ip_addr, allow_oper_mac from db_rpts.vi_user_opor_info where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, opor_name, opor_type, opor_pwd, 
        opor_status, create_opor, conta_addr, oper_rights, 
        phone_number, email, is_trader, trader_no, 
        allow_login_type, allow_oper_ip_addr, allow_oper_mac from db_rpts.vi_user_opor_info where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品上日资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Pre_Asset;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Pre_Asset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);
    SELECT t.*,

    /* a.{现金资产} as {上日现金资产}, */
    a.cash_asset as pre_cash_asset,

    /* a.{股票资产} as {上日股票资产}, */
    a.stock_asset as pre_stock_asset,

    /* a.{债券资产} as {上日债券资产}, */
    a.bond_asset as pre_bond_asset,

    /* a.{基金资产} as {上日基金资产}, */
    a.fund_asset as pre_fund_asset,

    /* a.{回购资产} as {上日回购资产}, */
    a.repo_asset as pre_repo_asset,

    /* a.{其他资产} as {上日其他资产}, */
    a.other_asset as pre_other_asset,

    /* a.{期货资产} as {上日期货资产}, */
    a.futu_asset as pre_futu_asset,

    /* a.{港股通资产} as {上日港股通资产}, */
    a.hk_thrgh_stock_asset as pre_hk_thrgh_stock_asset,

    /* a.{货币基金资产} as {上日货币基金资产}, */
    a.money_fund_asset as pre_money_fund_asset,

    /* a.{股票成本} as {上日股票成本}, */
    a.stock_cost as pre_stock_cost,

    /* a.{债券成本} as {上日债券成本}, */
    a.bond_cost as pre_bond_cost,

    /* a.{基金成本} as {上日基金成本}, */
    a.fund_cost as pre_fund_cost,

    /* a.{回购成本} as {上日回购成本}, */
    a.repo_cost as pre_repo_cost,

    /* a.{其他成本} as {上日其他成本}, */
    a.other_cost as pre_other_cost,

    /* a.{期货成本} as {上日期货成本}, */
    a.futu_cost as pre_futu_cost,

    /* a.{港股通成本} as {上日港股通成本}, */
    a.hk_thrgh_stock_cost as pre_hk_thrgh_stock_cost,

    /* a.{货币基金成本} as {上日货币基金成本} */
    a.money_fund_cost as pre_money_fund_cost

     /* from ~报表_资管报表_产品资产查询历表^ t */
     from db_rpts.tb_rptasset_pd_capit_asset_his t

    /* left join ~报表_资管报表_产品资产查询历表^ a on (t.{机构编号},t.{产品编号},t.{分组序号}) = (a.{机构编号},a.{产品编号},a.{分组序号}+1) */
    left join db_rpts.tb_rptasset_pd_capit_asset_his a on (t.co_no,t.pd_no,t.grp_row) = (a.co_no,a.pd_no,a.grp_row+1)

     /* where (t.{机构编号} = @操作员机构编号#) */
     where (t.co_no = v_opor_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and t.{初始化日期} between @查询开始日期# and @查询结束日期# */
    and t.init_date between v_qry_begin_date and v_qry_end_date

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品汇总成交证券类型
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Sum_Strike_StockType;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Sum_Strike_StockType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no int,
    IN p_stock_type int,
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no int;
    declare v_stock_type int;
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    # if (@查询开始日期# = 0) and (@查询结束日期# = 0) then
    # else
    select

    /* t.{机构编号},t.{产品编号}, */
    t.co_no,t.pd_no,

    /* MIN(t.{初始化日期}) as {开始日期},MAX(t.{初始化日期}) as {结束日期}, */
    MIN(t.init_date) as begin_date,MAX(t.init_date) as end_date,

    /* COUNT(*) as {累计交易笔数}, */
    COUNT(*) as total_trade_cnt,

    /* SUM(t.{成交金额}) as {累计交易金额}, */
    SUM(t.strike_amt) as total_trade_amt,

    /* SUM(t.{交易佣金}) as {累计成交佣金}, */
    SUM(t.trade_commis) as total_strike_commis,

    /* SUM(IF(t.{证券类型} in (1) and t.{市场编号} in (1,2),1,0)) as {A股交易笔数}, */
    SUM(IF(t.stock_type in (1) and t.exch_no in (1,2),1,0)) as stock_trade_cnt,

    /* SUM(IF(t.{证券类型} in (1) and t.{市场编号} in (1,2),t.{成交金额},0)) as {A股交易金额}, */
    SUM(IF(t.stock_type in (1) and t.exch_no in (1,2),t.strike_amt,0)) as stock_trade_amt,

    /* SUM(IF(t.{证券类型} in (1) and t.{市场编号} in (1,2),t.{交易佣金},0)) as {A股成交佣金}, */
    SUM(IF(t.stock_type in (1) and t.exch_no in (1,2),t.trade_commis,0)) as stock_strike_commis,

    /* SUM(IF((t.{证券类型} between 21 and 45) and t.{证券类型} not in (26,27) and t.{市场编号} in (1,2),1,0)) as {债券交易笔数}, */
    SUM(IF((t.stock_type between 21 and 45) and t.stock_type not in (26,27) and t.exch_no in (1,2),1,0)) as bond_trade_cnt,

    /* SUM(IF((t.{证券类型} between 21 and 45) and t.{证券类型} not in (26,27) and t.{市场编号} in (1,2),t.{成交金额},0)) as {债券交易金额}, */
    SUM(IF((t.stock_type between 21 and 45) and t.stock_type not in (26,27) and t.exch_no in (1,2),t.strike_amt,0)) as bond_trade_amt,

    /* SUM(IF((t.{证券类型} between 21 and 45) and t.{证券类型} not in (26,27) and t.{市场编号} in (1,2),t.{交易佣金},0)) as {债券成交佣金}, */
    SUM(IF((t.stock_type between 21 and 45) and t.stock_type not in (26,27) and t.exch_no in (1,2),t.trade_commis,0)) as bond_strike_commis,

    /* SUM(IF((t.{证券类型} between 51 and 64) and t.{市场编号} in (1,2),1,0)) as {基金交易笔数}, */
    SUM(IF((t.stock_type between 51 and 64) and t.exch_no in (1,2),1,0)) as fund_trade_cnt,

    /* SUM(IF((t.{证券类型} between 51 and 64) and t.{市场编号} in (1,2),t.{成交金额},0)) as {基金交易金额}, */
    SUM(IF((t.stock_type between 51 and 64) and t.exch_no in (1,2),t.strike_amt,0)) as fund_trade_amt,

    /* SUM(IF((t.{证券类型} between 51 and 64) and t.{市场编号} in (1,2),t.{交易佣金},0)) as {基金成交佣金}, */
    SUM(IF((t.stock_type between 51 and 64) and t.exch_no in (1,2),t.trade_commis,0)) as fund_strike_commis,

    /* SUM(IF(t.{证券类型} in (57,63) and t.{市场编号} in (1,2),1,0)) as {货币基金交易笔数}, */
    SUM(IF(t.stock_type in (57,63) and t.exch_no in (1,2),1,0)) as money_fund_trade_cnt,

    /* SUM(IF(t.{证券类型} in (57,63) and t.{市场编号} in (1,2),t.{成交金额},0)) as {货币基金交易金额}, */
    SUM(IF(t.stock_type in (57,63) and t.exch_no in (1,2),t.strike_amt,0)) as money_fund_trade_amt,

    /* SUM(IF(t.{证券类型} in (57,63) and t.{市场编号} in (1,2),t.{交易佣金},0)) as {货币基金成交佣金}, */
    SUM(IF(t.stock_type in (57,63) and t.exch_no in (1,2),t.trade_commis,0)) as money_fund_strike_commis,

    /* SUM(IF(t.{证券类型} in (26,27) and t.{市场编号} in (1,2),1,0)) as {回购交易笔数}, */
    SUM(IF(t.stock_type in (26,27) and t.exch_no in (1,2),1,0)) as repo_trade_cnt,

    /* SUM(IF(t.{证券类型} in (26,27) and t.{市场编号} in (1,2),t.{成交金额},0)) as {回购交易金额}, */
    SUM(IF(t.stock_type in (26,27) and t.exch_no in (1,2),t.strike_amt,0)) as repo_trade_amt,

    /* SUM(IF(t.{证券类型} in (26,27) and t.{市场编号} in (1,2),t.{交易佣金},0)) as {回购成交佣金}, */
    SUM(IF(t.stock_type in (26,27) and t.exch_no in (1,2),t.trade_commis,0)) as repo_strike_commis,

    /* SUM(IF(t.{证券类型} in (1) and t.{市场编号} in (3,4),1,0)) as {港股通交易笔数}, */
    SUM(IF(t.stock_type in (1) and t.exch_no in (3,4),1,0)) as hk_thrgh_trade_cnt,

    /* SUM(IF(t.{证券类型} in (1) and t.{市场编号} in (3,4),t.{成交金额},0)) as {港股通交易金额}, */
    SUM(IF(t.stock_type in (1) and t.exch_no in (3,4),t.strike_amt,0)) as hk_thrgh_trade_amt,

    /* SUM(IF(t.{证券类型} in (1) and t.{市场编号} in (3,4),t.{交易佣金},0)) as {港股通成交佣金}, */
    SUM(IF(t.stock_type in (1) and t.exch_no in (3,4),t.trade_commis,0)) as hk_thrgh_strike_commis,

    /* SUM(IF(t.{证券类型} in (101,102) and t.{市场编号} in (1,2),1,0)) as {期权交易笔数}, */
    SUM(IF(t.stock_type in (101,102) and t.exch_no in (1,2),1,0)) as option_trade_cnt,

    /* SUM(IF(t.{证券类型} in (101,102) and t.{市场编号} in (1,2),t.{成交金额},0)) as {期权交易金额}, */
    SUM(IF(t.stock_type in (101,102) and t.exch_no in (1,2),t.strike_amt,0)) as option_trade_amt,

    /* SUM(IF(t.{证券类型} in (101,102) and t.{市场编号} in (1,2),t.{交易佣金},0)) as {期权成交佣金}, */
    SUM(IF(t.stock_type in (101,102) and t.exch_no in (1,2),t.trade_commis,0)) as option_strike_commis,

    /* SUM(IF(t.{市场编号} in (11,12,13,14),1,0)) as {期货交易笔数}, */
    SUM(IF(t.exch_no in (11,12,13,14),1,0)) as futu_trade_cnt,

    /* SUM(IF(t.{市场编号} in (11,12,13,14),t.{成交金额},0)) as {期货交易金额}, */
    SUM(IF(t.exch_no in (11,12,13,14),t.strike_amt,0)) as futu_trade_amt,

    /* SUM(IF(t.{市场编号} in (11,12,13,14),t.{交易佣金},0)) as {期货成交佣金} */
    SUM(IF(t.exch_no in (11,12,13,14),t.trade_commis,0)) as futu_strike_commis

      /* from db_dc.tb_tdserp_strike_his t force index(idx_tb_tdserp_strike_his_6)  where ({机构编号} = @操作员机构编号#) */
      from db_dc.tb_tdserp_strike_his t force index(idx_tb_tdserp_strike_his_6)  where (co_no = v_opor_co_no)

    /* and t.{初始化日期} between @查询开始日期# and @查询结束日期# */
    and t.init_date between v_qry_begin_date and v_qry_end_date

    /* and  (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and  (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@证券类型# = 0 or t.{证券类型} = @证券类型#)  and {记录有效标志}<>2 */
    and (v_stock_type = 0 or t.stock_type = v_stock_type)  and record_valid_flag<>2

    /* group by {机构编号},{产品编号}  limit 65535 */
    group by co_no,pd_no  limit 65535
    ;
    # end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询证券行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Stock_Quot;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Stock_Quot(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_init_date int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_init_date = date_format(curdate(),'%Y%m%d');
    SET v_mach_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @临时_初始化日期# = 0; */
    set v_tmp_init_date = 0;

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* select t.init_date into @临时_初始化日期# from db_dc.tb_base_sys_info t;
 */
    select t.init_date into v_tmp_init_date from db_dc.tb_base_sys_info t;
    

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);

     /* if (@查询开始日期# = @临时_初始化日期#) or (@查询结束日期# = @临时_初始化日期#)  then */
     if (v_qry_begin_date = v_tmp_init_date) or (v_qry_end_date = v_tmp_init_date)  then
    select

     /* t.{记录序号},t.{证券代码编号},t.{市场编号},t.{证券代码},t.{证券名称},t.{证券类型},t.{资产类型},t.{涨停价},t.{跌停价},t.{最新价},t.{昨收盘价},t.{今开盘价},t.{今收盘价},t.{今最高价},t.{今最低价},t.{买一价},t.{买一量},t.{买二价},t.{买二量},t.{买三价},t.{买三量},t.{买四价},t.{买四量},t.{买五价},t.{买五量},t.{卖一价},t.{卖一量},t.{卖二价},t.{卖二量},t.{卖三价},t.{卖三量},t.{卖四价},t.{卖四量},t.{卖五价},t.{卖五量},t.{成交数量},t.{成交金额},t.{市盈率},t.{时间戳} */
     t.row_id,t.stock_code_no,t.exch_no,t.stock_code,t.stock_name,t.stock_type,t.asset_type,t.up_limit_price,t.down_limit_price,t.last_price,t.pre_close_price,t.today_open_price,t.today_close_price,t.today_max_price,t.today_min_price,t.buy_price_1,t.buy_qty_1,t.buy_price_2,t.buy_qty_2,t.buy_price_3,t.buy_qty_3,t.buy_price_4,t.buy_qty_4,t.buy_price_5,t.buy_qty_5,t.sell_price_1,t.sell_qty_1,t.sell_price_2,t.sell_qty_2,t.sell_price_3,t.sell_qty_3,t.sell_price_4,t.sell_qty_4,t.sell_price_5,t.sell_qty_5,t.strike_qty,t.strike_amt,t.pe_ratio,t.time_stamp

    /* from ~报表_资管报表_视图-证券基础数据-证券行情表^ t where (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    from db_rpts.vi_basesedt_stock_quot t where (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and t.{记录序号} > @记录序号#   order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id   order by row_id limit v_row_count
    ;
     else

     /* if (@机器时间# <930 or @机器时间# >1530) then */
     if (v_mach_time <930 or v_mach_time >1530) then

    /* select t.{记录序号},t.{证券代码编号},t.{市场编号},t.{证券代码},t.{证券名称},b.{证券类型},b.{资产类型},t.{涨停价},t.{跌停价},t.{最新价},t.{昨收盘价},t.{今开盘价},t.{今收盘价},t.{今最高价},t.{今最低价},t.{买一价},t.{买一量},t.{买二价},t.{买二量},t.{买三价},t.{买三量},t.{买四价},t.{买四量},t.{买五价},t.{买五量},t.{卖一价},t.{卖一量},t.{卖二价},t.{卖二量},t.{卖三价},t.{卖三量},t.{卖四价},t.{卖四量},t.{卖五价},t.{卖五量},t.{成交数量},t.{成交金额},t.{市盈率},t.{时间戳} */
    select t.row_id,t.stock_code_no,t.exch_no,t.stock_code,t.stock_name,b.stock_type,b.asset_type,t.up_limit_price,t.down_limit_price,t.last_price,t.pre_close_price,t.today_open_price,t.today_close_price,t.today_max_price,t.today_min_price,t.buy_price_1,t.buy_qty_1,t.buy_price_2,t.buy_qty_2,t.buy_price_3,t.buy_qty_3,t.buy_price_4,t.buy_qty_4,t.buy_price_5,t.buy_qty_5,t.sell_price_1,t.sell_qty_1,t.sell_price_2,t.sell_qty_2,t.sell_price_3,t.sell_qty_3,t.sell_price_4,t.sell_qty_4,t.sell_price_5,t.sell_qty_5,t.strike_qty,t.strike_amt,t.pe_ratio,t.time_stamp

    /* from( select a.{记录序号},a.{证券代码编号},a.{市场编号},a.{证券代码},a.{证券名称},a.{涨停价},a.{跌停价},a.{最新价},a.{昨收盘价},a.{今开盘价},a.{今收盘价},a.{今最高价},a.{今最低价},a.{买一价},a.{买一量},a.{买二价},a.{买二量},a.{买三价},a.{买三量},a.{买四价},a.{买四量},a.{买五价},a.{买五量},a.{卖一价},a.{卖一量},a.{卖二价},a.{卖二量},a.{卖三价},a.{卖三量},a.{卖四价},a.{卖四量},a.{卖五价},a.{卖五量},a.{成交数量},a.{成交金额},a.{市盈率},a.{时间戳}
 */
    from( select a.row_id,a.stock_code_no,a.exch_no,a.stock_code,a.stock_name,a.up_limit_price,a.down_limit_price,a.last_price,a.pre_close_price,a.today_open_price,a.today_close_price,a.today_max_price,a.today_min_price,a.buy_price_1,a.buy_qty_1,a.buy_price_2,a.buy_qty_2,a.buy_price_3,a.buy_qty_3,a.buy_price_4,a.buy_qty_4,a.buy_price_5,a.buy_qty_5,a.sell_price_1,a.sell_qty_1,a.sell_price_2,a.sell_qty_2,a.sell_price_3,a.sell_qty_3,a.sell_price_4,a.sell_qty_4,a.sell_price_5,a.sell_qty_5,a.strike_qty,a.strike_amt,a.pe_ratio,a.time_stamp
    

    /* from db_dc.tb_basesedt_stock_quot_his a where  (@证券代码编号# = 0 or a.{证券代码编号} = @证券代码编号#) */
    from db_dc.tb_basesedt_stock_quot_his a where  (v_stock_code_no = 0 or a.stock_code_no = v_stock_code_no)

    /* and (@市场编号# = 0 or a.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or a.exch_no = v_exch_no)

    /* and a.{初始化日期} between @查询开始日期# and @查询结束日期# */
    and a.init_date between v_qry_begin_date and v_qry_end_date

    /* and a.{记录序号} > @记录序号# order by {记录序号} limit @指定行数#) as t left join db_dc.tb_basesedt_stock_code_info b on t.stock_code=b.stock_code */
    and a.row_id > v_row_id order by row_id limit v_row_count) as t left join db_dc.tb_basesedt_stock_code_info b on t.stock_code=b.stock_code
    ;
    end if;
     end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品指令统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Stat_Command;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Stat_Command(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
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
    declare v_pd_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);
     # if (@查询开始日期# = 0) and (@查询结束日期# = 0) then
     # else
    select
     t.*

    /* from ~报表_资管报表_指令统计表^ t where (t.{机构编号} = @机构编号#) */
    from db_rpts.tb_rptstat_command t where (t.co_no = v_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

    /* and (@市场编号# = 0 or t.{市场编号} = @市场编号#) */
    and (v_exch_no = 0 or t.exch_no = v_exch_no)

    /* and (@证券代码编号# = 0 or t.{证券代码编号} = @证券代码编号#) */
    and (v_stock_code_no = 0 or t.stock_code_no = v_stock_code_no)

    /* and (@证券类型# = 0 or t.{证券类型} = @证券类型#) */
    and (v_stock_type = 0 or t.stock_type = v_stock_type)

    /* and (@资产类型# = 0 or t.{资产类型} = @资产类型#) */
    and (v_asset_type = 0 or t.asset_type = v_asset_type)

    /* and t.{初始化日期} between @查询开始日期# and @查询结束日期# */
    and t.init_date between v_qry_begin_date and v_qry_end_date

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
     # end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品交易操作效率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Stat_Trade_Oper;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Stat_Trade_Oper(
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
    declare v_pd_no int;
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
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
    SET v_pd_no = p_pd_no;
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);
    select
     t.*

    /* from ~报表_资管报表_交易操作效率表^ t where (t.{机构编号} = @机构编号#) */
    from db_rpts.tb_rptstat_trade_oper t where (t.co_no = v_co_no)

    /* and (@产品编号# = 0 or t.{产品编号} = @产品编号#) */
    and (v_pd_no = 0 or t.pd_no = v_pd_no)

     /* and t.{开始日期} = @查询开始日期# */
     and t.begin_date = v_qry_begin_date

     /* and t.{结束日期} = @查询结束日期# */
     and t.end_date = v_qry_end_date

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品汇总持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_Pd_Sum_Posi;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_Pd_Sum_Posi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_type int,
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
    declare v_qry_begin_date int;
    declare v_qry_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no int;
    declare v_exch_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_type int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);

    /* if (@查询开始日期# = 0) and (@查询结束日期# = 0) then */
    if (v_qry_begin_date = 0) and (v_qry_end_date = 0) then
    select *

    /* from ~报表_资管报表_产品汇总持仓表^ t where (t.{机构编号} = @操作员机构编号#) */
    from db_rpts.tb_rptasset_pd_sum_posi t where (t.co_no = v_opor_co_no)

    /* and (@证券类型# = 0 or {证券类型}=@证券类型#) */
    and (v_stock_type = 0 or stock_type=v_stock_type)

    /* and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) */
    and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no)

    /* and (t.{当前数量} <> 0 or t.{期初数量} <> 0) */
    and (t.curr_qty <> 0 or t.begin_qty <> 0)

    /* and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)

    /* and {记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and row_id > v_row_id order by row_id limit v_row_count
    ;
    else
    select *

    /* from ~报表_资管报表_产品汇总持仓历史^ t where (t.{机构编号} = @操作员机构编号#) */
    from db_rpts.tb_rptasset_pd_sum_posi_his t where (t.co_no = v_opor_co_no)

    /* and (@证券类型# = 0 or {证券类型}=@证券类型#) */
    and (v_stock_type = 0 or stock_type=v_stock_type)

    /* and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) */
    and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no)

    /* and (t.{当前数量} <> 0 or t.{期初数量} <> 0) */
    and (t.curr_qty <> 0 or t.begin_qty <> 0)

    /* and ({机构编号},{产品编号}) in (select {机构编号},{产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (co_no,pd_no) in (select co_no,pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)

    /* and {记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and row_id > v_row_id order by row_id limit v_row_count
    ;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询产品佣金统计报表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QryPdCommisSum;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QryPdCommisSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_begin_date int,
    IN p_qry_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no int;
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
    SET v_qry_begin_date = p_qry_begin_date;
    SET v_qry_end_date = p_qry_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* select init_date into @初始化日期#  from db_dc.tb_base_sys_info; */
    select init_date into v_init_date  from db_dc.tb_base_sys_info;

    /* if @查询开始日期# >= @初始化日期# then */
    if v_qry_begin_date >= v_init_date then
       #只查当前成交表

      /* select  t.{机构编号},t.{产品编号},MIN(t.{初始化日期}) as {开始日期},MAX(t.{初始化日期}) as {结束日期},SUM(t.{成交金额}) as {A股交易金额},SUM( t.{交易佣金}) as {A股成交佣金} */
      select  t.co_no,t.pd_no,MIN(t.init_date) as begin_date,MAX(t.init_date) as end_date,SUM(t.strike_amt) as stock_trade_amt,SUM( t.trade_commis) as stock_strike_commis

      /* from db_dc.tb_tdserp_strike t where (t.{机构编号} = @操作员机构编号#) */
      from db_dc.tb_tdserp_strike t where (t.co_no = v_opor_co_no)

      /* and  (@产品编号# = 0 or t.{产品编号} = @产品编号#) and {证券类型}=1 and ({市场编号}=1 or {市场编号}=2) and {记录有效标志}<>2 */
      and  (v_pd_no = 0 or t.pd_no = v_pd_no) and stock_type=1 and (exch_no=1 or exch_no=2) and record_valid_flag<>2

      /* group by {机构编号},{产品编号}  limit  @指定行数# ; */
      group by co_no,pd_no  limit  v_row_count ;

    /* elseif @查询结束日期#< @初始化日期# then */
    elseif v_qry_end_date< v_init_date then
       #只查历史的

      /* select  {机构编号},{产品编号},MIN({初始化日期}) as {开始日期},MAX({初始化日期}) as {结束日期},SUM({成交金额}) as {A股交易金额},SUM( {交易佣金}) as {A股成交佣金} */
      select  co_no,pd_no,MIN(init_date) as begin_date,MAX(init_date) as end_date,SUM(strike_amt) as stock_trade_amt,SUM( trade_commis) as stock_strike_commis

      /* from db_dc.tb_tdserp_strike_his force index(idx_tb_tdserp_strike_his_6)  where ({机构编号} = @操作员机构编号#) */
      from db_dc.tb_tdserp_strike_his force index(idx_tb_tdserp_strike_his_6)  where (co_no = v_opor_co_no)

      /* and  (@产品编号# = 0 or {产品编号} = @产品编号#) and {证券类型}=1 and ({市场编号}=1 or {市场编号}=2) and {记录有效标志}<>2 */
      and  (v_pd_no = 0 or pd_no = v_pd_no) and stock_type=1 and (exch_no=1 or exch_no=2) and record_valid_flag<>2

      /* and {初始化日期} between @查询开始日期# and @查询结束日期# */
      and init_date between v_qry_begin_date and v_qry_end_date

      /* group by {机构编号},{产品编号}   limit  @指定行数#  ; */
      group by co_no,pd_no   limit  v_row_count  ;
    else

      /* select  t.{机构编号},t.{产品编号},MIN(t.{开始日期}) as {开始日期},MAX(t.{结束日期}) as {结束日期},SUM(t.{成交金额}) as {A股交易金额},SUM( t.{交易佣金}) as {A股成交佣金} */
      select  t.co_no,t.pd_no,MIN(t.begin_date) as begin_date,MAX(t.end_date) as end_date,SUM(t.strike_amt) as stock_trade_amt,SUM( t.trade_commis) as stock_strike_commis
      from (

               /* select  {机构编号},{产品编号},MIN({初始化日期}) as {开始日期},MAX({初始化日期}) as {结束日期},SUM({成交金额}) as {成交金额},SUM({交易佣金}) as {交易佣金} */
               select  co_no,pd_no,MIN(init_date) as begin_date,MAX(init_date) as end_date,SUM(strike_amt) as strike_amt,SUM(trade_commis) as trade_commis

                 /* from db_dc.tb_tdserp_strike_his  force index(idx_tb_tdserp_strike_his_6)  where ({机构编号} = @操作员机构编号#) */
                 from db_dc.tb_tdserp_strike_his  force index(idx_tb_tdserp_strike_his_6)  where (co_no = v_opor_co_no)

                 /* and  (@产品编号# = 0 or {产品编号} = @产品编号#) and {证券类型}=1 and ({市场编号}=1 or {市场编号}=2)  and {记录有效标志}<>2 */
                 and  (v_pd_no = 0 or pd_no = v_pd_no) and stock_type=1 and (exch_no=1 or exch_no=2)  and record_valid_flag<>2

                 /* and {初始化日期} between @查询开始日期# and @查询结束日期# */
                 and init_date between v_qry_begin_date and v_qry_end_date

                 /* group by {机构编号},{产品编号} */
                 group by co_no,pd_no
              union all

                 /* select  {机构编号},{产品编号},MIN({初始化日期}) as {开始日期},MAX({初始化日期}) as {结束日期},SUM({成交金额}) as {成交金额},SUM( {交易佣金}) as {交易佣金} */
                 select  co_no,pd_no,MIN(init_date) as begin_date,MAX(init_date) as end_date,SUM(strike_amt) as strike_amt,SUM( trade_commis) as trade_commis

                 /* from db_dc.tb_tdserp_strike  where ({机构编号} = @操作员机构编号#) */
                 from db_dc.tb_tdserp_strike  where (co_no = v_opor_co_no)

                 /* and  (@产品编号# = 0 or {产品编号} = @产品编号#) and {证券类型}=1 and ({市场编号}=1 or {市场编号}=2)  and {记录有效标志}<>2 */
                 and  (v_pd_no = 0 or pd_no = v_pd_no) and stock_type=1 and (exch_no=1 or exch_no=2)  and record_valid_flag<>2

                 /* group by {机构编号},{产品编号} */
                 group by co_no,pd_no
      ) t

     /* group by {机构编号},{产品编号}   limit  @指定行数# ; */
     group by co_no,pd_no   limit  v_row_count ;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_产品当日成交统计查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QryPdCurStrikeSum;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QryPdCurStrikeSum(
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
    declare v_strike_releas_amt decimal(18,4);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_strike_releas_amt = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;

    
    label_pro:BEGIN
    

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @买入参考汇率# = f_get_hk_buy_rate(f_get_init_date(), 3); */
    set v_buy_ref_rate = f_get_hk_buy_rate(f_get_init_date(), 3);

    /* set @卖出参考汇率# = f_get_hk_sell_rate(f_get_init_date(), 3); */
    set v_sell_ref_rate = f_get_hk_sell_rate(f_get_init_date(), 3);

      /* select sum(if({市场编号} in(3,4),if({订单方向}=1,@卖出参考汇率#,@买入参考汇率#)*{成交金额},{成交金额})) as {成交金额},{订单方向} */
      select sum(if(exch_no in(3,4),if(order_dir=1,v_sell_ref_rate,v_buy_ref_rate)*strike_amt,strike_amt)) as strike_amt,order_dir

      /* from db_dc.tb_tdserp_strike t where (t.{机构编号} = @操作员机构编号#) */
      from db_dc.tb_tdserp_strike t where (t.co_no = v_opor_co_no)

      /* and  (@产品编号# = 0 or t.{产品编号} = @产品编号#)   and {记录有效标志}<>2 */
      and  (v_pd_no = 0 or t.pd_no = v_pd_no)   and record_valid_flag<>2

      /* and   {证券类型} <> 《证券类型-货币ETF基金》 and  {证券类型} <>《证券类型-普通货币基金》 */
      and   stock_type <> 57 and  stock_type <>63

      /* and {订单方向} in(1,2,31)  and {产品编号} in (select {产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) */
      and order_dir in(1,2,31)  and pd_no in (select pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)

      /* group by {订单方向}    limit  65535; */
      group by order_dir    limit  65535;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_产品持仓汇总统计查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QryPdPosiSum;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QryPdPosiSum(
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
    OUT p_posi_market_value decimal(18,4),
    OUT p_cost_amt decimal(18,4),
    OUT p_holder_profit decimal(18,4)
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
    declare v_posi_market_value decimal(18,4);
    declare v_cost_amt decimal(18,4);
    declare v_holder_profit decimal(18,4);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_posi_market_value = 0;
    SET v_cost_amt = 0;
    SET v_holder_profit = 0;
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    

    /* set @持仓市值#=0; */
    set v_posi_market_value=0;

     /* set @成本金额#=0; */
     set v_cost_amt=0;

    /* set @汇率# = f_get_hk_avg_rate(f_get_init_date(), 3); */
    set v_exch_rate = f_get_hk_avg_rate(f_get_init_date(), 3);

      /* select sum({成本金额})  ,sum( ifnull(t.curr_qty * if(t.exch_no in (3,4), if(t.{投资类型} = 3, t.{公允价格},stq.{最新价}) * @汇率# , if(t.{投资类型} = 3, if(t.{公允价格}<0.0001,t.{公允价格},stq.{最新价}),stq.{最新价})),0)) into  @成本金额#, @持仓市值#   from ~报表_资管报表_产品持仓查询表^ t , db_dc.tb_basesedt_stock_quot stq where (t.{证券代码编号}) = (stq.{证券代码编号}) and t.{证券类型} <>《证券类型-回购标准券》 and ({机构编号} = @操作员机构编号#)  and  (@产品编号# = 0 or {产品编号} = @产品编号#)  and {产品编号} in (select {产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) ; */
      select sum(cost_amt)  ,sum( ifnull(t.curr_qty * if(t.exch_no in (3,4), if(t.invest_type = 3, t.fair_price,stq.last_price) * v_exch_rate , if(t.invest_type = 3, if(t.fair_price<0.0001,t.fair_price,stq.last_price),stq.last_price)),0)) into  v_cost_amt, v_posi_market_value   from db_rpts.tb_rptasset_pd_posi t , db_dc.tb_basesedt_stock_quot stq where (t.stock_code_no) = (stq.stock_code_no) and t.stock_type <>27 and (co_no = v_opor_co_no)  and  (v_pd_no = 0 or pd_no = v_pd_no)  and pd_no in (select pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no) ;

    /* set @持仓盈亏#=@持仓市值#-@成本金额#; */
    set v_holder_profit=v_posi_market_value-v_cost_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_market_value = v_posi_market_value;
    SET p_cost_amt = v_cost_amt;
    SET p_holder_profit = v_holder_profit;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_证券代码映射查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QryStockInfoMap;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QryStockInfoMap(
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
    

      /* select {证券代码} ,{证券名称},{证券代码编号}  from db_dc.tb_basesedt_stock_code_info t where (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)  limit 65535; */
      select stock_code ,stock_name,stock_code_no  from db_dc.tb_basesedt_stock_code_info t where (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  limit 65535;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_查询_交易组_新证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_Qry_ExGrp_PosiNew;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_Qry_ExGrp_PosiNew(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_exch_group_no int,
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
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_exch_group_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_exch_group_no = p_exch_group_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_rate = 0;

    
    label_pro:BEGIN
    
    # [获取表记录][报表_资管报表_交易组持仓查询表][字段][({机构编号}=@操作员机构编号#) and ({当前数量} <> 0 or {期初数量} <> 0) and (@证券类型# = 0 or {证券类型}=@证券类型#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#)  and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* set @指定行数# = if(@指定行数# = 0,99999999,@指定行数#); */
    set v_row_count = if(v_row_count = 0,99999999,v_row_count);

    /* set @汇率# = f_get_hk_avg_rate(f_get_init_date(), 3); */
    set v_exch_rate = f_get_hk_avg_rate(f_get_init_date(), 3);
    select
     t.*

     /* , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as {全价} */
     , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) as full_price

     /* , if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0)) as {债券应收利息} */
     , if(t.bond_rate_type = '3', 0, ifnull(t.curr_qty,0)* ifnull(t.bond_accr_intrst,0)) as bond_receivable_amt

     /* , ifnull(t.curr_qty * if(t.exch_no in (3,4), if(t.{投资类型} = 3, t.{公允价格},stq.{最新价}) * @汇率# ,if(t.{投资类型} = 3, t.{公允价格},stq.{最新价})),0) as {持仓市值} */
     , ifnull(t.curr_qty * if(t.exch_no in (3,4), if(t.invest_type = 3, t.fair_price,stq.last_price) * v_exch_rate ,if(t.invest_type = 3, t.fair_price,stq.last_price)),0) as posi_market_value

     /* , ifnull(t.curr_qty * if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * @汇率# , f_get_stock_full_price(t.asset_type,t.fair_price,stq.{最新价},t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst)),0) as {全价持仓市值} */
     , ifnull(t.curr_qty * if(t.exch_no in (3,4), f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst) * v_exch_rate , f_get_stock_full_price(t.asset_type,t.fair_price,stq.last_price,t.net_price_flag, t.bond_rate_type, t.bond_accr_intrst)),0) as full_holding_amt

     /* , stq.{最新价} as {净价} , stq.{昨收盘价} */
     , stq.last_price as net_price , stq.pre_close_price

      /* , stq.{最新价}, stq.{成交数量} as {行情成交数量}, stq.{成交金额} as {行情成交金额} */
      , stq.last_price, stq.strike_qty as quot_strike_qty, stq.strike_amt as quot_strike_amt

    /* ,ifnull(stq.{证券代码}," ") as {证券代码} */
    ,ifnull(stq.stock_code," ") as stock_code

    /* ,ifnull(stq.{证券名称}," ") as {证券名称} */
    ,ifnull(stq.stock_name," ") as stock_name

    /* from ~报表_资管报表_交易组持仓查询表^ t */
    from db_rpts.tb_rptasset_exgrp_posi t

     /* left join db_dc.tb_basesedt_stock_quot stq on (t.{证券代码编号}) = (stq.{证券代码编号}) */
     left join db_dc.tb_basesedt_stock_quot stq on (t.stock_code_no) = (stq.stock_code_no)

    /* where (t.{机构编号} = @操作员机构编号#) and (@产品编号# = 0 or t.{产品编号} = @产品编号#) and (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#) */
    where (t.co_no = v_opor_co_no) and (v_pd_no = 0 or t.pd_no = v_pd_no) and (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)

    /* and ({当前数量} <> 0 or {期初数量} <> 0) and (@证券类型# = 0 or t.{证券类型}=@证券类型#) and (@证券代码编号# = 0 or t.{证券代码编号}=@证券代码编号#) */
    and (curr_qty <> 0 or begin_qty <> 0) and (v_stock_type = 0 or t.stock_type=v_stock_type) and (v_stock_code_no = 0 or t.stock_code_no=v_stock_code_no)

    /* and ({机构编号},{产品编号},{交易组编号}) in (select {机构编号},{产品编号},{交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ opr where opr.{操作员编号} = @操作员编号#) */
    and (co_no,pd_no,exch_group_no) in (select co_no,pd_no,exch_group_no from db_rpts.vi_user_opor_exch_group opr where opr.opor_no = v_opor_no)

    /* and t.{记录序号} > @记录序号# order by {记录序号} limit @指定行数# */
    and t.row_id > v_row_id order by row_id limit v_row_count
    ;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_更新期货行情
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_UpdateFutuQuote;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_UpdateFutuQuote(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    IN p_last_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_today_close_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_buy_price_1 decimal(16,9),
    IN p_sell_price_1 decimal(16,9),
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
    declare v_contrc_code varchar(6);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_today_close_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_buy_price_1 decimal(16,9);
    declare v_sell_price_1 decimal(16,9);
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code = p_contrc_code;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_today_close_price = p_today_close_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_buy_price_1 = p_buy_price_1;
    SET v_sell_price_1 = p_sell_price_1;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* update db_dc.tb_basefudt_futu_quot set {更新日期} = @更新日期#, {更新时间} = @更新时间#, {更新次数} = {更新次数} + 1,{买一价}=@买一价#,{卖一价}=@卖一价#,{最新价} = case when @最新价# <> 0 then @最新价# else {最新价} end, {涨停价} = case when @涨停价# <> 0 then @涨停价# else {涨停价} end, {跌停价} = case when @跌停价# <> 0 then @跌停价# else {跌停价} end, {昨结算价} = case when @昨结算价# <> 0 then @昨结算价# else {昨结算价} end,{结算价} = case when @结算价# <> 0 then @结算价# else {结算价} end,{今收盘价} = case when @今收盘价# <> 0 then @今收盘价# else {今收盘价} end,{昨收盘价} = case when @昨收盘价# <> 0 then @昨收盘价# else {昨收盘价} end where  {市场编号}=@市场编号# and {合约代码} = @合约代码#; */
    update db_dc.tb_basefudt_futu_quot set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1,buy_price_1=v_buy_price_1,sell_price_1=v_sell_price_1,last_price = case when v_last_price <> 0 then v_last_price else last_price end, up_limit_price = case when v_up_limit_price <> 0 then v_up_limit_price else up_limit_price end, down_limit_price = case when v_down_limit_price <> 0 then v_down_limit_price else down_limit_price end, pre_settle_price = case when v_pre_settle_price <> 0 then v_pre_settle_price else pre_settle_price end,sett_price = case when v_sett_price <> 0 then v_sett_price else sett_price end,today_close_price = case when v_today_close_price <> 0 then v_today_close_price else today_close_price end,pre_close_price = case when v_pre_close_price <> 0 then v_pre_close_price else pre_close_price end where  exch_no=v_exch_no and contrc_code = v_contrc_code;

    /* if  @错误编码#<>'0'  then */
    if  v_error_code<>'0'  then

       /* set @错误信息#=concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code); */
       set v_error_info=concat("市场编号=",v_exch_no,",","合约代码=",v_contrc_code);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rpts;;

# 原子_报表_资管报表_交易组当日成交统计查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rptasset_QryExgpCurStrikeSum;;
DELIMITER ;;
CREATE PROCEDURE pra_rptasset_QryExgpCurStrikeSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_capt_amt decimal(18,4),
    OUT p_strike_releas_amt decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;

    
    label_pro:BEGIN
    

    /* set @成交占用金额#=0; */
    set v_strike_capt_amt=0;

    /* set @成交释放金额#=0; */
    set v_strike_releas_amt=0;

    /* set @买入参考汇率# = f_get_hk_buy_rate(f_get_init_date(), 3); */
    set v_buy_ref_rate = f_get_hk_buy_rate(f_get_init_date(), 3);

    /* set @卖出参考汇率# = f_get_hk_sell_rate(f_get_init_date(), 3); */
    set v_sell_ref_rate = f_get_hk_sell_rate(f_get_init_date(), 3);

      /* select sum(if(t.{订单方向} =1,if(t.{市场编号} in(3,4),t.{成交金额}*@卖出参考汇率#,t.{成交金额}),0)),sum(if(t.{订单方向} =2,if(t.{市场编号} in(3,4),t.{成交金额}*@买入参考汇率#,t.{成交金额}),0))  into @成交占用金额#,@成交释放金额# */
      select sum(if(t.order_dir =1,if(t.exch_no in(3,4),t.strike_amt*v_sell_ref_rate,t.strike_amt),0)),sum(if(t.order_dir =2,if(t.exch_no in(3,4),t.strike_amt*v_buy_ref_rate,t.strike_amt),0))  into v_strike_capt_amt,v_strike_releas_amt

      /* from db_dc.tb_tdserp_strike t where (t.{机构编号} = @操作员机构编号#) */
      from db_dc.tb_tdserp_strike t where (t.co_no = v_opor_co_no)

      /* and  (@产品编号# = 0 or t.{产品编号} = @产品编号#) and  (@交易组编号# = 0 or t.{交易组编号} = @交易组编号#)    and t.{记录有效标志}<>2 */
      and  (v_pd_no = 0 or t.pd_no = v_pd_no) and  (v_exch_group_no = 0 or t.exch_group_no = v_exch_group_no)    and t.record_valid_flag<>2

      /* and   t.{证券类型} <> 《证券类型-货币ETF基金》 and  t.{证券类型} <>《证券类型-普通货币基金》 */
      and   t.stock_type <> 57 and  t.stock_type <>63

      /* and t.{订单方向} in(1,2,31)  and t.{产品编号} in (select {产品编号} from ~报表_资管报表_公共-用户-操作员可操作产品表^ opr where opr.{操作员编号} = @操作员编号#) */
      and t.order_dir in(1,2,31)  and t.pd_no in (select pd_no from db_rpts.vi_user_opor_allow_prod opr where opr.opor_no = v_opor_no)

      /* and t.{交易组编号} in (select {交易组编号} from ~报表_资管报表_公共-用户-操作员所属交易组表^ op where op.{操作员编号} = @操作员编号#); */
      and t.exch_group_no in (select exch_group_no from db_rpts.vi_user_opor_exch_group op where op.opor_no = v_opor_no);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_capt_amt = v_strike_capt_amt;
    SET p_strike_releas_amt = v_strike_releas_amt;

END;;


