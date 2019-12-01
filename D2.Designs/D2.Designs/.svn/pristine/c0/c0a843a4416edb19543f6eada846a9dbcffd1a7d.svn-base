DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_检查系统状态权限身份市场币种
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CheckSysStatusAuthOperMoneyType;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CheckSysStatusAuthOperMoneyType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_busi_config_str varchar(64),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_sys_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_busi_config_str = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_sys_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_检查系统状态】*/
    call db_pub.pra_base_CheckSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_基础_获取市场本币币种汇率】*/
    call db_pub.pra_base_GetExchMoneyTypeExchRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场本币币种汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_busi_config_str = v_co_busi_config_str;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_检查系统状态权限身份新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CheckSysStatusAuthOperNewStockInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CheckSysStatusAuthOperNewStockInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_menu_no int,
    IN p_pd_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_opor_pwd varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_stock_code_no int,
    OUT p_stock_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_menu_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_opor_pwd varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_sys_config_str varchar(64);
    declare v_co_busi_config_str varchar(64);
    declare v_opor_type int;
    declare v_oper_rights int;
    declare v_is_trader int;
    declare v_online_opor_no_str varchar(2048);
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_menu_no = p_menu_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_opor_pwd = p_opor_pwd;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_sys_config_str = " ";
    SET v_co_busi_config_str = " ";
    SET v_opor_type = 0;
    SET v_oper_rights = 0;
    SET v_is_trader = 0;
    SET v_online_opor_no_str = " ";
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_基础_检查系统状态】*/
    call db_pub.pra_base_CheckSysStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_init_date,
        v_sys_config_str,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_检查系统状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_用户_检查操作员身份】*/
    call db_pub.pra_user_CheckOperatorAuth(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_pwd,
        v_error_code,
        v_error_info,
        v_opor_type,
        v_oper_rights,
        v_is_trader,
        v_online_opor_no_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_用户_检查操作员身份出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_权限_检查菜单功能权限】*/
    call db_pub.pra_perm_CheckMenuFuncRights(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_opor_type,
        v_menu_no,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_权限_检查菜单功能权限出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    #[原子_公共_用户_获取产品默认交易组编号]

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_计算证券清算费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CalcSecuClearFee;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CalcSecuClearFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_trade_tax decimal(18,4),
    OUT p_trade_cost_fee decimal(18,4),
    OUT p_trade_system_use_fee decimal(18,4),
    OUT p_stock_settle_fee decimal(18,4),
    OUT p_settle_buy_rate decimal(18,12),
    OUT p_settle_sell_rate decimal(18,12)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strike_date int;
    declare v_co_no int;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_order_qty decimal(18,2);
    declare v_tmp_trade_commis decimal(18,4);
    declare v_init_date int;
    declare v_exch_rate decimal(18,12);
    declare v_tmp_fee_price decimal(16,9);
    declare v_repo_back_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_strike_date = p_strike_date;
    SET v_co_no = p_co_no;
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_order_qty = 0;
    SET v_tmp_trade_commis = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_exch_rate = 0;
    SET v_tmp_fee_price = 0;
    SET v_repo_back_date = 0;

    
    label_pro:BEGIN
    

    /* set @订单数量# = @费用数量#; */
    set v_order_qty = v_fee_qty;
    #获取市场本币币种及交易币种，以及币种汇率
    #[原子_公共_基础_获取市场本币币种汇率]
    #如果是港股交易, 交易佣金重新按人民币进行计算

    /* set @临时_交易佣金# = 0; */
    set v_tmp_trade_commis = 0;

    /* if @市场编号# =《市场编号-沪港通证券交易所》 or @市场编号# = 《市场编号-深港通证券交易所》 then */
    if v_exch_no =3 or v_exch_no = 4 then

        /* set @初始化日期# = @成交日期#; */
        set v_init_date = v_strike_date;

        /* 调用【原子_公共_清算接口_获取港股通结算汇率】*/
        call db_pub.pra_clearif_GetHKSettleRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_exch_no,
            v_error_code,
            v_error_info,
            v_settle_buy_rate,
            v_settle_sell_rate);
        if v_error_code = "1" then
            SET v_error_code = "pubT.26.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取港股通结算汇率出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [检查报错返回][@卖出结算汇率# = 0 or @买入结算汇率# = 0][1]["结算汇率未录入"] */
        if v_settle_sell_rate = 0 or v_settle_buy_rate = 0 then
            
            SET v_error_code = "pubT.26.21.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("结算汇率未录入","#",v_mysql_message);
            else
                SET v_error_info = "结算汇率未录入";
            end if;
            leave label_pro;
        end if;


        /* if @订单方向# = 《订单方向-买入》 then */
        if v_order_dir = 1 then

            /* set @汇率# = @卖出结算汇率#; */
            set v_exch_rate = v_settle_sell_rate;
        else

            /* set @汇率# = @卖出结算汇率#; */
            set v_exch_rate = v_settle_sell_rate;
        end if;

        /* set @临时_费用价格# = @费用价格#; */
        set v_tmp_fee_price = v_fee_price;

        /* set @费用价格# = @费用价格# * @汇率#; */
        set v_fee_price = v_fee_price * v_exch_rate;

        /* 调用【事务_公共_清算接口_计算证券清算交易佣金费用】*/
        call db_pub.prt_clearif_CalcSecuClearTradeCommisFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_strike_date,
            v_co_no,
            v_pass_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_code_no,
            v_stock_type,
            v_order_dir,
            v_fee_qty,
            v_fee_price,
            v_net_price_flag,
            v_par_value,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_error_code,
            v_error_info,
            v_crncy_type,
            v_exch_crncy_type,
            v_trade_commis);
        if v_error_code = "1" then
            SET v_error_code = "pubT.26.21.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程事务_公共_清算接口_计算证券清算交易佣金费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @临时_交易佣金#＝@交易佣金#; */
        set v_tmp_trade_commis=v_trade_commis;

        /* set @费用价格# = @临时_费用价格#; */
        set v_fee_price = v_tmp_fee_price;
    end if;

    /* set @回购到期日期# = 0; */
    set v_repo_back_date = 0;
    #如果是债券类型，需要获取债券计提利益

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* if (@订单方向# = 《订单方向-融资回购》) or (@订单方向# = 《订单方向-融券回购》) then */
        if (v_order_dir = 3) or (v_order_dir = 4) then
            #只有回购才需要重置费用价格

            /* set @费用价格#=@票面面值#; */
            set v_fee_price=v_par_value;
        else

            /* if @净价标志# = 《净价标志-净价》 and @债券利率类型#<>《债券利率类型-零息》 then */
            if v_net_price_flag = 1 and v_bond_rate_type<>3 then

                /* set @费用价格# = @费用价格# + @债券计提利息#; */
                set v_fee_price = v_fee_price + v_bond_accr_intrst;
            end if;
        end if;
    end if;

    /* 调用【原子_公共_证券费用_计算证券费用】*/
    call db_pub.pra_feesecu_CalcSecuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_order_dir,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_trade_tax,
        v_trade_cost_fee,
        v_trade_system_use_fee,
        v_stock_settle_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @临时_交易佣金# <> 0 then */
    if v_tmp_trade_commis <> 0 then

        /* set @交易佣金# = @临时_交易佣金#; */
        set v_trade_commis = v_tmp_trade_commis;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;
    SET p_settle_buy_rate = v_settle_buy_rate;
    SET p_settle_sell_rate = v_settle_sell_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_计算证券合并清算费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CalcSecuMergeClearFee;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CalcSecuMergeClearFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_chann_commis decimal(18,4),
    OUT p_divi_commis decimal(18,4),
    OUT p_out_stamp_tax decimal(18,4),
    OUT p_out_trans_fee decimal(18,4),
    OUT p_out_brkage decimal(18,4),
    OUT p_out_SEC_charges decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_out_chann_commis decimal(18,4),
    OUT p_out_divi_commis decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strike_date int;
    declare v_co_no int;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_out_stamp_tax decimal(18,4);
    declare v_out_trans_fee decimal(18,4);
    declare v_out_brkage decimal(18,4);
    declare v_out_SEC_charges decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_out_chann_commis decimal(18,4);
    declare v_out_divi_commis decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_repo_back_date int;
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_strike_date = p_strike_date;
    SET v_co_no = p_co_no;
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_out_stamp_tax = 0;
    SET v_out_trans_fee = 0;
    SET v_out_brkage = 0;
    SET v_out_SEC_charges = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_out_chann_commis = 0;
    SET v_out_divi_commis = 0;
    SET v_order_qty = 0;
    SET v_repo_back_date = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;

    
    label_pro:BEGIN
    

    /* set @订单数量# = @费用数量#; */
    set v_order_qty = v_fee_qty;

    /* set @回购到期日期# = 0; */
    set v_repo_back_date = 0;
    #如果是债券类型，需要获取债券计提利益

    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* if (@订单方向# = 《订单方向-融资回购》) or (@订单方向# = 《订单方向-融券回购》) then */
        if (v_order_dir = 3) or (v_order_dir = 4) then
            #只有回购才需要重置费用价格

            /* set @费用价格#=@票面面值#; */
            set v_fee_price=v_par_value;
        else

            /* if @净价标志# = 《净价标志-净价》 and @债券利率类型#<>《债券利率类型-零息》 then */
            if v_net_price_flag = 1 and v_bond_rate_type<>3 then

                /* set @费用价格# = @费用价格# + @债券计提利息#; */
                set v_fee_price = v_fee_price + v_bond_accr_intrst;
            end if;
        end if;
    end if;

    /* 调用【原子_公共_证券费用_计算证券费用】*/
    call db_pub.pra_feesecu_CalcSecuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_order_dir,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_stamp_tax,
        v_trans_fee,
        v_brkage_fee,
        v_SEC_charges,
        v_other_fee,
        v_trade_commis,
        v_other_commis,
        v_trade_tax,
        v_trade_cost_fee,
        v_trade_system_use_fee,
        v_stock_settle_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_chann_commis = v_chann_commis;
    SET p_divi_commis = v_divi_commis;
    SET p_out_stamp_tax = v_out_stamp_tax;
    SET p_out_trans_fee = v_out_trans_fee;
    SET p_out_brkage = v_out_brkage;
    SET p_out_SEC_charges = v_out_SEC_charges;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_out_chann_commis = v_out_chann_commis;
    SET p_out_divi_commis = v_out_divi_commis;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_计算证券清算交易佣金费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CalcSecuClearTradeCommisFee;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CalcSecuClearTradeCommisFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_trade_commis decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strike_date int;
    declare v_co_no int;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_trade_commis decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_contrc_dir int;
    declare v_secu_fee_type int;
    declare v_fee_no int;
    declare v_tax_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_strike_date = p_strike_date;
    SET v_co_no = p_co_no;
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_trade_commis = 0;
    SET v_order_qty = 0;
    SET v_contrc_dir = 0;
    SET v_secu_fee_type = 0;
    SET v_fee_no = 0;
    SET v_tax_fee = 0;

    
    label_pro:BEGIN
    

    /* set @订单数量# = @费用数量#; */
    set v_order_qty = v_fee_qty;

    /* set @开平方向# = 0; */
    set v_contrc_dir = 0;

    /* set @证券费用类型#=《证券费用类型-交易佣金》; */
    set v_secu_fee_type=7;

    /* set @费用编号#=《证券费用类型-交易佣金》*10000+@订单方向#*100+@开平方向#; */
    set v_fee_no=7*10000+v_order_dir*100+v_contrc_dir;

    /* 调用【原子_公共_证券费用_计算证券指定费用】*/
    call db_pub.pra_feesecu_CalcSecuSpecFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_stock_code_no,
        v_exch_no,
        v_stock_type,
        v_secu_fee_type,
        v_fee_no,
        v_fee_qty,
        v_fee_price,
        v_order_qty,
        v_error_code,
        v_error_info,
        v_tax_fee);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.23.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券指定费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @交易佣金#=@税费费用#; */
    set v_trade_commis=v_tax_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_trade_commis = v_trade_commis;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_证券价格除权处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_SecuPriceExRightsDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_SecuPriceExRightsDeal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_price_occur_amt decimal(18,4),
    IN p_price_occur_ratio decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_target_code varchar(6),
    OUT p_target_code_no int,
    OUT p_impawn_ratio decimal(18,12)
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
    declare v_price_occur_amt decimal(18,4);
    declare v_price_occur_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_target_code varchar(6);
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_price_occur_amt = p_price_occur_amt;
    SET v_price_occur_ratio = p_price_occur_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_target_code = " ";
    SET v_target_code_no = 0;
    SET v_impawn_ratio = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_清算接口_证券价格除权处理】*/
        call db_pub.pra_clearif_SecuPriceExRightsDeal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_stock_code_no,
            v_price_occur_amt,
            v_price_occur_ratio,
            v_error_code,
            v_error_info,
            v_target_code,
            v_target_code_no,
            v_impawn_ratio);
        if v_error_code = "1" then
            SET v_error_code = "pubT.26.31.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_证券价格除权处理出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_target_code = v_target_code;
    SET p_target_code_no = v_target_code_no;
    SET p_impawn_ratio = v_impawn_ratio;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_计算期货清算费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CalcFutuClearFee;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CalcFutuClearFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_contrc_unit int,
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_rece_margin decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_rece_margin decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_other_commis decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strike_date int;
    declare v_co_no int;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_rece_margin decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_rece_margin decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_margin_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_strike_date = p_strike_date;
    SET v_co_no = p_co_no;
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_fee_price = p_fee_price;
    SET v_contrc_unit = p_contrc_unit;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_rece_margin = 0;
    SET v_trade_commis = 0;
    SET v_service_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_out_rece_margin = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_service_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_other_commis = 0;
    SET v_margin_ratio = 0;

    
    label_pro:BEGIN
    
    #获取市场本币币种及交易币种，以及币种汇率

    /* 调用【原子_公共_基础_获取市场本币币种汇率】*/
    call db_pub.pra_base_GetExchMoneyTypeExchRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_crncy_type,
        v_exch_crncy_type,
        v_exch_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_基础_获取市场本币币种汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_期货费用_计算期货费用】*/
    call db_pub.pra_feefutu_CalcFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_rece_margin,
        v_trade_commis,
        v_service_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_deli_fee,
        v_other_fee,
        v_other_commis,
        v_margin_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_期货费用_计算外部期货费用】*/
    call db_pub.pra_feefutu_CalcOutFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_error_code,
        v_error_info,
        v_out_rece_margin,
        v_out_brkage_commis,
        v_out_service_fee,
        v_out_report_fee,
        v_out_cancel_fee,
        v_out_deli_fee,
        v_out_other_fee,
        v_out_other_commis);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算外部期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_rece_margin = v_rece_margin;
    SET p_trade_commis = v_trade_commis;
    SET p_service_fee = v_service_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_other_fee = v_other_fee;
    SET p_other_commis = v_other_commis;
    SET p_out_rece_margin = v_out_rece_margin;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_other_commis = v_out_other_commis;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_计算期货合并清算费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CalcFutuMergeClearFee;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CalcFutuMergeClearFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_co_no int,
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_contrc_unit int,
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_rece_margin decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_rece_margin decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_other_commis decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strike_date int;
    declare v_co_no int;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_rece_margin decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_rece_margin decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_margin_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_strike_date = p_strike_date;
    SET v_co_no = p_co_no;
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_fee_price = p_fee_price;
    SET v_contrc_unit = p_contrc_unit;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_rece_margin = 0;
    SET v_trade_commis = 0;
    SET v_service_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_out_rece_margin = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_service_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_other_commis = 0;
    SET v_margin_ratio = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_期货费用_计算期货费用】*/
    call db_pub.pra_feefutu_CalcFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_hedge_type,
        v_error_code,
        v_error_info,
        v_rece_margin,
        v_trade_commis,
        v_service_fee,
        v_report_fee,
        v_wtdraw_fee,
        v_deli_fee,
        v_other_fee,
        v_other_commis,
        v_margin_ratio);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_公共_期货费用_计算外部期货费用】*/
    call db_pub.pra_feefutu_CalcOutFutuFee(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_asset_acco_no,
        v_contrc_code_no,
        v_exch_no,
        v_contrc_type,
        v_order_dir,
        v_contrc_dir,
        v_fee_qty,
        v_order_qty,
        v_wtdraw_qty,
        v_fee_price,
        v_contrc_unit,
        v_error_code,
        v_error_info,
        v_out_rece_margin,
        v_out_brkage_commis,
        v_out_service_fee,
        v_out_report_fee,
        v_out_cancel_fee,
        v_out_deli_fee,
        v_out_other_fee,
        v_out_other_commis);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算外部期货费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_rece_margin = v_rece_margin;
    SET p_trade_commis = v_trade_commis;
    SET p_service_fee = v_service_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_other_fee = v_other_fee;
    SET p_other_commis = v_other_commis;
    SET p_out_rece_margin = v_out_rece_margin;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_other_commis = v_out_other_commis;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取合约交割参数记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetDeliParam;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetDeliParam(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_deli_price decimal(16,9)
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
    declare v_contrc_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deli_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deli_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取合约交割参数记录】*/
    call db_pub.pra_clearif_GetDeliParam(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_deli_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取合约交割参数记录出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_deli_price = v_deli_price;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取保证金优惠组合编码
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetCombinationCode;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetCombinationCode(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_contrc_type int,
    IN p_contrc_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comb_code varchar(6),
    OUT p_comb_type int
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
    declare v_contrc_type int;
    declare v_contrc_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comb_code varchar(6);
    declare v_comb_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_code = p_contrc_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comb_code = " ";
    SET v_comb_type = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取保证金优惠组合编码】*/
    call db_pub.pra_clearif_GetCombinationCode(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_contrc_type,
        v_contrc_code,
        v_error_code,
        v_error_info,
        v_comb_code,
        v_comb_type);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.64.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取保证金优惠组合编码出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comb_code = v_comb_code;
    SET p_comb_type = v_comb_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取代码编号合约代码属性
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetCodeNoContrcCodeProp;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetCodeNoContrcCodeProp(
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
    OUT p_exch_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_name varchar(64),
    OUT p_contrc_type int,
    OUT p_margin_pref int,
    OUT p_contrc_unit int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_expire_date int,
    OUT p_begin_deli_date int,
    OUT p_end_deli_date int,
    OUT p_deli_price decimal(16,9)
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
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_margin_pref int;
    declare v_contrc_unit int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_expire_date int;
    declare v_begin_deli_date int;
    declare v_end_deli_date int;
    declare v_deli_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_name = " ";
    SET v_contrc_type = 0;
    SET v_margin_pref = 0;
    SET v_contrc_unit = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_end_deli_date = date_format(curdate(),'%Y%m%d');
    SET v_deli_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取代码编号合约代码属性】*/
    call db_pub.pra_clearif_GetCodeNoContrcCodeProp(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_error_code,
        v_error_info,
        v_exch_no,
        v_contrc_code,
        v_contrc_name,
        v_contrc_type,
        v_contrc_unit,
        v_margin_pref,
        v_capit_reback_days,
        v_posi_reback_days,
        v_expire_date,
        v_begin_deli_date,
        v_end_deli_date,
        v_deli_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.65.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取代码编号合约代码属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_name = v_contrc_name;
    SET p_contrc_type = v_contrc_type;
    SET p_margin_pref = v_margin_pref;
    SET p_contrc_unit = v_contrc_unit;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_expire_date = v_expire_date;
    SET p_begin_deli_date = v_begin_deli_date;
    SET p_end_deli_date = v_end_deli_date;
    SET p_deli_price = v_deli_price;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取期货结算价
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetContrcSettPrice;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetContrcSettPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_contrc_code_no int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sett_price decimal(16,9),
    OUT p_pre_settle_price decimal(16,9)
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_price = 0;
    SET v_pre_settle_price = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取期货结算价】*/
    call db_pub.pra_clearif_GetContrcSettPrice(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_contrc_code_no,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_sett_price,
        v_pre_settle_price);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.66.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取期货结算价出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sett_price = v_sett_price;
    SET p_pre_settle_price = v_pre_settle_price;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_计算期货清算保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_CalcFutuClearMargin;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_CalcFutuClearMargin(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pass_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_order_dir int,
    IN p_contrc_dir int,
    IN p_fee_qty decimal(18,2),
    IN p_fee_price decimal(16,9),
    IN p_contrc_unit int,
    IN p_hedge_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_rece_margin decimal(18,4),
    OUT p_out_rece_margin decimal(18,4)
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
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_hedge_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_rece_margin decimal(18,4);
    declare v_out_rece_margin decimal(18,4);
    declare v_order_qty decimal(18,2);
    declare v_futu_fee_type int;
    declare v_fee_no int;
    declare v_tax_fee decimal(18,4);
    declare v_amt_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_pass_no = p_pass_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_order_dir = p_order_dir;
    SET v_contrc_dir = p_contrc_dir;
    SET v_fee_qty = p_fee_qty;
    SET v_fee_price = p_fee_price;
    SET v_contrc_unit = p_contrc_unit;
    SET v_hedge_type = p_hedge_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_rece_margin = 0;
    SET v_out_rece_margin = 0;
    SET v_order_qty = 0;
    SET v_futu_fee_type = 0;
    SET v_fee_no = 0;
    SET v_tax_fee = 0;
    SET v_amt_ratio = 0;

    
    label_pro:BEGIN
    

    /* set @订单数量# = @费用数量#; */
    set v_order_qty = v_fee_qty;
    #获取市场本币币种及交易币种，以及币种汇率

        /* set @期货费用类型#=《期货费用类型-期货保证金》; */
        set v_futu_fee_type=51;

        /* set @费用编号# = @期货费用类型#*10000 + @订单方向#*100 + @开平方向#; */
        set v_fee_no = v_futu_fee_type*10000 + v_order_dir*100 + v_contrc_dir;

        /* 调用【原子_公共_期货费用_计算期货指定费用】*/
        call db_pub.pra_feefutu_CalcFutuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_contrc_code_no,
            v_exch_no,
            v_contrc_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_contrc_unit,
            v_order_qty,
            v_hedge_type,
            v_error_code,
            v_error_info,
            v_tax_fee,
            v_amt_ratio);
        if v_error_code = "1" then
            SET v_error_code = "pubT.26.67.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @应收保证金#=@税费费用#; */
        set v_rece_margin=v_tax_fee;

        /* set @期货费用类型#=《期货费用类型-期货保证金》; */
        set v_futu_fee_type=51;

        /* set @费用编号# = @期货费用类型#*10000 + @订单方向#*100 + @开平方向#; */
        set v_fee_no = v_futu_fee_type*10000 + v_order_dir*100 + v_contrc_dir;

        /* 调用【原子_公共_期货费用_计算外部期货指定费用】*/
        call db_pub.pra_feefutu_CalcOutFutuSpecFee(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_pass_no,
            v_asset_acco_no,
            v_contrc_code_no,
            v_exch_no,
            v_contrc_type,
            v_fee_no,
            v_fee_qty,
            v_fee_price,
            v_contrc_unit,
            v_error_code,
            v_error_info,
            v_tax_fee);
        if v_error_code = "1" then
            SET v_error_code = "pubT.26.67.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算外部期货指定费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @外部应收保证金#=@税费费用#; */
        set v_out_rece_margin=v_tax_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_rece_margin = v_rece_margin;
    SET p_out_rece_margin = v_out_rece_margin;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取机构业务控制配置串
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetCoBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetCoBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_busi_config_str varchar(64)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取机构业务控制配置串】*/
    call db_pub.pra_clearif_GetCoBusiConfigStr(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_error_code,
        v_error_info,
        v_co_busi_config_str);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取机构业务控制配置串出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_busi_config_str = v_co_busi_config_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取港股通结算汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetHKSettleRate;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetHKSettleRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_settle_buy_rate decimal(18,12),
    OUT p_settle_sell_rate decimal(18,12)
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取港股通结算汇率】*/
    call db_pub.pra_clearif_GetHKSettleRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.81.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取港股通结算汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_settle_buy_rate = v_settle_buy_rate;
    SET p_settle_sell_rate = v_settle_sell_rate;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取港股通交收日期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetHKSettleDate;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetHKSettleDate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_settle_date int
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_settle_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_settle_date = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取港股通交收日期】*/
    call db_pub.pra_clearif_GetHKSettleDate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_settle_date);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取港股通交收日期出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_settle_date = v_settle_date;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetStockCodeNo;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetStockCodeNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int
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
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_清算接口_获取证券代码编号】*/
    call db_pub.pra_clearif_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.83.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_清算接口_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_清算接口_获取新股信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_clearif_GetNewStockInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_clearif_GetNewStockInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_code_no int,
    OUT p_stock_type int
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
    declare v_stock_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_par_value decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code = p_stock_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_par_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_证券基础数据_获取证券代码编号】*/
    call db_pub.pra_basesedt_GetStockCodeNo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_stock_code,
        v_error_code,
        v_error_info,
        v_stock_code_no,
        v_stock_type,
        v_asset_type,
        v_par_value);
    if v_error_code = "1" then
        SET v_error_code = "pubT.26.84.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取证券代码编号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_type = v_stock_type;

END;;


