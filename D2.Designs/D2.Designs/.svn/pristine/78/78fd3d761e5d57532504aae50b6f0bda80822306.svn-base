DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_查询风控所需交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_QueryExchGroupByRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_QueryExchGroupByRisk(
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
    

    /* 调用【原子_公共_风控接口_查询风控所需交易组信息】*/
    call db_pub.pra_riskif_QueryExchGroupByRisk(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_exch_group_status,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.27.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_风控接口_查询风控所需交易组信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_计算证券订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_CalcSecuOrderFee;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_CalcSecuOrderFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_all_fee decimal(18,4),
    OUT p_stock_type int,
    OUT p_asset_type int
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
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_all_fee decimal(18,4);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_pass_no int;
    declare v_stock_code_no int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_stock_code = p_stock_code;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_all_fee = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_pass_no = 0;
    SET v_stock_code_no = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
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

    
    label_pro:BEGIN
    

    /* set @费用数量# = @订单数量#; */
    set v_fee_qty = v_order_qty;

    /* set @费用价格# = @订单价格#; */
    set v_fee_price = v_order_price;

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* 调用【原子_公共_证券基础数据_获取风控计算费用证券代码属性】*/
    call db_pub.pra_basesedt_GetStockCodeInfoByRiskCalcFee(
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
        v_net_price_flag,
        v_par_value,
        v_bond_rate_type,
        v_bond_accr_intrst);
    if v_error_code = "1" then
        SET v_error_code = "pubT.27.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取风控计算费用证券代码属性出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @证券类型#>20 and @证券类型#<50 then */
    if v_stock_type>20 and v_stock_type<50 then

        /* if @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_net_price_flag = 1 and v_bond_rate_type <> 3 then

           /* set @费用价格# = @费用价格# + @债券计提利息#; */
           set v_fee_price = v_fee_price + v_bond_accr_intrst;
        end if;

        /* if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then */
        if v_order_dir = 3 or v_order_dir = 4 then

            /* set @费用价格# = @票面面值#; */
            set v_fee_price = v_par_value;
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
        SET v_error_code = "pubT.27.2.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @全部费用# = @交易佣金# + @印花税# + @过户费# + @经手费# + @证管费#  + @其他费用# + @其他佣金# + @交易征费# + @交易费# + @交易系统使用费# + @股份交收费#; */
    set v_all_fee = v_trade_commis + v_stamp_tax + v_trans_fee + v_brkage_fee + v_SEC_charges  + v_other_fee + v_other_commis + v_trade_tax + v_trade_cost_fee + v_trade_system_use_fee + v_stock_settle_fee;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_all_fee = v_all_fee;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_获取风控所需证券代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_GetStockCodeInfoByRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_GetStockCodeInfoByRisk(
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
    

    /* 调用【原子_公共_证券基础数据_获取风控所需证券代码信息】*/
    call db_pub.pra_basesedt_GetStockCodeInfoByRisk(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.27.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取风控所需证券代码信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_获取风控所需期货代码信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_GetFutuCodeInfoByRisk;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_GetFutuCodeInfoByRisk(
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
    

    /* 调用【原子_公共_风控接口_获取风控所需期货代码信息】*/
    call db_pub.pra_riskif_GetFutuCodeInfoByRisk(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pubT.27.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_风控接口_获取风控所需期货代码信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_获取港股通汇率信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_GetHKRate;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_GetHKRate(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* 调用【原子_公共_风控接口_获取港股通汇率信息】*/
    call db_pub.pra_riskif_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_error_code,
        v_error_info,
        v_sh_hk_buy_ref_rate,
        v_sh_hk_sell_ref_rate,
        v_sh_hk_settle_buy_rate,
        v_sh_hk_settle_sell_rate,
        v_sz_hk_buy_ref_rate,
        v_sz_hk_sell_ref_rate,
        v_sz_hk_settle_buy_rate,
        v_sz_hksettle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "pubT.27.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_风控接口_获取港股通汇率信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

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

# 事务_公共_风控接口_计算批量订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_CalcOrderBatchFee;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_CalcOrderBatchFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_order_dir_str varchar(1024),
    IN p_order_qty_str varchar(4096),
    IN p_order_price_str varchar(4096),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_all_fee_str varchar(4096)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_order_dir_str varchar(1024);
    declare v_order_qty_str varchar(4096);
    declare v_order_price_str varchar(4096);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_all_fee_str varchar(4096);
    declare v_pass_no int;
    declare v_split_str varchar(4);
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
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
    declare v_all_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_order_price_str = p_order_price_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_all_fee_str = " ";
    SET v_pass_no = 0;
    SET v_split_str = " ";
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_bond_rate_type = 0;
    SET v_bond_accr_intrst = 0;
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
    SET v_all_fee = 0;

    
    label_pro:BEGIN
    

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* set @全部费用串# = ""; */
    set v_all_fee_str = "";

    /* set @分隔符#= ';'; */
    set v_split_str= ';';

    /* while LOCATE(@分隔符#,@证券代码串#)<>0   do */
    while LOCATE(v_split_str,v_stock_code_str)<>0   do
        #截取前面每一位

        /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1) as SIGNED); */
        set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @证券代码#=substring(@证券代码串#,1,LOCATE(@分隔符#,@证券代码串#)-1); */
        set v_stock_code=substring(v_stock_code_str,1,LOCATE(v_split_str,v_stock_code_str)-1);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @费用数量# = @订单数量#; */
        set v_fee_qty = v_order_qty;

        /* set @费用价格# = @订单价格#; */
        set v_fee_price = v_order_price;

        /* set @通道编号# = 0; */
        set v_pass_no = 0;

        /* 调用【原子_公共_证券基础数据_获取风控计算费用证券代码属性】*/
        call db_pub.pra_basesedt_GetStockCodeInfoByRiskCalcFee(
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
            v_net_price_flag,
            v_par_value,
            v_bond_rate_type,
            v_bond_accr_intrst);
        if v_error_code = "1" then
            SET v_error_code = "pubT.27.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券基础数据_获取风控计算费用证券代码属性出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* if @证券类型#>20 and @证券类型#<50 then */
        if v_stock_type>20 and v_stock_type<50 then

            /* if @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
            if v_net_price_flag = 1 and v_bond_rate_type <> 3 then

               /* set @费用价格# = @费用价格# + @债券计提利息#; */
               set v_fee_price = v_fee_price + v_bond_accr_intrst;
            end if;

            /* if @订单方向# = 《订单方向-融资回购》 or @订单方向# = 《订单方向-融券回购》 then */
            if v_order_dir = 3 or v_order_dir = 4 then

                /* set @费用价格# = @票面面值#; */
                set v_fee_price = v_par_value;
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
            SET v_error_code = "pubT.27.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_证券费用_计算证券费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @全部费用# = @交易佣金# + @印花税# + @过户费# + @经手费# + @证管费#  + @其他费用# + @其他佣金# + @交易征费# + @交易费# + @交易系统使用费# + @股份交收费#; */
        set v_all_fee = v_trade_commis + v_stamp_tax + v_trans_fee + v_brkage_fee + v_SEC_charges  + v_other_fee + v_other_commis + v_trade_tax + v_trade_cost_fee + v_trade_system_use_fee + v_stock_settle_fee;

        /* set @全部费用串# = concat(@全部费用串#,@全部费用#,";"); */
        set v_all_fee_str = concat(v_all_fee_str,v_all_fee,";");

        /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
        set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @证券代码串#=substring(@证券代码串#,LOCATE(@分隔符#,@证券代码串#)+1); */
        set v_stock_code_str=substring(v_stock_code_str,LOCATE(v_split_str,v_stock_code_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_all_fee_str = v_all_fee_str;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_更新交易组证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_UpdateExchGroupSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_UpdateExchGroupSecuAsset(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_风控接口_更新交易组证券资产】*/
        call db_pub.pra_riskif_UpdateExchGroupSecuAsset(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_crncy_type,
            v_asset_item,
            v_asset_value,
            v_error_code,
            v_error_info,
            v_exgp_asset_id,
            v_exch_group_net_asset,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.27.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_风控接口_更新交易组证券资产出现错误！',v_mysql_message);
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
    SET p_exgp_asset_id = v_exgp_asset_id;
    SET p_exch_group_net_asset = v_exch_group_net_asset;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_更新交易组期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_UpdateExchGroupFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_UpdateExchGroupFutuAsset(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_公共_风控接口_更新交易组期货资产】*/
        call db_pub.pra_riskif_UpdateExchGroupFutuAsset(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_crncy_type,
            v_asset_item,
            v_asset_value,
            v_error_code,
            v_error_info,
            v_exgp_asset_id,
            v_exch_group_net_asset,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pubT.27.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_风控接口_更新交易组期货资产出现错误！',v_mysql_message);
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
    SET p_exgp_asset_id = v_exgp_asset_id;
    SET p_exch_group_net_asset = v_exch_group_net_asset;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pub;;

# 事务_公共_风控接口_计算批量期货订单费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_riskif_CalcFutuOrderBatchFee;;
DELIMITER ;;
CREATE PROCEDURE prt_riskif_CalcFutuOrderBatchFee(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_contrc_code_str varchar(4096),
    IN p_contrc_type_str varchar(2048),
    IN p_contrc_unit_str varchar(4096),
    IN p_order_dir_str varchar(1024),
    IN p_contrc_dir_str varchar(64),
    IN p_order_qty_str varchar(4096),
    IN p_order_price_str varchar(4096),
    IN p_hedge_type_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_all_fee_str varchar(4096)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_contrc_code_str varchar(4096);
    declare v_contrc_type_str varchar(2048);
    declare v_contrc_unit_str varchar(4096);
    declare v_order_dir_str varchar(1024);
    declare v_contrc_dir_str varchar(64);
    declare v_order_qty_str varchar(4096);
    declare v_order_price_str varchar(4096);
    declare v_hedge_type_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_all_fee_str varchar(4096);
    declare v_pass_no int;
    declare v_split_str varchar(4);
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_hedge_type int;
    declare v_fee_qty decimal(18,2);
    declare v_fee_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_price_type int;
    declare v_contrc_code_no int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_rece_margin decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_margin_ratio decimal(18,12);
    declare v_all_fee decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_contrc_code_str = p_contrc_code_str;
    SET v_contrc_type_str = p_contrc_type_str;
    SET v_contrc_unit_str = p_contrc_unit_str;
    SET v_order_dir_str = p_order_dir_str;
    SET v_contrc_dir_str = p_contrc_dir_str;
    SET v_order_qty_str = p_order_qty_str;
    SET v_order_price_str = p_order_price_str;
    SET v_hedge_type_str = p_hedge_type_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_all_fee_str = " ";
    SET v_pass_no = 0;
    SET v_split_str = " ";
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_hedge_type = 0;
    SET v_fee_qty = 0;
    SET v_fee_price = 0;
    SET v_wtdraw_qty = 0;
    SET v_price_type = 0;
    SET v_contrc_code_no = 0;
    SET v_asset_type = 0;
    SET v_crncy_type = "CNY";
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_rece_margin = 0;
    SET v_trade_commis = 0;
    SET v_service_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_other_fee = 0;
    SET v_other_commis = 0;
    SET v_margin_ratio = 0;
    SET v_all_fee = 0;

    
    label_pro:BEGIN
    

    /* set @通道编号# = 0; */
    set v_pass_no = 0;

    /* set @全部费用串# = ""; */
    set v_all_fee_str = "";

    /* set @分隔符#= ';'; */
    set v_split_str= ';';

    /* while LOCATE(@分隔符#,@合约代码串#)<>0   do */
    while LOCATE(v_split_str,v_contrc_code_str)<>0   do
        #截取前面每一位

        /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1) as SIGNED); */
        set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1) as SIGNED);

        /* set @市场编号#=cast(substring(@市场编号串#,1,LOCATE(@分隔符#,@市场编号串#)-1) as SIGNED); */
        set v_exch_no=cast(substring(v_exch_no_str,1,LOCATE(v_split_str,v_exch_no_str)-1) as SIGNED);

        /* set @合约代码#=substring(@合约代码串#,1,LOCATE(@分隔符#,@合约代码串#)-1); */
        set v_contrc_code=substring(v_contrc_code_str,1,LOCATE(v_split_str,v_contrc_code_str)-1);

        /* set @合约类型#=substring(@合约类型串#,1,LOCATE(@分隔符#,@合约类型串#)-1); */
        set v_contrc_type=substring(v_contrc_type_str,1,LOCATE(v_split_str,v_contrc_type_str)-1);

        /* set @合约乘数#=cast(substring(@合约乘数串#,1,LOCATE(@分隔符#,@合约乘数串#)-1) as SIGNED); */
        set v_contrc_unit=cast(substring(v_contrc_unit_str,1,LOCATE(v_split_str,v_contrc_unit_str)-1) as SIGNED);

        /* set @订单方向#=cast(substring(@订单方向串#,1,LOCATE(@分隔符#,@订单方向串#)-1) as SIGNED); */
        set v_order_dir=cast(substring(v_order_dir_str,1,LOCATE(v_split_str,v_order_dir_str)-1) as SIGNED);

        /* set @开平方向#=cast(substring(@开平方向串#,1,LOCATE(@分隔符#,@开平方向串#)-1) as SIGNED); */
        set v_contrc_dir=cast(substring(v_contrc_dir_str,1,LOCATE(v_split_str,v_contrc_dir_str)-1) as SIGNED);

        /* set @订单价格#=cast(substring(@订单价格串#,1,LOCATE(@分隔符#,@订单价格串#)-1) as decimal(16,9)); */
        set v_order_price=cast(substring(v_order_price_str,1,LOCATE(v_split_str,v_order_price_str)-1) as decimal(16,9));

        /* set @订单数量#=cast(substring(@订单数量串#,1,LOCATE(@分隔符#,@订单数量串#)-1) as decimal(18,2)); */
        set v_order_qty=cast(substring(v_order_qty_str,1,LOCATE(v_split_str,v_order_qty_str)-1) as decimal(18,2));

        /* set @套保标志#=cast(substring(@套保标志串#,1,LOCATE(@分隔符#,@套保标志串#)-1) as decimal(18,2)); */
        set v_hedge_type=cast(substring(v_hedge_type_str,1,LOCATE(v_split_str,v_hedge_type_str)-1) as decimal(18,2));

        /* set @费用数量# = @订单数量#; */
        set v_fee_qty = v_order_qty;

        /* set @费用价格# = @订单价格#; */
        set v_fee_price = v_order_price;

        /* set @撤单数量# = @订单数量#; */
        set v_wtdraw_qty = v_order_qty;

        /* set @价格类型# = 《价格类型-限价》; */
        set v_price_type = 1;

        /* 调用【原子_公共_期货基础数据_检查期货交易业务属性】*/
        call db_pub.pra_basefudt_CheckFutuExchProp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_no,
            v_contrc_code,
            v_order_dir,
            v_contrc_dir,
            v_order_qty,
            v_price_type,
            v_error_code,
            v_error_info,
            v_contrc_code_no,
            v_contrc_type,
            v_asset_type,
            v_crncy_type,
            v_capit_reback_days,
            v_posi_reback_days,
            v_contrc_unit);
        if v_error_code = "1" then
            SET v_error_code = "pubT.27.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货基础数据_检查期货交易业务属性出现错误！',v_mysql_message);
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
            SET v_error_code = "pubT.27.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_公共_期货费用_计算期货费用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @全部费用# = @交易佣金# + @其他佣金# + @申报费用# + @撤单费用#; */
        set v_all_fee = v_trade_commis + v_other_commis + v_report_fee + v_wtdraw_fee;

        /* set @全部费用串# = concat(@全部费用串#,@全部费用#,";"); */
        set v_all_fee_str = concat(v_all_fee_str,v_all_fee,";");

        /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
        set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);

        /* set @市场编号串#=substring(@市场编号串#,LOCATE(@分隔符#,@市场编号串#)+1); */
        set v_exch_no_str=substring(v_exch_no_str,LOCATE(v_split_str,v_exch_no_str)+1);

        /* set @合约代码串#=substring(@合约代码串#,LOCATE(@分隔符#,@合约代码串#)+1); */
        set v_contrc_code_str=substring(v_contrc_code_str,LOCATE(v_split_str,v_contrc_code_str)+1);

        /* set @合约类型串#=substring(@合约类型串#,LOCATE(@分隔符#,@合约类型串#)+1); */
        set v_contrc_type_str=substring(v_contrc_type_str,LOCATE(v_split_str,v_contrc_type_str)+1);

        /* set @合约乘数串#=substring(@合约乘数串#,LOCATE(@分隔符#,@合约乘数串#)+1); */
        set v_contrc_unit_str=substring(v_contrc_unit_str,LOCATE(v_split_str,v_contrc_unit_str)+1);

        /* set @订单方向串#=substring(@订单方向串#,LOCATE(@分隔符#,@订单方向串#)+1); */
        set v_order_dir_str=substring(v_order_dir_str,LOCATE(v_split_str,v_order_dir_str)+1);

        /* set @开平方向串#=substring(@开平方向串#,LOCATE(@分隔符#,@开平方向串#)+1); */
        set v_contrc_dir_str=substring(v_contrc_dir_str,LOCATE(v_split_str,v_contrc_dir_str)+1);

        /* set @订单价格串#=substring(@订单价格串#,LOCATE(@分隔符#,@订单价格串#)+1); */
        set v_order_price_str=substring(v_order_price_str,LOCATE(v_split_str,v_order_price_str)+1);

        /* set @订单数量串#=substring(@订单数量串#,LOCATE(@分隔符#,@订单数量串#)+1); */
        set v_order_qty_str=substring(v_order_qty_str,LOCATE(v_split_str,v_order_qty_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_all_fee_str = v_all_fee_str;

END;;


