DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_计算_获取期货信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfucc_GetContrcInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfucc_GetContrcInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_contrc_code_no int,
    OUT p_contrc_name varchar(64),
    OUT p_contrc_type int,
    OUT p_asset_type int,
    OUT p_step_price decimal(16,9),
    OUT p_hold_qty decimal(18,2),
    OUT p_main_flag int,
    OUT p_contrc_unit int,
    OUT p_last_price decimal(16,9),
    OUT p_buy_price_1 decimal(16,9),
    OUT p_sell_price_1 decimal(16,9),
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_contrc_code_no int;
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_asset_type int;
    declare v_step_price decimal(16,9);
    declare v_hold_qty decimal(18,2);
    declare v_main_flag int;
    declare v_contrc_unit int;
    declare v_last_price decimal(16,9);
    declare v_buy_price_1 decimal(16,9);
    declare v_sell_price_1 decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_name = " ";
    SET v_contrc_type = 0;
    SET v_asset_type = 0;
    SET v_step_price = 0;
    SET v_hold_qty = 0;
    SET v_main_flag = 0;
    SET v_contrc_unit = 0;
    SET v_last_price = 0;
    SET v_buy_price_1 = 0;
    SET v_sell_price_1 = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控期货_计算_期货信息表][{合约代码编号}, {合约名称}, {合约类型}, {资产类型}, {最小价差}, {持仓量}, {主力标志}, {合约乘数}, {最新价}, {买一价}, {卖一价}, {涨停价}, {跌停价}, {昨结算价}, {结算价}][@合约代码编号#, @合约名称#, @合约类型#, @资产类型#, @最小价差#, @持仓量#, @主力标志#, @合约乘数#, @最新价#, @买一价#, @卖一价#, @涨停价#, @跌停价#, @昨结算价#, @结算价#][{市场编号}=@市场编号# and {合约代码}=@合约代码#] */
    select contrc_code_no, contrc_name, contrc_type, asset_type, step_price, hold_qty, main_flag, contrc_unit, last_price, buy_price_1, sell_price_1, up_limit_price, down_limit_price, pre_settle_price, sett_price into v_contrc_code_no, v_contrc_name, v_contrc_type, v_asset_type, v_step_price, v_hold_qty, v_main_flag, v_contrc_unit, v_last_price, v_buy_price_1, v_sell_price_1, v_up_limit_price, v_down_limit_price, v_pre_settle_price, v_sett_price from db_rkfutu.tb_rkfucc_futu_contrc_info where exch_no=v_exch_no and contrc_code=v_contrc_code limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_type = v_contrc_type;
    SET p_asset_type = v_asset_type;
    SET p_step_price = v_step_price;
    SET p_hold_qty = v_hold_qty;
    SET p_main_flag = v_main_flag;
    SET p_contrc_unit = v_contrc_unit;
    SET p_last_price = v_last_price;
    SET p_buy_price_1 = v_buy_price_1;
    SET p_sell_price_1 = v_sell_price_1;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_计算_计算单期货持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfucc_CalcContrcPosition;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfucc_CalcContrcPosition(
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
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控期货_计算_交易组业务持仓表][ifnull(sum({持仓数量}),0)][@持仓数量#][{机构编号} = @机构编号# and ({产品编号} = @产品编号# or @产品编号# = -1) and ({交易组编号} = @交易组编号# or @交易组编号# = -1 or @交易组编号# = 0 ) and {合约代码编号} = @合约代码编号#] */
    select ifnull(sum(posi_qty),0) into v_posi_qty from db_rkfutu.tb_rkfucc_futu_exgp_posi where co_no = v_co_no and (pd_no = v_pd_no or v_pd_no = -1) and (exch_group_no = v_exch_group_no or v_exch_group_no = -1 or v_exch_group_no = 0 ) and contrc_code_no = v_contrc_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_qty = v_posi_qty;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_计算_计算单期货单合约保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfucc_CalcContrcMargin;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfucc_CalcContrcMargin(
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
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rece_margin decimal(18,4)
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
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控期货_计算_交易组业务持仓表][ifnull(sum({应收保证金}),0)][@应收保证金#][{机构编号} = @机构编号# and ({产品编号} = @产品编号# or @产品编号# = -1) and ({交易组编号} = @交易组编号# or @交易组编号# = -1 or @交易组编号# = 0) and {合约代码编号} = @合约代码编号#] */
    select ifnull(sum(rece_margin),0) into v_rece_margin from db_rkfutu.tb_rkfucc_futu_exgp_posi where co_no = v_co_no and (pd_no = v_pd_no or v_pd_no = -1) and (exch_group_no = v_exch_group_no or v_exch_group_no = -1 or v_exch_group_no = 0) and contrc_code_no = v_contrc_code_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rece_margin = v_rece_margin;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_计算_计算实收保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfucc_CalcRealMarginByExection;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfucc_CalcRealMarginByExection(
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
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_lngsht_type int,
    IN p_rece_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4)
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
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_lngsht_type int;
    declare v_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_long_order_margin decimal(18,4);
    declare v_short_order_margin decimal(18,4);
    declare v_long_strike_margin decimal(18,4);
    declare v_short_strike_margin decimal(18,4);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_posi_capt_amt decimal(18,4);
    declare v_strike_margin decimal(18,4);
    declare v_order_margin decimal(18,4);
    declare v_posi_capt_amt_after decimal(18,4);
    declare v_trade_capt_amt_after decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_lngsht_type = p_lngsht_type;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_long_order_margin = 0;
    SET v_short_order_margin = 0;
    SET v_long_strike_margin = 0;
    SET v_short_strike_margin = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_trade_capt_amt = 0;
    SET v_posi_capt_amt = 0;
    SET v_strike_margin = 0;
    SET v_order_margin = 0;
    SET v_posi_capt_amt_after = 0;
    SET v_trade_capt_amt_after = 0;
    SET v_strike_occur_amt = 0;

    
    label_pro:BEGIN
    
    #多头持仓保证金为产品库中的多头应收保证金,空头持仓保证金为产品库的空头应收保证金

    /* [获取表记录变量语句][风控期货_计算_保证金优惠控制表][{多头订单保证金}, {空头订单保证金}, {多头成交保证金}, {空头成交保证金}, {多头持仓保证金}, {空头持仓保证金}, {交易占用金额}, {持仓占用金额}][@多头订单保证金#, @空头订单保证金#, @多头成交保证金#, @空头成交保证金#, @多头持仓保证金#, @空头持仓保证金#, @交易占用金额#, @持仓占用金额#][{产品编号}=@产品编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {组合编码} =@组合编码# and {套保标志} = @套保标志#] */
    select long_order_margin, short_order_margin, long_strike_margin, short_strike_margin, long_hold_margin, short_hold_margin, trade_capt_amt, posi_capt_amt into v_long_order_margin, v_short_order_margin, v_long_strike_margin, v_short_strike_margin, v_long_hold_margin, v_short_hold_margin, v_trade_capt_amt, v_posi_capt_amt from db_rkfutu.tb_rkfucc_margin_ctrl where pd_no=v_pd_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and comb_code =v_comb_code and hedge_type = v_hedge_type limit 1;


    /* set @成交保证金# =0; */
    set v_strike_margin =0;

    /* set @订单保证金# =@应收保证金#; */
    set v_order_margin =v_rece_margin;

    /* if @多空类型# = 《多空类型-多头》 then */
    if v_lngsht_type = 1 then

      /* set @持仓占用后金额# = GREATEST((@多头成交保证金# + @多头持仓保证金# + @成交保证金#), (@空头成交保证金# + @空头持仓保证金#)); */
      set v_posi_capt_amt_after = GREATEST((v_long_strike_margin + v_long_hold_margin + v_strike_margin), (v_short_strike_margin + v_short_hold_margin));

      /* set @交易占用后金额# = GREATEST((@多头订单保证金# + @多头成交保证金# + @多头持仓保证金# + @订单保证金# + @成交保证金#), (@空头订单保证金# + @空头成交保证金# + @空头持仓保证金#)); */
      set v_trade_capt_amt_after = GREATEST((v_long_order_margin + v_long_strike_margin + v_long_hold_margin + v_order_margin + v_strike_margin), (v_short_order_margin + v_short_strike_margin + v_short_hold_margin));
    end if;

    /* if @多空类型# = 《多空类型-空头》 then */
    if v_lngsht_type = 2 then

      /* set @持仓占用后金额# = GREATEST((@多头成交保证金# + @多头持仓保证金#), (@空头成交保证金# + @空头持仓保证金# + @成交保证金#)); */
      set v_posi_capt_amt_after = GREATEST((v_long_strike_margin + v_long_hold_margin), (v_short_strike_margin + v_short_hold_margin + v_strike_margin));

      /* set @交易占用后金额# = GREATEST((@多头订单保证金# + @多头成交保证金# + @多头持仓保证金#), (@空头订单保证金# + @空头成交保证金# + @空头持仓保证金# + @订单保证金# + @成交保证金#)); */
      set v_trade_capt_amt_after = GREATEST((v_long_order_margin + v_long_strike_margin + v_long_hold_margin), (v_short_order_margin + v_short_strike_margin + v_short_hold_margin + v_order_margin + v_strike_margin));
    end if;

    /* set @成交变动金额# = @持仓占用后金额# - @持仓占用金额#; */
    set v_strike_occur_amt = v_posi_capt_amt_after - v_posi_capt_amt;

    /* set @交易占用后金额# = @交易占用后金额# - @持仓占用后金额#; */
    set v_trade_capt_amt_after = v_trade_capt_amt_after - v_posi_capt_amt_after;

    /* set @交易变动金额# = @交易占用后金额# - @交易占用金额#; */
    set v_trade_occur_amt = v_trade_capt_amt_after - v_trade_capt_amt;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;

END;;


DELIMITER ;;
use db_rkfutu;;

# 原子_风控期货_计算_计算数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkfucc_FutuDataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rkfucc_FutuDataToHis(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [清空表记录][风控期货_计算_期货信息表] */
    truncate table db_rkfutu.tb_rkfucc_futu_contrc_info;


    /* [清空表记录][风控期货_计算_保证金优惠控制表] */
    truncate table db_rkfutu.tb_rkfucc_margin_ctrl;


    /* [清空表记录][风控期货_计算_交易组业务持仓表] */
    truncate table db_rkfutu.tb_rkfucc_futu_exgp_posi;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


