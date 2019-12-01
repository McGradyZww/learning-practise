DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_策略插件上线
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_StrategePluginOnline;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_StrategePluginOnline(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_plugin_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strategy_plugin_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_plugin_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_plugin_status varchar(2);
    declare v_oper_func_code varchar(16);
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
    SET v_strategy_plugin_type = p_strategy_plugin_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_plugin_status = " ";
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @策略插件状态# = 《策略插件状态-上线》; */
    set v_strategy_plugin_status = "1";

    /* [插入重复更新][交易证券_策略_策略插件状态表][字段][字段变量][{策略插件状态}=@策略插件状态#][1][@策略插件类型#,@策略插件状态#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsest_strategypluginstatus (
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, strategy_plugin_status, strategy_plugin_type) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_strategy_plugin_status, v_strategy_plugin_type) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strategy_plugin_status=v_strategy_plugin_status;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.1.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略插件类型=",v_strategy_plugin_type,",","策略插件状态=",v_strategy_plugin_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略插件类型=",v_strategy_plugin_type,",","策略插件状态=",v_strategy_plugin_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strategy_plugin_status = v_strategy_plugin_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_策略插件下线
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_StrategePluginOffline;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_StrategePluginOffline(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_plugin_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strategy_plugin_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_plugin_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_plugin_status varchar(2);
    declare v_oper_func_code varchar(16);
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
    SET v_strategy_plugin_type = p_strategy_plugin_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_plugin_status = " ";
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @策略插件状态# = 《策略插件状态-下线》; */
    set v_strategy_plugin_status = "2";

    /* [插入重复更新][交易证券_策略_策略插件状态表][字段][字段变量][{策略插件状态}=@策略插件状态#][1][@策略插件类型#,@策略插件状态#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsest_strategypluginstatus (
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, strategy_plugin_status, strategy_plugin_type) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_strategy_plugin_status, v_strategy_plugin_type) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strategy_plugin_status=v_strategy_plugin_status;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.2.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略插件类型=",v_strategy_plugin_type,",","策略插件状态=",v_strategy_plugin_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略插件类型=",v_strategy_plugin_type,",","策略插件状态=",v_strategy_plugin_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strategy_plugin_status = v_strategy_plugin_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_校验新增策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_CheckAddStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_CheckAddStrategyOrder(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_exgp_avail_amt decimal(18,4),
    IN p_exgp_T_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T_hk_sell_total_amt decimal(18,4),
    IN p_exgp_T1_hk_buy_total_amt decimal(18,4),
    IN p_exgp_T1_hk_sell_total_amt decimal(18,4),
    IN p_asac_avail_amt decimal(18,4),
    IN p_asac_T_hk_buy_total_amt decimal(18,4),
    IN p_asac_T_hk_sell_total_amt decimal(18,4),
    IN p_asac_T1_hk_buy_total_amt decimal(18,4),
    IN p_asac_T1_hk_sell_total_amt decimal(18,4),
    IN p_exgp_avail_qty decimal(18,2),
    IN p_exgp_target_code_avail_qty decimal(18,2),
    IN p_exgp_trade_code_avail_qty decimal(18,2),
    IN p_asac_avail_qty decimal(18,2),
    IN p_asac_target_code_avail_qty decimal(18,2),
    IN p_asac_trade_code_avail_qty decimal(18,2),
    IN p_exgp_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_strategy_dir int,
    IN p_strategy_qty decimal(18,2),
    IN p_strategy_amt decimal(18,4),
    IN p_impawn_ratio decimal(18,12),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_avail_amt decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_exgp_avail_qty decimal(18,2);
    declare v_exgp_target_code_avail_qty decimal(18,2);
    declare v_exgp_trade_code_avail_qty decimal(18,2);
    declare v_asac_avail_qty decimal(18,2);
    declare v_asac_target_code_avail_qty decimal(18,2);
    declare v_asac_trade_code_avail_qty decimal(18,2);
    declare v_exgp_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_strategy_amt decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_stock_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_hk_cash_avail_date_type int;
    declare v_shsz_comm_avail_amt decimal(18,4);
    declare v_hk_comm_avail_amt decimal(18,4);
    declare v_shsz_trade_avail_amt decimal(18,4);
    declare v_hk_trade_avail_amt decimal(18,4);
    declare v_comm_avail_amt decimal(18,4);
    declare v_trade_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_tmp_sell_ref_rate decimal(18,12);
    declare v_comm_avail_qty decimal(18,2);
    declare v_trade_avail_qty decimal(18,2);
    declare v_static_avail_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_exgp_avail_amt = p_exgp_avail_amt;
    SET v_exgp_T_hk_buy_total_amt = p_exgp_T_hk_buy_total_amt;
    SET v_exgp_T_hk_sell_total_amt = p_exgp_T_hk_sell_total_amt;
    SET v_exgp_T1_hk_buy_total_amt = p_exgp_T1_hk_buy_total_amt;
    SET v_exgp_T1_hk_sell_total_amt = p_exgp_T1_hk_sell_total_amt;
    SET v_asac_avail_amt = p_asac_avail_amt;
    SET v_asac_T_hk_buy_total_amt = p_asac_T_hk_buy_total_amt;
    SET v_asac_T_hk_sell_total_amt = p_asac_T_hk_sell_total_amt;
    SET v_asac_T1_hk_buy_total_amt = p_asac_T1_hk_buy_total_amt;
    SET v_asac_T1_hk_sell_total_amt = p_asac_T1_hk_sell_total_amt;
    SET v_exgp_avail_qty = p_exgp_avail_qty;
    SET v_exgp_target_code_avail_qty = p_exgp_target_code_avail_qty;
    SET v_exgp_trade_code_avail_qty = p_exgp_trade_code_avail_qty;
    SET v_asac_avail_qty = p_asac_avail_qty;
    SET v_asac_target_code_avail_qty = p_asac_target_code_avail_qty;
    SET v_asac_trade_code_avail_qty = p_asac_trade_code_avail_qty;
    SET v_exgp_busi_config_str = p_exgp_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_strategy_dir = p_strategy_dir;
    SET v_strategy_qty = p_strategy_qty;
    SET v_strategy_amt = p_strategy_amt;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_stock_type = p_stock_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_hk_cash_avail_date_type = 0;
    SET v_shsz_comm_avail_amt = 0;
    SET v_hk_comm_avail_amt = 0;
    SET v_shsz_trade_avail_amt = 0;
    SET v_hk_trade_avail_amt = 0;
    SET v_comm_avail_amt = 0;
    SET v_trade_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_avail_amt = 0;
    SET v_tmp_sell_ref_rate = 0;
    SET v_comm_avail_qty = 0;
    SET v_trade_avail_qty = 0;
    SET v_static_avail_qty = 0;
    SET v_avail_qty = 0;

    
    label_pro:BEGIN
    

    /* set @港股通资金可用日期# =cast(substring(@资产账户业务控制配置串#,21,1) as SIGNED); */
    set v_hk_cash_avail_date_type =cast(substring(v_asac_busi_config_str,21,1) as SIGNED);

    /* if @策略方向#=《策略方向-买入》  then */
    if v_strategy_dir=1  then

        /* if substring(@交易组业务控制配置串#,1,1) <> 《指令资金校验-否》 then */
        if substring(v_exgp_busi_config_str,1,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
                v_asset_acco_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@交易组可用金额#+@沪深指令可用金额# + 
                @交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额# + 
                least(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股指令可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_comm_avail_amt + 
                                    v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt + 
                                    least(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_comm_avail_amt);
                else

                    /* set @可用金额# =@交易组可用金额#+@沪深指令可用金额# + 
                least(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#) + 
                least(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#) + @港股指令可用金额#); */
                    set v_avail_amt =v_exgp_avail_amt+v_shsz_comm_avail_amt + 
                                    least(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt) + v_hk_comm_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额#=@交易组可用金额# + @指令端可用金额#; */
                set v_avail_amt=v_exgp_avail_amt + v_comm_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;

            /* [检查报错返回][Round(@策略金额# * @临时_卖出参考汇率#,2) >@可用金额#][603][concat("可用金额=",@可用金额#,"|策略金额=", Round(@策略金额# * @临时_卖出参考汇率#,2))] */
            if Round(v_strategy_amt * v_tmp_sell_ref_rate,2) >v_avail_amt then
                
                SET v_error_code = "tdsecuA.11.3.603";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|策略金额=", Round(v_strategy_amt * v_tmp_sell_ref_rate,2)),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,"|策略金额=", Round(v_strategy_amt * v_tmp_sell_ref_rate,2));
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,1,1) <> 《指令资金校验-否》 then */
        if substring(v_asac_busi_config_str,1,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* if @市场编号# = 《市场编号-上海证券交易所》 or @市场编号# = 《市场编号-深圳证券交易所》 then */
            if v_exch_no = 1 or v_exch_no = 2 then

                /* if @港股通资金可用日期# = 《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type = 4 then

                    /* set @可用金额# =@资产账户可用金额#+@沪深指令可用金额# + 
                @资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额# + 
                least(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股指令可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_comm_avail_amt + 
                                    v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt + 
                                    least(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_comm_avail_amt);
                else

                    /* set @可用金额# =@资产账户可用金额#+@沪深指令可用金额# + 
                least(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#) + 
                least(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+
                least(0,greatest(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#) + @港股指令可用金额#); */
                    set v_avail_amt =v_asac_avail_amt+v_shsz_comm_avail_amt + 
                                    least(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt) + 
                                    least(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+
                                    least(0,greatest(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt) + v_hk_comm_avail_amt);
                end if;

                /* set @临时_卖出参考汇率# = 1; */
                set v_tmp_sell_ref_rate = 1;
            else

                /* set @可用金额#=@资产账户可用金额# + @指令端可用金额#; */
                set v_avail_amt=v_asac_avail_amt + v_comm_avail_amt;

                /* set @临时_卖出参考汇率# = @卖出参考汇率#; */
                set v_tmp_sell_ref_rate = v_sell_ref_rate;
            end if;

            /* [检查报错返回][Round(@策略金额# * @临时_卖出参考汇率#,2) >@可用金额#][604][concat("可用金额=",@可用金额#,"|策略金额=", Round(@策略金额# * @临时_卖出参考汇率#,2))] */
            if Round(v_strategy_amt * v_tmp_sell_ref_rate,2) >v_avail_amt then
                
                SET v_error_code = "tdsecuA.11.3.604";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,"|策略金额=", Round(v_strategy_amt * v_tmp_sell_ref_rate,2)),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,"|策略金额=", Round(v_strategy_amt * v_tmp_sell_ref_rate,2));
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif @策略方向#=《策略方向-卖出》 then */
    elseif v_strategy_dir=2 then

        /* if substring(@交易组业务控制配置串#,2,1) <> 《指令持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@交易组可用数量# + @指令端可用数量#; */
            set v_avail_qty=v_exgp_avail_qty + v_comm_avail_qty;

            /* [检查报错返回][@策略数量#>@可用数量#][605][@可用数量#,@策略数量#] */
            if v_strategy_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.11.3.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,2,1) <> 《指令持仓校验-否》 then */
        if substring(v_asac_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@资产账户可用数量# + @指令端可用数量#; */
            set v_avail_qty=v_asac_avail_qty + v_comm_avail_qty;

            /* [检查报错返回][@策略数量#>@可用数量#][606][@可用数量#,@策略数量#] */
            if v_strategy_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.11.3.606";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty);
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif @策略方向#=《策略方向-融资回购》 then */
    elseif v_strategy_dir=3 then

        /* set @证券代码编号#=@标的代码编号#; */
        set v_stock_code_no=v_target_code_no;

        /* if substring(@交易组业务控制配置串#,2,1) <> 《指令持仓校验-否》 then */
        if substring(v_exgp_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpPosiAvail(
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
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@交易组标的代码可用数量# + @指令端可用数量#; */
            set v_avail_qty=v_exgp_target_code_avail_qty + v_comm_avail_qty;

            /* [检查报错返回][@策略数量#>@可用数量#][605][@可用数量#,@策略数量#] */
            if v_strategy_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.11.3.605";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,2,1) <> 《指令持仓校验-否》 then */
        if substring(v_asac_busi_config_str,2,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户持仓可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacPosiAvail(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_posi_reback_days,
                v_error_code,
                v_error_info,
                v_comm_avail_qty,
                v_trade_avail_qty,
                v_static_avail_qty);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户持仓可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用数量#=@资产账户标的代码可用数量# + @指令端可用数量#; */
            set v_avail_qty=v_asac_target_code_avail_qty + v_comm_avail_qty;

            /* [检查报错返回][@策略数量#>@可用数量#][606][@可用数量#,@策略数量#] */
            if v_strategy_qty>v_avail_qty then
                
                SET v_error_code = "tdsecuA.11.3.606";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用数量=",v_avail_qty,",","策略数量=",v_strategy_qty);
                end if;
                leave label_pro;
            end if;

        end if;

    /* elseif @策略方向#=《策略方向-融券回购》 then */
    elseif v_strategy_dir=4 then

        /* if substring(@交易组业务控制配置串#,1,1) <> 《指令资金校验-否》 then */
        if substring(v_exgp_busi_config_str,1,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算交易组资金可用】*/
            call db_tdsecu.pra_tdseac_CalcExgpCashAvail(
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
                v_asset_acco_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算交易组资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用金额#=@交易组可用金额# + @指令端可用金额#; */
            set v_avail_amt=v_exgp_avail_amt + v_comm_avail_amt;

            /* [检查报错返回][@策略金额#>@可用金额#][603][@可用金额#, @策略金额#] */
            if v_strategy_amt>v_avail_amt then
                
                SET v_error_code = "tdsecuA.11.3.603";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,","," 策略金额=", v_strategy_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,","," 策略金额=", v_strategy_amt);
                end if;
                leave label_pro;
            end if;

        end if;

        /* if substring(@资产账户业务控制配置串#,1,1) <> 《指令资金校验-否》 then */
        if substring(v_asac_busi_config_str,1,1) <> 2 then

            /* 调用【原子_交易证券_账户_计算资产账户资金可用】*/
            call db_tdsecu.pra_tdseac_CalcAsacCashAvail(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_capit_reback_days,
                v_error_code,
                v_error_info,
                v_shsz_comm_avail_amt,
                v_hk_comm_avail_amt,
                v_shsz_trade_avail_amt,
                v_hk_trade_avail_amt,
                v_comm_avail_amt,
                v_trade_avail_amt,
                v_static_avail_amt);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.11.3.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_账户_计算资产账户资金可用出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;


            /* set @可用金额#=@资产账户可用金额# + @指令端可用金额#; */
            set v_avail_amt=v_asac_avail_amt + v_comm_avail_amt;

            /* [检查报错返回][@策略金额#>@可用金额#][604][@可用金额#, @策略金额#] */
            if v_strategy_amt>v_avail_amt then
                
                SET v_error_code = "tdsecuA.11.3.604";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,","," 策略金额=", v_strategy_amt),"#",v_mysql_message);
                else
                    SET v_error_info = concat("可用金额=",v_avail_amt,","," 策略金额=", v_strategy_amt);
                end if;
                leave label_pro;
            end if;

        end if;
    else

            /* [报错返回][639][@策略方向#] */
                
                SET v_error_code = "tdsecuA.11.3.639";
                SET v_error_info = concat("策略方向=",v_strategy_dir);
                leave label_pro;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_锁定获取策略信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_LockGetStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_LockGetStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_comm_opor int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_strategy_batch_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_price decimal(16,9),
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_price_type int,
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_remark_info varchar(255),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_strategy_status varchar(2),
    OUT p_margin_trade_type int,
    OUT p_strategy_deal_kind int,
    OUT p_target_strategy_type varchar(16),
    OUT p_target_strategy_param varchar(2048),
    OUT p_order_qty decimal(18,2),
    OUT p_valid_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_valid_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strategy_deal_status varchar(2),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_update_times int,
    OUT p_strategy_price_type int,
    OUT p_comm_batch_no int,
    OUT p_comm_id bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_comm_opor int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strategy_batch_no int;
    declare v_strategy_dir int;
    declare v_strategy_price decimal(16,9);
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_price_type int;
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_strategy_status varchar(2);
    declare v_margin_trade_type int;
    declare v_strategy_deal_kind int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_order_qty decimal(18,2);
    declare v_valid_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strategy_deal_status varchar(2);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_update_times int;
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);
    declare v_orig_strategy_id bigint;
    declare v_strategy_contr_comm varchar(2048);

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
    SET v_strategy_id = p_strategy_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_comm_opor = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strategy_batch_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_price = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_price_type = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_remark_info = " ";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_strategy_status = " ";
    SET v_margin_trade_type = 0;
    SET v_strategy_deal_kind = 0;
    SET v_target_strategy_type = " ";
    SET v_target_strategy_param = " ";
    SET v_order_qty = 0;
    SET v_valid_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strategy_deal_status = " ";
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_update_times = 1;
    SET v_strategy_price_type = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_id = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";
    SET v_orig_strategy_id = 0;
    SET v_strategy_contr_comm = " ";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_策略_策略表][字段][字段变量][{记录序号} = @策略序号#][4][@策略序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, comm_opor, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, strategy_batch_no, orig_strategy_id, strategy_exec_broker, 
        strategy_exec_kind, strategy_exec_comm_str, exch_no, stock_acco_no, 
        stock_acco, stock_type, asset_type, stock_code, 
        stock_code_no, strategy_dir, strategy_qty, cash_strategy_qty, 
        strategy_price, price_type, strategy_amt, strategy_valid_type, 
        strategy_rule_way, exch_crncy_type, remark_info, strategy_date, 
        strategy_time, margin_trade_type, target_strategy_type, target_strategy_param, 
        strategy_contr_comm, strategy_status, strategy_deal_status, strategy_deal_kind, 
        order_qty, valid_order_qty, order_amt, wtdraw_qty, 
        valid_wtdraw_qty, strike_qty, strike_amt, external_no, 
        order_batch_no, strategy_oper_way, strategy_price_type, comm_batch_no, 
        comm_id into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_comm_opor, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_strategy_batch_no, v_orig_strategy_id, v_strategy_exec_broker, 
        v_strategy_exec_kind, v_strategy_exec_comm_str, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_type, v_asset_type, v_stock_code, 
        v_stock_code_no, v_strategy_dir, v_strategy_qty, v_cash_strategy_qty, 
        v_strategy_price, v_price_type, v_strategy_amt, v_strategy_valid_type, 
        v_strategy_rule_way, v_exch_crncy_type, v_remark_info, v_strategy_date, 
        v_strategy_time, v_margin_trade_type, v_target_strategy_type, v_target_strategy_param, 
        v_strategy_contr_comm, v_strategy_status, v_strategy_deal_status, v_strategy_deal_kind, 
        v_order_qty, v_valid_order_qty, v_order_amt, v_wtdraw_qty, 
        v_valid_wtdraw_qty, v_strike_qty, v_strike_amt, v_external_no, 
        v_order_batch_no, v_strategy_oper_way, v_strategy_price_type, v_comm_batch_no, 
        v_comm_id from db_tdsecu.tb_tdsest_strategyorder where row_id = v_strategy_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.11.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略序号=",v_strategy_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略序号=",v_strategy_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_price = v_strategy_price;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_price_type = v_price_type;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_remark_info = v_remark_info;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_strategy_status = v_strategy_status;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_target_strategy_type = v_target_strategy_type;
    SET p_target_strategy_param = v_target_strategy_param;
    SET p_order_qty = v_order_qty;
    SET p_valid_order_qty = v_valid_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_valid_wtdraw_qty = v_valid_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_update_times = v_update_times;
    SET p_strategy_price_type = v_strategy_price_type;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_id = v_comm_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_新增策略流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_AddStrategyOrderJour;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_AddStrategyOrderJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_strategy_batch_no int,
    IN p_strategy_id bigint,
    IN p_orig_strategy_id bigint,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_strategy_dir int,
    IN p_strategy_qty decimal(18,2),
    IN p_cash_strategy_qty decimal(18,2),
    IN p_strategy_price decimal(16,9),
    IN p_price_type int,
    IN p_exch_crncy_type varchar(3),
    IN p_strategy_date int,
    IN p_strategy_time int,
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_deal_kind int,
    IN p_order_id bigint,
    IN p_order_qty decimal(18,2),
    IN p_order_amt decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_id bigint,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_order_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_remark_info varchar(255),
    IN p_comm_batch_no int,
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
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_strategy_batch_no int;
    declare v_strategy_id bigint;
    declare v_orig_strategy_id bigint;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_exch_crncy_type varchar(3);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_order_id bigint;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_id bigint;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_remark_info varchar(255);
    declare v_comm_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_row_id bigint;

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
    SET v_comm_opor = p_comm_opor;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_strategy_id = p_strategy_id;
    SET v_orig_strategy_id = p_orig_strategy_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strategy_dir = p_strategy_dir;
    SET v_strategy_qty = p_strategy_qty;
    SET v_cash_strategy_qty = p_cash_strategy_qty;
    SET v_strategy_price = p_strategy_price;
    SET v_price_type = p_price_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_strategy_date = p_strategy_date;
    SET v_strategy_time = p_strategy_time;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_order_id = p_order_id;
    SET v_order_qty = p_order_qty;
    SET v_order_amt = p_order_amt;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_id = p_strike_id;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_order_batch_no = p_order_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_remark_info = p_remark_info;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [插入表记录][交易证券_策略_策略流水表][字段][字段变量][1][@初始化日期#,@策略序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsest_strategyorder_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, comm_opor, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        strategy_batch_no, strategy_id, orig_strategy_id, exch_no, 
        stock_acco_no, stock_acco, stock_type, asset_type, 
        stock_code, stock_code_no, strategy_dir, strategy_qty, 
        cash_strategy_qty, strategy_price, price_type, exch_crncy_type, 
        strategy_date, strategy_time, strategy_status, strategy_deal_status, 
        strategy_deal_kind, order_id, order_qty, order_amt, 
        wtdraw_qty, strike_id, strike_qty, strike_amt, 
        order_batch_no, strategy_oper_way, remark_info, comm_batch_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_comm_opor, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_strategy_batch_no, v_strategy_id, v_orig_strategy_id, v_exch_no, 
        v_stock_acco_no, v_stock_acco, v_stock_type, v_asset_type, 
        v_stock_code, v_stock_code_no, v_strategy_dir, v_strategy_qty, 
        v_cash_strategy_qty, v_strategy_price, v_price_type, v_exch_crncy_type, 
        v_strategy_date, v_strategy_time, v_strategy_status, v_strategy_deal_status, 
        v_strategy_deal_kind, v_order_id, v_order_qty, v_order_amt, 
        v_wtdraw_qty, v_strike_id, v_strike_qty, v_strike_amt, 
        v_order_batch_no, v_strategy_oper_way, v_remark_info, v_comm_batch_no);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.5.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","策略序号=",v_strategy_id),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_获取策略信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_GetStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_GetStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_no int,
    OUT p_comm_opor int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_target_code_no int,
    OUT p_trade_code_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_strategy_batch_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_price decimal(16,9),
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_price_type int,
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_net_price_flag int,
    OUT p_par_value decimal(16,9),
    OUT p_impawn_ratio decimal(18,12),
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_capit_reback_days int,
    OUT p_posi_reback_days int,
    OUT p_remark_info varchar(255),
    OUT p_strategy_date int,
    OUT p_strategy_time int,
    OUT p_strategy_status varchar(2),
    OUT p_margin_trade_type int,
    OUT p_strategy_deal_kind int,
    OUT p_target_strategy_type varchar(16),
    OUT p_target_strategy_param varchar(2048),
    OUT p_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strategy_deal_status varchar(2),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_strategy_oper_way varchar(2),
    OUT p_busi_opor_no int,
    OUT p_strategy_price_type int,
    OUT p_comm_batch_no int,
    OUT p_comm_id bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_comm_opor int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strategy_batch_no int;
    declare v_strategy_dir int;
    declare v_strategy_price decimal(16,9);
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_price_type int;
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_strategy_time int;
    declare v_strategy_status varchar(2);
    declare v_margin_trade_type int;
    declare v_strategy_deal_kind int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strategy_deal_status varchar(2);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_busi_opor_no int;
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_func_code varchar(16);
    declare v_orig_strategy_id bigint;
    declare v_strategy_contr_comm varchar(2048);
    declare v_valid_order_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);

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
    SET v_strategy_id = p_strategy_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_comm_opor = 0;
    SET v_stock_acco = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strategy_batch_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_price = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_price_type = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_capit_reback_days = 0;
    SET v_posi_reback_days = 0;
    SET v_remark_info = " ";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_strategy_status = " ";
    SET v_margin_trade_type = 0;
    SET v_strategy_deal_kind = 0;
    SET v_target_strategy_type = " ";
    SET v_target_strategy_param = " ";
    SET v_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strategy_deal_status = " ";
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_busi_opor_no = 0;
    SET v_strategy_price_type = 0;
    SET v_comm_batch_no = 0;
    SET v_comm_id = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_func_code = " ";
    SET v_orig_strategy_id = 0;
    SET v_strategy_contr_comm = " ";
    SET v_valid_order_qty = 0;
    SET v_valid_wtdraw_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_策略_策略表][字段][字段变量][{记录序号} = @策略序号#][4][@策略序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, comm_opor, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, strategy_batch_no, orig_strategy_id, strategy_exec_broker, 
        strategy_exec_kind, strategy_exec_comm_str, exch_no, stock_acco_no, 
        stock_acco, stock_type, asset_type, stock_code, 
        stock_code_no, strategy_dir, strategy_qty, cash_strategy_qty, 
        strategy_price, price_type, strategy_amt, strategy_valid_type, 
        strategy_rule_way, exch_crncy_type, remark_info, strategy_date, 
        strategy_time, margin_trade_type, target_strategy_type, target_strategy_param, 
        strategy_contr_comm, strategy_status, strategy_deal_status, strategy_deal_kind, 
        order_qty, valid_order_qty, order_amt, wtdraw_qty, 
        valid_wtdraw_qty, strike_qty, strike_amt, external_no, 
        order_batch_no, strategy_oper_way, strategy_price_type, comm_batch_no, 
        comm_id into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_comm_opor, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_strategy_batch_no, v_orig_strategy_id, v_strategy_exec_broker, 
        v_strategy_exec_kind, v_strategy_exec_comm_str, v_exch_no, v_stock_acco_no, 
        v_stock_acco, v_stock_type, v_asset_type, v_stock_code, 
        v_stock_code_no, v_strategy_dir, v_strategy_qty, v_cash_strategy_qty, 
        v_strategy_price, v_price_type, v_strategy_amt, v_strategy_valid_type, 
        v_strategy_rule_way, v_exch_crncy_type, v_remark_info, v_strategy_date, 
        v_strategy_time, v_margin_trade_type, v_target_strategy_type, v_target_strategy_param, 
        v_strategy_contr_comm, v_strategy_status, v_strategy_deal_status, v_strategy_deal_kind, 
        v_order_qty, v_valid_order_qty, v_order_amt, v_wtdraw_qty, 
        v_valid_wtdraw_qty, v_strike_qty, v_strike_amt, v_external_no, 
        v_order_batch_no, v_strategy_oper_way, v_strategy_price_type, v_comm_batch_no, 
        v_comm_id from db_tdsecu.tb_tdsest_strategyorder where row_id = v_strategy_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.11.6.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略序号=",v_strategy_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略序号=",v_strategy_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_no = v_exch_no;
    SET p_comm_opor = v_comm_opor;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_target_code_no = v_target_code_no;
    SET p_trade_code_no = v_trade_code_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_strategy_batch_no = v_strategy_batch_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_price = v_strategy_price;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_price_type = v_price_type;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_net_price_flag = v_net_price_flag;
    SET p_par_value = v_par_value;
    SET p_impawn_ratio = v_impawn_ratio;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_capit_reback_days = v_capit_reback_days;
    SET p_posi_reback_days = v_posi_reback_days;
    SET p_remark_info = v_remark_info;
    SET p_strategy_date = v_strategy_date;
    SET p_strategy_time = v_strategy_time;
    SET p_strategy_status = v_strategy_status;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_target_strategy_type = v_target_strategy_type;
    SET p_target_strategy_param = v_target_strategy_param;
    SET p_order_qty = v_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_strategy_price_type = v_strategy_price_type;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_comm_id = v_comm_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_获取策略插件状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_GetStrategePluginStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_GetStrategePluginStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_plugin_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strategy_plugin_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_strategy_plugin_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_plugin_status varchar(2);

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
    SET v_strategy_plugin_type = p_strategy_plugin_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_plugin_status = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_策略_策略插件状态表][{策略插件状态}][@策略插件状态#][{策略插件类型}=@策略插件类型#] */
    select strategy_plugin_status into v_strategy_plugin_status from db_tdsecu.tb_tdsest_strategypluginstatus where strategy_plugin_type=v_strategy_plugin_type limit 1;


    /* set @策略插件状态# = ifnull(@策略插件状态#,《策略插件状态-下线》); */
    set v_strategy_plugin_status = ifnull(v_strategy_plugin_status,"2");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strategy_plugin_status = v_strategy_plugin_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_新增策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_AddStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_AddStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_orig_strategy_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_comm_opor int,
    IN p_stock_acco varchar(16),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strategy_batch_no int,
    IN p_strategy_dir int,
    IN p_strategy_price decimal(16,9),
    IN p_strategy_qty decimal(18,2),
    IN p_cash_strategy_qty decimal(18,2),
    IN p_strategy_amt decimal(18,4),
    IN p_strategy_exec_broker varchar(16),
    IN p_strategy_exec_kind int,
    IN p_strategy_exec_comm_str varchar(2048),
    IN p_price_type int,
    IN p_strategy_valid_type int,
    IN p_strategy_rule_way varchar(4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_capit_reback_days int,
    IN p_posi_reback_days int,
    IN p_remark_info varchar(255),
    IN p_strategy_date int,
    IN p_margin_trade_type int,
    IN p_strategy_deal_kind int,
    IN p_target_strategy_type varchar(16),
    IN p_target_strategy_param varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_cancel_qty decimal(18,2),
    IN p_valid_wtdraw_qty decimal(18,2),
    IN p_valid_order_qty decimal(18,2),
    IN p_strategy_price_type int,
    IN p_comm_batch_no int,
    IN p_comm_id bigint,
    IN p_strategy_capt_qty decimal(18,2),
    IN p_strategy_order_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strategy_id bigint,
    OUT p_strategy_status varchar(2),
    OUT p_strategy_time int
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
    declare v_orig_strategy_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_comm_opor int;
    declare v_stock_acco varchar(16);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strategy_batch_no int;
    declare v_strategy_dir int;
    declare v_strategy_price decimal(16,9);
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_price_type int;
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_capit_reback_days int;
    declare v_posi_reback_days int;
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_margin_trade_type int;
    declare v_strategy_deal_kind int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_cancel_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_valid_order_qty decimal(18,2);
    declare v_strategy_price_type int;
    declare v_comm_batch_no int;
    declare v_comm_id bigint;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_id bigint;
    declare v_strategy_status varchar(2);
    declare v_strategy_time int;
    declare v_strategy_plugin_type int;
    declare v_strategy_plugin_status varchar(2);
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_contr_comm varchar(2048);
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;

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
    SET v_orig_strategy_id = p_orig_strategy_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_strategy_dir = p_strategy_dir;
    SET v_strategy_price = p_strategy_price;
    SET v_strategy_qty = p_strategy_qty;
    SET v_cash_strategy_qty = p_cash_strategy_qty;
    SET v_strategy_amt = p_strategy_amt;
    SET v_strategy_exec_broker = p_strategy_exec_broker;
    SET v_strategy_exec_kind = p_strategy_exec_kind;
    SET v_strategy_exec_comm_str = p_strategy_exec_comm_str;
    SET v_price_type = p_price_type;
    SET v_strategy_valid_type = p_strategy_valid_type;
    SET v_strategy_rule_way = p_strategy_rule_way;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_capit_reback_days = p_capit_reback_days;
    SET v_posi_reback_days = p_posi_reback_days;
    SET v_remark_info = p_remark_info;
    SET v_strategy_date = p_strategy_date;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_target_strategy_param = p_target_strategy_param;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_cancel_qty = p_cancel_qty;
    SET v_valid_wtdraw_qty = p_valid_wtdraw_qty;
    SET v_valid_order_qty = p_valid_order_qty;
    SET v_strategy_price_type = p_strategy_price_type;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_comm_id = p_comm_id;
    SET v_strategy_capt_qty = p_strategy_capt_qty;
    SET v_strategy_order_qty = p_strategy_order_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_id = 0;
    SET v_strategy_status = " ";
    SET v_strategy_time = date_format(curtime(),'%H%i%s');
    SET v_strategy_plugin_type = 0;
    SET v_strategy_plugin_status = " ";
    SET v_order_qty = 0;
    SET v_order_amt = 0;
    SET v_strike_amt = 0;
    SET v_strike_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_faild_qty = 0;
    SET v_strategy_deal_status = " ";
    SET v_strategy_contr_comm = " ";
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@策略时间#] */
    select date_format(curtime(),'%H%i%s') into v_strategy_time;


    /* set @策略状态#=《策略状态-新建》; */
    set v_strategy_status="1";

    /* set @策略插件类型# = 《策略插件类型-金纳插件》; */
    set v_strategy_plugin_type = 61;

    /* 调用【原子_交易证券_策略_获取策略插件状态】*/
    call db_tdsecu.pra_tdsest_GetStrategePluginStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_strategy_plugin_type,
        v_error_code,
        v_error_info,
        v_strategy_plugin_status);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.11.11.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_获取策略插件状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @策略插件状态# = 《策略插件状态-上线》 then */
    if v_strategy_plugin_status = "1" then

        /* set @策略状态#=《策略状态-待发送》; */
        set v_strategy_status="2";
    end if;

    /* set @订单数量#=0; */
    set v_order_qty=0;

    /* set @订单金额#=0; */
    set v_order_amt=0;

    /* set @成交金额#=0; */
    set v_strike_amt=0;

    /* set @成交数量#=0; */
    set v_strike_qty=0;

    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* set @失败数量# = 0; */
    set v_faild_qty = 0;

    /* set @策略处理状态# = 《策略处理状态-未处理》; */
    set v_strategy_deal_status = "1";

    /* set @策略控制指令#=" "; */
    set v_strategy_contr_comm=" ";

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* [插入表记录][交易证券_策略_策略表][字段][字段变量][1][@初始化日期#,@订单批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsest_strategyorder(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, comm_opor, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, out_acco, 
        strategy_batch_no, orig_strategy_id, strategy_exec_broker, strategy_exec_kind, 
        strategy_exec_comm_str, exch_no, stock_acco_no, stock_acco, 
        stock_type, asset_type, stock_code, stock_code_no, 
        strategy_dir, strategy_qty, cash_strategy_qty, strategy_price, 
        price_type, strategy_amt, strategy_valid_type, strategy_rule_way, 
        exch_crncy_type, remark_info, strategy_date, strategy_time, 
        margin_trade_type, target_strategy_type, target_strategy_param, strategy_contr_comm, 
        strategy_status, strategy_deal_status, strategy_deal_kind, order_qty, 
        valid_order_qty, order_amt, wtdraw_qty, valid_wtdraw_qty, 
        strike_qty, strike_amt, external_no, order_batch_no, 
        strategy_oper_way, strategy_price_type, comm_batch_no, comm_id) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_comm_opor, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_strategy_batch_no, v_orig_strategy_id, v_strategy_exec_broker, v_strategy_exec_kind, 
        v_strategy_exec_comm_str, v_exch_no, v_stock_acco_no, v_stock_acco, 
        v_stock_type, v_asset_type, v_stock_code, v_stock_code_no, 
        v_strategy_dir, v_strategy_qty, v_cash_strategy_qty, v_strategy_price, 
        v_price_type, v_strategy_amt, v_strategy_valid_type, v_strategy_rule_way, 
        v_exch_crncy_type, v_remark_info, v_strategy_date, v_strategy_time, 
        v_margin_trade_type, v_target_strategy_type, v_target_strategy_param, v_strategy_contr_comm, 
        v_strategy_status, v_strategy_deal_status, v_strategy_deal_kind, v_order_qty, 
        v_valid_order_qty, v_order_amt, v_wtdraw_qty, v_valid_wtdraw_qty, 
        v_strike_qty, v_strike_amt, v_external_no, v_order_batch_no, 
        v_strategy_oper_way, v_strategy_price_type, v_comm_batch_no, v_comm_id);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.11.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","订单批号=",v_order_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;


    /* set @策略序号#=@记录序号#; */
    set v_strategy_id=v_row_id;
    #更新指令表

    /* if @指令序号#>0 then */
    if v_comm_id>0 then

        /* [更新表记录][交易证券_指令_指令表][{策略订单数量} = {策略订单数量}+@策略订单数量#,{策略占用数量} = {策略占用数量}+@策略占用数量#][{记录序号}=@指令序号#][2][@指令序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_order_qty = strategy_order_qty+v_strategy_order_qty,strategy_capt_qty = strategy_capt_qty+v_strategy_capt_qty where row_id=v_comm_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.11.11.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令序号=",v_comm_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strategy_id = v_strategy_id;
    SET p_strategy_status = v_strategy_status;
    SET p_strategy_time = v_strategy_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_更新策略执行情况
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_UpdateStrategyOrderExecution;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_UpdateStrategyOrderExecution(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_strategy_id bigint,
    IN p_order_qty decimal(18,2),
    IN p_order_amt decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strategy_status varchar(2),
    IN p_strategy_batch_no int,
    IN p_valid_order_qty decimal(18,2),
    IN p_valid_wtdraw_qty decimal(18,2),
    IN p_faild_qty decimal(18,2),
    IN p_cancel_qty decimal(18,2),
    IN p_strategy_dir int,
    IN p_comm_id bigint,
    IN p_strategy_order_qty decimal(18,2),
    IN p_strategy_capt_qty decimal(18,2),
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
    declare v_strategy_id bigint;
    declare v_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strategy_status varchar(2);
    declare v_strategy_batch_no int;
    declare v_valid_order_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_cancel_qty decimal(18,2);
    declare v_strategy_dir int;
    declare v_comm_id bigint;
    declare v_strategy_order_qty decimal(18,2);
    declare v_strategy_capt_qty decimal(18,2);
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
    SET v_co_no = p_co_no;
    SET v_strategy_id = p_strategy_id;
    SET v_order_qty = p_order_qty;
    SET v_order_amt = p_order_amt;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_valid_order_qty = p_valid_order_qty;
    SET v_valid_wtdraw_qty = p_valid_wtdraw_qty;
    SET v_faild_qty = p_faild_qty;
    SET v_cancel_qty = p_cancel_qty;
    SET v_strategy_dir = p_strategy_dir;
    SET v_comm_id = p_comm_id;
    SET v_strategy_order_qty = p_strategy_order_qty;
    SET v_strategy_capt_qty = p_strategy_capt_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_策略_策略表][{订单数量} = {订单数量}+@订单数量#,{订单金额} = {订单金额}+@订单金额#,{撤单数量} = {撤单数量}+@撤单数量#,{成交数量} = {成交数量}+@成交数量#,{成交金额} = {成交金额}+@成交金额#,{策略状态} = @策略状态#,{有效订单数量} = {有效订单数量}+@有效订单数量#,{有效撤单数量} = {有效撤单数量}+@有效撤单数量#][{记录序号}=@策略序号#][2][@策略序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsest_strategyorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty = order_qty+v_order_qty,order_amt = order_amt+v_order_amt,wtdraw_qty = wtdraw_qty+v_wtdraw_qty,strike_qty = strike_qty+v_strike_qty,strike_amt = strike_amt+v_strike_amt,strategy_status = v_strategy_status,valid_order_qty = valid_order_qty+v_valid_order_qty,valid_wtdraw_qty = valid_wtdraw_qty+v_valid_wtdraw_qty where row_id=v_strategy_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略序号=",v_strategy_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略序号=",v_strategy_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_策略_策略汇总表][{订单数量} = {订单数量} +@订单数量#,{订单金额} = {订单金额}+@订单金额#,{撤单数量} ={撤单数量}+ @撤单数量#,{成交数量} ={成交数量}+ @成交数量#,{成交金额} ={成交金额}+ @成交金额#,{策略汇总状态} = @策略状态#,{有效撤单数量} = {有效撤单数量} + @有效撤单数量#,{失败数量} = {失败数量} + @失败数量#,{撤销数量} = {撤销数量} + @撤销数量#,{有效订单数量} = {有效订单数量}+@有效订单数量#,{有效撤单数量} = {有效撤单数量}+@有效撤单数量#][{策略批号}=@策略批号# and {机构编号} = @机构编号#][2][@策略批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsest_strategyordersum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, order_qty = order_qty +v_order_qty,order_amt = order_amt+v_order_amt,wtdraw_qty =wtdraw_qty+ v_wtdraw_qty,strike_qty =strike_qty+ v_strike_qty,strike_amt =strike_amt+ v_strike_amt,strategy_sum_status = v_strategy_status,valid_wtdraw_qty = valid_wtdraw_qty + v_valid_wtdraw_qty,faild_qty = faild_qty + v_faild_qty,cancel_qty = cancel_qty + v_cancel_qty,valid_order_qty = valid_order_qty+v_valid_order_qty,valid_wtdraw_qty = valid_wtdraw_qty+v_valid_wtdraw_qty where strategy_batch_no=v_strategy_batch_no and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.15.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_交易证券_策略_更新汇总策略状态】*/
    call db_tdsecu.pra_tdsest_UpdateStrategySumOrderState(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_strategy_batch_no,
        v_strategy_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.11.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新汇总策略状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* if @指令序号# > 0 then */
    if v_comm_id > 0 then

        /* [更新表记录][交易证券_指令_指令表][{策略订单数量} = {策略订单数量}+@策略订单数量#][{记录序号}=@指令序号#][2][@指令序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_order_qty = strategy_order_qty+v_strategy_order_qty where row_id=v_comm_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.11.15.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("指令序号=",v_comm_id);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_更新策略状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_UpdateStrategyOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_UpdateStrategyOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_strategy_id bigint,
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_status varchar(2),
    IN p_remark_info varchar(255),
    IN p_strategy_batch_no int,
    IN p_faild_qty decimal(18,2),
    IN p_cancel_qty decimal(18,2),
    IN p_strategy_dir int,
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
    declare v_strategy_id bigint;
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_status varchar(2);
    declare v_remark_info varchar(255);
    declare v_strategy_batch_no int;
    declare v_faild_qty decimal(18,2);
    declare v_cancel_qty decimal(18,2);
    declare v_strategy_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strategy_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_faild_qty decimal(18,2);
    declare v_tmp_cancel_qty decimal(18,2);
    declare v_strategy_qty decimal(18,2);

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
    SET v_strategy_id = p_strategy_id;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_status = p_strategy_status;
    SET v_remark_info = p_remark_info;
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_faild_qty = p_faild_qty;
    SET v_cancel_qty = p_cancel_qty;
    SET v_strategy_dir = p_strategy_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strategy_status = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_faild_qty = 0;
    SET v_tmp_cancel_qty = 0;
    SET v_strategy_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_策略_策略表][{策略状态}][@临时_策略状态#][{记录序号}=@策略序号#] */
    select strategy_status into v_tmp_strategy_status from db_tdsecu.tb_tdsest_strategyorder where row_id=v_strategy_id limit 1;


    /* [检查正常返回][@临时_策略状态#='7' or @临时_策略状态#='8' or @临时_策略状态#='9' or @临时_策略状态#='b' or @临时_策略状态#='c'] */
    if v_tmp_strategy_status='7' or v_tmp_strategy_status='8' or v_tmp_strategy_status='9' or v_tmp_strategy_status='b' or v_tmp_strategy_status='c' then
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_策略_策略表][{策略状态} = @策略状态#,{策略处理状态}=@策略处理状态#,{备注信息}=@备注信息#][{记录序号}=@策略序号#][2][@策略序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsest_strategyorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_status = v_strategy_status,strategy_deal_status=v_strategy_deal_status,remark_info=v_remark_info where row_id=v_strategy_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.16.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略序号=",v_strategy_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略序号=",v_strategy_id);
        end if;
        leave label_pro;
    end if;

    #防止失败数量超过策略数量情况的发生

    /* set @临时_失败数量#  = @失败数量#; */
    set v_tmp_faild_qty  = v_faild_qty;

    /* set @临时_撤销数量#  = @撤销数量#; */
    set v_tmp_cancel_qty  = v_cancel_qty;

    /* [锁定获取表记录变量][交易证券_策略_策略汇总表][{策略数量},{失败数量},{撤销数量}][@策略数量#,@失败数量#,@撤销数量#][{策略批号}=@策略批号# and {机构编号} = @机构编号#][1][@策略批号#] */
    select strategy_qty,faild_qty,cancel_qty into v_strategy_qty,v_faild_qty,v_cancel_qty from db_tdsecu.tb_tdsest_strategyordersum where strategy_batch_no=v_strategy_batch_no and co_no = v_co_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.11.16.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no);
        end if;
        leave label_pro;
    end if;


    /* set @临时_失败数量#  = @临时_失败数量#+@失败数量#; */
    set v_tmp_faild_qty  = v_tmp_faild_qty+v_faild_qty;

    /* set @临时_撤销数量#  = @临时_撤销数量#+@撤销数量#; */
    set v_tmp_cancel_qty  = v_tmp_cancel_qty+v_cancel_qty;

    /* if @策略数量# >= (@临时_失败数量#+@临时_撤销数量#) then */
    if v_strategy_qty >= (v_tmp_faild_qty+v_tmp_cancel_qty) then

        /* [更新表记录][交易证券_策略_策略汇总表][{失败数量} = @临时_失败数量#,{撤销数量} = @临时_撤销数量#][{策略批号}=@策略批号# and {机构编号} =@机构编号#][2][@策略批号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsest_strategyordersum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, faild_qty = v_tmp_faild_qty,cancel_qty = v_tmp_cancel_qty where strategy_batch_no=v_strategy_batch_no and co_no =v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.11.16.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("策略批号=",v_strategy_batch_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* 调用【原子_交易证券_策略_更新汇总策略状态】*/
    call db_tdsecu.pra_tdsest_UpdateStrategySumOrderState(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_strategy_batch_no,
        v_strategy_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.11.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新汇总策略状态出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 原子_交易证券_策略_查询策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_QueryStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_QueryStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_strategy_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_strategy_dir int,
    IN p_busi_opor_no int,
    IN p_margin_trade_type int,
    IN p_target_strategy_type varchar(16),
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_deal_kind int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_comm_opor int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_strategy_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_strategy_dir int;
    declare v_busi_opor_no int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

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
    SET v_comm_opor = p_comm_opor;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_strategy_id = p_strategy_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_strategy_dir = p_strategy_dir;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_策略_策略表][{指令下达人},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{记录序号} as {策略序号},{原策略序号},{策略执行商},{策略执行方式},{策略执行指令串},{市场编号},{股东代码编号},{股东代码},{证券类型},{资产类型},{证券代码},{证券代码编号},{策略方向},{策略数量},{资金策略数量},{策略价格},{价格类型},{策略有效期限},{策略规则方式},{交易币种},{备注信息},{策略时间},{信用交易方式},{目标策略类型},{目标策略参数},{策略控制指令},{策略状态},{策略处理状态},{策略处理方式},{策略金额},{订单数量},{订单金额},{撤单数量},{成交数量},{成交金额},{外部编号},{订单批号},{策略操作方式},{更新次数},{策略批号},{指令批号},{指令序号}][(@策略序号#=0 or {记录序号}=@策略序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@信用交易方式#=0 or {信用交易方式}=@信用交易方式#) and (@策略方向#=0 or {策略方向}=@策略方向#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@目标策略类型#=" " or {目标策略类型}=@目标策略类型#) and (@策略状态#=" " or {策略状态}=@策略状态#) and (@策略处理状态#=" " or {策略处理状态}=@策略处理状态#) and (@策略处理方式#=0 or {策略处理方式}=@策略处理方式#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@策略操作方式# = " " or {策略操作方式} = @策略操作方式#) and (@指令批号# = 0 or {指令批号} = @指令批号#) and (@指令序号# = 0 or {指令序号} = @指令序号#)  and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,update_times,strategy_batch_no,comm_batch_no,comm_id from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_batch_no = 0 or comm_batch_no = v_comm_batch_no) and (v_comm_id = 0 or comm_id = v_comm_id)  and row_id>v_row_id order by row_id;
        else
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,update_times,strategy_batch_no,comm_batch_no,comm_id from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_batch_no = 0 or comm_batch_no = v_comm_batch_no) and (v_comm_id = 0 or comm_id = v_comm_id)  and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_策略_策略表][{指令下达人},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{记录序号} as {策略序号},{原策略序号},{策略执行商},{策略执行方式},{策略执行指令串},{市场编号},{股东代码编号},{股东代码},{证券类型},{资产类型},{证券代码},{证券代码编号},{策略方向},{策略数量},{资金策略数量},{策略价格},{价格类型},{策略有效期限},{策略规则方式},{交易币种},{备注信息},{策略时间},{信用交易方式},{目标策略类型},{目标策略参数},{策略控制指令},{策略状态},{策略处理状态},{策略处理方式},{策略金额},{订单数量},{订单金额},{撤单数量},{成交数量},{成交金额},{外部编号},{订单批号},{策略操作方式},{更新次数},{策略批号},{指令批号},{指令序号}][(@策略序号#=0 or {记录序号}=@策略序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@信用交易方式#=0 or {信用交易方式}=@信用交易方式#) and (@策略方向#=0 or {策略方向}=@策略方向#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@目标策略类型#=" " or {目标策略类型}=@目标策略类型#) and (@策略状态#=" " or {策略状态}=@策略状态#) and (@策略处理状态#=" " or {策略处理状态}=@策略处理状态#) and (@策略处理方式#=0 or {策略处理方式}=@策略处理方式#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@策略操作方式# = " " or {策略操作方式} = @策略操作方式#) and (@指令批号# = 0 or {指令批号} = @指令批号#) and (@指令序号# = 0 or {指令序号} = @指令序号#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,update_times,strategy_batch_no,comm_batch_no,comm_id from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_batch_no = 0 or comm_batch_no = v_comm_batch_no) and (v_comm_id = 0 or comm_id = v_comm_id) and row_id<v_row_id order by row_id desc;
        else
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,update_times,strategy_batch_no,comm_batch_no,comm_id from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_batch_no = 0 or comm_batch_no = v_comm_batch_no) and (v_comm_id = 0 or comm_id = v_comm_id) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_插件查询策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_PluginQueryStrategyOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_PluginQueryStrategyOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_strategy_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_strategy_dir int,
    IN p_busi_opor_no int,
    IN p_margin_trade_type int,
    IN p_target_strategy_type varchar(16),
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_deal_kind int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_comm_id bigint,
    IN p_comm_batch_no int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_comm_opor int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_strategy_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_strategy_dir int;
    declare v_busi_opor_no int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_comm_id bigint;
    declare v_comm_batch_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

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
    SET v_comm_opor = p_comm_opor;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_strategy_id = p_strategy_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_strategy_dir = p_strategy_dir;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_comm_id = p_comm_id;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_策略_策略表][{指令下达人},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{记录序号} as {策略序号},{原策略序号},{策略执行商},{策略执行方式},{策略执行指令串},{市场编号},{股东代码编号},{股东代码},{证券类型},{资产类型},{证券代码},{证券代码编号},{策略方向},{策略数量},{资金策略数量},{策略价格},{价格类型},{策略有效期限},{策略规则方式},{交易币种},{备注信息},{策略时间},{信用交易方式},{目标策略类型},{目标策略参数},{策略控制指令},{策略状态},{策略处理状态},{策略处理方式},{策略金额},{订单数量},{订单金额},{撤单数量},{成交数量},{成交金额},{外部编号},{订单批号},{策略操作方式},{策略批号},{指令序号},{指令批号},{更新次数}][(@策略序号#=0 or {记录序号}=@策略序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@信用交易方式#=0 or {信用交易方式}=@信用交易方式#) and (@策略方向#=0 or {策略方向}=@策略方向#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@目标策略类型#=" " or {目标策略类型}=@目标策略类型#) and (@策略状态#=" " or {策略状态}=@策略状态#) and (@策略处理状态#=" " or {策略处理状态}=@策略处理状态#) and (@策略处理方式#=0 or {策略处理方式}=@策略处理方式#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@策略操作方式# = " " or {策略操作方式} = @策略操作方式#) and (@指令序号# = 0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,strategy_batch_no,comm_id,comm_batch_no,update_times from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_id = 0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and row_id>v_row_id order by row_id;
        else
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,strategy_batch_no,comm_id,comm_batch_no,update_times from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_id = 0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_策略_策略表][{指令下达人},{操作员编号},{机构编号},{产品编号},{交易组编号},{资产账户编号},{通道编号},{外部账号},{记录序号} as {策略序号},{原策略序号},{策略执行商},{策略执行方式},{策略执行指令串},{市场编号},{股东代码编号},{股东代码},{证券类型},{资产类型},{证券代码},{证券代码编号},{策略方向},{策略数量},{资金策略数量},{策略价格},{价格类型},{策略有效期限},{策略规则方式},{交易币种},{备注信息},{策略时间},{信用交易方式},{目标策略类型},{目标策略参数},{策略控制指令},{策略状态},{策略处理状态},{策略处理方式},{策略金额},{订单数量},{订单金额},{撤单数量},{成交数量},{成交金额},{外部编号},{订单批号},{策略操作方式},{策略批号},{指令序号},{指令批号},{更新次数}][(@策略序号#=0 or {记录序号}=@策略序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@信用交易方式#=0 or {信用交易方式}=@信用交易方式#) and (@策略方向#=0 or {策略方向}=@策略方向#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@目标策略类型#=" " or {目标策略类型}=@目标策略类型#) and (@策略状态#=" " or {策略状态}=@策略状态#) and (@策略处理状态#=" " or {策略处理状态}=@策略处理状态#) and (@策略处理方式#=0 or {策略处理方式}=@策略处理方式#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@策略操作方式# = " " or {策略操作方式} = @策略操作方式#) and (@指令序号# = 0 or {指令序号}=@指令序号#) and (@指令批号#=0 or {指令批号}=@指令批号#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,strategy_batch_no,comm_id,comm_batch_no,update_times from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_id = 0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and row_id<v_row_id order by row_id desc;
        else
            select comm_opor,opor_no,co_no,pd_no,exch_group_no,asset_acco_no,pass_no,out_acco,row_id as strategy_id,orig_strategy_id,strategy_exec_broker,strategy_exec_kind,strategy_exec_comm_str,exch_no,stock_acco_no,stock_acco,stock_type,asset_type,stock_code,stock_code_no,strategy_dir,strategy_qty,cash_strategy_qty,strategy_price,price_type,strategy_valid_type,strategy_rule_way,exch_crncy_type,remark_info,strategy_time,margin_trade_type,target_strategy_type,target_strategy_param,strategy_contr_comm,strategy_status,strategy_deal_status,strategy_deal_kind,strategy_amt,order_qty,order_amt,wtdraw_qty,strike_qty,strike_amt,external_no,order_batch_no,strategy_oper_way,strategy_batch_no,comm_id,comm_batch_no,update_times from db_tdsecu.tb_tdsest_strategyorder where (v_strategy_id=0 or row_id=v_strategy_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and (v_comm_id = 0 or comm_id=v_comm_id) and (v_comm_batch_no=0 or comm_batch_no=v_comm_batch_no) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_更新汇总策略
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_UpdateStrategySumOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_UpdateStrategySumOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_oper_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_comm_opor int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_trade_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strategy_batch_no int,
    IN p_strategy_dir int,
    IN p_strategy_price decimal(16,9),
    IN p_strategy_qty decimal(18,2),
    IN p_cash_strategy_qty decimal(18,2),
    IN p_strategy_amt decimal(18,4),
    IN p_strategy_exec_broker varchar(16),
    IN p_strategy_exec_kind int,
    IN p_strategy_exec_comm_str varchar(2048),
    IN p_price_type int,
    IN p_strategy_valid_type int,
    IN p_strategy_rule_way varchar(4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_impawn_ratio decimal(18,12),
    IN p_intrst_days int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_remark_info varchar(255),
    IN p_strategy_date int,
    IN p_margin_trade_type int,
    IN p_strategy_deal_kind int,
    IN p_target_strategy_type varchar(16),
    IN p_target_strategy_param varchar(2048),
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_comm_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_contr_comm varchar(2048),
    IN p_cancel_qty decimal(18,2),
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
    declare v_oper_func_code varchar(16);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_comm_opor int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strategy_batch_no int;
    declare v_strategy_dir int;
    declare v_strategy_price decimal(16,9);
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_price_type int;
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_margin_trade_type int;
    declare v_strategy_deal_kind int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_comm_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_contr_comm varchar(2048);
    declare v_cancel_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_sum_status varchar(2);
    declare v_order_qty decimal(18,2);
    declare v_valid_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_tmp_stock_code_no int;
    declare v_tmp_stock_code varchar(6);
    declare v_tmp_strategy_dir int;
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
    SET v_oper_func_code = p_oper_func_code;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_comm_opor = p_comm_opor;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_trade_code_no = p_trade_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_strategy_dir = p_strategy_dir;
    SET v_strategy_price = p_strategy_price;
    SET v_strategy_qty = p_strategy_qty;
    SET v_cash_strategy_qty = p_cash_strategy_qty;
    SET v_strategy_amt = p_strategy_amt;
    SET v_strategy_exec_broker = p_strategy_exec_broker;
    SET v_strategy_exec_kind = p_strategy_exec_kind;
    SET v_strategy_exec_comm_str = p_strategy_exec_comm_str;
    SET v_price_type = p_price_type;
    SET v_strategy_valid_type = p_strategy_valid_type;
    SET v_strategy_rule_way = p_strategy_rule_way;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_intrst_days = p_intrst_days;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_remark_info = p_remark_info;
    SET v_strategy_date = p_strategy_date;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_target_strategy_param = p_target_strategy_param;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_contr_comm = p_strategy_contr_comm;
    SET v_cancel_qty = p_cancel_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_sum_status = " ";
    SET v_order_qty = 0;
    SET v_valid_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_faild_qty = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_tmp_stock_code = " ";
    SET v_tmp_strategy_dir = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [检查正常返回][@策略批号# = 0] */
    if v_strategy_batch_no = 0 then
        leave label_pro;
    end if;


    /* set @策略汇总状态# = @策略状态#; */
    set v_strategy_sum_status = v_strategy_status;

    /* set @订单数量# = 0; */
    set v_order_qty = 0;

    /* set @有效订单数量# = 0; */
    set v_valid_order_qty = 0;

    /* set @订单金额# = 0; */
    set v_order_amt = 0;

    /* set @撤单数量# = 0; */
    set v_wtdraw_qty = 0;

    /* set @成交数量# = 0; */
    set v_strike_qty = 0;

    /* set @成交金额# = 0; */
    set v_strike_amt = 0;

    /* set @有效撤单数量# = 0; */
    set v_valid_wtdraw_qty = 0;

    /* set @失败数量# = 0; */
    set v_faild_qty = 0;

    /* set @临时_证券代码编号# = @证券代码编号#; */
    set v_tmp_stock_code_no = v_stock_code_no;

    /* set @临时_证券代码# = @证券代码#; */
    set v_tmp_stock_code = v_stock_code;

    /* set @临时_策略方向# = @策略方向#; */
    set v_tmp_strategy_dir = v_strategy_dir;

    /* [插入重复更新][交易证券_策略_策略汇总表][字段][字段变量][{策略数量} = {策略数量} + @策略数量#, {策略金额} = {策略金额} + @策略金额#,{撤销数量}={撤销数量}+@撤销数量#][1][@策略批号#, @策略数量#,@策略金额#,@撤销数量#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsest_strategyordersum (
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_func_code, comm_opor, co_no, pd_no, 
        exch_group_no, asset_acco_no, pass_no, strategy_batch_no, 
        strategy_exec_broker, strategy_exec_kind, strategy_exec_comm_str, exch_no, 
        stock_type, asset_type, stock_code, stock_code_no, 
        strategy_dir, strategy_qty, cash_strategy_qty, strategy_price, 
        price_type, strategy_amt, strategy_valid_type, strategy_rule_way, 
        exch_crncy_type, remark_info, strategy_date, margin_trade_type, 
        target_strategy_type, target_strategy_param, strategy_contr_comm, strategy_sum_status, 
        strategy_deal_status, strategy_deal_kind, order_qty, order_amt, 
        valid_order_qty, wtdraw_qty, valid_wtdraw_qty, strike_qty, 
        strike_amt, cancel_qty, faild_qty, external_no, 
        order_batch_no, comm_batch_no, strategy_oper_way) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_func_code, v_comm_opor, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_pass_no, v_strategy_batch_no, 
        v_strategy_exec_broker, v_strategy_exec_kind, v_strategy_exec_comm_str, v_exch_no, 
        v_stock_type, v_asset_type, v_stock_code, v_stock_code_no, 
        v_strategy_dir, v_strategy_qty, v_cash_strategy_qty, v_strategy_price, 
        v_price_type, v_strategy_amt, v_strategy_valid_type, v_strategy_rule_way, 
        v_exch_crncy_type, v_remark_info, v_strategy_date, v_margin_trade_type, 
        v_target_strategy_type, v_target_strategy_param, v_strategy_contr_comm, v_strategy_sum_status, 
        v_strategy_deal_status, v_strategy_deal_kind, v_order_qty, v_order_amt, 
        v_valid_order_qty, v_wtdraw_qty, v_valid_wtdraw_qty, v_strike_qty, 
        v_strike_amt, v_cancel_qty, v_faild_qty, v_external_no, 
        v_order_batch_no, v_comm_batch_no, v_strategy_oper_way) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strategy_qty = strategy_qty + v_strategy_qty, strategy_amt = strategy_amt + v_strategy_amt,cancel_qty=cancel_qty+v_cancel_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.17.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no,","," 策略数量=", v_strategy_qty,",","策略金额=",v_strategy_amt,",","撤销数量=",v_cancel_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no,","," 策略数量=", v_strategy_qty,",","策略金额=",v_strategy_amt,",","撤销数量=",v_cancel_qty);
        end if;
        leave label_pro;
    end if;


    /* [锁定获取表记录变量][交易证券_策略_策略汇总表][{证券代码编号},{策略方向}][@证券代码编号#,@策略方向#][{策略批号}=@策略批号# and {策略日期} = @策略日期# and {机构编号} = @机构编号#][4][@策略批号#,@策略日期#,@机构编号#] */
    select stock_code_no,strategy_dir into v_stock_code_no,v_strategy_dir from db_tdsecu.tb_tdsest_strategyordersum where strategy_batch_no=v_strategy_batch_no and strategy_date = v_strategy_date and co_no = v_co_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.11.17.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no,",","策略日期=",v_strategy_date,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no,",","策略日期=",v_strategy_date,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* if @临时_证券代码编号# <> @证券代码编号# then */
    if v_tmp_stock_code_no <> v_stock_code_no then

        /* set @证券代码编号#= 0; */
        set v_stock_code_no= 0;

        /* set @证券代码# = " "; */
        set v_stock_code = " ";
    end if;

    /* if @临时_策略方向# <> @策略方向# then */
    if v_tmp_strategy_dir <> v_strategy_dir then

        /* set @策略方向#= 0; */
        set v_strategy_dir= 0;
    end if;

    /* [更新表记录][交易证券_策略_策略汇总表][{证券代码编号} = @证券代码编号#,{证券代码}=@证券代码#,{策略方向} = @策略方向#][{策略批号}=@策略批号# and {策略日期} = @策略日期# and {机构编号} = @机构编号#][2][@策略批号#, @策略日期#,@机构编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsest_strategyordersum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, stock_code_no = v_stock_code_no,stock_code=v_stock_code,strategy_dir = v_strategy_dir where strategy_batch_no=v_strategy_batch_no and strategy_date = v_strategy_date and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.17.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no,","," 策略日期=", v_strategy_date,",","机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no,","," 策略日期=", v_strategy_date,",","机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;


    /* 调用【原子_交易证券_策略_更新汇总策略状态】*/
    call db_tdsecu.pra_tdsest_UpdateStrategySumOrderState(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_strategy_batch_no,
        v_strategy_dir,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.11.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_策略_更新汇总策略状态出现错误！',v_mysql_message);
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
use db_tdsecu;;

# 原子_交易证券_策略_查询策略汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_QueryStrategyOrderSum;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_QueryStrategyOrderSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_opor int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_strategy_sum_id bigint,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_strategy_dir int,
    IN p_busi_opor_no int,
    IN p_margin_trade_type int,
    IN p_target_strategy_type varchar(16),
    IN p_strategy_status varchar(2),
    IN p_strategy_deal_status varchar(2),
    IN p_strategy_deal_kind int,
    IN p_external_no bigint,
    IN p_order_batch_no int,
    IN p_comm_batch_no int,
    IN p_strategy_oper_way varchar(2),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_sort_type int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_comm_opor int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_strategy_sum_id bigint;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_strategy_dir int;
    declare v_busi_opor_no int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_strategy_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_comm_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;

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
    SET v_comm_opor = p_comm_opor;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_strategy_sum_id = p_strategy_sum_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_strategy_dir = p_strategy_dir;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_margin_trade_type = p_margin_trade_type;
    SET v_target_strategy_type = p_target_strategy_type;
    SET v_strategy_status = p_strategy_status;
    SET v_strategy_deal_status = p_strategy_deal_status;
    SET v_strategy_deal_kind = p_strategy_deal_kind;
    SET v_external_no = p_external_no;
    SET v_order_batch_no = p_order_batch_no;
    SET v_comm_batch_no = p_comm_batch_no;
    SET v_strategy_oper_way = p_strategy_oper_way;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_策略_策略汇总表][字段][(@策略汇总序号#=0 or {记录序号}=@策略汇总序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@信用交易方式#=0 or {信用交易方式}=@信用交易方式#) and (@策略方向#=0 or {策略方向}=@策略方向#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@目标策略类型#=" " or {目标策略类型}=@目标策略类型#) and (@策略状态#=" " or {策略汇总状态}=@策略状态#) and (@策略处理状态#=" " or {策略处理状态}=@策略处理状态#) and (@策略处理方式#=0 or {策略处理方式}=@策略处理方式#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@策略操作方式# = " " or {策略操作方式} = @策略操作方式#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, comm_opor, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            strategy_batch_no, strategy_exec_broker, strategy_exec_kind, strategy_exec_comm_str, 
            exch_no, stock_type, asset_type, stock_code, 
            stock_code_no, strategy_dir, strategy_qty, cash_strategy_qty, 
            strategy_price, price_type, strategy_amt, strategy_valid_type, 
            strategy_rule_way, exch_crncy_type, remark_info, strategy_date, 
            margin_trade_type, target_strategy_type, target_strategy_param, strategy_contr_comm, 
            strategy_sum_status, strategy_deal_status, strategy_deal_kind, order_qty, 
            order_amt, valid_order_qty, wtdraw_qty, valid_wtdraw_qty, 
            strike_qty, strike_amt, cancel_qty, faild_qty, 
            external_no, order_batch_no, comm_batch_no, strategy_oper_way from db_tdsecu.tb_tdsest_strategyordersum where (v_strategy_sum_id=0 or row_id=v_strategy_sum_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_sum_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, comm_opor, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            strategy_batch_no, strategy_exec_broker, strategy_exec_kind, strategy_exec_comm_str, 
            exch_no, stock_type, asset_type, stock_code, 
            stock_code_no, strategy_dir, strategy_qty, cash_strategy_qty, 
            strategy_price, price_type, strategy_amt, strategy_valid_type, 
            strategy_rule_way, exch_crncy_type, remark_info, strategy_date, 
            margin_trade_type, target_strategy_type, target_strategy_param, strategy_contr_comm, 
            strategy_sum_status, strategy_deal_status, strategy_deal_kind, order_qty, 
            order_amt, valid_order_qty, wtdraw_qty, valid_wtdraw_qty, 
            strike_qty, strike_amt, cancel_qty, faild_qty, 
            external_no, order_batch_no, comm_batch_no, strategy_oper_way from db_tdsecu.tb_tdsest_strategyordersum where (v_strategy_sum_id=0 or row_id=v_strategy_sum_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_sum_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_策略_策略汇总表][字段][(@策略汇总序号#=0 or {记录序号}=@策略汇总序号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@信用交易方式#=0 or {信用交易方式}=@信用交易方式#) and (@策略方向#=0 or {策略方向}=@策略方向#) and (@业务操作员编号#=0 or {操作员编号}=@业务操作员编号#) and (@指令下达人#=0 or {指令下达人}=@指令下达人#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@目标策略类型#=" " or {目标策略类型}=@目标策略类型#) and (@策略状态#=" " or {策略汇总状态}=@策略状态#) and (@策略处理状态#=" " or {策略处理状态}=@策略处理状态#) and (@策略处理方式#=0 or {策略处理方式}=@策略处理方式#) and (@外部编号#=0 or {外部编号}=@外部编号#) and (@订单批号#=0 or {订单批号}=@订单批号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@策略操作方式# = " " or {策略操作方式} = @策略操作方式#) and {记录序号}<@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, comm_opor, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            strategy_batch_no, strategy_exec_broker, strategy_exec_kind, strategy_exec_comm_str, 
            exch_no, stock_type, asset_type, stock_code, 
            stock_code_no, strategy_dir, strategy_qty, cash_strategy_qty, 
            strategy_price, price_type, strategy_amt, strategy_valid_type, 
            strategy_rule_way, exch_crncy_type, remark_info, strategy_date, 
            margin_trade_type, target_strategy_type, target_strategy_param, strategy_contr_comm, 
            strategy_sum_status, strategy_deal_status, strategy_deal_kind, order_qty, 
            order_amt, valid_order_qty, wtdraw_qty, valid_wtdraw_qty, 
            strike_qty, strike_amt, cancel_qty, faild_qty, 
            external_no, order_batch_no, comm_batch_no, strategy_oper_way from db_tdsecu.tb_tdsest_strategyordersum where (v_strategy_sum_id=0 or row_id=v_strategy_sum_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_sum_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and row_id<v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_func_code, comm_opor, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            strategy_batch_no, strategy_exec_broker, strategy_exec_kind, strategy_exec_comm_str, 
            exch_no, stock_type, asset_type, stock_code, 
            stock_code_no, strategy_dir, strategy_qty, cash_strategy_qty, 
            strategy_price, price_type, strategy_amt, strategy_valid_type, 
            strategy_rule_way, exch_crncy_type, remark_info, strategy_date, 
            margin_trade_type, target_strategy_type, target_strategy_param, strategy_contr_comm, 
            strategy_sum_status, strategy_deal_status, strategy_deal_kind, order_qty, 
            order_amt, valid_order_qty, wtdraw_qty, valid_wtdraw_qty, 
            strike_qty, strike_amt, cancel_qty, faild_qty, 
            external_no, order_batch_no, comm_batch_no, strategy_oper_way from db_tdsecu.tb_tdsest_strategyordersum where (v_strategy_sum_id=0 or row_id=v_strategy_sum_id) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no=0 or exch_no=v_exch_no) and (v_margin_trade_type=0 or margin_trade_type=v_margin_trade_type) and (v_strategy_dir=0 or strategy_dir=v_strategy_dir) and (v_busi_opor_no=0 or opor_no=v_busi_opor_no) and (v_comm_opor=0 or comm_opor=v_comm_opor) and (v_stock_code=" " or stock_code=v_stock_code) and (v_target_strategy_type=" " or target_strategy_type=v_target_strategy_type) and (v_strategy_status=" " or strategy_sum_status=v_strategy_status) and (v_strategy_deal_status=" " or strategy_deal_status=v_strategy_deal_status) and (v_strategy_deal_kind=0 or strategy_deal_kind=v_strategy_deal_kind) and (v_external_no=0 or external_no=v_external_no) and (v_order_batch_no=0 or order_batch_no=v_order_batch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_strategy_oper_way = " " or strategy_oper_way = v_strategy_oper_way) and row_id<v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_查询单条策略汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_QuerySingleStrategyOrderSum;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_QuerySingleStrategyOrderSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strategy_batch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_comm_opor int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_strategy_exec_broker varchar(16),
    OUT p_strategy_exec_kind int,
    OUT p_strategy_exec_comm_str varchar(2048),
    OUT p_exch_no int,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_stock_code varchar(6),
    OUT p_stock_code_no int,
    OUT p_strategy_dir int,
    OUT p_strategy_qty decimal(18,2),
    OUT p_cash_strategy_qty decimal(18,2),
    OUT p_strategy_price decimal(16,9),
    OUT p_price_type int,
    OUT p_strategy_amt decimal(18,4),
    OUT p_strategy_valid_type int,
    OUT p_strategy_rule_way varchar(4),
    OUT p_exch_crncy_type varchar(3),
    OUT p_remark_info varchar(255),
    OUT p_strategy_date int,
    OUT p_margin_trade_type int,
    OUT p_target_strategy_type varchar(16),
    OUT p_target_strategy_param varchar(2048),
    OUT p_strategy_contr_comm varchar(2048),
    OUT p_strategy_sum_status varchar(2),
    OUT p_strategy_deal_status varchar(2),
    OUT p_strategy_deal_kind int,
    OUT p_order_qty decimal(18,2),
    OUT p_valid_order_qty decimal(18,2),
    OUT p_order_amt decimal(18,4),
    OUT p_wtdraw_qty decimal(18,2),
    OUT p_valid_wtdraw_qty decimal(18,2),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_cancel_qty decimal(18,2),
    OUT p_faild_qty decimal(18,2),
    OUT p_external_no bigint,
    OUT p_order_batch_no int,
    OUT p_comm_batch_no int,
    OUT p_strategy_oper_way varchar(2),
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
    declare v_strategy_batch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_comm_opor int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_strategy_exec_broker varchar(16);
    declare v_strategy_exec_kind int;
    declare v_strategy_exec_comm_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_cash_strategy_qty decimal(18,2);
    declare v_strategy_price decimal(16,9);
    declare v_price_type int;
    declare v_strategy_amt decimal(18,4);
    declare v_strategy_valid_type int;
    declare v_strategy_rule_way varchar(4);
    declare v_exch_crncy_type varchar(3);
    declare v_remark_info varchar(255);
    declare v_strategy_date int;
    declare v_margin_trade_type int;
    declare v_target_strategy_type varchar(16);
    declare v_target_strategy_param varchar(2048);
    declare v_strategy_contr_comm varchar(2048);
    declare v_strategy_sum_status varchar(2);
    declare v_strategy_deal_status varchar(2);
    declare v_strategy_deal_kind int;
    declare v_order_qty decimal(18,2);
    declare v_valid_order_qty decimal(18,2);
    declare v_order_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_cancel_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_external_no bigint;
    declare v_order_batch_no int;
    declare v_comm_batch_no int;
    declare v_strategy_oper_way varchar(2);
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_oper_func_code varchar(16);

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
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_comm_opor = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_strategy_exec_broker = " ";
    SET v_strategy_exec_kind = 0;
    SET v_strategy_exec_comm_str = " ";
    SET v_exch_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_stock_code = " ";
    SET v_stock_code_no = 0;
    SET v_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_cash_strategy_qty = 0;
    SET v_strategy_price = 0;
    SET v_price_type = 0;
    SET v_strategy_amt = 0;
    SET v_strategy_valid_type = 0;
    SET v_strategy_rule_way = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_remark_info = " ";
    SET v_strategy_date = date_format(curdate(),'%Y%m%d');
    SET v_margin_trade_type = 0;
    SET v_target_strategy_type = " ";
    SET v_target_strategy_param = " ";
    SET v_strategy_contr_comm = " ";
    SET v_strategy_sum_status = " ";
    SET v_strategy_deal_status = " ";
    SET v_strategy_deal_kind = 0;
    SET v_order_qty = 0;
    SET v_valid_order_qty = 0;
    SET v_order_amt = 0;
    SET v_wtdraw_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_cancel_qty = 0;
    SET v_faild_qty = 0;
    SET v_external_no = 0;
    SET v_order_batch_no = 0;
    SET v_comm_batch_no = 0;
    SET v_strategy_oper_way = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_策略_策略汇总表][字段][字段变量][{策略批号}=@策略批号# and (@操作员机构编号# =9999 or  {机构编号} = @操作员机构编号#)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, comm_opor, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        strategy_batch_no, strategy_exec_broker, strategy_exec_kind, strategy_exec_comm_str, 
        exch_no, stock_type, asset_type, stock_code, 
        stock_code_no, strategy_dir, strategy_qty, cash_strategy_qty, 
        strategy_price, price_type, strategy_amt, strategy_valid_type, 
        strategy_rule_way, exch_crncy_type, remark_info, strategy_date, 
        margin_trade_type, target_strategy_type, target_strategy_param, strategy_contr_comm, 
        strategy_sum_status, strategy_deal_status, strategy_deal_kind, order_qty, 
        order_amt, valid_order_qty, wtdraw_qty, valid_wtdraw_qty, 
        strike_qty, strike_amt, cancel_qty, faild_qty, 
        external_no, order_batch_no, comm_batch_no, strategy_oper_way into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_func_code, v_comm_opor, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_strategy_batch_no, v_strategy_exec_broker, v_strategy_exec_kind, v_strategy_exec_comm_str, 
        v_exch_no, v_stock_type, v_asset_type, v_stock_code, 
        v_stock_code_no, v_strategy_dir, v_strategy_qty, v_cash_strategy_qty, 
        v_strategy_price, v_price_type, v_strategy_amt, v_strategy_valid_type, 
        v_strategy_rule_way, v_exch_crncy_type, v_remark_info, v_strategy_date, 
        v_margin_trade_type, v_target_strategy_type, v_target_strategy_param, v_strategy_contr_comm, 
        v_strategy_sum_status, v_strategy_deal_status, v_strategy_deal_kind, v_order_qty, 
        v_order_amt, v_valid_order_qty, v_wtdraw_qty, v_valid_wtdraw_qty, 
        v_strike_qty, v_strike_amt, v_cancel_qty, v_faild_qty, 
        v_external_no, v_order_batch_no, v_comm_batch_no, v_strategy_oper_way from db_tdsecu.tb_tdsest_strategyordersum where strategy_batch_no=v_strategy_batch_no and (v_opor_co_no =9999 or  co_no = v_opor_co_no) limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_comm_opor = v_comm_opor;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_strategy_exec_broker = v_strategy_exec_broker;
    SET p_strategy_exec_kind = v_strategy_exec_kind;
    SET p_strategy_exec_comm_str = v_strategy_exec_comm_str;
    SET p_exch_no = v_exch_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_stock_code = v_stock_code;
    SET p_stock_code_no = v_stock_code_no;
    SET p_strategy_dir = v_strategy_dir;
    SET p_strategy_qty = v_strategy_qty;
    SET p_cash_strategy_qty = v_cash_strategy_qty;
    SET p_strategy_price = v_strategy_price;
    SET p_price_type = v_price_type;
    SET p_strategy_amt = v_strategy_amt;
    SET p_strategy_valid_type = v_strategy_valid_type;
    SET p_strategy_rule_way = v_strategy_rule_way;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_remark_info = v_remark_info;
    SET p_strategy_date = v_strategy_date;
    SET p_margin_trade_type = v_margin_trade_type;
    SET p_target_strategy_type = v_target_strategy_type;
    SET p_target_strategy_param = v_target_strategy_param;
    SET p_strategy_contr_comm = v_strategy_contr_comm;
    SET p_strategy_sum_status = v_strategy_sum_status;
    SET p_strategy_deal_status = v_strategy_deal_status;
    SET p_strategy_deal_kind = v_strategy_deal_kind;
    SET p_order_qty = v_order_qty;
    SET p_valid_order_qty = v_valid_order_qty;
    SET p_order_amt = v_order_amt;
    SET p_wtdraw_qty = v_wtdraw_qty;
    SET p_valid_wtdraw_qty = v_valid_wtdraw_qty;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_cancel_qty = v_cancel_qty;
    SET p_faild_qty = v_faild_qty;
    SET p_external_no = v_external_no;
    SET p_order_batch_no = v_order_batch_no;
    SET p_comm_batch_no = v_comm_batch_no;
    SET p_strategy_oper_way = v_strategy_oper_way;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_更新汇总策略状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_UpdateStrategySumOrderState;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_UpdateStrategySumOrderState(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_strategy_batch_no int,
    IN p_strategy_dir int,
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
    declare v_strategy_batch_no int;
    declare v_strategy_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_strategy_dir int;
    declare v_strategy_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_valid_wtdraw_qty decimal(18,2);
    declare v_faild_qty decimal(18,2);
    declare v_cancel_qty decimal(18,2);
    declare v_strategy_sum_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_strategy_deal_status varchar(2);

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
    SET v_strategy_batch_no = p_strategy_batch_no;
    SET v_strategy_dir = p_strategy_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_strategy_dir = 0;
    SET v_strategy_qty = 0;
    SET v_order_qty = 0;
    SET v_strike_qty = 0;
    SET v_wtdraw_qty = 0;
    SET v_valid_wtdraw_qty = 0;
    SET v_faild_qty = 0;
    SET v_cancel_qty = 0;
    SET v_strategy_sum_status = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_strategy_deal_status = " ";

    
    label_pro:BEGIN
    

    /* set @临时_策略方向# = @策略方向#; */
    set v_tmp_strategy_dir = v_strategy_dir;

    /* [获取表记录变量语句][交易证券_策略_策略汇总表][{策略数量},{订单数量},{成交数量},{撤单数量},{有效撤单数量},{失败数量},{撤销数量},{策略方向}][@策略数量#,@订单数量#,@成交数量#,@撤单数量#,@有效撤单数量#,@失败数量#,@撤销数量#,@策略方向#][{策略批号}=@策略批号# and {机构编号} = @机构编号#] */
    select strategy_qty,order_qty,strike_qty,wtdraw_qty,valid_wtdraw_qty,faild_qty,cancel_qty,strategy_dir into v_strategy_qty,v_order_qty,v_strike_qty,v_wtdraw_qty,v_valid_wtdraw_qty,v_faild_qty,v_cancel_qty,v_strategy_dir from db_tdsecu.tb_tdsest_strategyordersum where strategy_batch_no=v_strategy_batch_no and co_no = v_co_no limit 1;


    /* if @失败数量#=0 and @策略数量# <=(@成交数量# +@撤销数量#) then */
    if v_faild_qty=0 and v_strategy_qty <=(v_strike_qty +v_cancel_qty) then

        /* set @策略汇总状态# = 《策略汇总状态-执行完成》; */
        set v_strategy_sum_status = "3";

        /* set @撤销数量# =@策略数量#-@成交数量#; */
        set v_cancel_qty =v_strategy_qty-v_strike_qty;

    /* [更新表记录][交易证券_策略_策略汇总表][{撤销数量}=@撤销数量#][{策略批号}=@策略批号# and {机构编号} = @机构编号#][2][@策略批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsest_strategyordersum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cancel_qty=v_cancel_qty where strategy_batch_no=v_strategy_batch_no and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.20.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no);
        end if;
        leave label_pro;
    end if;


    /* elseif @订单数量# = 0 and @失败数量# =0  then */
    elseif v_order_qty = 0 and v_faild_qty =0  then

        /* set @策略汇总状态# = 《策略汇总状态-未执行》; */
        set v_strategy_sum_status = "1";

    /* elseif @失败数量#=@策略数量#  then */
    elseif v_faild_qty=v_strategy_qty  then

        /* set @策略汇总状态# = 《策略汇总状态-全部失败》; */
        set v_strategy_sum_status = "6";

    /* elseif @失败数量#>0 and @策略数量# > (@成交数量# +@失败数量# +@撤销数量#) then */
    elseif v_faild_qty>0 and v_strategy_qty > (v_strike_qty +v_faild_qty +v_cancel_qty) then

        /* set @策略汇总状态# = 《策略汇总状态-部分失败(执行中)》; */
        set v_strategy_sum_status = "4";

    /* elseif @失败数量#>0 and @策略数量# <=(@成交数量# +@失败数量# +@撤销数量#) then */
    elseif v_faild_qty>0 and v_strategy_qty <=(v_strike_qty +v_faild_qty +v_cancel_qty) then

        /* set @策略汇总状态# = 《策略汇总状态-部分失败(执行完成)》; */
        set v_strategy_sum_status = "5";

        /* set @撤销数量# = @策略数量#-@成交数量#-@失败数量#; */
        set v_cancel_qty = v_strategy_qty-v_strike_qty-v_faild_qty;

    /* [更新表记录][交易证券_策略_策略汇总表][{撤销数量}=@撤销数量#][{策略批号}=@策略批号# and {机构编号} = @机构编号#][2][@策略批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsest_strategyordersum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cancel_qty=v_cancel_qty where strategy_batch_no=v_strategy_batch_no and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.20.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no);
        end if;
        leave label_pro;
    end if;

    else

        /* set @策略汇总状态# = 《策略汇总状态-执行中》; */
        set v_strategy_sum_status = "2";
    end if;

    /* if @临时_策略方向# <>  @策略方向# then */
    if v_tmp_strategy_dir <>  v_strategy_dir then

        /* set @临时_策略方向# = 《策略方向-混合》; */
        set v_tmp_strategy_dir = 0;
    end if;

    /* [更新表记录][交易证券_策略_策略汇总表][{策略汇总状态} = @策略汇总状态#,{策略处理状态}=@策略处理状态#,{策略方向} = @临时_策略方向#][{策略批号}=@策略批号# and {机构编号} = @机构编号#][2][@策略批号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsest_strategyordersum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_sum_status = v_strategy_sum_status,strategy_deal_status=v_strategy_deal_status,strategy_dir = v_tmp_strategy_dir where strategy_batch_no=v_strategy_batch_no and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.20.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("策略批号=",v_strategy_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("策略批号=",v_strategy_batch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_更新指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_UpdateCommon;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_UpdateCommon(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_id bigint,
    IN p_strategy_capt_qty decimal(18,2),
    IN p_strategy_order_qty decimal(18,2),
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
    declare v_comm_id bigint;
    declare v_strategy_capt_qty decimal(18,2);
    declare v_strategy_order_qty decimal(18,2);
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
    SET v_comm_id = p_comm_id;
    SET v_strategy_capt_qty = p_strategy_capt_qty;
    SET v_strategy_order_qty = p_strategy_order_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_指令_指令表][{策略占用数量} = {策略占用数量}+@策略占用数量#,{策略订单数量} = {策略订单数量}+@策略订单数量#][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_capt_qty = strategy_capt_qty+v_strategy_capt_qty,strategy_order_qty = strategy_order_qty+v_strategy_order_qty where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.21.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_策略_重置指令策略数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsest_ResetCommStrategyQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsest_ResetCommStrategyQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_comm_id bigint,
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
    declare v_comm_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strategy_qty decimal(18,2);
    declare v_valid_order_qty decimal(18,2);
    declare v_tmp_valid_order_qty decimal(18,2);
    declare v_tmp_strategy_qty decimal(18,2);
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
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strategy_qty = 0;
    SET v_valid_order_qty = 0;
    SET v_tmp_valid_order_qty = 0;
    SET v_tmp_strategy_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #过滤 已拒绝、发送失败

    /* [获取表记录变量语句][交易证券_策略_策略表][IFNULL(SUM({策略数量}),0)][@策略数量#][{机构编号}=@机构编号# and {指令序号} = @指令序号# and {原策略序号} = 0 and {策略状态} in (《策略状态-新建》,《策略状态-待发送》,《策略状态-执行中》,《策略状态-暂停中》,《策略状态-已暂停》,《策略状态-重启中》,《策略状态-已完成》,《策略状态-撤销中》)] */
    select IFNULL(SUM(strategy_qty),0) into v_strategy_qty from db_tdsecu.tb_tdsest_strategyorder where co_no=v_co_no and comm_id = v_comm_id and orig_strategy_id = 0 and strategy_status in ("1","2","3","4","5","6","7","a") limit 1;

    #SELECT IFNULL(SUM({订单数量} - {撤单数量}),0) INTO @有效订单数量#  FROM ~交易证券_交易_订单表^ WHERE {机构编号} = @机构编号# and {指令序号} = @指令序号# and {策略序号} <> 0;

    /* [获取表记录变量语句][交易证券_交易_订单表][IFNULL(SUM({订单数量}-{撤单数量}),0)][@有效订单数量#][{机构编号} = @机构编号# and {指令序号} = @指令序号# and {策略序号} <> 0] */
    select IFNULL(SUM(order_qty-wtdraw_qty),0) into v_valid_order_qty from db_tdsecu.tb_tdsetd_order where co_no = v_co_no and comm_id = v_comm_id and strategy_id <> 0 limit 1;


    /* [获取表记录变量语句][历史_交易证券_交易_订单表][IFNULL(SUM({成交数量}),0)][@临时_有效订单数量#][{机构编号} = @机构编号# and {指令序号} = @指令序号# and {策略序号} <> 0] */
    select IFNULL(SUM(strike_qty),0) into v_tmp_valid_order_qty from db_tdsecu_his.tb_tdsetd_order_his where co_no = v_co_no and comm_id = v_comm_id and strategy_id <> 0 limit 1;


    /* [获取表记录变量语句][交易证券_策略_策略表][IFNULL(SUM({成交数量}),0)][@临时_策略数量#][{机构编号}=@机构编号# and {指令序号} = @指令序号# and {原策略序号} = 0  and {策略状态} in (《策略状态-已过期》,《策略状态-已撤销》)] */
    select IFNULL(SUM(strike_qty),0) into v_tmp_strategy_qty from db_tdsecu.tb_tdsest_strategyorder where co_no=v_co_no and comm_id = v_comm_id and orig_strategy_id = 0  and strategy_status in ("9","b") limit 1;


    /* set @策略数量# = @策略数量# + @临时_策略数量# + @临时_有效订单数量#; */
    set v_strategy_qty = v_strategy_qty + v_tmp_strategy_qty + v_tmp_valid_order_qty;

    /* set @有效订单数量# = @有效订单数量# + @临时_有效订单数量#; */
    set v_valid_order_qty = v_valid_order_qty + v_tmp_valid_order_qty;

    /* [更新表记录][交易证券_指令_指令表][{策略订单数量} =  @有效订单数量#,{策略占用数量} = @策略数量#][{记录序号}=@指令序号#][2][@指令序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strategy_order_qty =  v_valid_order_qty,strategy_capt_qty = v_strategy_qty where row_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.11.105.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("指令序号=",v_comm_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("指令序号=",v_comm_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


