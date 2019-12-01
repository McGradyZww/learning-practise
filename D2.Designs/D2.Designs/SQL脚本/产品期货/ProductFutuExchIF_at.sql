DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_交易接口_检查账户状态获取可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuexif_CheckStockAccoStatusAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuexif_CheckStockAccoStatusAvail(
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
    IN p_contrc_code_no int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_contrc_type int,
    IN p_contrc_dir int,
    IN p_order_dir int,
    IN p_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_futu_acco_no int,
    OUT p_futu_acco varchar(16),
    OUT p_exgp_avail_amt decimal(18,4),
    OUT p_asac_avail_amt decimal(18,4),
    OUT p_exgp_avail_qty decimal(18,2),
    OUT p_asac_avail_qty decimal(18,2),
    OUT p_exgp_long_rece_margin decimal(18,4),
    OUT p_exgp_short_rece_margin decimal(18,4),
    OUT p_asac_long_rece_margin decimal(18,4),
    OUT p_asac_short_rece_margin decimal(18,4),
    OUT p_exgp_long_stock_rece_margin decimal(18,4),
    OUT p_exgp_short_stock_rece_margin decimal(18,4)
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
    declare v_contrc_code_no int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_dir int;
    declare v_order_dir int;
    declare v_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_exgp_long_rece_margin decimal(18,4);
    declare v_exgp_short_rece_margin decimal(18,4);
    declare v_asac_long_rece_margin decimal(18,4);
    declare v_asac_short_rece_margin decimal(18,4);
    declare v_exgp_long_stock_rece_margin decimal(18,4);
    declare v_exgp_short_stock_rece_margin decimal(18,4);
    declare v_futu_acco_status varchar(2);
    declare v_allow_contrc_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_dir = p_contrc_dir;
    SET v_order_dir = p_order_dir;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_no = 0;
    SET v_futu_acco = " ";
    SET v_exgp_avail_amt = 0;
    SET v_asac_avail_amt = 0;
    SET v_exgp_avail_qty = 0;
    SET v_asac_avail_qty = 0;
    SET v_exgp_long_rece_margin = 0;
    SET v_exgp_short_rece_margin = 0;
    SET v_asac_long_rece_margin = 0;
    SET v_asac_short_rece_margin = 0;
    SET v_exgp_long_stock_rece_margin = 0;
    SET v_exgp_short_stock_rece_margin = 0;
    SET v_futu_acco_status = "0";
    SET v_allow_contrc_type = " ";
    SET v_busi_limit_str = " ";
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_capt_margin = 0;
    SET v_lngsht_type = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;

    
    label_pro:BEGIN
    
    #获取交易编码编号和交易编码状态

    /* [获取表记录变量][产品期货_账户_期货账户信息表][{交易编码编号},{交易编码},{交易编码状态},{允许操作合约类型},{业务限制串}][@交易编码编号#,@交易编码#,@交易编码状态#,@允许操作合约类型#,@业务限制串#][{资产账户编号} = @资产账户编号# and {市场编号} = @市场编号# and {套保标志}=@套保标志#][4]["请检查期货账户信息的配置",@资产账户编号#,@市场编号#] */
    select futu_acco_no,futu_acco,futu_acco_status,allow_contrc_type,busi_limit_str into v_futu_acco_no,v_futu_acco,v_futu_acco_status,v_allow_contrc_type,v_busi_limit_str from db_pdfutu.tb_pdfuac_futu_acco where asset_acco_no = v_asset_acco_no and exch_no = v_exch_no and hedge_type=v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.6.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("请检查期货账户信息的配置",",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("请检查期货账户信息的配置",",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    #如果交易编码状态非正常，报错返回

    /* [检查报错返回][@交易编码状态# <> 《交易编码状态-正常》][146][@交易编码状态#] */
    if v_futu_acco_status <> "1" then
        
        SET v_error_code = "pdfutuA.6.1.146";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易编码状态=",v_futu_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易编码状态=",v_futu_acco_status);
        end if;
        leave label_pro;
    end if;

    #检查业务限制
    #如果传入的证券类型有值，检查是否可操作

    /* [检查报错返回][@合约类型# <> 0 and instr(@允许操作合约类型#, @合约类型#) = 0][147][@合约类型#,@允许操作合约类型#] */
    if v_contrc_type <> 0 and instr(v_allow_contrc_type, v_contrc_type) = 0 then
        
        SET v_error_code = "pdfutuA.6.1.147";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("合约类型=",v_contrc_type,",","允许操作合约类型=",v_allow_contrc_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("合约类型=",v_contrc_type,",","允许操作合约类型=",v_allow_contrc_type);
        end if;
        leave label_pro;
    end if;


    /* set @资产账户可用金额# = 0; */
    set v_asac_avail_amt = 0;

    /* set @交易组可用金额# = 0; */
    set v_exgp_avail_amt = 0;

    /* set @交易组可用数量#  = 0; */
    set v_exgp_avail_qty  = 0;

    /* set @资产账户可用数量#  = 0; */
    set v_asac_avail_qty  = 0;
    #开仓获取资金可用

    /* if (@订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-卖出》) and @开平方向# = 《开平方向-开仓》 then */
    if (v_order_dir = 1 or v_order_dir = 2) and v_contrc_dir = 1 then

        /* if @资产账户编号# <> 0 then */
        if v_asset_acco_no <> 0 then

            /* [获取表记录变量语句][产品期货_资金_资产账户资金表][{当前金额},{冻结金额},{解冻金额},{占用保证金}][@当前金额#,@冻结金额#,@解冻金额#,@占用保证金#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select curr_amt,frozen_amt,unfroz_amt,capt_margin into v_curr_amt,v_frozen_amt,v_unfroz_amt,v_capt_margin from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @资产账户可用金额# = @当前金额# - @占用保证金# - @冻结金额# + @解冻金额#; */
                set v_asac_avail_amt = v_curr_amt - v_capt_margin - v_frozen_amt + v_unfroz_amt;
            end if;
        end if;

        /* if @交易组编号# <> 0 then */
        if v_exch_group_no <> 0 then

            /* [获取表记录变量语句][产品期货_资金_交易组资金表][{当前金额},{冻结金额},{解冻金额},{占用保证金}][@当前金额#,@冻结金额#,@解冻金额#,@占用保证金#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select curr_amt,frozen_amt,unfroz_amt,capt_margin into v_curr_amt,v_frozen_amt,v_unfroz_amt,v_capt_margin from db_pdfutu.tb_pdfuca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

            if FOUND_ROWS() <> 0 then

                /* set @交易组可用金额# = @当前金额# - @占用保证金# - @冻结金额# + @解冻金额#; */
                set v_exgp_avail_amt = v_curr_amt - v_capt_margin - v_frozen_amt + v_unfroz_amt;
            end if;
        end if;
    end if;

    /* if (@订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-卖出》) and @开平方向# = 《开平方向-平仓》 then */
    if (v_order_dir = 1 or v_order_dir = 2) and v_contrc_dir = 2 then

        /* if @订单方向# = 《订单方向-买入》 then */
        if v_order_dir = 1 then

            /* set @多空类型# = 《多空类型-空头》; */
            set v_lngsht_type = 2;
        else

            /* set @多空类型# = 《多空类型-多头》; */
            set v_lngsht_type = 1;
        end if;

        /* [获取表记录变量语句][产品期货_持仓_资产账户持仓表][{当前数量},{冻结数量},{解冻数量}][@当前数量#,@冻结数量#,@解冻数量#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
        select curr_qty,frozen_qty,unfroz_qty into v_curr_qty,v_frozen_qty,v_unfroz_qty from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @资产账户可用数量# = @当前数量# - @冻结数量# + @解冻数量#; */
            set v_asac_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty;
        end if;

        /* [获取表记录变量语句][产品期货_持仓_交易组持仓表][{当前数量},{冻结数量},{解冻数量}][@当前数量#,@冻结数量#,@解冻数量#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
        select curr_qty,frozen_qty,unfroz_qty into v_curr_qty,v_frozen_qty,v_unfroz_qty from db_pdfutu.tb_pdfupo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;

        if FOUND_ROWS() <> 0 then

            /* set @交易组可用数量# = @当前数量# - @冻结数量# + @解冻数量#; */
            set v_exgp_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty;
        end if;
    end if;

    /* set @交易组多头应收保证金# =0; */
    set v_exgp_long_rece_margin =0;

    /* set @交易组空头应收保证金# =0; */
    set v_exgp_short_rece_margin =0;

    /* if @组合编码#<>" " then */
    if v_comb_code<>" " then

        /* [获取表记录变量语句][产品期货_持仓_交易组持仓表][sum({应收保证金})][@交易组多头应收保证金#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {组合编码}=@组合编码# and {多空类型}=《多空类型-多头》 and {套保标志}=@套保标志#] */
        select sum(rece_margin) into v_exgp_long_rece_margin from db_pdfutu.tb_pdfupo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and comb_code=v_comb_code and lngsht_type=1 and hedge_type=v_hedge_type limit 1;


        /* set @交易组多头应收保证金# = ifnull(@交易组多头应收保证金#,0); */
        set v_exgp_long_rece_margin = ifnull(v_exgp_long_rece_margin,0);

        /* [获取表记录变量语句][产品期货_持仓_交易组持仓表][sum({应收保证金})][@交易组空头应收保证金#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {组合编码}=@组合编码# and {多空类型}=《多空类型-空头》 and {套保标志}=@套保标志#] */
        select sum(rece_margin) into v_exgp_short_rece_margin from db_pdfutu.tb_pdfupo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and comb_code=v_comb_code and lngsht_type=2 and hedge_type=v_hedge_type limit 1;


        /* set @交易组空头应收保证金# = ifnull(@交易组空头应收保证金#,0); */
        set v_exgp_short_rece_margin = ifnull(v_exgp_short_rece_margin,0);

        /* [获取表记录变量语句][产品期货_持仓_交易组持仓表][{应收保证金}][@交易组多头单票应收保证金#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {组合编码}=@组合编码# and {多空类型}=《多空类型-多头》 and {套保标志}=@套保标志# and {合约代码编号} = @合约代码编号#] */
        select rece_margin into v_exgp_long_stock_rece_margin from db_pdfutu.tb_pdfupo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and comb_code=v_comb_code and lngsht_type=1 and hedge_type=v_hedge_type and contrc_code_no = v_contrc_code_no limit 1;


        /* set @交易组多头单票应收保证金# = ifnull(@交易组多头单票应收保证金#,0); */
        set v_exgp_long_stock_rece_margin = ifnull(v_exgp_long_stock_rece_margin,0);

        /* [获取表记录变量语句][产品期货_持仓_交易组持仓表][sum({应收保证金})][@交易组空头单票应收保证金#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {组合编码}=@组合编码# and {多空类型}=《多空类型-空头》 and {套保标志}=@套保标志# and {合约代码编号} = @合约代码编号#] */
        select sum(rece_margin) into v_exgp_short_stock_rece_margin from db_pdfutu.tb_pdfupo_exgp_posi where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and comb_code=v_comb_code and lngsht_type=2 and hedge_type=v_hedge_type and contrc_code_no = v_contrc_code_no limit 1;


        /* set @交易组空头单票应收保证金# = ifnull(@交易组空头单票应收保证金#,0); */
        set v_exgp_short_stock_rece_margin = ifnull(v_exgp_short_stock_rece_margin,0);
    end if;
    #资产账户的暂不计算

    /* set @资产账户多头应收保证金# =0; */
    set v_asac_long_rece_margin =0;

    /* set @资产账户空头应收保证金# =0; */
    set v_asac_short_rece_margin =0;

    /* if @组合编码#<>" " then */
    if v_comb_code<>" " then

        /* [获取表记录变量语句][产品期货_持仓_资产账户持仓表][sum({应收保证金})][@资产账户多头应收保证金#][{资产账户编号}=@资产账户编号# and {组合编码}=@组合编码# and {多空类型}=《多空类型-多头》 and {套保标志}=@套保标志#] */
        select sum(rece_margin) into v_asac_long_rece_margin from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no=v_asset_acco_no and comb_code=v_comb_code and lngsht_type=1 and hedge_type=v_hedge_type limit 1;


        /* set @资产账户多头应收保证金# = ifnull(@资产账户多头应收保证金#,0); */
        set v_asac_long_rece_margin = ifnull(v_asac_long_rece_margin,0);

        /* [获取表记录变量语句][产品期货_持仓_资产账户持仓表][sum({应收保证金})][@资产账户空头应收保证金#][{资产账户编号}=@资产账户编号# and {组合编码}=@组合编码# and {多空类型}=《多空类型-空头》 and {套保标志}=@套保标志#] */
        select sum(rece_margin) into v_asac_short_rece_margin from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no=v_asset_acco_no and comb_code=v_comb_code and lngsht_type=2 and hedge_type=v_hedge_type limit 1;


        /* set @资产账户空头应收保证金# = ifnull(@资产账户空头应收保证金#,0); */
        set v_asac_short_rece_margin = ifnull(v_asac_short_rece_margin,0);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_futu_acco = v_futu_acco;
    SET p_exgp_avail_amt = v_exgp_avail_amt;
    SET p_asac_avail_amt = v_asac_avail_amt;
    SET p_exgp_avail_qty = v_exgp_avail_qty;
    SET p_asac_avail_qty = v_asac_avail_qty;
    SET p_exgp_long_rece_margin = v_exgp_long_rece_margin;
    SET p_exgp_short_rece_margin = v_exgp_short_rece_margin;
    SET p_asac_long_rece_margin = v_asac_long_rece_margin;
    SET p_asac_short_rece_margin = v_asac_short_rece_margin;
    SET p_exgp_long_stock_rece_margin = v_exgp_long_stock_rece_margin;
    SET p_exgp_short_stock_rece_margin = v_exgp_short_stock_rece_margin;

END;;


