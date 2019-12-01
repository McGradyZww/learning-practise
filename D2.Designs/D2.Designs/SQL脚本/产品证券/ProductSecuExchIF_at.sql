DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_检查账户状态获取可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_CheckStockAccoStatusAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_CheckStockAccoStatusAvail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_crncy_type varchar(3),
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no int,
    OUT p_stock_acco varchar(16),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_avail_qty decimal(18,2),
    OUT p_exgp_target_code_avail_qty decimal(18,2),
    OUT p_exgp_trade_code_avail_qty decimal(18,2),
    OUT p_asac_avail_qty decimal(18,2),
    OUT p_asac_target_code_avail_qty decimal(18,2),
    OUT p_asac_trade_code_avail_qty decimal(18,2),
    OUT p_exgp_loan_sell_amt decimal(18,4),
    OUT p_asac_loan_sell_amt decimal(18,4),
    OUT p_exgp_debt_loan_sell_strike_qty decimal(18,2),
    OUT p_exgp_debt_fina_buy_strike_amt decimal(18,4),
    OUT p_record_count int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_crncy_type varchar(3);
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_exgp_loan_sell_amt decimal(18,4);
    declare v_asac_loan_sell_amt decimal(18,4);
    declare v_exgp_debt_loan_sell_strike_qty decimal(18,2);
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
    declare v_record_count int;
    declare v_invest_type int;
    declare v_stock_acco_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_apply_limit decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_curr_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_crncy_type = p_crncy_type;
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exgp_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_exgp_loan_sell_amt = 0;
    SET v_asac_loan_sell_amt = 0;
    SET v_exgp_debt_loan_sell_strike_qty = 0;
    SET v_exgp_debt_fina_buy_strike_amt = 0;
    SET v_record_count = 0;
    SET v_invest_type = 0;
    SET v_stock_acco_status = "0";
    SET v_allow_stock_type = " ";
    SET v_busi_limit_str = " ";
    SET v_apply_limit = 0;
    SET v_avail_qty = 0;
    SET v_curr_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;
    #获取股东代码编号和股东代码状态
    #[获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号},{股东代码},{股东代码状态},{允许操作证券类型},{业务限制串}][@股东代码编号#,@股东代码#,@股东代码状态#,@允许操作证券类型#,@业务限制串#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号#][145][@资产账户编号#,@市场编号#]

    /* [获取表记录变量语句][产品证券_账户_证券账户信息表][count(1),min({股东代码编号})][@记录个数#,@股东代码编号#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {股东代码状态}=《股东代码状态-正常》] */
    select count(1),min(stock_acco_no) into v_record_count,v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and stock_acco_status="1" limit 1;

    #资产账户下不存在正常的股东代码，则报错返回

    /* [检查报错返回][@记录个数# =0][167][@股东代码状态#] */
    if v_record_count =0 then
        
        SET v_error_code = "pdsecuA.6.1.167";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("股东代码状态=",v_stock_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("股东代码状态=",v_stock_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码},{股东代码状态},{允许操作证券类型},{业务限制串}][@股东代码#,@股东代码状态#,@允许操作证券类型#,@业务限制串#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {股东代码编号}=@股东代码编号#][145][@资产账户编号#,@市场编号#,@股东代码编号#] */
    select stock_acco,stock_acco_status,allow_stock_type,busi_limit_str into v_stock_acco,v_stock_acco_status,v_allow_stock_type,v_busi_limit_str from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and stock_acco_no=v_stock_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.6.1.145";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;

    #检查业务限制
    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][166][@证券类型#,@允许操作证券类型#] */
    if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
        
        SET v_error_code = "pdsecuA.6.1.166";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
        end if;
        leave label_pro;
    end if;

    #如果传入的指令方向有值，检查是否有相应业务限制

    /* if @订单方向# = 《订单方向-新股申购》 and @证券代码# <= 688000 and @证券代码# >= 688999  then */
    if v_order_dir = 11 and v_stock_code <= 688000 and v_stock_code >= 688999  then

        /* [检查报错返回][instr(concat(";",@业务限制串#,";") ,concat(";",《业务限制-限制打新》,";")) > 0][148][@业务限制串#] */
        if instr(concat(";",v_busi_limit_str,";") ,concat(";",1,";")) > 0 then
            
            SET v_error_code = "pdsecuA.6.1.148";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-新股申购》 and @证券代码# >= 688000 and @证券代码# <= 688999  then */
    if v_order_dir = 11 and v_stock_code >= 688000 and v_stock_code <= 688999  then

        /* [检查报错返回][instr(concat(";",@业务限制串#,";") ,concat(";",《业务限制-限制科创板打新》,";")) > 0][920][@业务限制串#] */
        if instr(concat(";",v_busi_limit_str,";") ,concat(";",4,";")) > 0 then
            
            SET v_error_code = "pdsecuA.6.1.920";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融资回购》 then */
    if v_order_dir = 3 then

        /* [检查报错返回][instr(concat(";",@业务限制串#,";"), concat(";",《业务限制-限制融资回购》,";")) > 0][149][@业务限制串#] */
        if instr(concat(";",v_busi_limit_str,";"), concat(";",2,";")) > 0 then
            
            SET v_error_code = "pdsecuA.6.1.149";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-融券回购》 then */
    if v_order_dir = 4 then

        /* [检查报错返回][instr(concat(";",@业务限制串#,";"), concat(";",《业务限制-限制融券回购》,";")) > 0][150][@业务限制串#] */
        if instr(concat(";",v_busi_limit_str,";"), concat(";",3,";")) > 0 then
            
            SET v_error_code = "pdsecuA.6.1.150";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务限制串=",v_busi_limit_str);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# = 《订单方向-新股申购》 then */
    if v_order_dir = 11 then

        /* [获取表记录变量语句][产品证券_持仓_新股申购上限表][{申购上限}][@申购上限#][{初始化日期}=@初始化日期# and {资产账户编号} = @资产账户编号# and {股东代码编号}=@股东代码编号#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
        select apply_limit into v_apply_limit from db_pdsecu.tb_pdsepo_new_stock_limit where init_date=v_init_date and asset_acco_no = v_asset_acco_no and stock_acco_no=v_stock_acco_no limit 1;


        /* [检查报错返回][@申购上限# >0 and @申购上限# < @订单数量#][765][@申购上限#,@订单数量#] */
        if v_apply_limit >0 and v_apply_limit < v_order_qty then
            
            SET v_error_code = "pdsecuA.6.1.765";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty),"#",v_mysql_message);
            else
                SET v_error_info = concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @资产账户可用金额# = 0; */
    set v_asac_avail_amt = 0;

    /* set @交易组可用金额# = 0; */
    set v_exgp_avail_amt = 0;

    /* set @交易组可用数量#  = 0; */
    set v_exgp_avail_qty  = 0;

    /* set @资产账户可用数量#  = 0; */
    set v_asac_avail_qty  = 0;

    /* set @交易组标的代码可用数量#  = 0; */
    set v_exgp_target_code_avail_qty  = 0;

    /* set @交易组交易代码可用数量#  = 0; */
    set v_exgp_trade_code_avail_qty  = 0;

    /* set @资产账户标的代码可用数量#  = 0; */
    set v_asac_target_code_avail_qty  = 0;

    /* set @资产账户交易代码可用数量#  = 0; */
    set v_asac_trade_code_avail_qty  = 0;

    /* set @可用数量# = 0; */
    set v_avail_qty = 0;

    /* set @交易组融券卖出金额#  = 0; */
    set v_exgp_loan_sell_amt  = 0;

    /* set @资产账户融券卖出金额# = 0; */
    set v_asac_loan_sell_amt = 0;

    /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》  or @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-融券卖出》 or @订单方向# = 《订单方向-基金申购》 or  @订单方向# =《订单方向-买券还券》  then */
    if v_order_dir = 1 or v_order_dir = 4  or v_order_dir = 5 or v_order_dir = 6 or v_order_dir = 9 or  v_order_dir =8  then
        #如果资产账户编号不为0，则检查资产账户相关数据

        /* if @资产账户编号# <> 0 then */
        if v_asset_acco_no <> 0 then

            /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{冻结金额},{解冻金额}][@当前金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@冻结金额#,@解冻金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select curr_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,frozen_amt,unfroz_amt into v_curr_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_frozen_amt,v_unfroz_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 or @市场编号#=《市场编号-场外交易市场》 then */
                if v_exch_no = 1 or v_exch_no = 2 or v_exch_no=5 then

                    /* set @资产账户可用金额# = @当前金额# + @沪深可用调整金额# - @冻结金额# + @解冻金额#+@金额核对差额#; */
                    set v_asac_avail_amt = v_curr_amt + v_shsz_avail_change_amt - v_frozen_amt + v_unfroz_amt+v_amt_check_diff;
                else

                    /* set @资产账户可用金额# = @当前金额# + @港股通可用调整金额# - @冻结金额# + @解冻金额#+@金额核对差额#; */
                    set v_asac_avail_amt = v_curr_amt + v_hk_avail_change_amt - v_frozen_amt + v_unfroz_amt+v_amt_check_diff;
                end if;
            else

                /* set @资产账户可用金额# = 0; */
                set v_asac_avail_amt = 0;
            end if;
        end if;
        #如果交易组编号不为0，则检查交易组相关数据

        /* if @交易组编号# <> 0 then */
        if v_exch_group_no <> 0 then

            /* [获取表记录变量语句][产品证券_资金_交易组资金表][{当前金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{冻结金额},{解冻金额}][@当前金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@冻结金额#,@解冻金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select curr_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,frozen_amt,unfroz_amt into v_curr_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_frozen_amt,v_unfroz_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》  or @市场编号#=《市场编号-场外交易市场》 then */
                if v_exch_no = 1 or v_exch_no = 2  or v_exch_no=5 then

                    /* set @交易组可用金额# = @当前金额# + @沪深可用调整金额# - @冻结金额# + @解冻金额#+@金额核对差额#; */
                    set v_exgp_avail_amt = v_curr_amt + v_shsz_avail_change_amt - v_frozen_amt + v_unfroz_amt+v_amt_check_diff;
                else

                    /* set @交易组可用金额# = @当前金额# + @港股通可用调整金额# - @冻结金额# + @解冻金额#+@金额核对差额#; */
                    set v_exgp_avail_amt = v_curr_amt + v_hk_avail_change_amt - v_frozen_amt + v_unfroz_amt+v_amt_check_diff;
                end if;
            else

                /* set @交易组可用金额# = 0; */
                set v_exgp_avail_amt = 0;
            end if;
        end if;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-质押提交》 or @订单方向# = 《订单方向-零股卖出》  or @订单方向# = 《订单方向-基金申购》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# =《订单方向-卖券还款》 then */
    elseif v_order_dir = 2 or v_order_dir = 3 or v_order_dir = 21 or v_order_dir = 31  or v_order_dir = 9 or v_order_dir = 10 or v_order_dir =7 then

        /* if @订单方向# = 《订单方向-融资回购》 then */
        if v_order_dir = 3 then

            /* set @证券代码编号# = @标的代码编号#; */
            set v_stock_code_no = v_target_code_no;
        end if;

        /* if @订单方向# = 《订单方向-质押提交》 then */
        if v_order_dir = 21 then

            /* set @证券代码编号# = @交易代码编号#; */
            set v_stock_code_no = v_trade_code_no;
        end if;
        #如果资产账户编号不为0，则检查资产账户相关数据

        /* if @资产账户编号# <> 0 then */
        if v_asset_acco_no <> 0 then

            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @记录个数#=1; */
                set v_record_count=1;

                /* set @可用数量# = @当前数量# - @冻结数量# + @解冻数量#+@持仓核对差额#; */
                set v_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty+v_posi_qty_check_diff;
            end if;

            /* if @订单方向# = 《订单方向-卖出》  or   @订单方向# = 《订单方向-零股卖出》  or @订单方向# = 《订单方向-基金申购》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# = 《订单方向-卖券还款》 then */
            if v_order_dir = 2  or   v_order_dir = 31  or v_order_dir = 9 or v_order_dir = 10 or v_order_dir = 7 then

                /* set @资产账户可用数量# = @可用数量#; */
                set v_asac_avail_qty = v_avail_qty;

            /* elseif @订单方向# = 《订单方向-融资回购》 then */
            elseif v_order_dir = 3 then

                /* set @资产账户标的代码可用数量#  = @可用数量#; */
                set v_asac_target_code_avail_qty  = v_avail_qty;

            /* elseif @订单方向# = 《订单方向-质押提交》 then */
            elseif v_order_dir = 21 then

                /* set @资产账户交易代码可用数量#  = @可用数量#; */
                set v_asac_trade_code_avail_qty  = v_avail_qty;
            end if;
        end if;
        #如果交易组编号不为0，则检查交易组相关数据

        /* if @交易组编号# <> 0 then */
        if v_exch_group_no <> 0 then

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @可用数量# = @当前数量# - @冻结数量# + @解冻数量#+@持仓核对差额#; */
                set v_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty+v_posi_qty_check_diff;
            end if;

            /* if @订单方向# = 《订单方向-卖出》  or   @订单方向# = 《订单方向-零股卖出》  or @订单方向# = 《订单方向-基金申购》 or @订单方向# = 《订单方向-基金赎回》 or @订单方向# = 《订单方向-卖券还款》 then */
            if v_order_dir = 2  or   v_order_dir = 31  or v_order_dir = 9 or v_order_dir = 10 or v_order_dir = 7 then

                /* set @交易组可用数量# = @可用数量#; */
                set v_exgp_avail_qty = v_avail_qty;

            /* elseif @订单方向# = 《订单方向-融资回购》 then */
            elseif v_order_dir = 3 then

                /* set @交易组标的代码可用数量#  = @可用数量#; */
                set v_exgp_target_code_avail_qty  = v_avail_qty;

            /* elseif @订单方向# = 《订单方向-质押提交》 then */
            elseif v_order_dir = 21 then

                /* set @交易组交易代码可用数量#  = @可用数量#; */
                set v_exgp_trade_code_avail_qty  = v_avail_qty;
            end if;
        end if;

    /* elseif @订单方向# = 《订单方向-质押转回》 then */
    elseif v_order_dir = 22 then
        #如果资产账户编号不为0，则检查资产账户相关数据

        /* if @资产账户编号# <> 0 then */
        if v_asset_acco_no <> 0 then

            /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@标的代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_target_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @资产账户标的代码可用数量# = @当前数量# - @冻结数量# + @解冻数量#+@持仓核对差额#; */
                set v_asac_target_code_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty+v_posi_qty_check_diff;
            end if;

            /* [获取表记录变量语句][产品证券_持仓_资产账户债券质押表][{当前数量}][@当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
            select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_asac_bond_pledge where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @资产账户交易代码可用数量# = @当前数量#; */
                set v_asac_trade_code_avail_qty = v_curr_qty;
            end if;
        end if;
        #如果交易组编号不为0，则检查交易组相关数据

        /* if @交易组编号# <> 0 then */
        if v_exch_group_no <> 0 then

            /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@标的代码编号# and {投资类型}=@投资类型#] */
            select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_target_code_no and invest_type=v_invest_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @交易组标的代码可用数量# = @当前数量# - @冻结数量# + @解冻数量#+@持仓核对差额#; */
                set v_exgp_target_code_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty+v_posi_qty_check_diff;
            end if;

            /* [获取表记录变量语句][产品证券_持仓_交易组债券质押表][{当前数量}][@当前数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
            select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_exgp_bond_pledge where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @交易组交易代码可用数量# = @当前数量#; */
                set v_exgp_trade_code_avail_qty = v_curr_qty;
            end if;
        end if;
    end if;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* if @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-融券卖出》 or  @订单方向# = 《订单方向-买券还券》  or  @订单方向# = 《订单方向-卖券还款》   then */
    if v_order_dir = 5 or v_order_dir = 6 or  v_order_dir = 8  or  v_order_dir = 7   then

        /* if @资产账户编号# <> 0 then */
        if v_asset_acco_no <> 0 then

            /* [获取表记录变量语句][产品证券_融资融券_资产账户资金负债表][{融券卖出金额}][@资产账户融券卖出金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select loan_sell_amt into v_asac_loan_sell_amt from db_pdsecu.tb_pdsecr_asac_capitdebt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

        end if;

        /* if @交易组编号# <> 0 then */
        if v_exch_group_no <> 0 then

            /* [获取表记录变量语句][产品证券_融资融券_交易组资金负债表][{融券卖出金额}][@交易组融券卖出金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select loan_sell_amt into v_exgp_loan_sell_amt from db_pdsecu.tb_pdsecr_exgp_capitdebt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


            /* [获取表记录变量语句][产品证券_融资融券_交易组持仓负债表][{当前负债数量}][@交易组负债融券卖出成交数量#][{交易组编号} = @交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型} = @投资类型# and {负债类型} = 《负债类型-融券》] */
            select curr_debt_qty into v_exgp_debt_loan_sell_strike_qty from db_pdsecu.tb_pdsecr_exgp_posidebt where exch_group_no = v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type = v_invest_type and debt_type = 2 limit 1;


            /* [获取表记录变量语句][产品证券_融资融券_交易组持仓负债表][{当前负债金额}][@交易组负债融资买入成交金额#][{交易组编号} = @交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型} = @投资类型# and {负债类型} = 《负债类型-融资》] */
            select curr_debt_amt into v_exgp_debt_fina_buy_strike_amt from db_pdsecu.tb_pdsecr_exgp_posidebt where exch_group_no = v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type = v_invest_type and debt_type = 1 limit 1;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_acco = v_stock_acco;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exgp_avail_qty = v_exgp_avail_qty;
    SET p_exgp_target_code_avail_qty = v_exgp_target_code_avail_qty;
    SET p_exgp_trade_code_avail_qty = v_exgp_trade_code_avail_qty;
    SET p_asac_avail_qty = v_asac_avail_qty;
    SET p_asac_target_code_avail_qty = v_asac_target_code_avail_qty;
    SET p_asac_trade_code_avail_qty = v_asac_trade_code_avail_qty;
    SET p_exgp_loan_sell_amt = v_exgp_loan_sell_amt;
    SET p_asac_loan_sell_amt = v_asac_loan_sell_amt;
    SET p_exgp_debt_loan_sell_strike_qty = v_exgp_debt_loan_sell_strike_qty;
    SET p_exgp_debt_fina_buy_strike_amt = v_exgp_debt_fina_buy_strike_amt;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_检查账户状态获取批量可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_CheckStockAccoStatusBatchAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_CheckStockAccoStatusBatchAvail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_no_str varchar(4096),
    IN p_trade_code_no_str varchar(4096),
    IN p_target_code_no_str varchar(4096),
    IN p_stock_type_str varchar(2048),
    IN p_order_dir_str varchar(1024),
    IN p_order_qty_str varchar(4096),
    IN p_crncy_type_str varchar(2048),
    IN p_registration_agency_str varchar(4096),
    IN p_split_str varchar(4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_acco_no_str varchar(4096),
    OUT p_stock_acco_str varchar(2048),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_avail_qty_str varchar(4096),
    OUT p_exgp_target_code_avail_qty_str varchar(4096),
    OUT p_exgp_trade_code_avail_qty_str varchar(4096),
    OUT p_asac_avail_qty_str varchar(4096),
    OUT p_asac_target_code_avail_qty_str varchar(4096),
    OUT p_asac_trade_code_avail_qty_str varchar(4096),
    OUT p_record_count int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_no_str varchar(4096);
    declare v_trade_code_no_str varchar(4096);
    declare v_target_code_no_str varchar(4096);
    declare v_stock_type_str varchar(2048);
    declare v_order_dir_str varchar(1024);
    declare v_order_qty_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_registration_agency_str varchar(4096);
    declare v_split_str varchar(4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_acco_no_str varchar(4096);
    declare v_stock_acco_str varchar(2048);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_avail_qty_str varchar(4096);
    declare v_exgp_target_code_avail_qty_str varchar(4096);
    declare v_exgp_trade_code_avail_qty_str varchar(4096);
    declare v_asac_avail_qty_str varchar(4096);
    declare v_asac_target_code_avail_qty_str varchar(4096);
    declare v_asac_trade_code_avail_qty_str varchar(4096);
    declare v_record_count int;
    declare v_invest_type int;
    declare v_exec_status varchar(2);
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_crncy_type varchar(3);
    declare v_registration_agency varchar(32);
    declare v_tmp_record_count int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_status varchar(2);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_apply_limit decimal(18,2);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_posi_qty_check_diff decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_no_str = p_stock_code_no_str;
    SET v_trade_code_no_str = p_trade_code_no_str;
    SET v_target_code_no_str = p_target_code_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_registration_agency_str = p_registration_agency_str;
    SET v_split_str = p_split_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_acco_no_str = " ";
    SET v_stock_acco_str = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exgp_avail_qty_str = " ";
    SET v_exgp_target_code_avail_qty_str = " ";
    SET v_exgp_trade_code_avail_qty_str = " ";
    SET v_asac_avail_qty_str = " ";
    SET v_asac_target_code_avail_qty_str = " ";
    SET v_asac_trade_code_avail_qty_str = " ";
    SET v_record_count = 0;
    SET v_invest_type = 0;
    SET v_exec_status = "0";
    SET v_exch_no = 0;
    SET v_order_dir = 0;
    SET v_order_qty = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_crncy_type = "CNY";
    SET v_registration_agency = " ";
    SET v_tmp_record_count = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_status = "0";
    SET v_allow_stock_type = " ";
    SET v_busi_limit_str = " ";
    SET v_apply_limit = 0;
    SET v_exgp_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_avail_qty = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_posi_qty_check_diff = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @股东代码编号串# = ""; */
    set v_stock_acco_no_str = "";

    /* set @股东代码串# = ""; */
    set v_stock_acco_str = "";

    /* set @交易组可用数量串# = ""; */
    set v_exgp_avail_qty_str = "";

    /* set @交易组标的代码可用数量串# = ""; */
    set v_exgp_target_code_avail_qty_str = "";

    /* set @交易组交易代码可用数量串# = ""; */
    set v_exgp_trade_code_avail_qty_str = "";

    /* set @资产账户可用数量串# = ""; */
    set v_asac_avail_qty_str = "";

    /* set @资产账户标的代码可用数量串# = ""; */
    set v_asac_target_code_avail_qty_str = "";

    /* set @资产账户交易代码可用数量串# = ""; */
    set v_asac_trade_code_avail_qty_str = "";

    /* set @资产账户可用金额# = 0; */
    set v_asac_avail_amt = 0;

    /* set @交易组可用金额# = 0; */
    set v_exgp_avail_amt = 0;

    /* if @分隔符# = ' ' then */
    if v_split_str = ' ' then

        /* set @分隔符#= ';'; */
        set v_split_str= ';';
    end if;
    #记录数，用于计算查询资金的次数

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* set @执行状态# = 0; */
    set v_exec_status = 0;

    /* while LOCATE(@分隔符#,@证券代码编号串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_no_str)<>0   do
        #截取前面每一位

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @证券代码编号#=cast(substring(@证券代码编号串#,1,LOCATE(@分隔符#,@证券代码编号串#)-1) as SIGNED); */
        set v_stock_code_no=cast(substring(v_stock_code_no_str,1,LOCATE(v_split_str,v_stock_code_no_str)-1) as SIGNED);

        /* set @标的代码编号#=cast(substring(@标的代码编号串#,1,LOCATE(@分隔符#,@标的代码编号串#)-1) as SIGNED); */
        set v_target_code_no=cast(substring(v_target_code_no_str,1,LOCATE(v_split_str,v_target_code_no_str)-1) as SIGNED);

        /* set @交易代码编号#=cast(substring(@交易代码编号串#,1,LOCATE(@分隔符#,@交易代码编号串#)-1) as SIGNED); */
        set v_trade_code_no=cast(substring(v_trade_code_no_str,1,LOCATE(v_split_str,v_trade_code_no_str)-1) as SIGNED);

        /* set @证券类型#=cast(substring(@证券类型串#,1,LOCATE(@分隔符#,@证券类型串#)-1) as SIGNED); */
        set v_stock_type=cast(substring(v_stock_type_str,1,LOCATE(v_split_str,v_stock_type_str)-1) as SIGNED);

        /* set @本币币种#=substring(@本币币种串#,1,LOCATE(@分隔符#,@本币币种串#)-1); */
        set v_crncy_type=substring(v_crncy_type_str,1,LOCATE(v_split_str,v_crncy_type_str)-1);

        /* set @登记机构#=substring(@登记机构串#,1,LOCATE(@分隔符#,@登记机构串#)-1); */
        set v_registration_agency=substring(v_registration_agency_str,1,LOCATE(v_split_str,v_registration_agency_str)-1);
        #获取股东代码编号和股东代码状态

        /* [获取表记录变量语句][产品证券_账户_证券账户信息表][count(1),min({股东代码编号}),min({股东代码}),min({股东代码状态}),min({允许操作证券类型}),min({业务限制串})][@临时_记录个数#,@股东代码编号#,@股东代码#,@股东代码状态#,@允许操作证券类型#,@业务限制串#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {股东代码状态}=《股东代码状态-正常》] */
        select count(1),min(stock_acco_no),min(stock_acco),min(stock_acco_status),min(allow_stock_type),min(busi_limit_str) into v_tmp_record_count,v_stock_acco_no,v_stock_acco,v_stock_acco_status,v_allow_stock_type,v_busi_limit_str from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and stock_acco_status="1" limit 1;

        #资产账户下不存在正常的股东代码，则报错返回

        /* [检查报错返回][@临时_记录个数# =0][146][@股东代码状态#] */
        if v_tmp_record_count =0 then
            
            SET v_error_code = "pdsecuA.6.2.146";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("股东代码状态=",v_stock_acco_status),"#",v_mysql_message);
            else
                SET v_error_info = concat("股东代码状态=",v_stock_acco_status);
            end if;
            leave label_pro;
        end if;

        #检查业务限制
        #如果传入的证券类型有值，检查是否可操作

        /* [检查报错返回][@证券类型# <> 0 and instr(@允许操作证券类型#, @证券类型#) = 0][147][@证券类型#,@允许操作证券类型#] */
        if v_stock_type <> 0 and instr(v_allow_stock_type, v_stock_type) = 0 then
            
            SET v_error_code = "pdsecuA.6.2.147";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("证券类型=",v_stock_type,",","允许操作证券类型=",v_allow_stock_type);
            end if;
            leave label_pro;
        end if;

        #如果传入的指令方向有值，检查是否有相应业务限制

        /* if @订单方向# = 《订单方向-新股申购》 then */
        if v_order_dir = 11 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制打新》) > 0][148][@业务限制串#] */
            if instr(v_busi_limit_str, 1) > 0 then
                
                SET v_error_code = "pdsecuA.6.2.148";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @订单方向# = 《订单方向-融资回购》 then */
        if v_order_dir = 3 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融资回购》) > 0][149][@业务限制串#] */
            if instr(v_busi_limit_str, 2) > 0 then
                
                SET v_error_code = "pdsecuA.6.2.149";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @订单方向# = 《订单方向-融券回购》 then */
        if v_order_dir = 4 then

            /* [检查报错返回][instr(@业务限制串#, 《业务限制-限制融券回购》) > 0][150][@业务限制串#] */
            if instr(v_busi_limit_str, 3) > 0 then
                
                SET v_error_code = "pdsecuA.6.2.150";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务限制串=",v_busi_limit_str),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务限制串=",v_busi_limit_str);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if @订单方向# = 《订单方向-新股申购》 then */
        if v_order_dir = 11 then

            /* [获取表记录变量语句][产品证券_持仓_新股申购上限表][{申购上限}][@申购上限#][{初始化日期}=@初始化日期# and {资产账户编号} = @资产账户编号# and {股东代码编号}=@股东代码编号#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            select apply_limit into v_apply_limit from db_pdsecu.tb_pdsepo_new_stock_limit where init_date=v_init_date and asset_acco_no = v_asset_acco_no and stock_acco_no=v_stock_acco_no limit 1;


            /* [检查报错返回][@申购上限# >0 and @申购上限# < @订单数量#][765][@申购上限#,@订单数量#] */
            if v_apply_limit >0 and v_apply_limit < v_order_qty then
                
                SET v_error_code = "pdsecuA.6.2.765";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("申购上限=",v_apply_limit,",","订单数量=",v_order_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* set @交易组可用数量#  = 0; */
        set v_exgp_avail_qty  = 0;

        /* set @资产账户可用数量#  = 0; */
        set v_asac_avail_qty  = 0;

        /* set @交易组标的代码可用数量#  = 0; */
        set v_exgp_target_code_avail_qty  = 0;

        /* set @交易组交易代码可用数量#  = 0; */
        set v_exgp_trade_code_avail_qty  = 0;

        /* set @资产账户标的代码可用数量#  = 0; */
        set v_asac_target_code_avail_qty  = 0;

        /* set @资产账户交易代码可用数量#  = 0; */
        set v_asac_trade_code_avail_qty  = 0;

        /* set @可用数量# = 0; */
        set v_avail_qty = 0;
        #该标识用来只取一次可用金额

        /* if @执行状态# = 0 then */
        if v_exec_status = 0 then
            #如果资产账户编号不为0，则检查资产账户相关数据

            /* if @资产账户编号# <> 0 and @记录个数# = 0 then */
            if v_asset_acco_no <> 0 and v_record_count = 0 then

                /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额},{冻结金额},{解冻金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{沪深可用调整金额},{港股通可用调整金额}][@当前金额#,@冻结金额#,@解冻金额#,@金额核对差额#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@沪深可用调整金额#,@港股通可用调整金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
                select curr_amt,frozen_amt,unfroz_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,shsz_avail_change_amt,hk_avail_change_amt into v_curr_amt,v_frozen_amt,v_unfroz_amt,v_amt_check_diff,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

                if FOUND_ROWS() <> 0 then

                    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》  or @市场编号#=《市场编号-场外交易市场》 then */
                    if v_exch_no = 1 or v_exch_no = 2  or v_exch_no=5 then

                        /* set @资产账户可用金额# = @当前金额# + @沪深可用调整金额# - @冻结金额# + @解冻金额# + @金额核对差额#; */
                        set v_asac_avail_amt = v_curr_amt + v_shsz_avail_change_amt - v_frozen_amt + v_unfroz_amt + v_amt_check_diff;
                    else

                        /* set @资产账户可用金额# = @当前金额# + @港股通可用调整金额# - @冻结金额# + @解冻金额# + @金额核对差额#; */
                        set v_asac_avail_amt = v_curr_amt + v_hk_avail_change_amt - v_frozen_amt + v_unfroz_amt + v_amt_check_diff;
                    end if;
                else

                    /* set @资产账户可用金额# = 0; */
                    set v_asac_avail_amt = 0;
                end if;
            end if;
            #如果交易组编号不为0，则检查交易组相关数据

            /* if @交易组编号# <> 0 and @记录个数# = 0 then */
            if v_exch_group_no <> 0 and v_record_count = 0 then

                /* [获取表记录变量语句][产品证券_资金_交易组资金表][{当前金额},{冻结金额},{解冻金额},{金额核对差额},{沪深可用调整金额},{港股通可用调整金额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额}][@当前金额#,@冻结金额#,@解冻金额#,@金额核对差额#,@沪深可用调整金额#,@港股通可用调整金额#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#][{交易组编号}=@交易组编号#  and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
                select curr_amt,frozen_amt,unfroz_amt,amt_check_diff,shsz_avail_change_amt,hk_avail_change_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt into v_curr_amt,v_frozen_amt,v_unfroz_amt,v_amt_check_diff,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no  and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

                if FOUND_ROWS() <> 0 then

                    /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》  or @市场编号#=《市场编号-场外交易市场》 then */
                    if v_exch_no = 1 or v_exch_no = 2  or v_exch_no=5 then

                        /* set @交易组可用金额# = @当前金额# + @沪深可用调整金额# - @冻结金额# + @解冻金额# + @金额核对差额#; */
                        set v_exgp_avail_amt = v_curr_amt + v_shsz_avail_change_amt - v_frozen_amt + v_unfroz_amt + v_amt_check_diff;
                    else

                        /* set @交易组可用金额# = @当前金额# + @港股通可用调整金额# - @冻结金额# + @解冻金额# + @金额核对差额#; */
                        set v_exgp_avail_amt = v_curr_amt + v_hk_avail_change_amt - v_frozen_amt + v_unfroz_amt + v_amt_check_diff;
                    end if;
                else

                    /* set @交易组可用金额# = 0; */
                    set v_exgp_avail_amt = 0;
                end if;
            end if;

        /* set @执行状态# = 1; */
        set v_exec_status = 1;
        end if;

        /* set @记录个数# = 0; */
        set v_record_count = 0;

        /* if @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-质押提交》  or   @订单方向# = 《订单方向-零股卖出》  or   @订单方向# = 《订单方向-基金申购》  or   @订单方向# = 《订单方向-基金赎回》 then */
        if v_order_dir = 2 or v_order_dir = 3 or v_order_dir = 21  or   v_order_dir = 31  or   v_order_dir = 9  or   v_order_dir = 10 then

            /* if @订单方向# = 《订单方向-融资回购》 then */
            if v_order_dir = 3 then

                /* set @证券代码编号# = @标的代码编号#; */
                set v_stock_code_no = v_target_code_no;
            end if;

            /* if @订单方向# = 《订单方向-质押提交》 then */
            if v_order_dir = 21 then

                /* set @证券代码编号# = @交易代码编号#; */
                set v_stock_code_no = v_trade_code_no;
            end if;
            #如果资产账户编号不为0，则检查资产账户相关数据

            /* if @资产账户编号# <> 0 then */
            if v_asset_acco_no <> 0 then

                /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
                select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @记录个数#=1; */
                    set v_record_count=1;

                    /* set @可用数量# = @当前数量# - @冻结数量# + @解冻数量# + @持仓核对差额#; */
                    set v_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty + v_posi_qty_check_diff;
                end if;

                /* if @订单方向# = 《订单方向-卖出》  or   @订单方向# = 《订单方向-零股卖出》 or   @订单方向# = 《订单方向-基金申购》 or   @订单方向# = 《订单方向-基金赎回》 then */
                if v_order_dir = 2  or   v_order_dir = 31 or   v_order_dir = 9 or   v_order_dir = 10 then

                    /* set @资产账户可用数量# = @可用数量#; */
                    set v_asac_avail_qty = v_avail_qty;

                /* elseif @订单方向# = 《订单方向-融资回购》 then */
                elseif v_order_dir = 3 then

                    /* set @资产账户标的代码可用数量#  = @可用数量#; */
                    set v_asac_target_code_avail_qty  = v_avail_qty;

                /* elseif @订单方向# = 《订单方向-质押提交》 then */
                elseif v_order_dir = 21 then

                    /* set @资产账户交易代码可用数量#  = @可用数量#; */
                    set v_asac_trade_code_avail_qty  = v_avail_qty;
                end if;
            end if;
            #如果交易组编号不为0，则检查交易组相关数据

            /* if @交易组编号# <> 0 then */
            if v_exch_group_no <> 0 then

                /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
                select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @记录个数#=1; */
                    set v_record_count=1;

                    /* set @可用数量# = @当前数量# - @冻结数量# + @解冻数量# + @持仓核对差额#; */
                    set v_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty + v_posi_qty_check_diff;
                end if;

                /* if @订单方向# = 《订单方向-卖出》  or   @订单方向# = 《订单方向-零股卖出》  or   @订单方向# = 《订单方向-基金申购》 or   @订单方向# = 《订单方向-基金赎回》 then */
                if v_order_dir = 2  or   v_order_dir = 31  or   v_order_dir = 9 or   v_order_dir = 10 then

                    /* set @交易组可用数量# = @可用数量#; */
                    set v_exgp_avail_qty = v_avail_qty;

                /* elseif @订单方向# = 《订单方向-融资回购》 then */
                elseif v_order_dir = 3 then

                    /* set @交易组标的代码可用数量#  = @可用数量#; */
                    set v_exgp_target_code_avail_qty  = v_avail_qty;

                /* elseif @订单方向# = 《订单方向-质押提交》 then */
                elseif v_order_dir = 21 then

                    /* set @交易组交易代码可用数量#  = @可用数量#; */
                    set v_exgp_trade_code_avail_qty  = v_avail_qty;
                end if;
            end if;

        /* elseif @订单方向# = 《订单方向-质押转回》 then */
        elseif v_order_dir = 22 then
            #如果资产账户编号不为0，则检查资产账户相关数据

            /* if @资产账户编号# <> 0 then */
            if v_asset_acco_no <> 0 then

                /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@标的代码编号# and {投资类型}=@投资类型#] */
                select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_target_code_no and invest_type=v_invest_type limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @资产账户标的代码可用数量# = @当前数量# - @冻结数量# + @解冻数量# + @持仓核对差额#; */
                    set v_asac_target_code_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty + v_posi_qty_check_diff;
                end if;

                /* [获取表记录变量语句][产品证券_持仓_资产账户债券质押表][{当前数量}][@当前数量#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
                select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_asac_bond_pledge where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @资产账户交易代码可用数量# = @当前数量#; */
                    set v_asac_trade_code_avail_qty = v_curr_qty;
                end if;
            end if;
            #如果交易组编号不为0，则检查交易组相关数据

            /* if @交易组编号# <> 0 then */
            if v_exch_group_no <> 0 then

                /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量},{冻结数量},{解冻数量},{持仓核对差额}][@当前数量#,@冻结数量#,@解冻数量#,@持仓核对差额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@标的代码编号# and {投资类型}=@投资类型#] */
                select curr_qty+pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff into v_curr_qty,v_frozen_qty,v_unfroz_qty,v_posi_qty_check_diff from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_target_code_no and invest_type=v_invest_type limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @交易组标的代码可用数量# = @当前数量# - @冻结数量# + @解冻数量# + @持仓核对差额#; */
                    set v_exgp_target_code_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty + v_posi_qty_check_diff;
                end if;

                /* [获取表记录变量语句][产品证券_持仓_交易组债券质押表][{当前数量}][@当前数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@交易代码编号#] */
                select curr_qty into v_curr_qty from db_pdsecu.tb_pdsepo_exgp_bond_pledge where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_trade_code_no limit 1;

                if FOUND_ROWS() <> 0 then

                    /* set @交易组交易代码可用数量# = @当前数量#; */
                    set v_exgp_trade_code_avail_qty = v_curr_qty;
                end if;
            end if;
        end if;
        #处理输出

        /* set @股东代码编号串# = concat(@股东代码编号串#,@股东代码编号#,";"); */
        set v_stock_acco_no_str = concat(v_stock_acco_no_str,v_stock_acco_no,";");

        /* set @股东代码串# = concat(@股东代码串#,@股东代码#,";"); */
        set v_stock_acco_str = concat(v_stock_acco_str,v_stock_acco,";");

        /* set @交易组可用数量串# = concat(@交易组可用数量串#,@交易组可用数量#,";"); */
        set v_exgp_avail_qty_str = concat(v_exgp_avail_qty_str,v_exgp_avail_qty,";");

        /* set @交易组标的代码可用数量串# = concat(@交易组标的代码可用数量串#,@交易组标的代码可用数量#,";"); */
        set v_exgp_target_code_avail_qty_str = concat(v_exgp_target_code_avail_qty_str,v_exgp_target_code_avail_qty,";");

        /* set @交易组交易代码可用数量串# = concat(@交易组交易代码可用数量串#,@交易组交易代码可用数量#,";"); */
        set v_exgp_trade_code_avail_qty_str = concat(v_exgp_trade_code_avail_qty_str,v_exgp_trade_code_avail_qty,";");

        /* set @资产账户可用数量串# = concat(@资产账户可用数量串#,@资产账户可用数量#,";"); */
        set v_asac_avail_qty_str = concat(v_asac_avail_qty_str,v_asac_avail_qty,";");

        /* set @资产账户标的代码可用数量串# = concat(@资产账户标的代码可用数量串#,@资产账户标的代码可用数量#,";"); */
        set v_asac_target_code_avail_qty_str = concat(v_asac_target_code_avail_qty_str,v_asac_target_code_avail_qty,";");

        /* set @资产账户交易代码可用数量串# = concat(@资产账户交易代码可用数量串#,@资产账户交易代码可用数量#,";"); */
        set v_asac_trade_code_avail_qty_str = concat(v_asac_trade_code_avail_qty_str,v_asac_trade_code_avail_qty,";");

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);

        /* set @证券代码编号串#=substring(@证券代码编号串#,LOCATE(@分隔符#,@证券代码编号串#)+1); */
        set v_stock_code_no_str=substring(v_stock_code_no_str,LOCATE(v_split_str,v_stock_code_no_str)+1);

        /* set @标的代码编号串#=substring(@标的代码编号串#,LOCATE(@分隔符#,@标的代码编号串#)+1); */
        set v_target_code_no_str=substring(v_target_code_no_str,LOCATE(v_split_str,v_target_code_no_str)+1);

        /* set @交易代码编号串#=substring(@交易代码编号串#,LOCATE(@分隔符#,@交易代码编号串#)+1); */
        set v_trade_code_no_str=substring(v_trade_code_no_str,LOCATE(v_split_str,v_trade_code_no_str)+1);

        /* set @证券类型串#=substring(@证券类型串#,LOCATE(@分隔符#,@证券类型串#)+1); */
        set v_stock_type_str=substring(v_stock_type_str,LOCATE(v_split_str,v_stock_type_str)+1);

        /* set @本币币种串#=substring(@本币币种串#,LOCATE(@分隔符#,@本币币种串#)+1); */
        set v_crncy_type_str=substring(v_crncy_type_str,LOCATE(v_split_str,v_crncy_type_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_acco_no_str = v_stock_acco_no_str;
    SET p_stock_acco_str = v_stock_acco_str;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exgp_avail_qty_str = v_exgp_avail_qty_str;
    SET p_exgp_target_code_avail_qty_str = v_exgp_target_code_avail_qty_str;
    SET p_exgp_trade_code_avail_qty_str = v_exgp_trade_code_avail_qty_str;
    SET p_asac_avail_qty_str = v_asac_avail_qty_str;
    SET p_asac_target_code_avail_qty_str = v_asac_target_code_avail_qty_str;
    SET p_asac_trade_code_avail_qty_str = v_asac_trade_code_avail_qty_str;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_获取成交回报证券持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_GetStrikeRspPosiCost;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_GetStrikeRspPosiCost(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_stock_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_curr_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_stock_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_curr_qty decimal(18,2);
    declare v_invest_type int;
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_curr_qty = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_curr_qty = 0;
    SET v_invest_type = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_pandl = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* if @股东代码编号# = 0 then */
    if v_stock_acco_no = 0 then

        /* [获取表记录变量][产品证券_账户_证券账户信息表][{股东代码编号}][@股东代码编号#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号#][9][@资产账户编号#,@市场编号#] */
        select stock_acco_no into v_stock_acco_no from db_pdsecu.tb_pdseac_secu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.6.3.9";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* if @订单方向# <> 《订单方向-质押提交》 and @订单方向# <> 《订单方向-质押转回》 and @订单方向# <> 《订单方向-新股申购》 and @证券类型# <> 27 then */
    if v_order_dir <> 21 and v_order_dir <> 22 and v_order_dir <> 11 and v_stock_type <> 27 then

        /* [获取表记录变量语句][产品证券_持仓_交易组持仓表][{当前数量}+{待交收数量}+{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@交易组当前数量#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
        select curr_qty+pre_settle_qty+posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_exgp_curr_qty,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;


        /* [获取表记录变量语句][产品证券_持仓_资产账户持仓表][{当前数量}+{待交收数量}+{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@资产账户当前数量#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#] */
        select curr_qty+pre_settle_qty+posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_asac_curr_qty,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;

    end if;

    /* set @交易组成本金额# = IFNULL(@交易组成本金额#,0); */
    set v_exgp_cost_amt = IFNULL(v_exgp_cost_amt,0);

    /* set @交易组实现盈亏# = IFNULL(@交易组实现盈亏#,0); */
    set v_exgp_realize_pandl = IFNULL(v_exgp_realize_pandl,0);

    /* set @交易组利息成本金额# = IFNULL(@交易组利息成本金额#,0); */
    set v_exgp_intrst_cost_amt = IFNULL(v_exgp_intrst_cost_amt,0);

    /* set @交易组利息收益# = IFNULL(@交易组利息收益#,0); */
    set v_exgp_intrst_pandl = IFNULL(v_exgp_intrst_pandl,0);

    /* set @资产账户成本金额# = IFNULL(@资产账户成本金额#,0); */
    set v_asac_cost_amt = IFNULL(v_asac_cost_amt,0);

    /* set @资产账户实现盈亏# = IFNULL(@资产账户实现盈亏#,0); */
    set v_asac_realize_pandl = IFNULL(v_asac_realize_pandl,0);

    /* set @资产账户利息成本金额# = IFNULL(@资产账户利息成本金额#,0); */
    set v_asac_intrst_cost_amt = IFNULL(v_asac_intrst_cost_amt,0);

    /* set @资产账户利息收益# = IFNULL(@资产账户利息收益#,0); */
    set v_asac_intrst_pandl = IFNULL(v_asac_intrst_pandl,0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_curr_qty = v_asac_curr_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_获取T0有权限交易组总可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_GetT0AuthExgpSumCashAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_GetT0AuthExgpSumCashAvail(
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
    IN p_asset_acco_no int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_avail_amt decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_avail_amt = 0;
    SET v_curr_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;

    
    label_pro:BEGIN
    

    /* set @交易组可用金额# = 0; */
    set v_exgp_avail_amt = 0;
    #如果交易组编号不为0，则检查交易组相关数据

    /* [获取表记录变量语句][产品证券_资金_交易组资金表][sum({当前金额}),sum({沪深可用调整金额}),sum({冻结金额}),sum({解冻金额})][@当前金额#,@沪深可用调整金额#,@冻结金额#,@解冻金额#][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {本币币种}=@本币币种#] */
    select sum(curr_amt),sum(shsz_avail_change_amt),sum(frozen_amt),sum(unfroz_amt) into v_curr_amt,v_shsz_avail_change_amt,v_frozen_amt,v_unfroz_amt from db_pdsecu.tb_pdseca_exgp_capit where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and crncy_type=v_crncy_type limit 1;

    if FOUND_ROWS() <> 0 then

        /* set @交易组可用金额# = @当前金额# + @沪深可用调整金额# - @冻结金额# + @解冻金额#; */
        set v_exgp_avail_amt = v_curr_amt + v_shsz_avail_change_amt - v_frozen_amt + v_unfroz_amt;
    end if;

    /* set @交易组可用金额# = ifnull(@交易组可用金额#,0); */
    set v_exgp_avail_amt = ifnull(v_exgp_avail_amt,0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_avail_amt = v_exgp_avail_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_插入组合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_InsertCombInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_InsertCombInfo(
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
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    IN p_posi_qty decimal(18,2),
    IN p_deal_status varchar(2),
    IN p_combo_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_deal_status varchar(2);
    declare v_combo_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_deal_status = p_deal_status;
    SET v_combo_status = p_combo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品证券_账户_组合交易组表][字段][字段变量][1][@交易组编号#,@组合代码#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseac_Comb_Exgp(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, combo_code, stock_code_no, posi_qty, 
        deal_status, combo_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_combo_code, v_stock_code_no, v_posi_qty, 
        v_deal_status, v_combo_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.6.1";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_更新组合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_UpdateCombInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_UpdateCombInfo(
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
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    IN p_posi_qty decimal(18,2),
    IN p_deal_status varchar(2),
    IN p_combo_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
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
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_deal_status varchar(2);
    declare v_combo_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_posi_qty = p_posi_qty;
    SET v_deal_status = p_deal_status;
    SET v_combo_status = p_combo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_组合交易组表][{记录序号}][@记录序号#][{交易组编号}=@交易组编号# and {组合代码}=@组合代码# and {证券代码编号}=@证券代码编号#][4][@交易组编号#,@组合代码#,@证券代码编号#] */
    select row_id into v_row_id from db_pdsecu.tb_pdseac_Comb_Exgp where exch_group_no=v_exch_group_no and combo_code=v_combo_code and stock_code_no=v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.6.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_账户_组合交易组表][{持仓数量}=@持仓数量#,{组合状态}=@组合状态#,{处理状态}=@处理状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseac_Comb_Exgp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, posi_qty=v_posi_qty,combo_status=v_combo_status,deal_status=v_deal_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.7.2";
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

# 原子_产品证券_交易接口_获取组合信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_GetCombInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_GetCombInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_combo_code varchar(32),
    OUT p_stock_code_no int,
    OUT p_posi_qty decimal(18,2)
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
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_status varchar(2);
    declare v_combo_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_combo_code = " ";
    SET v_stock_code_no = 0;
    SET v_posi_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_status = "0";
    SET v_combo_status = "0";

    
    label_pro:BEGIN
    

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_账户_组合交易组表][字段][字段变量][{组合状态}=《组合状态-失效》 and {处理状态}=《处理状态-未处理》 and locate({交易组编号},@交易组编号串#)=0 and {记录序号}>@查询记录序号# order by {记录序号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, exch_group_no, combo_code, stock_code_no, 
        posi_qty, deal_status, combo_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_exch_group_no, v_combo_code, v_stock_code_no, 
        v_posi_qty, v_deal_status, v_combo_status from db_pdsecu.tb_pdseac_Comb_Exgp where combo_status="2" and deal_status="0" and locate(exch_group_no,v_exch_group_no_str)=0 and row_id>v_query_row_id order by row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_combo_code = v_combo_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_posi_qty = v_posi_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_转移失效组合交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_TransferInvalidCombExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_TransferInvalidCombExgpPosi(
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
    IN p_default_exch_group_no int,
    IN p_combo_code varchar(32),
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
    declare v_exch_group_no int;
    declare v_default_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_invest_type int;
    declare v_query_row_id bigint;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_tmp_exch_group_no int;
    declare v_row_id bigint;
    declare v_stock_code_no int;
    declare v_posi_qty decimal(18,2);
    declare v_tmp_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_type int;
    declare v_asset_type int;
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
    declare v_posi_nav_ratio decimal(18,12);
    declare v_tmp_curr_qty decimal(18,2);
    declare v_tmp_posi_qty_check_diff decimal(18,2);
    declare v_tmp_cost_amt decimal(18,4);
    declare v_tmp_realize_pandl decimal(18,4);
    declare v_tmp_intrst_cost_amt decimal(18,4);
    declare v_tmp_intrst_pandl decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_occur_qty decimal(18,2);
    declare v_occur_end_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_remark_info varchar(255);
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_invest_type = 0;
    SET v_query_row_id = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_tmp_exch_group_no = 0;
    SET v_row_id = 0;
    SET v_stock_code_no = 0;
    SET v_posi_qty = 0;
    SET v_tmp_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
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
    SET v_posi_nav_ratio = 0;
    SET v_tmp_curr_qty = 0;
    SET v_tmp_posi_qty_check_diff = 0;
    SET v_tmp_cost_amt = 0;
    SET v_tmp_realize_pandl = 0;
    SET v_tmp_intrst_cost_amt = 0;
    SET v_tmp_intrst_pandl = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_occur_qty = 0;
    SET v_occur_end_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_remark_info = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @查询记录序号#=0; */
    set v_query_row_id=0;

    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;
    loop_label:loop

        /* set @记录序号#=0; */
        set v_row_id=0;

        /* set @交易组编号#=@临时_交易组编号#; */
        set v_exch_group_no=v_tmp_exch_group_no;

        /* [获取表记录变量语句][产品证券_账户_组合交易组表][{记录序号},{证券代码编号},{持仓数量}][@记录序号#,@证券代码编号#,@持仓数量#][{交易组编号}=@交易组编号# and {组合代码}=@组合代码# and {处理状态}<>《处理状态-成功》 and {组合状态}=《组合状态-失效》 and {记录序号}>@查询记录序号# order by {记录序号}] */
        select row_id,stock_code_no,posi_qty into v_row_id,v_stock_code_no,v_posi_qty from db_pdsecu.tb_pdseac_Comb_Exgp where exch_group_no=v_exch_group_no and combo_code=v_combo_code and deal_status<>"1" and combo_status="2" and row_id>v_query_row_id order by row_id limit 1;


        /* set @临时_记录序号#=@记录序号#; */
        set v_tmp_row_id=v_row_id;

        /* if @记录序号#<>0 then */
        if v_row_id<>0 then

            /* set @查询记录序号#=@记录序号#; */
            set v_query_row_id=v_row_id;

            /* [获取表记录变量][产品证券_持仓_交易组持仓表][字段][字段变量][{交易组编号}=@交易组编号# and {证券代码编号}=@证券代码编号# and {股东代码编号}<>0 and {资产账户编号}<>0 and {投资类型}=@投资类型#][4][@交易组编号#,@证券代码编号#,@投资类型#] */
            select row_id, create_date, create_time, 
                update_date, update_time, update_times, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, stock_type, asset_type, 
                invest_type, begin_qty, curr_qty, pre_settle_qty, 
                frozen_qty, unfroz_qty, posi_qty_check_diff, cost_amt, 
                realize_pandl, intrst_cost_amt, intrst_pandl into v_row_id, v_create_date, v_create_time, 
                v_update_date, v_update_time, v_update_times, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
                v_invest_type, v_begin_qty, v_curr_qty, v_pre_settle_qty, 
                v_frozen_qty, v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, 
                v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and stock_code_no=v_stock_code_no and stock_acco_no<>0 and asset_acco_no<>0 and invest_type=v_invest_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.6.9.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* set @持仓净值占比#=round(@持仓数量#/@当前数量#,4); */
            set v_posi_nav_ratio=round(v_posi_qty/v_curr_qty,4);

            /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量}={当前数量}-@持仓数量#,{持仓核对差额}={持仓核对差额}-@持仓核对差额#*@持仓净值占比#,{成本金额}={成本金额}-@成本金额#*@持仓净值占比#,{实现盈亏}={实现盈亏}-@实现盈亏#*@持仓净值占比#,{利息成本金额}={利息成本金额}-@利息成本金额#*@持仓净值占比#,{利息收益}={利息收益}-@利息收益#*@持仓净值占比#][{记录序号}=@记录序号#][4][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty-v_posi_qty,posi_qty_check_diff=posi_qty_check_diff-v_posi_qty_check_diff*v_posi_nav_ratio,cost_amt=cost_amt-v_cost_amt*v_posi_nav_ratio,realize_pandl=realize_pandl-v_realize_pandl*v_posi_nav_ratio,intrst_cost_amt=intrst_cost_amt-v_intrst_cost_amt*v_posi_nav_ratio,intrst_pandl=intrst_pandl-v_intrst_pandl*v_posi_nav_ratio where row_id=v_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.6.9.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@临时_当前数量#,@临时_持仓核对差额#,@临时_成本金额#,@临时_实现盈亏#,@临时_利息成本金额#,@临时_利息收益#][{记录序号}=@记录序号#][4][@记录序号#] */
            select curr_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl into v_tmp_curr_qty,v_tmp_posi_qty_check_diff,v_tmp_cost_amt,v_tmp_realize_pandl,v_tmp_intrst_cost_amt,v_tmp_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where row_id=v_row_id limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.6.9.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;


            /* [获取流水变动][{当前数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@当前数量#,@持仓核对差额#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
            set v_jour_occur_field = concat("当前数量","|","持仓核对差额","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
            set v_jour_occur_info = concat(v_curr_qty,"|",v_posi_qty_check_diff,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


            /* set @变动数量#=-1*@持仓数量#; */
            set v_occur_qty=-1*v_posi_qty;

            /* set @变动后数量#=@临时_当前数量#; */
            set v_occur_end_qty=v_tmp_curr_qty;

            /* set @业务标志# = 《业务标志-持仓划转》; */
            set v_busi_flag = 1104003;

            /* set @操作备注#="组合失效交易组持仓变动 !"; */
            set v_oper_remark_info="组合失效交易组持仓变动 !";

            /* [获取流水后信息][@临时_当前数量#,@临时_持仓核对差额#,@临时_成本金额#,@临时_实现盈亏#,@临时_利息成本金额#,@临时_利息收益#] */
            set v_jour_after_occur_info = concat(v_tmp_curr_qty,"|",v_tmp_posi_qty_check_diff,"|",v_tmp_cost_amt,"|",v_tmp_realize_pandl,"|",v_tmp_intrst_cost_amt,"|",v_tmp_intrst_pandl,"|");


            /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@交易组编号#,@证券代码编号#] */
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
                        
                SET v_error_code = "pdsecuA.6.9.1";
                SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* [获取流水变动][{当前数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益}][@当前数量#,@持仓核对差额#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
            set v_jour_occur_field = concat("当前数量","|","持仓核对差额","|","成本金额","|","实现盈亏","|","利息成本金额","|","利息收益","|");
            set v_jour_occur_info = concat(v_curr_qty,"|",v_posi_qty_check_diff,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


            /* set @交易组编号#=@默认交易组编号#; */
            set v_exch_group_no=v_default_exch_group_no;

            /* set @当前数量#=@持仓数量#; */
            set v_curr_qty=v_posi_qty;

            /* set @持仓核对差额#=@持仓核对差额#*@持仓净值占比#; */
            set v_posi_qty_check_diff=v_posi_qty_check_diff*v_posi_nav_ratio;

            /* set @成本金额#=@成本金额#*@持仓净值占比#; */
            set v_cost_amt=v_cost_amt*v_posi_nav_ratio;

            /* set @实现盈亏#=@实现盈亏#*@持仓净值占比#; */
            set v_realize_pandl=v_realize_pandl*v_posi_nav_ratio;

            /* set @利息成本金额#=@利息成本金额#*@持仓净值占比#; */
            set v_intrst_cost_amt=v_intrst_cost_amt*v_posi_nav_ratio;

            /* set @利息收益#=@利息收益#*@持仓净值占比#; */
            set v_intrst_pandl=v_intrst_pandl*v_posi_nav_ratio;

            /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量}={当前数量}+@当前数量#,{持仓核对差额}={持仓核对差额}+@持仓核对差额#,{成本金额}={成本金额}+@成本金额#,{实现盈亏}={实现盈亏}+@实现盈亏#,{利息成本金额}={利息成本金额}+@利息成本金额#,{利息收益}={利息收益}+@利息收益#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
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
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_curr_qty,posi_qty_check_diff=posi_qty_check_diff+v_posi_qty_check_diff,cost_amt=cost_amt+v_cost_amt,realize_pandl=realize_pandl+v_realize_pandl,intrst_cost_amt=intrst_cost_amt+v_intrst_cost_amt,intrst_pandl=intrst_pandl+v_intrst_pandl;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.6.9.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_持仓_交易组持仓表][字段][字段变量][{交易组编号}=@交易组编号# and {证券代码编号}=@证券代码编号# and {股东代码编号}=@股东代码编号# and {资产账户编号}=@资产账户编号# and {投资类型}=@投资类型#][4][@交易组编号#,@证券代码编号#,@股东代码编号#,@资产账户编号#,@投资类型#] */
            select row_id, create_date, create_time, 
                update_date, update_time, update_times, co_no, 
                pd_no, exch_group_no, asset_acco_no, exch_no, 
                stock_acco_no, stock_code_no, stock_type, asset_type, 
                invest_type, begin_qty, curr_qty, pre_settle_qty, 
                frozen_qty, unfroz_qty, posi_qty_check_diff, cost_amt, 
                realize_pandl, intrst_cost_amt, intrst_pandl into v_row_id, v_create_date, v_create_time, 
                v_update_date, v_update_time, v_update_times, v_co_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                v_stock_acco_no, v_stock_code_no, v_stock_type, v_asset_type, 
                v_invest_type, v_begin_qty, v_curr_qty, v_pre_settle_qty, 
                v_frozen_qty, v_unfroz_qty, v_posi_qty_check_diff, v_cost_amt, 
                v_realize_pandl, v_intrst_cost_amt, v_intrst_pandl from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and stock_code_no=v_stock_code_no and stock_acco_no=v_stock_acco_no and asset_acco_no=v_asset_acco_no and invest_type=v_invest_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.6.9.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no,",","资产账户编号=",v_asset_acco_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no,",","资产账户编号=",v_asset_acco_no,",","投资类型=",v_invest_type);
                end if;
                leave label_pro;
            end if;


            /* [获取流水后信息][@当前数量#,@持仓核对差额#,@成本金额#,@实现盈亏#,@利息成本金额#,@利息收益#] */
            set v_jour_after_occur_info = concat(v_curr_qty,"|",v_posi_qty_check_diff,"|",v_cost_amt,"|",v_realize_pandl,"|",v_intrst_cost_amt,"|",v_intrst_pandl,"|");


            /* set @变动数量#=-1*@变动数量#; */
            set v_occur_qty=-1*v_occur_qty;

            /* set @变动后数量#=@当前数量#; */
            set v_occur_end_qty=v_curr_qty;

            /* set @业务标志# = 《业务标志-持仓转入》; */
            set v_busi_flag = 1104004;

            /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@交易组编号#,@证券代码编号#] */
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
                        
                SET v_error_code = "pdsecuA.6.9.1";
                SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* [更新表记录][产品证券_账户_组合交易组表][{处理状态}=《处理状态-成功》][{记录序号}=@临时_记录序号#][2][@记录序号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_pdsecu.tb_pdseac_Comb_Exgp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_status="1" where row_id=v_tmp_row_id;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.6.9.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
                else
                    SET v_error_info = concat("记录序号=",v_row_id);
                end if;
                leave label_pro;
            end if;

       else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_转移失效组合交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_TransferInvalidCombExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_TransferInvalidCombExgpCapit(
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
    IN p_default_exch_group_no int,
    IN p_combo_code varchar(32),
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
    declare v_exch_group_no int;
    declare v_default_exch_group_no int;
    declare v_combo_code varchar(32);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_tmp_exch_group_no int;
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_oper_remark_info varchar(255);
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_combo_code = p_combo_code;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_tmp_exch_group_no = 0;
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_busi_flag = 0;
    SET v_oper_remark_info = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;

    /* [获取表记录数量][产品证券_账户_组合交易组表][@记录个数#][{交易组编号}=@交易组编号#  and {组合状态}=《组合状态-有效》] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseac_Comb_Exgp where exch_group_no=v_exch_group_no  and combo_status="1";

    #记录个数>0,说明该交易组仍有有效组合,不将其资金转移至默认交易组

    /* [检查正常返回][@记录个数#>0] */
    if v_record_count>0 then
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][字段][字段变量][{交易组编号}=@交易组编号# and {资产账户编号}<>0 and {本币币种}="CNY"][4][@交易组编号#] */
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
        v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no<>0 and crncy_type="CNY" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.6.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品证券_资金_交易组资金表][{当前金额}=0,{冻结金额}=0,{解冻金额}=0,{待交收金额}=0,{沪深可用调整金额}=0,{港股通可用调整金额}=0,{金额核对差额}=0,{T日当日港股买入金额}=0,{T日当日港股卖出金额}=0,{T1日当日港股买入金额}=0,{T1日当日港股卖出金额}=0,{累计应收金额}=0,{累计应付金额}=0,{红冲蓝补金额}=0,{实现盈亏}=0,{利率}=0,{利息积数}=0,{待入账利息}=0][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=0,frozen_amt=0,unfroz_amt=0,pre_settle_amt=0,shsz_avail_change_amt=0,hk_avail_change_amt=0,amt_check_diff=0,T_hk_buy_total_amt=0,T_hk_sell_total_amt=0,T1_hk_buy_total_amt=0,T1_hk_sell_total_amt=0,total_rece_amt=0,total_payab_amt=0,total_change_amt=0,realize_pandl=0,intrst_rate=0,intrst_base_amt=0,pre_entry_intrst_amt=0 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.10.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @变动金额#=-1*@当前金额#; */
    set v_occur_amt=-1*v_curr_amt;

    /* set @变动后金额#=0; */
    set v_occur_end_amt=0;

    /* set @业务标志# = 《业务标志-资金划转》; */
    set v_busi_flag = 1005001;

    /* set @操作备注#="组合失效交易组资金变动 !"; */
    set v_oper_remark_info="组合失效交易组资金变动 !";

    /* [获取流水后信息][@变动后金额#] */
    set v_jour_after_occur_info = concat(v_occur_end_amt,"|");


    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#] */
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
                
        SET v_error_code = "pdsecuA.6.10.1";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{红冲蓝补金额},{实现盈亏},{利率},{利息积数},{待入账利息}][@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
    set v_jour_occur_field = concat("当前金额","|","冻结金额","|","解冻金额","|","待交收金额","|","沪深可用调整金额","|","港股通可用调整金额","|","金额核对差额","|","T日当日港股买入金额","|","T日当日港股卖出金额","|","T1日当日港股买入金额","|","T1日当日港股卖出金额","|","累计应收金额","|","累计应付金额","|","红冲蓝补金额","|","实现盈亏","|","利率","|","利息积数","|","待入账利息","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


    /* set @交易组编号#=@默认交易组编号#; */
    set v_exch_group_no=v_default_exch_group_no;

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#,{冻结金额}={冻结金额}+@冻结金额#,{解冻金额}={解冻金额}+@解冻金额#,{待交收金额}={待交收金额}+@待交收金额#,{沪深可用调整金额}={沪深可用调整金额}+@沪深可用调整金额#,{港股通可用调整金额}={港股通可用调整金额}+@港股通可用调整金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{T日当日港股买入金额}={T日当日港股买入金额}+@T日当日港股买入金额#,{T日当日港股卖出金额}={T日当日港股卖出金额}+@T日当日港股卖出金额#,{T1日当日港股买入金额}={T1日当日港股买入金额}+@T1日当日港股买入金额#,{T1日当日港股卖出金额}={T1日当日港股卖出金额}+@T1日当日港股卖出金额#,{累计应收金额}={累计应收金额}+@累计应收金额#,{累计应付金额}={累计应付金额}+@累计应付金额#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#,{实现盈亏}={实现盈亏}+@实现盈亏#,{利率}={利率}+@利率#,{利息积数}={利息积数}+@利息积数#,{待入账利息}={待入账利息}+@待入账利息#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt,frozen_amt=frozen_amt+v_frozen_amt,unfroz_amt=unfroz_amt+v_unfroz_amt,pre_settle_amt=pre_settle_amt+v_pre_settle_amt,shsz_avail_change_amt=shsz_avail_change_amt+v_shsz_avail_change_amt,hk_avail_change_amt=hk_avail_change_amt+v_hk_avail_change_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,T_hk_buy_total_amt=T_hk_buy_total_amt+v_T_hk_buy_total_amt,T_hk_sell_total_amt=T_hk_sell_total_amt+v_T_hk_sell_total_amt,T1_hk_buy_total_amt=T1_hk_buy_total_amt+v_T1_hk_buy_total_amt,T1_hk_sell_total_amt=T1_hk_sell_total_amt+v_T1_hk_sell_total_amt,total_rece_amt=total_rece_amt+v_total_rece_amt,total_payab_amt=total_payab_amt+v_total_payab_amt,total_change_amt=total_change_amt+v_total_change_amt,realize_pandl=realize_pandl+v_realize_pandl,intrst_rate=intrst_rate+v_intrst_rate,intrst_base_amt=intrst_base_amt+v_intrst_base_amt,pre_entry_intrst_amt=pre_entry_intrst_amt+v_pre_entry_intrst_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.10.1";
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
                
        SET v_error_code = "pdsecuA.6.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动金额#=-1*@变动金额#; */
    set v_occur_amt=-1*v_occur_amt;

    /* set @变动后金额#=@当前金额#; */
    set v_occur_end_amt=v_curr_amt;

    /* set @业务标志# = 《业务标志-资金转入》; */
    set v_busi_flag = 1005002;

    /* [获取流水后信息][@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应收金额#,@累计应付金额#,@红冲蓝补金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_pre_settle_amt,"|",v_shsz_avail_change_amt,"|",v_hk_avail_change_amt,"|",v_amt_check_diff,"|",v_T_hk_buy_total_amt,"|",v_T_hk_sell_total_amt,"|",v_T1_hk_buy_total_amt,"|",v_T1_hk_sell_total_amt,"|",v_total_rece_amt,"|",v_total_payab_amt,"|",v_total_change_amt,"|",v_realize_pandl,"|",v_intrst_rate,"|",v_intrst_base_amt,"|",v_pre_entry_intrst_amt,"|");


    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][1][@交易组编号#] */
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
                
        SET v_error_code = "pdsecuA.6.10.1";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_QueryExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_QueryExgpCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_default_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_exch_group_no int;
    declare v_default_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数#=10; */
    set v_row_count=10;

    /* [获取表记录][产品证券_资金_交易组资金表][{记录序号} as {交易组资金序号},{机构编号},{产品编号},{资产账户编号},{交易组编号},{本币币种},{期初金额} as {交易组期初金额},{当前金额} as {交易组当前金额},{冻结金额} as {交易组冻结金额},{解冻金额} as {交易组解冻金额},{待交收金额} as {交易组待交收金额},{沪深可用调整金额} as {交易组沪深可用调整金额},{港股通可用调整金额} as {交易组港股通可用调整金额},{金额核对差额} as {交易组金额核对差额},{T日当日港股买入金额} as {交易组T日当日港股买入金额},{T日当日港股卖出金额} as {交易组T日当日港股卖出金额},{T1日当日港股买入金额} as {交易组T1日当日港股买入金额},{T1日当日港股卖出金额} as {交易组T1日当日港股卖出金额},{累计应收金额} as {交易组累计应收金额},{累计应付金额} as {交易组累计应付金额},{实现盈亏} as {交易组实现盈亏},{利率} as {交易组利率},{利息积数} as {交易组利息积数},{待入账利息} as {交易组待入账利息},{更新次数}][{交易组编号}=@交易组编号# or {交易组编号}=@默认交易组编号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as exgp_cash_id,co_no,pd_no,asset_acco_no,exch_group_no,crncy_type,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no or exch_group_no=v_default_exch_group_no;
    else
        select row_id as exgp_cash_id,co_no,pd_no,asset_acco_no,exch_group_no,crncy_type,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no or exch_group_no=v_default_exch_group_no limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_QueryExgpPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_default_exch_group_no int,
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
    declare v_exch_group_no int;
    declare v_default_exch_group_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_invest_type int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_invest_type = 0;
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* set @指定行数#=10; */
    set v_row_count=10;

    /* [获取表记录][产品证券_持仓_交易组持仓表][{记录序号} as {交易组持仓序号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{证券类型} as {交易组证券类型},{资产类型} as {交易组资产类型},{投资类型} as {交易组投资类型},{期初数量} as {交易组期初数量},{当前数量} as {交易组当前数量},{待交收数量} as {交易组待交收数量},{冻结数量} as {交易组冻结数量},{解冻数量} as {交易组解冻数量},{持仓核对差额} as {交易组持仓核对差额},{成本金额} as {交易组成本金额},{实现盈亏} as {交易组实现盈亏},{利息成本金额} as {交易组利息成本金额},{利息收益} as {交易组利息收益},{更新次数}][({交易组编号}=@交易组编号# or {交易组编号}=@默认交易组编号#) and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][@指定行数#] */
    if v_row_count = -1 then
        select row_id as exgp_posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where (exch_group_no=v_exch_group_no or exch_group_no=v_default_exch_group_no) and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
    else
        select row_id as exgp_posi_id,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,stock_type as exch_group_stock_type,asset_type as exch_group_asset_type,invest_type as exgp_invest_type,begin_qty as exch_group_begin_qty,curr_qty as exgp_curr_qty,pre_settle_qty as exgp_pre_settle_qty,frozen_qty as exgp_frozen_qty,unfroz_qty as exgp_unfroz_qty,posi_qty_check_diff as exgp_posi_qty_check_diff,cost_amt as exgp_cost_amt,realize_pandl as exgp_realize_pandl,intrst_cost_amt as exgp_intrst_cost_amt,intrst_pandl as exgp_intrst_pandl,update_times from db_pdsecu.tb_pdsepo_exgp_posi where (exch_group_no=v_exch_group_no or exch_group_no=v_default_exch_group_no) and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_更新持仓数量成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_UpdateExgpPosiQtyCost;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_UpdateExgpPosiQtyCost(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_cost_amt decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exch_group_stock_type int,
    OUT p_exch_group_asset_type int,
    OUT p_exgp_invest_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_pre_settle_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_posi_qty_check_diff decimal(18,2),
    OUT p_exgp_cost_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exgp_intrst_cost_amt decimal(18,4),
    OUT p_exgp_intrst_pandl decimal(18,4),
    OUT p_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_stock_type int,
    OUT p_asac_asset_type int,
    OUT p_asac_invest_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_pre_settle_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_posi_qty_check_diff decimal(18,2),
    OUT p_asac_cost_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_cost_amt decimal(18,4),
    OUT p_asac_intrst_pandl decimal(18,4),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exch_group_stock_type int;
    declare v_exch_group_asset_type int;
    declare v_exgp_invest_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_pre_settle_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_posi_qty_check_diff decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_update_times int;
    declare v_asac_posi_id bigint;
    declare v_asac_stock_type int;
    declare v_asac_asset_type int;
    declare v_asac_invest_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_pre_settle_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_posi_qty_check_diff decimal(18,2);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_asac_update_times int;
    declare v_invest_type int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_occur_end_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exch_group_stock_type = 0;
    SET v_exch_group_asset_type = 0;
    SET v_exgp_invest_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_pre_settle_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_posi_qty_check_diff = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_update_times = 1;
    SET v_asac_posi_id = 0;
    SET v_asac_stock_type = 0;
    SET v_asac_asset_type = 0;
    SET v_asac_invest_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_pre_settle_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_posi_qty_check_diff = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_asac_update_times = 0;
    SET v_invest_type = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_qty = 0;
    SET v_cost_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_occur_end_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量}={当前数量}+@变动数量#,{成本金额}={成本金额}+@变动成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.13.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数}][@交易组持仓序号#,@交易组证券类型#,@交易组资产类型#,@交易组投资类型#,@交易组期初数量#,@交易组当前数量#,@交易组待交收数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组持仓核对差额#,@交易组成本金额#,@交易组实现盈亏#,@交易组利息成本金额#,@交易组利息收益#,@更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times into v_exgp_posi_id,v_exch_group_stock_type,v_exch_group_asset_type,v_exgp_invest_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_pre_settle_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_posi_qty_check_diff,v_exgp_cost_amt,v_exgp_realize_pandl,v_exgp_intrst_cost_amt,v_exgp_intrst_pandl,v_update_times from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.6.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{当前数量},{成本金额}][@当前数量#,@成本金额#] */
    set v_jour_occur_field = concat("当前数量","|","成本金额","|");
    set v_jour_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


    /* [获取流水后信息][@交易组当前数量#,@交易组成本金额#] */
    set v_jour_after_occur_info = concat(v_exgp_curr_qty,"|",v_exgp_cost_amt,"|");


    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @变动后数量#=@交易组当前数量#; */
    set v_occur_end_qty=v_exgp_curr_qty;

    /* set @业务标志# = 《业务标志-持仓成本调整》; */
    set v_busi_flag = 1105001;

    /* set @操作备注#="组合持仓数量和成本金额调整 !"; */
    set v_oper_remark_info="组合持仓数量和成本金额调整 !";

    /* [插入表记录][产品证券_持仓_交易组持仓流水表][字段][字段变量][1][@交易组编号#,@证券代码编号#] */
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
                
        SET v_error_code = "pdsecuA.6.13.1";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_持仓_资产账户持仓表][{当前数量}={当前数量}+@变动数量#,{成本金额}={成本金额}+@变动成本金额#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=curr_qty+v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.13.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_资产账户持仓表][{记录序号},{证券类型},{资产类型},{投资类型},{期初数量},{当前数量},{待交收数量},{冻结数量},{解冻数量},{持仓核对差额},{成本金额},{实现盈亏},{利息成本金额},{利息收益},{更新次数}][@资产账户持仓序号#,@资产账户证券类型#,@资产账户资产类型#,@资产账户投资类型#,@资产账户期初数量#,@资产账户当前数量#,@资产账户待交收数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户持仓核对差额#,@资产账户成本金额#,@资产账户实现盈亏#,@资产账户利息成本金额#,@资产账户利息收益#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][4][@资产账户编号#,@股东代码编号#,@证券代码编号#,@投资类型#] */
    select row_id,stock_type,asset_type,invest_type,begin_qty,curr_qty,pre_settle_qty,frozen_qty,unfroz_qty,posi_qty_check_diff,cost_amt,realize_pandl,intrst_cost_amt,intrst_pandl,update_times into v_asac_posi_id,v_asac_stock_type,v_asac_asset_type,v_asac_invest_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_pre_settle_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_posi_qty_check_diff,v_asac_cost_amt,v_asac_realize_pandl,v_asac_intrst_cost_amt,v_asac_intrst_pandl,v_asac_update_times from db_pdsecu.tb_pdsepo_asac_posi where asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.6.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@资产账户当前数量#,@资产账户成本金额#] */
    set v_jour_after_occur_info = concat(v_asac_curr_qty,"|",v_asac_cost_amt,"|");


    /* set @变动后数量#=@资产账户当前数量#; */
    set v_occur_end_qty=v_asac_curr_qty;

    /* [插入表记录][产品证券_持仓_资产账户持仓流水表][字段][字段变量][1][@资产账户编号#,@证券代码编号#] */
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
                
        SET v_error_code = "pdsecuA.6.13.1";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exch_group_stock_type = v_exch_group_stock_type;
    SET p_exch_group_asset_type = v_exch_group_asset_type;
    SET p_exgp_invest_type = v_exgp_invest_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_pre_settle_qty = v_exgp_pre_settle_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_posi_qty_check_diff = v_exgp_posi_qty_check_diff;
    SET p_exgp_cost_amt = v_exgp_cost_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exgp_intrst_cost_amt = v_exgp_intrst_cost_amt;
    SET p_exgp_intrst_pandl = v_exgp_intrst_pandl;
    SET p_update_times = v_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_stock_type = v_asac_stock_type;
    SET p_asac_asset_type = v_asac_asset_type;
    SET p_asac_invest_type = v_asac_invest_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_pre_settle_qty = v_asac_pre_settle_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_posi_qty_check_diff = v_asac_posi_qty_check_diff;
    SET p_asac_cost_amt = v_asac_cost_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_cost_amt = v_asac_intrst_cost_amt;
    SET p_asac_intrst_pandl = v_asac_intrst_pandl;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_交易组持仓变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_ExgpPosiChange;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_ExgpPosiChange(
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
    IN p_target_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_cost_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_exch_group_no int;
    declare v_target_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_cost_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_occur_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_invest_type int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_begin_qty decimal(18,2);
    declare v_pre_settle_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_posi_qty_check_diff decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_target_exch_group_no = p_target_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_cost_amt = p_occur_cost_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_occur_qty = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_invest_type = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_qty = 0;
    SET v_cost_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_begin_qty = 0;
    SET v_pre_settle_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_cost_amt = 0;
    SET v_intrst_pandl = 0;
    SET v_posi_qty_check_diff = 0;

    
    label_pro:BEGIN
    

    /* set @临时_变动数量#=@变动数量#; */
    set v_tmp_occur_qty=v_occur_qty;

    /* set @业务标志# = 《业务标志-持仓划转》; */
    set v_busi_flag = 1104003;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @投资类型#=1; */
    set v_invest_type=1;

    /* [获取流水变动][{当前数量},{成本金额}][@当前数量#,@成本金额#] */
    set v_jour_occur_field = concat("当前数量","|","成本金额","|");
    set v_jour_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");

    #更新源交易组的数量和成本金额

    /* [更新表记录][产品证券_持仓_交易组持仓表][{当前数量} = {当前数量} - @变动数量#,{成本金额}={成本金额}-@变动成本金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {投资类型}=@投资类型#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdsepo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty - v_occur_qty,cost_amt=cost_amt-v_occur_cost_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and invest_type=v_invest_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额},{证券类型},{资产类型}][@当前数量#,@成本金额#,@证券类型#,@资产类型#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt,stock_type,asset_type into v_curr_qty,v_cost_amt,v_stock_type,v_asset_type from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.6.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    #写入源交易组的持仓流水

    /* [获取流水后信息][@当前数量#,@成本金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


    /* set @变动数量#=-1*@变动数量#; */
    set v_occur_qty=-1*v_occur_qty;

    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

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
                
        SET v_error_code = "pdsecuA.6.14.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @变动数量#=@临时_变动数量#; */
    set v_occur_qty=v_tmp_occur_qty;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @待交收数量# = 0; */
    set v_pre_settle_qty = 0;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利息成本金额# = 0; */
    set v_intrst_cost_amt = 0;

    /* set @利息收益# = 0; */
    set v_intrst_pandl = 0;

    /* set @持仓核对差额#=0; */
    set v_posi_qty_check_diff=0;

    /* set @当前数量#=@变动数量#; */
    set v_curr_qty=v_occur_qty;

    /* set @成本金额#=@变动成本金额#; */
    set v_cost_amt=v_occur_cost_amt;
    #更新目标交易组的数量和成本金额

    /* set @交易组编号#=@目标交易组编号#; */
    set v_exch_group_no=v_target_exch_group_no;

    /* [插入重复更新][产品证券_持仓_交易组持仓表][字段][字段变量][{当前数量}={当前数量}+@变动数量#,{成本金额}={成本金额}+@变动成本金额#][2][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=curr_qty+v_occur_qty,cost_amt=cost_amt+v_occur_cost_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.6.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_持仓_交易组持仓表][{当前数量},{成本金额}][@当前数量#,@成本金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {投资类型}=@投资类型#][4][@交易组编号#, @资产账户编号#, @股东代码编号#, @证券代码编号#,@投资类型#] */
    select curr_qty,cost_amt into v_curr_qty,v_cost_amt from db_pdsecu.tb_pdsepo_exgp_posi where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and invest_type=v_invest_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.6.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no,",","投资类型=",v_invest_type);
        end if;
        leave label_pro;
    end if;

    #目标交易组的持仓变动流水

    /* [获取流水后信息][@当前数量#,@成本金额#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|",v_cost_amt,"|");


    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

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
                
        SET v_error_code = "pdsecuA.6.14.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,","," 资产账户编号=", v_asset_acco_no,","," 股东代码编号=", v_stock_acco_no,","," 证券代码编号=", v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_补单获取交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_MissOrderGetExgpNum;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_MissOrderGetExgpNum(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_record_count int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{产品编号}=@产品编号# and {交易组编号}<>0 and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseca_exgp_capit where pd_no=v_pd_no and exch_group_no<>0 and asset_acco_no=v_asset_acco_no and crncy_type="CNY";

    #如果交易组资金表中只有一条记录,那么补单的时候就补到这条记录上,如果没有记录或者鼬多条记录,那么补到默认交易组上,这边传0,交易 那边处理

    /* if @记录个数#=1 then */
    if v_record_count=1 then

        /* [获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{交易组编号}<>0 and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"][4][@资产账户编号#] */
        select exch_group_no into v_exch_group_no from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no<>0 and asset_acco_no=v_asset_acco_no and crncy_type="CNY" limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.6.15.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
            end if;
            leave label_pro;
        end if;

    else

        /* set @交易组编号#=0; */
        set v_exch_group_no=0;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_交易接口_检查账户状态获取资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseexif_CheckStockAccoStatusCapitalAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseexif_CheckStockAccoStatusCapitalAvail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_order_dir int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_loan_sell_amt decimal(18,4),
    OUT p_asac_loan_sell_amt decimal(18,4),
    OUT p_exgp_debt_fina_buy_strike_amt decimal(18,4)
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_order_dir int;
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_loan_sell_amt decimal(18,4);
    declare v_asac_loan_sell_amt decimal(18,4);
    declare v_exgp_debt_fina_buy_strike_amt decimal(18,4);
    declare v_invest_type int;
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_curr_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_frozen_amt decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_order_dir = p_order_dir;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exgp_loan_sell_amt = 0;
    SET v_asac_loan_sell_amt = 0;
    SET v_exgp_debt_fina_buy_strike_amt = 0;
    SET v_invest_type = 0;
    SET v_exgp_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_exgp_target_code_avail_qty = 0;
    SET v_exgp_trade_code_avail_qty = 0;
    SET v_asac_target_code_avail_qty = 0;
    SET v_asac_trade_code_avail_qty = 0;
    SET v_avail_qty = 0;
    SET v_curr_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;

    
    label_pro:BEGIN
    

    /* set @投资类型#=1; */
    set v_invest_type=1;
    #如果传入的指令方向有值，检查是否有相应业务限制

    /* set @资产账户可用金额# = 0; */
    set v_asac_avail_amt = 0;

    /* set @交易组可用金额# = 0; */
    set v_exgp_avail_amt = 0;

    /* set @交易组可用数量#  = 0; */
    set v_exgp_avail_qty  = 0;

    /* set @资产账户可用数量#  = 0; */
    set v_asac_avail_qty  = 0;

    /* set @交易组标的代码可用数量#  = 0; */
    set v_exgp_target_code_avail_qty  = 0;

    /* set @交易组交易代码可用数量#  = 0; */
    set v_exgp_trade_code_avail_qty  = 0;

    /* set @资产账户标的代码可用数量#  = 0; */
    set v_asac_target_code_avail_qty  = 0;

    /* set @资产账户交易代码可用数量#  = 0; */
    set v_asac_trade_code_avail_qty  = 0;

    /* set @可用数量# = 0; */
    set v_avail_qty = 0;

    /* set @交易组融券卖出金额#  = 0; */
    set v_exgp_loan_sell_amt  = 0;

    /* set @资产账户融券卖出金额# = 0; */
    set v_asac_loan_sell_amt = 0;

    /* if @订单方向# = 《订单方向-直接还款》   then */
    if v_order_dir = 14   then
        #如果资产账户编号不为0，则检查资产账户相关数据

        /* if @资产账户编号# <> 0 then */
        if v_asset_acco_no <> 0 then

            /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{冻结金额},{解冻金额}][@当前金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@冻结金额#,@解冻金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select curr_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,frozen_amt,unfroz_amt into v_curr_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_frozen_amt,v_unfroz_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @资产账户可用金额# = @当前金额# + @沪深可用调整金额# - @冻结金额# + @解冻金额#+@金额核对差额#; */
                set v_asac_avail_amt = v_curr_amt + v_shsz_avail_change_amt - v_frozen_amt + v_unfroz_amt+v_amt_check_diff;
            else

                /* set @资产账户可用金额# = 0; */
                set v_asac_avail_amt = 0;
            end if;
        end if;
        #如果交易组编号不为0，则检查交易组相关数据

        /* if @交易组编号# <> 0 then */
        if v_exch_group_no <> 0 then

            /* [获取表记录变量语句][产品证券_资金_交易组资金表][{当前金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{冻结金额},{解冻金额}][@当前金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@冻结金额#,@解冻金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select curr_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,frozen_amt,unfroz_amt into v_curr_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_frozen_amt,v_unfroz_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @交易组可用金额# = @当前金额# + @沪深可用调整金额# - @冻结金额# + @解冻金额#+@金额核对差额#; */
                set v_exgp_avail_amt = v_curr_amt + v_shsz_avail_change_amt - v_frozen_amt + v_unfroz_amt+v_amt_check_diff;
            else

                /* set @交易组可用金额# = 0; */
                set v_exgp_avail_amt = 0;
            end if;
        end if;
    end if;

    /* set @投资类型# = 《投资类型-二级市场交易性金融资产》; */
    set v_invest_type = 1;

    /* if @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-融券卖出》 or  @订单方向# = 《订单方向-买券还券》  or  @订单方向# = 《订单方向-卖券还款》   then */
    if v_order_dir = 5 or v_order_dir = 6 or  v_order_dir = 8  or  v_order_dir = 7   then

        /* if @资产账户编号# <> 0 then */
        if v_asset_acco_no <> 0 then

            /* [获取表记录变量语句][产品证券_融资融券_资产账户资金负债表][{融券卖出金额}][@资产账户融券卖出金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select loan_sell_amt into v_asac_loan_sell_amt from db_pdsecu.tb_pdsecr_asac_capitdebt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

        end if;

        /* if @交易组编号# <> 0 then */
        if v_exch_group_no <> 0 then

            /* [获取表记录变量语句][产品证券_融资融券_交易组资金负债表][{融券卖出金额}][@交易组融券卖出金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select loan_sell_amt into v_exgp_loan_sell_amt from db_pdsecu.tb_pdsecr_exgp_capitdebt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


            /* [获取表记录变量语句][产品证券_融资融券_交易组持仓负债表][{当前负债金额}][@交易组负债融资买入成交金额#][{交易组编号} = @交易组编号# and {资产账户编号}=@资产账户编号#  and {投资类型} = @投资类型# and {负债类型} = 《负债类型-融资》] */
            select curr_debt_amt into v_exgp_debt_fina_buy_strike_amt from db_pdsecu.tb_pdsecr_exgp_posidebt where exch_group_no = v_exch_group_no and asset_acco_no=v_asset_acco_no  and invest_type = v_invest_type and debt_type = 1 limit 1;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exgp_loan_sell_amt = v_exgp_loan_sell_amt;
    SET p_asac_loan_sell_amt = v_asac_loan_sell_amt;
    SET p_exgp_debt_fina_buy_strike_amt = v_exgp_debt_fina_buy_strike_amt;

END;;


