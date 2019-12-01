DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_公共接口_获取交易编码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupubif_GetFutuAccoNo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupubif_GetFutuAccoNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_acco_no int
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
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_账户_期货账户信息表][{交易编码编号}][@交易编码编号#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {交易编码} = @交易编码# and {套保标志}=@套保标志#][155][@资产账户编号#, @市场编号#, @交易编码#,@套保标志#] */
    select futu_acco_no into v_futu_acco_no from db_pdfutu.tb_pdfuac_futu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and futu_acco = v_futu_acco and hedge_type=v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.4.1.155";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 交易编码=", v_futu_acco,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 交易编码=", v_futu_acco,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_acco_no = v_futu_acco_no;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_公共接口_获取交易编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupubif_GetFutuAcco;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupubif_GetFutuAcco(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_futu_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_no int,
    OUT p_futu_acco varchar(16)
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
    declare v_futu_acco_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_no = 0;
    SET v_futu_acco = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_账户_期货账户信息表][{市场编号}, {交易编码}][@市场编号#, @交易编码#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号#][155][@资产账户编号#,@交易编码编号#] */
    select exch_no, futu_acco into v_exch_no, v_futu_acco from db_pdfutu.tb_pdfuac_futu_acco where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.4.2.155";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco = v_futu_acco;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_公共接口_计算产品期货现金资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupubif_CalcProdFutuCashAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupubif_CalcProdFutuCashAsset(
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
    OUT p_error_info varchar(255),
    OUT p_futu_cash_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
    OUT p_futu_long_market_value decimal(18,4),
    OUT p_futu_short_market_value decimal(18,4)
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
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
    declare v_crncy_type varchar(3);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算期货现金资产 Modify by wjp 20181019 期货现金 产品层级根据资产账户去统计。

    /* select sum({当前金额}-{占用保证金}+{累计应收金额}-{累计应付金额})  into @期货现金资产# from ~产品期货_资金_资产账户资金表^ where {产品编号}=@产品编号# and {本币币种}=@本币币种# and {机构编号}=@机构编号#; */
    select sum(curr_amt-capt_margin+total_rece_amt-total_payab_amt)  into v_futu_cash_asset from db_pdfutu.tb_pdfuca_asac_capit where pd_no=v_pd_no and crncy_type=v_crncy_type and co_no=v_co_no;

    /* set @期货现金资产#=round(ifnull(@期货现金资产#,0),2); */
    set v_futu_cash_asset=round(ifnull(v_futu_cash_asset,0),2);
    #计算期货资产

    /* select sum({占用保证金})  into @期货资产# from ~产品期货_资金_资产账户资金表^ where {产品编号}=@产品编号# and {本币币种}=@本币币种# and {机构编号}=@机构编号#; */
    select sum(capt_margin)  into v_futu_asset from db_pdfutu.tb_pdfuca_asac_capit where pd_no=v_pd_no and crncy_type=v_crncy_type and co_no=v_co_no;

    /* set @期货资产#=round(ifnull(@期货资产#,0),2); */
    set v_futu_asset=round(ifnull(v_futu_asset,0),2);
    #计算期货多头市值

    /* select sum(a.{当前数量}*a.{合约乘数}*b.{最新价}) into @期货多头市值# from ~产品期货_持仓_资产账户持仓表^ a,~产品期货_持仓运维_期货行情表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{多空类型}=《多空类型-多头》  and a.{合约代码编号}=b.{合约代码编号} ; */
    select sum(a.curr_qty*a.contrc_unit*b.last_price) into v_futu_long_market_value from db_pdfutu.tb_pdfupo_asac_posi a,db_pdfutu.tb_pdfupobk_futu_quot b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.lngsht_type=1  and a.contrc_code_no=b.contrc_code_no ;

    /* set @期货多头市值#=round(ifnull(@期货多头市值#,0),2); */
    set v_futu_long_market_value=round(ifnull(v_futu_long_market_value,0),2);
    #计算期货空头市值

    /* select sum(a.{当前数量}*a.{合约乘数}*b.{最新价}) into @期货空头市值# from ~产品期货_持仓_资产账户持仓表^ a,~产品期货_持仓运维_期货行情表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{多空类型}=《多空类型-空头》  and a.{合约代码编号}=b.{合约代码编号} ; */
    select sum(a.curr_qty*a.contrc_unit*b.last_price) into v_futu_short_market_value from db_pdfutu.tb_pdfupo_asac_posi a,db_pdfutu.tb_pdfupobk_futu_quot b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.lngsht_type=2  and a.contrc_code_no=b.contrc_code_no ;

    /* set @期货空头市值#=round(ifnull(@期货空头市值#,0),2); */
    set v_futu_short_market_value=round(ifnull(v_futu_short_market_value,0),2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_cash_asset = v_futu_cash_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_futu_long_market_value = v_futu_long_market_value;
    SET p_futu_short_market_value = v_futu_short_market_value;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_公共接口_计算交易组期货现金资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupubif_CalcExchGroupFutuCashAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupubif_CalcExchGroupFutuCashAsset(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_cash_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
    OUT p_futu_long_market_value decimal(18,4),
    OUT p_futu_short_market_value decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
    declare v_crncy_type varchar(3);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算现金资产

    /* select sum({当前金额}+{累计应收金额}-{累计应付金额}-{占用保证金}) into @期货现金资产# from ~产品期货_资金_交易组资金表^ where {交易组编号}=@交易组编号# and {本币币种}=@本币币种#; */
    select sum(curr_amt+total_rece_amt-total_payab_amt-capt_margin) into v_futu_cash_asset from db_pdfutu.tb_pdfuca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;

    /* set @期货现金资产#=round(ifnull(@期货现金资产#,0),2); */
    set v_futu_cash_asset=round(ifnull(v_futu_cash_asset,0),2);
    #计算期货资产

    /* select sum({占用保证金}) into @期货资产# from ~产品期货_资金_交易组资金表^ where {交易组编号}=@交易组编号# and {本币币种}=@本币币种#; */
    select sum(capt_margin) into v_futu_asset from db_pdfutu.tb_pdfuca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;

    /* set @期货资产#=round(ifnull(@期货资产#,0),2); */
    set v_futu_asset=round(ifnull(v_futu_asset,0),2);
    #计算期货多头市值

    /* select sum(a.{当前数量}*a.{合约乘数}*b.{最新价}) into @期货多头市值# from ~产品期货_持仓_交易组持仓表^ a,~产品期货_持仓运维_期货行情表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{交易组编号}=@交易组编号# and  a.{多空类型}=《多空类型-多头》  and a.{合约代码编号}=b.{合约代码编号} ; */
    select sum(a.curr_qty*a.contrc_unit*b.last_price) into v_futu_long_market_value from db_pdfutu.tb_pdfupo_exgp_posi a,db_pdfutu.tb_pdfupobk_futu_quot b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.exch_group_no=v_exch_group_no and  a.lngsht_type=1  and a.contrc_code_no=b.contrc_code_no ;

    /* set @期货多头市值#=round(ifnull(@期货多头市值#,0),2); */
    set v_futu_long_market_value=round(ifnull(v_futu_long_market_value,0),2);
    #计算期货空头市值

    /* select sum(a.{当前数量}*a.{合约乘数}*b.{最新价}) into @期货空头市值# from ~产品期货_持仓_交易组持仓表^ a,~产品期货_持仓运维_期货行情表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{交易组编号}=@交易组编号# and  a.{多空类型}=《多空类型-空头》  and a.{合约代码编号}=b.{合约代码编号} ; */
    select sum(a.curr_qty*a.contrc_unit*b.last_price) into v_futu_short_market_value from db_pdfutu.tb_pdfupo_exgp_posi a,db_pdfutu.tb_pdfupobk_futu_quot b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.exch_group_no=v_exch_group_no and  a.lngsht_type=2  and a.contrc_code_no=b.contrc_code_no ;

    /* set @期货空头市值#=round(ifnull(@期货空头市值#,0),2); */
    set v_futu_short_market_value=round(ifnull(v_futu_short_market_value,0),2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_cash_asset = v_futu_cash_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_futu_long_market_value = v_futu_long_market_value;
    SET p_futu_short_market_value = v_futu_short_market_value;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_公共接口_获取合约代码最新价
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupubif_GetContrcCodeLastPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupubif_GetContrcCodeLastPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_last_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_持仓运维_期货行情表][{最新价}][@最新价#][{合约代码编号} = @合约代码编号#][4][@合约代码编号#] */
    select last_price into v_last_price from db_pdfutu.tb_pdfupobk_futu_quot where contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.4.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    if FOUND_ROWS() = 0 then

         /* set @最新价# =0; */
         set v_last_price =0;
    end if;

    /* set @最新价# = ROUND(@最新价#,2); */
    set v_last_price = ROUND(v_last_price,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_last_price = v_last_price;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_公共接口_更新期货行情最新价
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupubif_UpdateFutuQuotLastPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupubif_UpdateFutuQuotLastPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    IN p_last_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_contrc_code_no int;
    declare v_last_price decimal(16,9);
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* [插入重复更新][产品期货_持仓运维_期货行情表][字段][字段变量][{最新价}=@最新价#][1][@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupobk_futu_quot (
        create_date, create_time, update_date, 
        update_time, update_times, contrc_code_no, last_price) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_contrc_code_no, v_last_price) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, last_price=v_last_price;
    if v_error_code = "1" then
        ROLLBACK;        
        SET v_error_code = "pdfutuA.4.6.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


