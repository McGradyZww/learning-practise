DELIMITER ;;
use db_pub;;

# 原子_公共_风控接口_查询风控所需交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_riskif_QueryExchGroupByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_riskif_QueryExchGroupByRisk(
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
    declare v_exch_group_no int;
    declare v_exch_group_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_group_status = p_exch_group_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][公共_用户_交易组信息表][{记录序号},{交易组编号},{机构编号},{交易组编码},{交易组名称},{交易组状态},{默认组标志},{产品编号},{期初净资产},{交易组产品份额},{更新次数}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@交易组状态#=" " or {交易组状态}=@交易组状态#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,begin_NAV,exch_group_pd_share,update_times from db_pub.tb_user_exch_group_info where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_group_status=" " or exch_group_status=v_exch_group_status) and row_id>v_row_id order by row_id;
    else
        select row_id,exch_group_no,co_no,exch_group_code,exch_group_name,exch_group_status,default_group_flag,pd_no,begin_NAV,exch_group_pd_share,update_times from db_pub.tb_user_exch_group_info where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_exch_group_status=" " or exch_group_status=v_exch_group_status) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_风控接口_获取风控所需期货代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_riskif_GetFutuCodeInfoByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_riskif_GetFutuCodeInfoByRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @指定行数# = -1 then */
    if v_row_count = -1 then

        /* SELECT
 a.{记录序号},
 a.{合约代码编号},
 a.{市场编号},
 a.{合约代码},
 a.{合约名称},
 a.{合约类型},
 a.{资产类型},
 a.{最小价差},
 a.{持仓量},
 a.{主力标志},
 a.{合约乘数},
 ifnull(b.{最新价},0) as {最新价},
 ifnull(b.{买一价},0) as {买一价},
 ifnull(b.{卖一价},0) as {卖一价},
 ifnull(b.{涨停价},0) as {涨停价},
 ifnull(b.{跌停价},0) as {跌停价},
 ifnull(b.{昨结算价},0) as {昨结算价},
 ifnull(b.{结算价},0) as {结算价}
FROM
 ~公共_期货基础数据_合约代码信息表^ a
LEFT JOIN ~公共_期货基础数据_期货行情表^ b ON a.{合约代码编号} = b.{合约代码编号}
where a.{记录序号} > @记录序号# order by a.{记录序号}; */
        SELECT
         a.row_id,
         a.contrc_code_no,
         a.exch_no,
         a.contrc_code,
         a.contrc_name,
         a.contrc_type,
         a.asset_type,
         a.step_price,
         a.hold_qty,
         a.main_flag,
         a.contrc_unit,
         ifnull(b.last_price,0) as last_price,
         ifnull(b.buy_price_1,0) as buy_price_1,
         ifnull(b.sell_price_1,0) as sell_price_1,
         ifnull(b.up_limit_price,0) as up_limit_price,
         ifnull(b.down_limit_price,0) as down_limit_price,
         ifnull(b.pre_settle_price,0) as pre_settle_price,
         ifnull(b.sett_price,0) as sett_price
        FROM
         db_pub.tb_basefudt_futu_contrc_info a
        LEFT JOIN db_pub.tb_basefudt_futu_quot b ON a.contrc_code_no = b.contrc_code_no
        where a.row_id > v_row_id order by a.row_id;
    else

        /* SELECT
 a.{记录序号},
 a.{合约代码编号},
 a.{市场编号},
 a.{合约代码},
 a.{合约名称},
 a.{合约类型},
 a.{资产类型},
 a.{最小价差},
 a.{持仓量},
 a.{主力标志},
 a.{合约乘数},
 ifnull(b.{最新价},0) as {最新价},
 ifnull(b.{买一价},0) as {买一价},
 ifnull(b.{卖一价},0) as {卖一价},
 ifnull(b.{涨停价},0) as {涨停价},
 ifnull(b.{跌停价},0) as {跌停价},
 ifnull(b.{昨结算价},0) as {昨结算价},
 ifnull(b.{结算价},0) as {结算价}
FROM
 ~公共_期货基础数据_合约代码信息表^ a
LEFT JOIN ~公共_期货基础数据_期货行情表^ b ON a.{合约代码编号} = b.{合约代码编号}
where a.{记录序号} > @记录序号# order by a.{记录序号} limit @指定行数#;
 */
        SELECT
         a.row_id,
         a.contrc_code_no,
         a.exch_no,
         a.contrc_code,
         a.contrc_name,
         a.contrc_type,
         a.asset_type,
         a.step_price,
         a.hold_qty,
         a.main_flag,
         a.contrc_unit,
         ifnull(b.last_price,0) as last_price,
         ifnull(b.buy_price_1,0) as buy_price_1,
         ifnull(b.sell_price_1,0) as sell_price_1,
         ifnull(b.up_limit_price,0) as up_limit_price,
         ifnull(b.down_limit_price,0) as down_limit_price,
         ifnull(b.pre_settle_price,0) as pre_settle_price,
         ifnull(b.sett_price,0) as sett_price
        FROM
         db_pub.tb_basefudt_futu_contrc_info a
        LEFT JOIN db_pub.tb_basefudt_futu_quot b ON a.contrc_code_no = b.contrc_code_no
        where a.row_id > v_row_id order by a.row_id limit v_row_count;
        
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_风控接口_获取港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_riskif_GetHKRate;;
DELIMITER ;;
CREATE PROCEDURE pra_riskif_GetHKRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sh_hk_buy_ref_rate decimal(18,12),
    OUT p_sh_hk_sell_ref_rate decimal(18,12),
    OUT p_sh_hk_settle_buy_rate decimal(18,12),
    OUT p_sh_hk_settle_sell_rate decimal(18,12),
    OUT p_sz_hk_buy_ref_rate decimal(18,12),
    OUT p_sz_hk_sell_ref_rate decimal(18,12),
    OUT p_sz_hk_settle_buy_rate decimal(18,12),
    OUT p_sz_hksettle_sell_rate decimal(18,12)
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
    declare v_sh_hk_buy_ref_rate decimal(18,12);
    declare v_sh_hk_sell_ref_rate decimal(18,12);
    declare v_sh_hk_settle_buy_rate decimal(18,12);
    declare v_sh_hk_settle_sell_rate decimal(18,12);
    declare v_sz_hk_buy_ref_rate decimal(18,12);
    declare v_sz_hk_sell_ref_rate decimal(18,12);
    declare v_sz_hk_settle_buy_rate decimal(18,12);
    declare v_sz_hksettle_sell_rate decimal(18,12);
    declare v_init_date int;
    declare v_exch_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_sh_hk_buy_ref_rate = 0;
    SET v_sh_hk_sell_ref_rate = 0;
    SET v_sh_hk_settle_buy_rate = 0;
    SET v_sh_hk_settle_sell_rate = 0;
    SET v_sz_hk_buy_ref_rate = 0;
    SET v_sz_hk_sell_ref_rate = 0;
    SET v_sz_hk_settle_buy_rate = 0;
    SET v_sz_hksettle_sell_rate = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][公共_基础_系统信息表][{初始化日期}][@初始化日期#][1=1][4][" "] */
    select init_date into v_init_date from db_pub.tb_base_sys_info where 1=1 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.27.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @市场编号# = 《市场编号-沪港通证券交易所》; */
    set v_exch_no = 3;

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@沪港通买入参考汇率#,@沪港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
    select buy_ref_rate,sell_ref_rate into v_sh_hk_buy_ref_rate,v_sh_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@沪港通买入结算汇率#,@沪港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_sh_hk_settle_buy_rate,v_sh_hk_settle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;


    /* set @市场编号# = 《市场编号-深港通证券交易所》; */
    set v_exch_no = 4;

    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入参考汇率},{卖出参考汇率}][@深港通买入参考汇率#,@深港通卖出参考汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入参考汇率}<>0 and {卖出参考汇率}<>0 order by {初始化日期} desc] */
    select buy_ref_rate,sell_ref_rate into v_sz_hk_buy_ref_rate,v_sz_hk_sell_ref_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and buy_ref_rate<>0 and sell_ref_rate<>0 order by init_date desc limit 1;


    /* [获取表记录变量语句][公共_基础_港股通汇率表][{买入结算汇率},{卖出结算汇率}][@深港通买入结算汇率#,@深港通卖出结算汇率#][{市场编号} = @市场编号# and {初始化日期} <= @初始化日期# and {买入结算汇率}<>0 and {卖出结算汇率}<>0 order by {初始化日期} desc] */
    select settle_buy_rate,settle_sell_rate into v_sz_hk_settle_buy_rate,v_sz_hksettle_sell_rate from db_pub.tb_base_hk_exch_rate where exch_no = v_exch_no and init_date <= v_init_date and settle_buy_rate<>0 and settle_sell_rate<>0 order by init_date desc limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sh_hk_buy_ref_rate = v_sh_hk_buy_ref_rate;
    SET p_sh_hk_sell_ref_rate = v_sh_hk_sell_ref_rate;
    SET p_sh_hk_settle_buy_rate = v_sh_hk_settle_buy_rate;
    SET p_sh_hk_settle_sell_rate = v_sh_hk_settle_sell_rate;
    SET p_sz_hk_buy_ref_rate = v_sz_hk_buy_ref_rate;
    SET p_sz_hk_sell_ref_rate = v_sz_hk_sell_ref_rate;
    SET p_sz_hk_settle_buy_rate = v_sz_hk_settle_buy_rate;
    SET p_sz_hksettle_sell_rate = v_sz_hksettle_sell_rate;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_风控接口_更新交易组证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_riskif_UpdateExchGroupSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_riskif_UpdateExchGroupSecuAsset(
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
    IN p_crncy_type varchar(3),
    IN p_asset_item int,
    IN p_asset_value decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_asset_id bigint,
    OUT p_exch_group_net_asset decimal(18,4),
    OUT p_update_times int
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
    declare v_crncy_type varchar(3);
    declare v_asset_item int;
    declare v_asset_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_asset_id bigint;
    declare v_exch_group_net_asset decimal(18,4);
    declare v_update_times int;
    declare v_begin_NAV decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_asset_item = p_asset_item;
    SET v_asset_value = p_asset_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_asset_id = 0;
    SET v_exch_group_net_asset = 0;
    SET v_update_times = 1;
    SET v_begin_NAV = 0;
    SET v_nav_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_futu_asset = 0;
    SET v_other_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_total_realiz_pandl = 0;
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_total_fina_debt = 0;
    SET v_total_loan_debt = 0;
    SET v_total_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @净资产# = @资产值#; */
    set v_nav_asset = v_asset_value;

    /* set @证券现金资产# = 0; */
    set v_stock_cash_asset = 0;

    /* set @总现金资产# = 0; */
    set v_total_cash_asset = 0;

    /* set @期货现金资产# = 0; */
    set v_futu_cash_asset = 0;

    /* set @股票资产# = 0; */
    set v_stock_asset = 0;

    /* set @债券资产# = 0; */
    set v_bond_asset = 0;

    /* set @基金资产# = 0; */
    set v_fund_asset = 0;

    /* set @回购资产# = 0; */
    set v_repo_asset = 0;

    /* set @期货资产# = 0; */
    set v_futu_asset = 0;

    /* set @其他资产# = 0; */
    set v_other_asset = 0;

    /* set @港股通资产# = 0; */
    set v_hk_thrgh_stock_asset = 0;

    /* set @累计实现收益# = 0; */
    set v_total_realiz_pandl = 0;

    /* set @多日总资产# = 0; */
    set v_many_days_total_asset = 0;

    /* set @统计天数# = 0; */
    set v_stat_days = 0;

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;

    /* set @货币基金资产# = 0; */
    set v_money_fund_asset = 0;

    /* set @非货币基金资产# = 0; */
    set v_not_money_fund_asset = 0;

    /* set  @总融资负债#=0; */
    set  v_total_fina_debt=0;

    /* set @总融券负债#=0; */
    set v_total_loan_debt=0;

    /* set @总资产#=0; */
    set v_total_asset=0;

    /* set @期货多头市值# = 0; */
    set v_futu_long_market_value = 0;

    /* set @期货空头市值# = 0; */
    set v_futu_short_market_value = 0;
    ##总资产=净资产+累计应付+融资负债+融券负债
    ##净资产=现金资产（不包含应收应付）+股票资产+基金资产+债券资产+回购资产+期货资产+期货资产+港股通资产+其他资产-累计应付+累计应收-融资负债-融券负债

    /* if @资产项# = 《资产项-现金资产》 then */
    if v_asset_item = 1 then

        /* set @证券现金资产# = @资产值#; */
        set v_stock_cash_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{证券现金资产}=@证券现金资产#,{总现金资产}=@证券现金资产#+{期货现金资产},{净资产}=@证券现金资产#+{期货现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_cash_asset=v_stock_cash_asset,total_cash_asset=v_stock_cash_asset+futu_cash_asset,nav_asset=v_stock_cash_asset+futu_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-股票资产》 then */
    elseif v_asset_item = 2 then

        /* set @股票资产# = @资产值#; */
        set v_stock_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{股票资产}=@股票资产#,{净资产}={总现金资产}+@股票资产#+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_asset=v_stock_asset,nav_asset=total_cash_asset+v_stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-债券资产》 then */
    elseif v_asset_item = 3 then

        /* set @债券资产# = @资产值#; */
        set v_bond_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{债券资产}=@债券资产#,{净资产}={总现金资产}+{股票资产}+@债券资产#+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, bond_asset=v_bond_asset,nav_asset=total_cash_asset+stock_asset+v_bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-基金资产》 then */
    elseif v_asset_item = 4 then

        /* set @基金资产# = @资产值#; */
        set v_fund_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{基金资产}=@基金资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+@基金资产#+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fund_asset=v_fund_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+v_fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-回购资产》 then */
    elseif v_asset_item = 5 then

        /* set @回购资产# = @资产值#; */
        set v_repo_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{回购资产}=@回购资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+@回购资产#+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, repo_asset=v_repo_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+v_repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-其他资产》 then */
    elseif v_asset_item = 7 then

        /* set @其他资产# = @资产值#; */
        set v_other_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{其他资产}=@其他资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+@其他资产#+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, other_asset=v_other_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+v_other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-港股通资产》 then */
    elseif v_asset_item = 8 then

        /* set @港股通资产# = @资产值#; */
        set v_hk_thrgh_stock_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{港股通资产}=@港股通资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+@港股通资产#-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, hk_thrgh_stock_asset=v_hk_thrgh_stock_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+v_hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-货币基金资产》 then */
    elseif v_asset_item = 11 then

        /* set @货币基金资产# = @资产值#; */
        set v_money_fund_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{货币基金资产}=@货币基金资产#,{基金资产}={非货币基金资产}+@货币基金资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{非货币基金资产}+@货币基金资产#+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, money_fund_asset=v_money_fund_asset,fund_asset=not_money_fund_asset+v_money_fund_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+not_money_fund_asset+v_money_fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-非货币基金资产》 then */
    elseif v_asset_item = 12 then

        /* set @非货币基金资产# = @资产值#; */
        set v_not_money_fund_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{非货币基金资产}=@非货币基金资产#,{基金资产}={货币基金资产}+@非货币基金资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{货币基金资产}+@非货币基金资产#+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, not_money_fund_asset=v_not_money_fund_asset,fund_asset=money_fund_asset+v_not_money_fund_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+money_fund_asset+v_not_money_fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-总融资负债》 then */
    elseif v_asset_item = 13 then

        /* set @总融资负债# = @资产值#; */
        set v_total_fina_debt = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{总融资负债}=@总融资负债#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-@总融资负债#-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_fina_debt=v_total_fina_debt,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-v_total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-总融券负债》 then */
    elseif v_asset_item = 14 then

        /* set @总融券负债# = @资产值#; */
        set v_total_loan_debt = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{总融券负债}=@总融券负债#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-@总融券负债#][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_loan_debt=v_total_loan_debt,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-v_total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.7.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][公共_用户_交易组资产表][{记录序号},{净资产},{更新次数}][@交易组资产序号#,@交易组净资产#,@更新次数#][{交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@交易组编号#,@本币币种#] */
    select row_id,nav_asset,update_times into v_exgp_asset_id,v_exch_group_net_asset,v_update_times from db_pub.tb_user_exch_group_asset where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.27.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_asset_id = v_exgp_asset_id;
    SET p_exch_group_net_asset = v_exch_group_net_asset;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 原子_公共_风控接口_更新交易组期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_riskif_UpdateExchGroupFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_riskif_UpdateExchGroupFutuAsset(
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
    IN p_crncy_type varchar(3),
    IN p_asset_item int,
    IN p_asset_value decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_asset_id bigint,
    OUT p_exch_group_net_asset decimal(18,4),
    OUT p_update_times int
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
    declare v_crncy_type varchar(3);
    declare v_asset_item int;
    declare v_asset_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_asset_id bigint;
    declare v_exch_group_net_asset decimal(18,4);
    declare v_update_times int;
    declare v_begin_NAV decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_total_realiz_pandl decimal(18,4);
    declare v_many_days_total_asset decimal(18,4);
    declare v_stat_days int;
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_total_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_asset_item = p_asset_item;
    SET v_asset_value = p_asset_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_asset_id = 0;
    SET v_exch_group_net_asset = 0;
    SET v_update_times = 1;
    SET v_begin_NAV = 0;
    SET v_nav_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_futu_asset = 0;
    SET v_other_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_total_realiz_pandl = 0;
    SET v_many_days_total_asset = 0;
    SET v_stat_days = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_total_fina_debt = 0;
    SET v_total_loan_debt = 0;
    SET v_total_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @净资产# = @资产值#; */
    set v_nav_asset = v_asset_value;

    /* set @证券现金资产# = 0; */
    set v_stock_cash_asset = 0;

    /* set @总现金资产# = 0; */
    set v_total_cash_asset = 0;

    /* set @期货现金资产# = 0; */
    set v_futu_cash_asset = 0;

    /* set @股票资产# = 0; */
    set v_stock_asset = 0;

    /* set @债券资产# = 0; */
    set v_bond_asset = 0;

    /* set @基金资产# = 0; */
    set v_fund_asset = 0;

    /* set @回购资产# = 0; */
    set v_repo_asset = 0;

    /* set @期货资产# = 0; */
    set v_futu_asset = 0;

    /* set @其他资产# = 0; */
    set v_other_asset = 0;

    /* set @港股通资产# = 0; */
    set v_hk_thrgh_stock_asset = 0;

    /* set @累计实现收益# = 0; */
    set v_total_realiz_pandl = 0;

    /* set @多日总资产# = 0; */
    set v_many_days_total_asset = 0;

    /* set @统计天数# = 0; */
    set v_stat_days = 0;

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;

    /* set @货币基金资产# = 0; */
    set v_money_fund_asset = 0;

    /* set @非货币基金资产# = 0; */
    set v_not_money_fund_asset = 0;

    /* set  @总融资负债#=0; */
    set  v_total_fina_debt=0;

    /* set @总融券负债#=0; */
    set v_total_loan_debt=0;

    /* set @总资产#=0; */
    set v_total_asset=0;

    /* set @期货多头市值# = 0; */
    set v_futu_long_market_value = 0;

    /* set @期货空头市值# = 0; */
    set v_futu_short_market_value = 0;

    /* if @资产项# = 《资产项-现金资产》 then */
    if v_asset_item = 1 then

        /* set @期货现金资产# = @资产值#; */
        set v_futu_cash_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{期货现金资产}=@期货现金资产#,{总现金资产}={证券现金资产}+@期货现金资产#,{净资产}={证券现金资产}+@期货现金资产#+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_cash_asset=v_futu_cash_asset,total_cash_asset=stock_cash_asset+v_futu_cash_asset,nav_asset=stock_cash_asset+v_futu_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.8.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-期货资产》 then */
    elseif v_asset_item = 6 then

        /* set @期货资产# = @资产值#; */
        set v_futu_asset = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{期货资产}=@期货资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+@期货资产#+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@交易组编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_asset=v_futu_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+v_futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.8.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-期货多头市值》 then */
    elseif v_asset_item = 15 then

        /* set @期货多头市值# = @资产值#; */
        set v_futu_long_market_value = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{期货多头市值}=@期货多头市值#][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_long_market_value=v_futu_long_market_value;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.8.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-期货空头市值》 then */
    elseif v_asset_item = 16 then

        /* set @期货空头市值# = @资产值#; */
        set v_futu_short_market_value = v_asset_value;

        /* [插入重复更新][公共_用户_交易组资产表][字段][字段变量][{期货空头市值}=@期货空头市值#][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pub.tb_user_exch_group_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, crncy_type, begin_NAV, nav_asset, 
            total_cash_asset, stock_cash_asset, futu_cash_asset, stock_asset, 
            fund_asset, money_fund_asset, not_money_fund_asset, bond_asset, 
            futu_asset, repo_asset, other_asset, hk_thrgh_stock_asset, 
            total_realiz_pandl, many_days_total_asset, stat_days, begin_evalu_nav_asset, 
            evalu_nav_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
            v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, v_stock_asset, 
            v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, v_bond_asset, 
            v_futu_asset, v_repo_asset, v_other_asset, v_hk_thrgh_stock_asset, 
            v_total_realiz_pandl, v_many_days_total_asset, v_stat_days, v_begin_evalu_nav_asset, 
            v_evalu_nav_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_short_market_value=v_futu_short_market_value;
        if v_error_code = "1" then
                    
            SET v_error_code = "pubA.27.8.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][公共_用户_交易组资产表][{记录序号},{净资产},{更新次数}][@交易组资产序号#,@交易组净资产#,@更新次数#][{交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@交易组编号#,@本币币种#] */
    select row_id,nav_asset,update_times into v_exgp_asset_id,v_exch_group_net_asset,v_update_times from db_pub.tb_user_exch_group_asset where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pubA.27.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_asset_id = v_exgp_asset_id;
    SET p_exch_group_net_asset = v_exch_group_net_asset;
    SET p_update_times = v_update_times;

END;;


