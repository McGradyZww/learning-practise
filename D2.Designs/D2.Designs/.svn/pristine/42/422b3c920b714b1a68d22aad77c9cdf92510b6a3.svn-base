DELIMITER ;;
use db_prod;;

# 原子_产品_风控接口_查询风控所需产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdrkif_QueryProductInfoByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdrkif_QueryProductInfoByRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pd_type int,
    IN p_pd_status_str varchar(64),
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
    declare v_pd_type int;
    declare v_pd_status_str varchar(64);
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
    SET v_pd_type = p_pd_type;
    SET v_pd_status_str = p_pd_status_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{记录序号},a.{产品编号},a.{机构编号},a.{产品编码},a.{产品名称},a.{产品全称},a.{产品管理人},a.{成立日期},a.{产品类型},a.{募集币种},a.{本币币种},a.{原始资产},a.{原始金额},a.{产品总份额},a.{当前份额},a.{昨日份额},a.{历史最高单位净值},a.{昨日净值},a.{期初净资产},a.{估值份额},a.{昨日估值份额},a.{境内托管人全名},a.{境内托管账户},a.{境内托管账户名},a.{备注信息},b.{产品状态},a.{更新次数}][a.{产品编号}=b.{产品编号} and (@机构编号# = 0 or a.{机构编号}=@机构编号#) and (@产品编号# = 0 or a.{产品编号}=@产品编号#) and (@产品类型# = 0 or a.{产品类型}=@产品类型#) and (@产品状态串# = "; ;" or instr(@产品状态串#, concat(";",b.{产品状态},";")) > 0) and a.{记录序号} > @记录序号# order by a.{记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.begin_NAV,a.evalu_share,a.pre_evalu_share,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.remark_info,b.pd_status,a.update_times from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_type = 0 or a.pd_type=v_pd_type) and (v_pd_status_str = "; ;" or instr(v_pd_status_str, concat(";",b.pd_status,";")) > 0) and a.row_id > v_row_id order by a.row_id;
    else
        select a.row_id,a.pd_no,a.co_no,a.pd_code,a.pd_name,a.pd_flname,a.pd_manager,a.found_date,a.pd_type,a.apply_currency,a.crncy_type,a.first_asset,a.first_amt,a.pd_all_share,a.curr_share,a.pre_share,a.his_max_per_nav,a.pre_nav,a.begin_NAV,a.evalu_share,a.pre_evalu_share,a.coust_full_name,a.coust_acco,a.coust_acco_name,a.remark_info,b.pd_status,a.update_times from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no = 0 or a.pd_no=v_pd_no) and (v_pd_type = 0 or a.pd_type=v_pd_type) and (v_pd_status_str = "; ;" or instr(v_pd_status_str, concat(";",b.pd_status,";")) > 0) and a.row_id > v_row_id order by a.row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_风控接口_查询风控所需产品限制信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdrkif_QueryProductLimitByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdrkif_QueryProductLimitByRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_产品限制信息表][{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{成本计算方式},{允许投资市场},{允许操作证券类型},{业务控制配置串},{指令审批操作员},{市价冻结浮动比例},{产品状态}," " as {备注信息},{更新次数}][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select create_date,create_time,update_date,update_time,co_no,pd_no,cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,pd_status," " as remark_info,update_times from db_prod.tb_pdacco_pd_limit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id;
    else
        select create_date,create_time,update_date,update_time,co_no,pd_no,cost_calc_type,allow_exch,allow_stock_type,busi_config_str,comm_appr_oper,market_price_ratio,pd_status," " as remark_info,update_times from db_prod.tb_pdacco_pd_limit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_风控接口_查询风控所需产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdrkif_QueryPdCapitalByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdrkif_QueryPdCapitalByRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_crncy_type_str varchar(2048);
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_资金_产品资金表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{本币币种},{原始金额},({当前金额}+{金额核对差额}) as {当前金额},{产品已分配金额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数}][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,crncy_type,first_amt,(curr_amt+amt_check_diff) as curr_amt,pd_dist_amt,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times from db_prod.tb_pdcapit_pd_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,crncy_type,first_amt,(curr_amt+amt_check_diff) as curr_amt,pd_dist_amt,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times from db_prod.tb_pdcapit_pd_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_风控接口_更新产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdrkif_UpdatePdAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdrkif_UpdatePdAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_crncy_type varchar(3),
    IN p_asset_item int,
    IN p_asset_value decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_prod_asset_id bigint,
    OUT p_pd_net_asset decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_asset_item int;
    declare v_asset_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_prod_asset_id bigint;
    declare v_pd_net_asset decimal(18,4);
    declare v_update_times int;
    declare v_begin_NAV decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
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
    SET v_crncy_type = p_crncy_type;
    SET v_asset_item = p_asset_item;
    SET v_asset_value = p_asset_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_prod_asset_id = 0;
    SET v_pd_net_asset = 0;
    SET v_update_times = 1;
    SET v_begin_NAV = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_nav_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_futu_asset = 0;
    SET v_other_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
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

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;

    /* set @净资产# = @资产值#; */
    set v_nav_asset = v_asset_value;

    /* set @总现金资产# = 0; */
    set v_total_cash_asset = 0;

    /* set @证券现金资产# = 0; */
    set v_stock_cash_asset = 0;

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

    /* set @港股通资产# =0; */
    set v_hk_thrgh_stock_asset =0;

    /* set @货币基金资产# = 0; */
    set v_money_fund_asset = 0;

    /* set @非货币基金资产# = 0; */
    set v_not_money_fund_asset = 0;

    /* set  @总融资负债#=0; */
    set  v_total_fina_debt=0;

    /* set  @总融券负债#=0; */
    set  v_total_loan_debt=0;

    /* set  @总资产#=0; */
    set  v_total_asset=0;

    /* set @期货多头市值# = 0; */
    set v_futu_long_market_value = 0;

    /* set @期货空头市值# = 0; */
    set v_futu_short_market_value = 0;
    ##总资产=净资产+累计应付+融资负债+融券负债
    ##净资产=现金资产（不包含应收应付）+股票资产+基金资产+债券资产+回购资产+期货资产+期货资产+港股通资产+其他资产-累计应付+累计应收-融资负债-融券负债

    /* if @资产项# = 《资产项-现金资产》 then */
    if v_asset_item = 1 then

        /* set @总现金资产# = @资产值#; */
        set v_total_cash_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{总现金资产}=@总现金资产#,{净资产}=@总现金资产#+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_cash_asset=v_total_cash_asset,nav_asset=v_total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-证券现金资产》 then */
    elseif v_asset_item = 9 then

        /* set @证券现金资产# = @资产值#; */
        set v_stock_cash_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{证券现金资产}=@证券现金资产#,{总现金资产}=@证券现金资产#+{期货现金资产},{净资产}=@证券现金资产#+{期货现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_cash_asset=v_stock_cash_asset,total_cash_asset=v_stock_cash_asset+futu_cash_asset,nav_asset=v_stock_cash_asset+futu_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-期货现金资产》 then */
    elseif v_asset_item = 10 then

        /* set @期货现金资产# = @资产值#; */
        set v_futu_cash_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{期货现金资产}=@期货现金资产#,{总现金资产}={证券现金资产}+@期货现金资产#,{净资产}={证券现金资产}+@期货现金资产#+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_cash_asset=v_futu_cash_asset,total_cash_asset=stock_cash_asset+v_futu_cash_asset,nav_asset=stock_cash_asset+v_futu_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-股票资产》 then */
    elseif v_asset_item = 2 then

        /* set @股票资产# = @资产值#; */
        set v_stock_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{股票资产}=@股票资产#,{净资产}={总现金资产}+@股票资产#+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_asset=v_stock_asset,nav_asset=total_cash_asset+v_stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-债券资产》 then */
    elseif v_asset_item = 3 then

        /* set @债券资产# = @资产值#; */
        set v_bond_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{债券资产}=@债券资产#,{净资产}={总现金资产}+{股票资产}+@债券资产#+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, bond_asset=v_bond_asset,nav_asset=total_cash_asset+stock_asset+v_bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-基金资产》 then */
    elseif v_asset_item = 4 then

        /* set @基金资产# = @资产值#; */
        set v_fund_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{基金资产}=@基金资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+@基金资产#+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, fund_asset=v_fund_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+v_fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-回购资产》 then */
    elseif v_asset_item = 5 then

        /* set @回购资产# = @资产值#; */
        set v_repo_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{回购资产}=@回购资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+@回购资产#+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, repo_asset=v_repo_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+v_repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-期货资产》 then */
    elseif v_asset_item = 6 then

        /* set @期货资产# = @资产值#; */
        set v_futu_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{期货资产}=@期货资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+@期货资产#+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_asset=v_futu_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+v_futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-其他资产》 then */
    elseif v_asset_item = 7 then

        /* set @其他资产# = @资产值#; */
        set v_other_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{其他资产}=@其他资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+@其他资产#+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, other_asset=v_other_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+v_other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-港股通资产》 then */
    elseif v_asset_item = 8 then

        /* set @港股通资产# = @资产值#; */
        set v_hk_thrgh_stock_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{港股通资产}=@港股通资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+@港股通资产#-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, hk_thrgh_stock_asset=v_hk_thrgh_stock_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+v_hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-货币基金资产》 then */
    elseif v_asset_item = 11 then

        /* set @货币基金资产# = @资产值#; */
        set v_money_fund_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{货币基金资产}=@货币基金资产#,{基金资产}={非货币基金资产}+@货币基金资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{非货币基金资产}+@货币基金资产#+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, money_fund_asset=v_money_fund_asset,fund_asset=not_money_fund_asset+v_money_fund_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+not_money_fund_asset+v_money_fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-非货币基金资产》 then */
    elseif v_asset_item = 12 then

        /* set @非货币基金资产# = @资产值#; */
        set v_not_money_fund_asset = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{非货币基金资产}=@非货币基金资产#,{基金资产}={货币基金资产}+@非货币基金资产#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{货币基金资产}+@非货币基金资产#+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, not_money_fund_asset=v_not_money_fund_asset,fund_asset=money_fund_asset+v_not_money_fund_asset,nav_asset=total_cash_asset+stock_asset+bond_asset+money_fund_asset+v_not_money_fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-总融资负债》 then */
    elseif v_asset_item = 13 then

        /* set @总融资负债# = @资产值#; */
        set v_total_fina_debt = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{总融资负债}=@总融资负债#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-@总融资负债#-{总融券负债}][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_fina_debt=v_total_fina_debt,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-v_total_fina_debt-total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
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

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{总融券负债}=@总融券负债#,{净资产}={总现金资产}+{股票资产}+{债券资产}+{基金资产}+{回购资产}+{期货资产}+{其他资产}+{港股通资产}-{总融资负债}-@总融券负债#][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_loan_debt=v_total_loan_debt,nav_asset=total_cash_asset+stock_asset+bond_asset+fund_asset+repo_asset+futu_asset+other_asset+hk_thrgh_stock_asset-total_fina_debt-v_total_loan_debt;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


    /* elseif @资产项# = 《资产项-期货多头市值》 then */
    elseif v_asset_item = 15 then

        /* set @期货多头市值# = @资产值#; */
        set v_futu_long_market_value = v_asset_value;

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{期货多头市值}=@期货多头市值#][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_long_market_value=v_futu_long_market_value;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
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

        /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{期货空头市值}=@期货空头市值#][1][@产品编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_prod.tb_pdcapit_pd_asset (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
            nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
            stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
            bond_asset, futu_asset, repo_asset, other_asset, 
            hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
            futu_short_market_value) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
            v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
            v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
            v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
            v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
            v_futu_short_market_value) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, futu_short_market_value=v_futu_short_market_value;
        if v_error_code = "1" then
                    
            SET v_error_code = "prodA.9.4.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][产品_资金_产品资产表][{记录序号},{净资产},{更新次数}][@产品资产序号#,@产品净资产#,@更新次数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select row_id,nav_asset,update_times into v_prod_asset_id,v_pd_net_asset,v_update_times from db_prod.tb_pdcapit_pd_asset where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.9.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_prod_asset_id = v_prod_asset_id;
    SET p_pd_net_asset = v_pd_net_asset;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_风控接口_查询风控所需产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdrkif_QueryPdAssetByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdrkif_QueryPdAssetByRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_crncy_type_str varchar(2048);
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_资金_产品资产表][{记录序号},{创建日期},{创建时间},{更新日期},{更新时间},{机构编号},{产品编号},{本币币种},{期初估值净资产},{估值净资产},{更新次数}][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,crncy_type,begin_evalu_nav_asset,evalu_nav_asset,update_times from db_prod.tb_pdcapit_pd_asset where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id,create_date,create_time,update_date,update_time,co_no,pd_no,crncy_type,begin_evalu_nav_asset,evalu_nav_asset,update_times from db_prod.tb_pdcapit_pd_asset where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_风控接口_查询融资融券资产账户通道
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdrkif_QueryAssetAccoChanel;;
DELIMITER ;;
CREATE PROCEDURE pra_pdrkif_QueryAssetAccoChanel(
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
    IN p_asset_acco_status varchar(2),
    IN p_out_acco varchar(32),
    IN p_pd_name varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_asset_acco_status varchar(2);
    declare v_out_acco varchar(32);
    declare v_pd_name varchar(64);
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
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_out_acco = p_out_acco;
    SET v_pd_name = p_pd_name;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #[获取表全记录][产品_账户_资产账户信息表][{机构编号},{产品编号},{资产账户编号},{资产账户},{资产账户名称},{资产账户状态}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@资产账户状态#=" " or {资产账户状态}=@资产账户状态#)]

    /* select a.*,c.out_acco,c.pass_no from tb_pdacco_asset_acco a,tb_pdacco_pd_info b,tb_pdacco_asset_acco_ch c where a.pd_no=b.pd_no and a.asset_acco_no=c.asset_acco_no and (@机构编号#=0 or a.{机构编号}=@机构编号#)and  a.{资产账户类型}=5 and (@产品编号#=0 or a.{产品编号}=@产品编号#) and (@资产账户编号#=0 or a.{资产账户编号}=@资产账户编号#) and (@资产账户状态#=" " or a.{资产账户状态}=@资产账户状态#) and (@产品名称#=" " or b.{产品名称} like concat("%",@产品名称#,"%")) and (@外部账号#=" " or c.{外部账号}=@外部账号#); */
    select a.*,c.out_acco,c.pass_no from tb_pdacco_asset_acco a,tb_pdacco_pd_info b,tb_pdacco_asset_acco_ch c where a.pd_no=b.pd_no and a.asset_acco_no=c.asset_acco_no and (v_co_no=0 or a.co_no=v_co_no)and  a.asset_acco_type=5 and (v_pd_no=0 or a.pd_no=v_pd_no) and (v_asset_acco_no=0 or a.asset_acco_no=v_asset_acco_no) and (v_asset_acco_status=" " or a.asset_acco_status=v_asset_acco_status) and (v_pd_name=" " or b.pd_name like concat("%",v_pd_name,"%")) and (v_out_acco=" " or c.out_acco=v_out_acco);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_风控接口_查询风控所需资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdrkif_QueryAssetAccoInfoByRisk;;
DELIMITER ;;
CREATE PROCEDURE pra_pdrkif_QueryAssetAccoInfoByRisk(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_status varchar(2),
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
    declare v_asset_acco_status varchar(2);
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
    SET v_asset_acco_status = p_asset_acco_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_资产账户信息表][{机构编号},{产品编号},{资产账户编号},{资产账户类型},{资产账户状态},{注销日期},{更新次数}][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and  (@资产账户状态#=" " or {资产账户状态}=@资产账户状态#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select co_no,pd_no,asset_acco_no,asset_acco_type,asset_acco_status,abolish_date,update_times from db_prod.tb_pdacco_asset_acco where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and  (v_asset_acco_status=" " or asset_acco_status=v_asset_acco_status) and row_id>v_row_id order by row_id;
    else
        select co_no,pd_no,asset_acco_no,asset_acco_type,asset_acco_status,abolish_date,update_times from db_prod.tb_pdacco_asset_acco where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and  (v_asset_acco_status=" " or asset_acco_status=v_asset_acco_status) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


