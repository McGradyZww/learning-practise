DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步证券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecuMarketInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecuMarketInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_code_no int,
    IN p_stock_name varchar(64),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_asset_type int,
    IN p_stock_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_total_stock_issue decimal(18,2),
    IN p_circl_stock_capit decimal(18,2),
    IN p_net_price_flag int,
    IN p_bond_rate_type int,
    IN p_last_price decimal(16,9),
    IN p_pre_close_price decimal(16,9),
    IN p_today_open_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_fair_price decimal(16,9),
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
    declare v_stock_name varchar(64);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_asset_type int;
    declare v_stock_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_net_price_flag int;
    declare v_bond_rate_type int;
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_fair_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_time_stamp int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_name = p_stock_name;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_asset_type = p_asset_type;
    SET v_stock_type = p_stock_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_total_stock_issue = p_total_stock_issue;
    SET v_circl_stock_capit = p_circl_stock_capit;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_last_price = p_last_price;
    SET v_pre_close_price = p_pre_close_price;
    SET v_today_open_price = p_today_open_price;
    SET v_strike_amt = p_strike_amt;
    SET v_fair_price = p_fair_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @时间戳# =  unix_timestamp(); */
    set v_time_stamp =  unix_timestamp();

    /* [插入重复更新][风控证券_计算_证券信息表][字段][字段变量][{证券名称} = @证券名称#, {流通股本} =@流通股本#,{债券计提利息}=@债券计提利息#,{总股本} =@总股本#,{净价标志}=@净价标志#,{时间戳}=@时间戳#,{债券利率类型} = @债券利率类型#,{最新价} = @最新价#, {昨收盘价}= @昨收盘价#,{今开盘价}=@今开盘价#, {成交金额}= @成交金额#,{公允价格}= @公允价格#][5][@证券代码#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksecc_secu_stock_info (
        create_date, create_time, update_date, 
        update_time, update_times, stock_code_no, stock_code, 
        stock_name, exch_no, asset_type, stock_type, 
        bond_accr_intrst, bond_rate_type, total_stock_issue, circl_stock_capit, 
        net_price_flag, fair_price, last_price, pre_close_price, 
        today_open_price, strike_amt, time_stamp) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_stock_code_no, v_stock_code, 
        v_stock_name, v_exch_no, v_asset_type, v_stock_type, 
        v_bond_accr_intrst, v_bond_rate_type, v_total_stock_issue, v_circl_stock_capit, 
        v_net_price_flag, v_fair_price, v_last_price, v_pre_close_price, 
        v_today_open_price, v_strike_amt, v_time_stamp) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, stock_name = v_stock_name, circl_stock_capit =v_circl_stock_capit,bond_accr_intrst=v_bond_accr_intrst,total_stock_issue =v_total_stock_issue,net_price_flag=v_net_price_flag,time_stamp=v_time_stamp,bond_rate_type = v_bond_rate_type,last_price = v_last_price, pre_close_price= v_pre_close_price,today_open_price=v_today_open_price, strike_amt= v_strike_amt,fair_price= v_fair_price;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.1.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("证券代码=",v_stock_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("证券代码=",v_stock_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步证券持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecuPosition;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecuPosition(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_invest_type int,
    IN p_curr_qty decimal(18,2),
    IN p_frozen_qty decimal(18,2),
    IN p_unfroz_qty decimal(18,2),
    IN p_comm_capt_qty decimal(18,2),
    IN p_comm_releas_qty decimal(18,2),
    IN p_trade_capt_qty decimal(18,2),
    IN p_trade_releas_qty decimal(18,2),
    IN p_strike_capt_qty decimal(18,2),
    IN p_strike_releas_qty decimal(18,2),
    IN p_curr_cost_amt decimal(18,4),
    IN p_intrst_cost_amt decimal(18,4),
    IN p_cost_calc_type int,
    IN p_risk_sync_type int,
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_invest_type int;
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_curr_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_cost_calc_type int;
    declare v_risk_sync_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_invest_type = p_invest_type;
    SET v_curr_qty = p_curr_qty;
    SET v_frozen_qty = p_frozen_qty;
    SET v_unfroz_qty = p_unfroz_qty;
    SET v_comm_capt_qty = p_comm_capt_qty;
    SET v_comm_releas_qty = p_comm_releas_qty;
    SET v_trade_capt_qty = p_trade_capt_qty;
    SET v_trade_releas_qty = p_trade_releas_qty;
    SET v_strike_capt_qty = p_strike_capt_qty;
    SET v_strike_releas_qty = p_strike_releas_qty;
    SET v_curr_cost_amt = p_curr_cost_amt;
    SET v_intrst_cost_amt = p_intrst_cost_amt;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_risk_sync_type = p_risk_sync_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #更新产品库和交易库相关数据

    /* if @风控同步类型# = 0 then */
    if v_risk_sync_type = 0 then

         /* [插入重复更新][风控证券_计算_交易组证券业务持仓表][字段][字段变量][{当前数量}=@当前数量#,{冻结数量}=@冻结数量#,{解冻数量}=@解冻数量#,{指令占用数量}=@指令占用数量#,{指令释放数量}=@指令释放数量#,{交易占用数量}=@交易占用数量#,{交易释放数量}=@交易释放数量#,{成交占用数量}=@成交占用数量#,{成交释放数量}=@成交释放数量#,{当前成本金额}=@当前成本金额#,{利息成本金额}=@利息成本金额#,{成本计算方式}=@成本计算方式#][5][@交易组编号#,@证券代码#,@市场编号#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_rksecu.tb_rksecc_secu_exgp_posi (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             exch_group_no, asset_acco_no, stock_acco_no, stock_code_no, 
             stock_code, exch_no, invest_type, curr_qty, 
             frozen_qty, unfroz_qty, comm_capt_qty, comm_releas_qty, 
             trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
             curr_cost_amt, intrst_cost_amt, cost_calc_type) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_exch_group_no, v_asset_acco_no, v_stock_acco_no, v_stock_code_no, 
             v_stock_code, v_exch_no, v_invest_type, v_curr_qty, 
             v_frozen_qty, v_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, 
             v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, v_strike_releas_qty, 
             v_curr_cost_amt, v_intrst_cost_amt, v_cost_calc_type) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=v_curr_qty,frozen_qty=v_frozen_qty,unfroz_qty=v_unfroz_qty,comm_capt_qty=v_comm_capt_qty,comm_releas_qty=v_comm_releas_qty,trade_capt_qty=v_trade_capt_qty,trade_releas_qty=v_trade_releas_qty,strike_capt_qty=v_strike_capt_qty,strike_releas_qty=v_strike_releas_qty,curr_cost_amt=v_curr_cost_amt,intrst_cost_amt=v_intrst_cost_amt,cost_calc_type=v_cost_calc_type;
         if v_error_code = "1" then
                     
             SET v_error_code = "rksecuA.5.2.5";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
             else
                 SET v_error_info = concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no);
             end if;
             leave label_pro;
         end if;

    #只更新产品库相关数据

    /* elseif @风控同步类型# = 1 then */
    elseif v_risk_sync_type = 1 then

         /* [插入重复更新][风控证券_计算_交易组证券业务持仓表][字段][字段变量][{当前数量}=@当前数量#,{冻结数量}=@冻结数量#,{解冻数量}=@解冻数量#,{当前成本金额}={当前成本金额}+@当前成本金额#,{利息成本金额}={利息成本金额}+@利息成本金额#,{成本计算方式}=@成本计算方式#][5][@交易组编号#,@证券代码#,@市场编号#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_rksecu.tb_rksecc_secu_exgp_posi (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             exch_group_no, asset_acco_no, stock_acco_no, stock_code_no, 
             stock_code, exch_no, invest_type, curr_qty, 
             frozen_qty, unfroz_qty, comm_capt_qty, comm_releas_qty, 
             trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
             curr_cost_amt, intrst_cost_amt, cost_calc_type) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_exch_group_no, v_asset_acco_no, v_stock_acco_no, v_stock_code_no, 
             v_stock_code, v_exch_no, v_invest_type, v_curr_qty, 
             v_frozen_qty, v_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, 
             v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, v_strike_releas_qty, 
             v_curr_cost_amt, v_intrst_cost_amt, v_cost_calc_type) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty=v_curr_qty,frozen_qty=v_frozen_qty,unfroz_qty=v_unfroz_qty,curr_cost_amt=curr_cost_amt+v_curr_cost_amt,intrst_cost_amt=intrst_cost_amt+v_intrst_cost_amt,cost_calc_type=v_cost_calc_type;
         if v_error_code = "1" then
                     
             SET v_error_code = "rksecuA.5.2.5";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
             else
                 SET v_error_info = concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no);
             end if;
             leave label_pro;
         end if;

    #只更新交易库相关数据

    /* elseif @风控同步类型# = 2 then */
    elseif v_risk_sync_type = 2 then

         /* [插入重复更新][风控证券_计算_交易组证券业务持仓表][字段][字段变量][{指令占用数量}=@指令占用数量#,{指令释放数量}=@指令释放数量#,{交易占用数量}=@交易占用数量#,{交易释放数量}=@交易释放数量#,{成交占用数量}=@成交占用数量#,{成交释放数量}=@成交释放数量#,{当前成本金额}={当前成本金额}+@当前成本金额#,{利息成本金额}={利息成本金额}+@利息成本金额#,{成本计算方式}=@成本计算方式#][5][@交易组编号#,@证券代码#,@市场编号#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_rksecu.tb_rksecc_secu_exgp_posi (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             exch_group_no, asset_acco_no, stock_acco_no, stock_code_no, 
             stock_code, exch_no, invest_type, curr_qty, 
             frozen_qty, unfroz_qty, comm_capt_qty, comm_releas_qty, 
             trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
             curr_cost_amt, intrst_cost_amt, cost_calc_type) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_exch_group_no, v_asset_acco_no, v_stock_acco_no, v_stock_code_no, 
             v_stock_code, v_exch_no, v_invest_type, v_curr_qty, 
             v_frozen_qty, v_unfroz_qty, v_comm_capt_qty, v_comm_releas_qty, 
             v_trade_capt_qty, v_trade_releas_qty, v_strike_capt_qty, v_strike_releas_qty, 
             v_curr_cost_amt, v_intrst_cost_amt, v_cost_calc_type) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_qty=v_comm_capt_qty,comm_releas_qty=v_comm_releas_qty,trade_capt_qty=v_trade_capt_qty,trade_releas_qty=v_trade_releas_qty,strike_capt_qty=v_strike_capt_qty,strike_releas_qty=v_strike_releas_qty,curr_cost_amt=curr_cost_amt+v_curr_cost_amt,intrst_cost_amt=intrst_cost_amt+v_intrst_cost_amt,cost_calc_type=v_cost_calc_type;
         if v_error_code = "1" then
                     
             SET v_error_code = "rksecuA.5.2.5";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
             else
                 SET v_error_info = concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no);
             end if;
             leave label_pro;
         end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步证券资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecuAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecuAmt(
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
    IN p_exch_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_comm_capt_amt decimal(18,4),
    IN p_comm_releas_amt decimal(18,4),
    IN p_trade_capt_amt decimal(18,4),
    IN p_trade_releas_amt decimal(18,4),
    IN p_strike_capt_amt decimal(18,4),
    IN p_strike_releas_amt decimal(18,4),
    IN p_risk_sync_type int,
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
    declare v_exch_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_risk_sync_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_comm_capt_amt = p_comm_capt_amt;
    SET v_comm_releas_amt = p_comm_releas_amt;
    SET v_trade_capt_amt = p_trade_capt_amt;
    SET v_trade_releas_amt = p_trade_releas_amt;
    SET v_strike_capt_amt = p_strike_capt_amt;
    SET v_strike_releas_amt = p_strike_releas_amt;
    SET v_risk_sync_type = p_risk_sync_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #0-同步所有字段,1-同步产品库字段,2-同步交易库字段

    /* if @风控同步类型# = 0 then */
    if v_risk_sync_type = 0 then

         /* [插入重复更新][风控证券_计算_交易组证券业务资金表][字段][字段变量][{当前金额}=@当前金额#,{冻结金额}=@冻结金额#,{解冻金额}=@解冻金额#,{指令占用金额}=@指令占用金额#,{指令释放金额}=@指令释放金额#,{交易占用金额}=@交易占用金额#,{交易释放金额}=@交易释放金额#,{成交占用金额}=@成交占用金额#,{成交释放金额}=@成交释放金额#][5][@交易组编号#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_rksecu.tb_rksecc_secu_exgp_capit (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             exch_group_no, asset_acco_no, exch_crncy_type, curr_amt, 
             frozen_amt, unfroz_amt, comm_capt_amt, comm_releas_amt, 
             trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_curr_amt, 
             v_frozen_amt, v_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
             v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=v_curr_amt,frozen_amt=v_frozen_amt,unfroz_amt=v_unfroz_amt,comm_capt_amt=v_comm_capt_amt,comm_releas_amt=v_comm_releas_amt,trade_capt_amt=v_trade_capt_amt,trade_releas_amt=v_trade_releas_amt,strike_capt_amt=v_strike_capt_amt,strike_releas_amt=v_strike_releas_amt;
         if v_error_code = "1" then
                     
             SET v_error_code = "rksecuA.5.3.5";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
             else
                 SET v_error_info = concat("交易组编号=",v_exch_group_no);
             end if;
             leave label_pro;
         end if;


    /* elseif @风控同步类型# = 1 then */
    elseif v_risk_sync_type = 1 then

         /* [插入重复更新][风控证券_计算_交易组证券业务资金表][字段][字段变量][{当前金额}=@当前金额#,{冻结金额}=@冻结金额#,{解冻金额}=@解冻金额#][5][@交易组编号#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_rksecu.tb_rksecc_secu_exgp_capit (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             exch_group_no, asset_acco_no, exch_crncy_type, curr_amt, 
             frozen_amt, unfroz_amt, comm_capt_amt, comm_releas_amt, 
             trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_curr_amt, 
             v_frozen_amt, v_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
             v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=v_curr_amt,frozen_amt=v_frozen_amt,unfroz_amt=v_unfroz_amt;
         if v_error_code = "1" then
                     
             SET v_error_code = "rksecuA.5.3.5";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
             else
                 SET v_error_info = concat("交易组编号=",v_exch_group_no);
             end if;
             leave label_pro;
         end if;


    /* elseif @风控同步类型# = 2 then */
    elseif v_risk_sync_type = 2 then

         /* [插入重复更新][风控证券_计算_交易组证券业务资金表][字段][字段变量][{指令占用金额}=@指令占用金额#,{指令释放金额}=@指令释放金额#,{交易占用金额}=@交易占用金额#,{交易释放金额}=@交易释放金额#,{成交占用金额}=@成交占用金额#,{成交释放金额}=@成交释放金额#][5][@交易组编号#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_rksecu.tb_rksecc_secu_exgp_capit (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             exch_group_no, asset_acco_no, exch_crncy_type, curr_amt, 
             frozen_amt, unfroz_amt, comm_capt_amt, comm_releas_amt, 
             trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_exch_group_no, v_asset_acco_no, v_exch_crncy_type, v_curr_amt, 
             v_frozen_amt, v_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
             v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_capt_amt=v_comm_capt_amt,comm_releas_amt=v_comm_releas_amt,trade_capt_amt=v_trade_capt_amt,trade_releas_amt=v_trade_releas_amt,strike_capt_amt=v_strike_capt_amt,strike_releas_amt=v_strike_releas_amt;
         if v_error_code = "1" then
                     
             SET v_error_code = "rksecuA.5.3.5";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
             else
                 SET v_error_info = concat("交易组编号=",v_exch_group_no);
             end if;
             leave label_pro;
         end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecuAsset(
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
    IN p_begin_asset_value decimal(18,4),
    IN p_asset_item int,
    IN p_asset_value decimal(18,4),
    IN p_part_share decimal(18,2),
    IN p_pd_all_share decimal(18,2),
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
    declare v_crncy_type varchar(3);
    declare v_begin_asset_value decimal(18,4);
    declare v_asset_item int;
    declare v_asset_value decimal(18,4);
    declare v_part_share decimal(18,2);
    declare v_pd_all_share decimal(18,2);
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
    SET v_crncy_type = p_crncy_type;
    SET v_begin_asset_value = p_begin_asset_value;
    SET v_asset_item = p_asset_item;
    SET v_asset_value = p_asset_value;
    SET v_part_share = p_part_share;
    SET v_pd_all_share = p_pd_all_share;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控证券_计算_交易组资产表][字段][字段变量][{期初资产值} = @期初资产值#,{资产值} = @资产值#,{期初资产值} = @期初资产值#,{交易单元份额} = @交易单元份额#,{产品总份额} = @产品总份额# ][5][@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksecc_secu_exgp_asset (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_asset_value, asset_item, 
        asset_value, part_share, pd_all_share) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_crncy_type, v_begin_asset_value, v_asset_item, 
        v_asset_value, v_part_share, v_pd_all_share) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, begin_asset_value = v_begin_asset_value,asset_value = v_asset_value,begin_asset_value = v_begin_asset_value,part_share = v_part_share,pd_all_share = v_pd_all_share ;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.4.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步证券订单
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecuOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecuOrder(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_order_dir int,
    IN p_price_type int,
    IN p_order_price decimal(16,9),
    IN p_order_status varchar(2),
    IN p_all_fee decimal(18,4),
    IN p_order_frozen_amt decimal(18,4),
    IN p_strike_amt decimal(18,4),
    IN p_stock_type int,
    IN p_order_frozen_qty decimal(18,2),
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_order_dir int;
    declare v_price_type int;
    declare v_order_price decimal(16,9);
    declare v_order_status varchar(2);
    declare v_all_fee decimal(18,4);
    declare v_order_frozen_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_stock_type int;
    declare v_order_frozen_qty decimal(18,2);
    declare v_comm_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_id bigint;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_order_price = p_order_price;
    SET v_order_status = p_order_status;
    SET v_all_fee = p_all_fee;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_strike_amt = p_strike_amt;
    SET v_stock_type = p_stock_type;
    SET v_order_frozen_qty = p_order_frozen_qty;
    SET v_comm_id = p_comm_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set  @订单序号# = @记录序号#; */
    set  v_order_id = v_row_id;

    /* [插入重复更新][风控证券_计算_订单表][字段][字段变量][{订单状态} = @订单状态#,{全部费用} = @全部费用#,{订单冻结金额} = @订单冻结金额#,{成交金额} = @成交金额#,{证券类型} = @证券类型#,{订单冻结数量}=@订单冻结数量#,{指令序号}=@指令序号#][5][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksecc_secu_order (
        create_date, create_time, update_date, 
        update_time, update_times, order_id, co_no, 
        pd_no, exch_group_no, stock_code_no, exch_no, 
        order_dir, price_type, order_price, order_status, 
        all_fee, order_frozen_amt, strike_amt, stock_type, 
        order_frozen_qty, comm_id) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_order_id, v_co_no, 
        v_pd_no, v_exch_group_no, v_stock_code_no, v_exch_no, 
        v_order_dir, v_price_type, v_order_price, v_order_status, 
        v_all_fee, v_order_frozen_amt, v_strike_amt, v_stock_type, 
        v_order_frozen_qty, v_comm_id) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, order_status = v_order_status,all_fee = v_all_fee,order_frozen_amt = v_order_frozen_amt,strike_amt = v_strike_amt,stock_type = v_stock_type,order_frozen_qty=v_order_frozen_qty,comm_id=v_comm_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.5.5";
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
use db_rksecu;;

# 原子_风控证券_接口_同步证券指令
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecucommand;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecucommand(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_comm_dir int,
    IN p_comm_limit_price decimal(16,9),
    IN p_comm_status varchar(2),
    IN p_comm_frozen_amt decimal(18,4),
    IN p_stock_type int,
    IN p_comm_frozen_qty decimal(18,2),
    IN p_limit_actual_price decimal(16,9),
    IN p_strike_status varchar(2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_comm_status varchar(2);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_stock_type int;
    declare v_comm_frozen_qty decimal(18,2);
    declare v_limit_actual_price decimal(16,9);
    declare v_strike_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_id bigint;
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_comm_dir = p_comm_dir;
    SET v_comm_limit_price = p_comm_limit_price;
    SET v_comm_status = p_comm_status;
    SET v_comm_frozen_amt = p_comm_frozen_amt;
    SET v_stock_type = p_stock_type;
    SET v_comm_frozen_qty = p_comm_frozen_qty;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_strike_status = p_strike_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set  @指令序号# = @记录序号#; */
    set  v_comm_id = v_row_id;

    /* [插入重复更新][风控证券_计算_指令表][字段][字段变量][{指令状态} = @指令状态#, {指令限价} = @指令限价#,{指令冻结金额}=@指令冻结金额#,{证券类型}=@证券类型#,{指令冻结数量}=@指令冻结数量#,{指令实际限价}=@指令实际限价#,{成交状态}=@成交状态#][5][@记录序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksecc_secu_command (
        create_date, create_time, update_date, 
        update_time, update_times, comm_id, co_no, 
        pd_no, exch_group_no, stock_code_no, exch_no, 
        comm_dir, comm_limit_price, comm_status, comm_frozen_amt, 
        stock_type, comm_frozen_qty, limit_actual_price, strike_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_comm_id, v_co_no, 
        v_pd_no, v_exch_group_no, v_stock_code_no, v_exch_no, 
        v_comm_dir, v_comm_limit_price, v_comm_status, v_comm_frozen_amt, 
        v_stock_type, v_comm_frozen_qty, v_limit_actual_price, v_strike_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, comm_status = v_comm_status, comm_limit_price = v_comm_limit_price,comm_frozen_amt=v_comm_frozen_amt,stock_type=v_stock_type,comm_frozen_qty=v_comm_frozen_qty,limit_actual_price=v_limit_actual_price,strike_status=v_strike_status;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.6.5";
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
use db_rksecu;;

# 原子_风控证券_接口_服务器查询客户风险规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_ServerQuerySecuClientRiskRule;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_ServerQuerySecuClientRiskRule(
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
    

    /* [获取表记录][风控证券_风控_客户风险规则表][字段][{记录序号} > @记录序号# ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
        dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
        trig_type, model_id, risk_item_id, compli_rules_remark, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
        risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
        risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
        end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where row_id > v_row_id ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, exch_no_str, order_dir_str, 
        dime_id, trig_stage_type_str, compli_calc_level, unit_nav_flag, 
        trig_type, model_id, risk_item_id, compli_rules_remark, 
        risk_rule_id, risk_rule_type, risk_rule_name, risk_rule_code, 
        risk_param_str, union_flag, risk_rule_value_str1, risk_rule_action1, 
        risk_rule_value_str2, risk_rule_action2, risk_rule_value_str3, risk_rule_action3, 
        risk_rule_value_str4, risk_rule_action4, corrsp_plug, begin_time, 
        end_time, rule_flag, templ_flag, compli_trig_result_type from db_rksecu.tb_rkserk_secu_client_risk_rule where row_id > v_row_id  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_更新客户风险规则计算值串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_UpdateSecuClientRiskRuleCalcStr;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_UpdateSecuClientRiskRuleCalcStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_link_row_id bigint,
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_trig_stage_type int,
    IN p_client_risk_rule_id int,
    IN p_risk_rule_calc_str varchar(255),
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
    declare v_link_row_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_trig_stage_type int;
    declare v_client_risk_rule_id int;
    declare v_risk_rule_calc_str varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
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
    SET v_link_row_id = p_link_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_client_risk_rule_id = p_client_risk_rule_id;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if @风险计算值串# = "delete" then */
    if v_risk_rule_calc_str = "delete" then

         /* [删除表记录][风控证券_风控_层次计算结果表][{机构编号}=@机构编号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串# and {触发阶段类型} = @触发阶段类型# and {客户风险规则序号} = @客户风险规则序号#][5][@客户风险规则序号#] */
         delete from db_rksecu.tb_rkserk_stage_calc 
             where co_no=v_co_no and pd_no_str = v_pd_no_str and exch_group_no_str = v_exch_group_no_str and trig_stage_type = v_trig_stage_type and client_risk_rule_id = v_client_risk_rule_id;
         if v_error_code = 1 then
                     
             SET v_error_code = "rksecuA.5.8.5";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
             else
                 SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
             end if;
             leave label_pro;
         end if;

    else

         /* set @记录个数# = 0; */
         set v_record_count = 0;

         /* [获取表记录数量][风控证券_风控_层次计算结果表][@记录个数#][{机构编号}=@机构编号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串# and {触发阶段类型} = @触发阶段类型# and {客户风险规则序号} = @客户风险规则序号#] */
         select count(1) into v_record_count from db_rksecu.tb_rkserk_stage_calc where co_no=v_co_no and pd_no_str = v_pd_no_str and exch_group_no_str = v_exch_group_no_str and trig_stage_type = v_trig_stage_type and client_risk_rule_id = v_client_risk_rule_id;


         /* if @记录个数# = 0 then */
         if v_record_count = 0 then

                /* [插入表记录][风控证券_风控_层次计算结果表][字段][字段变量][5][@客户风险规则序号#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_rksecu.tb_rkserk_stage_calc(
                    create_date, create_time, update_date, 
                    update_time, update_times, link_row_id, co_no, 
                    pd_no_str, exch_group_no_str, trig_stage_type, client_risk_rule_id, 
                    risk_rule_calc_str) 
                value( 
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_link_row_id, v_co_no, 
                    v_pd_no_str, v_exch_group_no_str, v_trig_stage_type, v_client_risk_rule_id, 
                    v_risk_rule_calc_str);
                if v_error_code = "1" then
                            
                    SET v_error_code = "rksecuA.5.8.5";
                    SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
                    leave label_pro;
                end if;

         else

                /* [更新表记录][风控证券_风控_层次计算结果表][{风险计算值串} = @风险计算值串#][{机构编号}=@机构编号# and {产品编号串} = @产品编号串# and {交易组编号串} = @交易组编号串# and {触发阶段类型} = @触发阶段类型# and {客户风险规则序号} = @客户风险规则序号#][5][@客户风险规则序号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_rksecu.tb_rkserk_stage_calc set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, risk_rule_calc_str = v_risk_rule_calc_str where co_no=v_co_no and pd_no_str = v_pd_no_str and exch_group_no_str = v_exch_group_no_str and trig_stage_type = v_trig_stage_type and client_risk_rule_id = v_client_risk_rule_id;
                if v_error_code = "1" then
                            
                    SET v_error_code = "rksecuA.5.8.5";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("客户风险规则序号=",v_client_risk_rule_id);
                    end if;
                    leave label_pro;
                end if;

         end if;
         #[插入重复更新][风控证券_风控_层次计算结果表][字段][字段变量][{机构编号}=@机构编号#, {产品编号串} = @产品编号串#, {交易组编号串} = @交易组编号串#, {触发阶段类型} = @触发阶段类型#, {客户风险规则序号} = @客户风险规则序号#, {风险计算值串} = @风险计算值串#][5][@客户风险规则序号#]
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_更新账户风险监控设置计算值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_UpdateProductMonitorSetServiceValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_UpdateProductMonitorSetServiceValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_curr_moni_value decimal(18,4),
    IN p_cash_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_stock_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_nav_asset decimal(18,4),
    IN p_contrs_curr_moni_value decimal(18,4),
    IN p_pd_share decimal(18,2),
    IN p_begin_asset_value decimal(18,4),
    IN p_hk_thrgh_stock_asset decimal(18,4),
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
    declare v_moni_set_id bigint;
    declare v_curr_moni_value decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_pd_share decimal(18,2);
    declare v_begin_asset_value decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_max_moni_value decimal(18,4);
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_value_flag int;
    declare v_moni_role_type int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_begin_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_update_date int;
    declare v_update_time int;
    declare v_curr_tmstp int;

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
    SET v_moni_set_id = p_moni_set_id;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_cash_asset = p_cash_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_stock_asset = p_stock_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_nav_asset = p_nav_asset;
    SET v_contrs_curr_moni_value = p_contrs_curr_moni_value;
    SET v_pd_share = p_pd_share;
    SET v_begin_asset_value = p_begin_asset_value;
    SET v_hk_thrgh_stock_asset = p_hk_thrgh_stock_asset;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_max_moni_value = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_value_flag = 0;
    SET v_moni_role_type = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_close_posi_value = 0;
    SET v_appd_value = 0;
    SET v_begin_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_stock_asset_ratio = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_curr_tmstp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_账户风险监控设置表][{最大监控值},{对比最大监控值},{监控结果},{监控结果状态},{监控值方式},{监控结果},{监控角色},{监控值类型},{预警线},{平仓线},{追加线},{起始监控值}][@最大监控值#,@对比最大监控值#,@监控结果#,@监控结果状态#,@监控值方式#,@监控结果#,@监控角色#,@监控值类型#,@预警线#,@平仓线#,@追加线#,@起始监控值#][{记录序号} = @监控设置序号#] */
    select max_moni_value,contrs_max_moni_value,moni_result_value,moni_result_status,moni_value_flag,moni_result_value,moni_role_type,moni_value_type,warn_posi_value,close_posi_value,appd_value,begin_moni_value into v_max_moni_value,v_contrs_max_moni_value,v_moni_result_value,v_moni_result_status,v_moni_value_flag,v_moni_result_value,v_moni_role_type,v_moni_value_type,v_warn_posi_value,v_close_posi_value,v_appd_value,v_begin_moni_value from db_rksecu.tb_rkserk_product_monitor_set where row_id = v_moni_set_id limit 1;


    /* set @监控结果状态# = 《监控结果状态-正常》; */
    set v_moni_result_status = "1";

    /* if @最大监控值# < @当前监控值# then */
    if v_max_moni_value < v_curr_moni_value then

        /* set @最大监控值# = @当前监控值#; */
        set v_max_moni_value = v_curr_moni_value;
    end if;

    /* if @对比最大监控值# < @对比当前监控值# then */
    if v_contrs_max_moni_value < v_contrs_curr_moni_value then

        /* set @对比最大监控值# = @对比当前监控值#; */
        set v_contrs_max_moni_value = v_contrs_curr_moni_value;
    end if;

    /* if @监控值方式# = 《监控值方式-固定值》 then */
    if v_moni_value_flag = 1 then

      /* set @监控结果# = @当前监控值#; */
      set v_moni_result_value = v_curr_moni_value;

      /* if @当前监控值# <= @预警线# and @预警线# <> 0 then */
      if v_curr_moni_value <= v_warn_posi_value and v_warn_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-预警》; */
        set v_moni_result_status = "2";
     end if;

      /* if @当前监控值# <= @追加线# and @追加线# <> 0 then */
      if v_curr_moni_value <= v_appd_value and v_appd_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-追加》; */
        set v_moni_result_status = "3";
     end if;

      /* if @当前监控值# <= @平仓线# and @平仓线# <> 0 then */
      if v_curr_moni_value <= v_close_posi_value and v_close_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-止损》; */
        set v_moni_result_status = "4";
     end if;

    /* elseif @监控值方式# = 《监控值方式-最大回撤》 or @监控值方式# = 《监控值方式-对比最大回撤》 then */
    elseif v_moni_value_flag = 2 or v_moni_value_flag = 3 then

      /* if @最大监控值# > 0 then */
      if v_max_moni_value > 0 then

        /* set @当前监控结果# = round((@最大监控值# - @当前监控值#)/@最大监控值#,4); */
        set v_curr_result_moni_value = round((v_max_moni_value - v_curr_moni_value)/v_max_moni_value,4);

        /* set @监控结果# =@当前监控结果#; */
        set v_moni_result_value =v_curr_result_moni_value;

        /* if @监控值方式# = 《监控值方式-对比最大回撤》 then */
        if v_moni_value_flag = 3 then

          /* if @对比最大监控值# > 0 then */
          if v_contrs_max_moni_value > 0 then

            /* set @对比监控结果# = round((@对比最大监控值#-@对比当前监控值#)/@对比最大监控值#,4); */
            set v_contrs_result_moni_value = round((v_contrs_max_moni_value-v_contrs_curr_moni_value)/v_contrs_max_moni_value,4);

            /* if @对比监控结果# = 0 then */
            if v_contrs_result_moni_value = 0 then

              /* set @监控结果# = 0; */
              set v_moni_result_value = 0;

              /* if @当前监控结果# > 0 then */
              if v_curr_result_moni_value > 0 then

                /* set @监控结果# = -9999; */
                set v_moni_result_value = -9999;
              end if;
            else

              /* set @监控结果# = ifnull(round(@当前监控结果#/@对比监控结果#,4),0); */
              set v_moni_result_value = ifnull(round(v_curr_result_moni_value/v_contrs_result_moni_value,4),0);
            end if;
          else

            /* set @对比监控结果# =0; */
            set v_contrs_result_moni_value =0;

            /* set @监控结果# = 0; */
            set v_moni_result_value = 0;
          end if;
        end if;

        /* if @监控结果# >= @预警线# and @预警线# <> 0 then */
        if v_moni_result_value >= v_warn_posi_value and v_warn_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-预警》; */
          set v_moni_result_status = "2";
       end if;

        /* if @监控结果# >= @追加线# and @追加线# <> 0 then */
        if v_moni_result_value >= v_appd_value and v_appd_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-追加》; */
          set v_moni_result_status = "3";
       end if;

        /* if (@监控结果# >= @平仓线#  or  (@监控结果# = -9999 and @监控值方式# = 《监控值方式-对比最大回撤》))  and @平仓线# <> 0 then */
        if (v_moni_result_value >= v_close_posi_value  or  (v_moni_result_value = -9999 and v_moni_value_flag = 3))  and v_close_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-止损》; */
          set v_moni_result_status = "4";
        end if;
      end if;
    end if;

    /* if @净资产# <> 0 then */
    if v_nav_asset <> 0 then

      /* set @股票资产占比# = Round(@股票资产#/@净资产#,4); */
      set v_stock_asset_ratio = Round(v_stock_asset/v_nav_asset,4);
    end if;

    /* if @监控值类型# = 《监控值类型-净值》 then */
    if v_moni_value_type = 2 then

        /* set @监控结果# = Round(@监控结果#,2); */
        set v_moni_result_value = Round(v_moni_result_value,2);

        /* set @当前监控值# = Round(@当前监控值#,2); */
        set v_curr_moni_value = Round(v_curr_moni_value,2);

        /* set @最大监控值# = Round(@最大监控值#,2); */
        set v_max_moni_value = Round(v_max_moni_value,2);

    /* elseif @监控值类型# = 《监控值类型-单位净值》 then */
    elseif v_moni_value_type = 1 then

        /* set @监控结果# = Round(@监控结果#,4); */
        set v_moni_result_value = Round(v_moni_result_value,4);

        /* set @当前监控值# = Round(@当前监控值#,4); */
        set v_curr_moni_value = Round(v_curr_moni_value,4);

        /* set @最大监控值# = Round(@最大监控值#,4); */
        set v_max_moni_value = Round(v_max_moni_value,4);
    end if;

    /* set @对比最大监控值# = Round(@对比最大监控值#,4); */
    set v_contrs_max_moni_value = Round(v_contrs_max_moni_value,4);

    /* set @对比当前监控值# = Round(@对比当前监控值#,4); */
    set v_contrs_curr_moni_value = Round(v_contrs_curr_moni_value,4);

    /* set @现金资产# = Round(@现金资产#,2); */
    set v_cash_asset = Round(v_cash_asset,2);

    /* set @基金资产# = Round(@基金资产#,2); */
    set v_fund_asset = Round(v_fund_asset,2);

    /* set @债券资产# = Round(@债券资产#,2); */
    set v_bond_asset = Round(v_bond_asset,2);

    /* set @股票资产# = Round(@股票资产#,2); */
    set v_stock_asset = Round(v_stock_asset,2);

    /* set @回购资产# = Round(@回购资产#,2); */
    set v_repo_asset = Round(v_repo_asset,2);

    /* set @净资产# = Round(@净资产#,2); */
    set v_nav_asset = Round(v_nav_asset,2);

    /* [更新表记录][风控证券_风控_账户风险监控设置表][{最大监控值}=@最大监控值#,{当前监控值}=@当前监控值#,{当前监控结果} = @当前监控结果#,{对比最大监控值}=@对比最大监控值#,{对比当前监控值}=@对比当前监控值#,{对比监控结果} = @对比监控结果#,{监控结果} = @监控结果#,{监控结果状态}=@监控结果状态#,{时间戳}=@当前时间戳#,{现金资产}=@现金资产#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{股票资产}=@股票资产#,{回购资产}=@回购资产#,{净资产}=@净资产#,{股票资产占比} = @股票资产占比#,{产品份额}=@产品份额#,{期初资产值}=@期初资产值#,{港股通资产}=@港股通资产#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_product_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, max_moni_value=v_max_moni_value,curr_moni_value=v_curr_moni_value,curr_result_moni_value = v_curr_result_moni_value,contrs_max_moni_value=v_contrs_max_moni_value,contrs_curr_moni_value=v_contrs_curr_moni_value,contrs_result_moni_value = v_contrs_result_moni_value,moni_result_value = v_moni_result_value,moni_result_status=v_moni_result_status,time_stamp=v_curr_tmstp,cash_asset=v_cash_asset,fund_asset=v_fund_asset,bond_asset=v_bond_asset,stock_asset=v_stock_asset,repo_asset=v_repo_asset,nav_asset=v_nav_asset,stock_asset_ratio = v_stock_asset_ratio,pd_share=v_pd_share,begin_asset_value=v_begin_asset_value,hk_thrgh_stock_asset=v_hk_thrgh_stock_asset where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetProductMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetProductMonitor(
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
    

    /* [获取表记录][风控证券_风控_账户风险监控设置表][字段][{记录序号} > @记录序号# ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
        moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
        close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
        begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
        contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
        contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
        cash_asset, fund_asset, bond_asset, stock_asset, 
        repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
        close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
        time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where row_id > v_row_id ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
        moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
        close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
        begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
        contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
        contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
        cash_asset, fund_asset, bond_asset, stock_asset, 
        repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
        close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
        time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where row_id > v_row_id  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步成本计算方式
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecuCostCalcType;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecuCostCalcType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_cost_calc_type int,
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
    declare v_cost_calc_type int;
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
    SET v_pd_no = p_pd_no;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][风控证券_计算_交易组证券业务持仓表][{成本计算方式} = @成本计算方式#][{机构编号} = @机构编号# and {产品编号} = @产品编号#][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rksecc_secu_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, cost_calc_type = v_cost_calc_type where co_no = v_co_no and pd_no = v_pd_no;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步港股汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncSecuHKrate;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncSecuHKrate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
    IN p_settle_buy_rate decimal(18,12),
    IN p_settle_sell_rate decimal(18,12),
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
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
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
    SET v_exch_no = p_exch_no;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_settle_buy_rate = p_settle_buy_rate;
    SET v_settle_sell_rate = p_settle_sell_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控证券_计算_港股汇率表][字段][字段变量][{买入参考汇率} = @买入参考汇率#, {卖出参考汇率} = @卖出参考汇率#,{买入结算汇率} = @买入结算汇率#, {卖出结算汇率} = @卖出结算汇率#][5][@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksecc_HK_rate (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, buy_ref_rate, 
        sell_ref_rate, settle_buy_rate, settle_sell_rate) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_buy_ref_rate, 
        v_sell_ref_rate, v_settle_buy_rate, v_settle_sell_rate) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, buy_ref_rate = v_buy_ref_rate, sell_ref_rate = v_sell_ref_rate,settle_buy_rate = v_settle_buy_rate, settle_sell_rate = v_settle_sell_rate;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.12.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_计算更新证券风险监控数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_CalcStockMonitorData;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_CalcStockMonitorData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_curr_moni_value decimal(18,4),
    IN p_contrs_curr_moni_value decimal(18,4),
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
    declare v_moni_set_id bigint;
    declare v_curr_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_max_moni_value decimal(18,4);
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_contrs_curr_moni_value = p_contrs_curr_moni_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_max_moni_value = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_value_flag = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_close_posi_value = 0;
    SET v_appd_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_证券风险监控设置表][{最大监控值},{对比最大监控值},{监控结果},{监控结果状态},{监控值方式},{监控结果},{监控值类型},{预警线},{平仓线},{追加线}][@最大监控值#,@对比最大监控值#,@监控结果#,@监控结果状态#,@监控值方式#,@监控结果#,@监控值类型#,@预警线#,@平仓线#,@追加线#][{记录序号} = @监控设置序号#] */
    select max_moni_value,contrs_max_moni_value,moni_result_value,moni_result_status,moni_value_flag,moni_result_value,moni_value_type,warn_posi_value,close_posi_value,appd_value into v_max_moni_value,v_contrs_max_moni_value,v_moni_result_value,v_moni_result_status,v_moni_value_flag,v_moni_result_value,v_moni_value_type,v_warn_posi_value,v_close_posi_value,v_appd_value from db_rksecu.tb_rkserk_stock_monitor_set where row_id = v_moni_set_id limit 1;


    /* set @监控结果状态# = 《监控结果状态-正常》; */
    set v_moni_result_status = "1";

    /* if @最大监控值# < @当前监控值# then */
    if v_max_moni_value < v_curr_moni_value then

        /* set @最大监控值# = @当前监控值#; */
        set v_max_moni_value = v_curr_moni_value;
    end if;

    /* if @对比最大监控值# < @对比当前监控值# then */
    if v_contrs_max_moni_value < v_contrs_curr_moni_value then

        /* set @对比最大监控值# = @对比当前监控值#; */
        set v_contrs_max_moni_value = v_contrs_curr_moni_value;
    end if;

    /* if @监控值方式# = 《监控值方式-固定值》 then */
    if v_moni_value_flag = 1 then

      /* set @监控结果# = @当前监控值#; */
      set v_moni_result_value = v_curr_moni_value;

      /* if @当前监控值# <= @预警线# and @预警线# <> 0 then */
      if v_curr_moni_value <= v_warn_posi_value and v_warn_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-预警》; */
        set v_moni_result_status = "2";
     end if;

      /* if @当前监控值# <= @追加线# and @追加线# <> 0 then */
      if v_curr_moni_value <= v_appd_value and v_appd_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-追加》; */
        set v_moni_result_status = "3";
     end if;

      /* if @当前监控值# <= @平仓线# and @平仓线# <> 0 then */
      if v_curr_moni_value <= v_close_posi_value and v_close_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-止损》; */
        set v_moni_result_status = "4";
     end if;

    /* elseif @监控值方式# = 《监控值方式-最大回撤》 or @监控值方式#  = 《监控值方式-对比最大回撤》 then */
    elseif v_moni_value_flag = 2 or v_moni_value_flag  = 3 then

      /* if @最大监控值# > 0 then */
      if v_max_moni_value > 0 then

        /* set @当前监控结果# = round((@最大监控值#-@当前监控值#)/@最大监控值#,4); */
        set v_curr_result_moni_value = round((v_max_moni_value-v_curr_moni_value)/v_max_moni_value,4);

        /* set @监控结果# =@当前监控结果#; */
        set v_moni_result_value =v_curr_result_moni_value;

        /* if @监控值方式# = 《监控值方式-对比最大回撤》 then */
        if v_moni_value_flag = 3 then

          /* if @对比最大监控值# > 0 then */
          if v_contrs_max_moni_value > 0 then

            /* set @对比监控结果# = round((@对比最大监控值#-@对比当前监控值#)/@对比最大监控值#,4); */
            set v_contrs_result_moni_value = round((v_contrs_max_moni_value-v_contrs_curr_moni_value)/v_contrs_max_moni_value,4);

            /* if @对比监控结果# = 0 then */
            if v_contrs_result_moni_value = 0 then

              /* set @监控结果# = 0; */
              set v_moni_result_value = 0;

              /* if @当前监控结果# > 0 then */
              if v_curr_result_moni_value > 0 then

                /* set @监控结果# = -9999; */
                set v_moni_result_value = -9999;
              end if;
            else

              /* set @监控结果# = ifnull(round(@当前监控结果#/@对比监控结果#,4),0); */
              set v_moni_result_value = ifnull(round(v_curr_result_moni_value/v_contrs_result_moni_value,4),0);
            end if;
          else

            /* set @对比监控结果# =0; */
            set v_contrs_result_moni_value =0;

            /* set @监控结果# = 0; */
            set v_moni_result_value = 0;
          end if;
        end if;

        /* if @监控结果# >= @预警线# and @预警线# <> 0 then */
        if v_moni_result_value >= v_warn_posi_value and v_warn_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-预警》; */
          set v_moni_result_status = "2";
       end if;

        /* if @监控结果# >= @追加线# and @追加线# <> 0 then */
        if v_moni_result_value >= v_appd_value and v_appd_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-追加》; */
          set v_moni_result_status = "3";
       end if;

        /* if (@监控结果# >= @平仓线#  or  (@监控结果# = -9999 and @监控值方式# = 《监控值方式-对比最大回撤》))  and @平仓线# <> 0 then */
        if (v_moni_result_value >= v_close_posi_value  or  (v_moni_result_value = -9999 and v_moni_value_flag = 3))  and v_close_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-止损》; */
          set v_moni_result_status = "4";
        end if;
      end if;
    end if;

    /* [更新表记录][风控证券_风控_证券风险监控设置表][{最大监控值}= @最大监控值#,{当前监控结果} = @当前监控结果#,{当前监控值} = @当前监控值#,{对比最大监控值} = @对比最大监控值#,{对比当前监控值} = @对比当前监控值#,{对比监控结果} = @对比监控结果#,{监控结果状态}=@监控结果状态#,{监控结果} = @监控结果#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_stock_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, max_moni_value= v_max_moni_value,curr_result_moni_value = v_curr_result_moni_value,curr_moni_value = v_curr_moni_value,contrs_max_moni_value = v_contrs_max_moni_value,contrs_curr_moni_value = v_contrs_curr_moni_value,contrs_result_moni_value = v_contrs_result_moni_value,moni_result_status=v_moni_result_status,moni_result_value = v_moni_result_value where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.13.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取批量证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetBatchStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetBatchStockMonitor(
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
    

    /* [获取表记录][风控证券_风控_证券风险监控设置表][字段][{记录序号} > @记录序号# and (@操作员编号# = 0 or {操作员编号} = @操作员编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no_str, exch_group_no_str, monitor_ctrl_type, 
        moni_value_type, monitor_param_value, moni_value_flag, warn_posi_value, 
        appd_value, close_posi_value, max_moni_value, curr_moni_value, 
        curr_result_moni_value, contrs_stock_code, contrs_exch_no, contrs_max_moni_value, 
        contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, moni_result_status, 
        moni_set_status, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
        close_ratio_level_three, remark_info from db_rksecu.tb_rkserk_stock_monitor_set where row_id > v_row_id and (v_opor_no = 0 or opor_no = v_opor_no);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no_str, exch_group_no_str, monitor_ctrl_type, 
        moni_value_type, monitor_param_value, moni_value_flag, warn_posi_value, 
        appd_value, close_posi_value, max_moni_value, curr_moni_value, 
        curr_result_moni_value, contrs_stock_code, contrs_exch_no, contrs_max_moni_value, 
        contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, moni_result_status, 
        moni_set_status, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
        close_ratio_level_three, remark_info from db_rksecu.tb_rkserk_stock_monitor_set where row_id > v_row_id and (v_opor_no = 0 or opor_no = v_opor_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取单条证券风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetSingleStockMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetSingleStockMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no_str varchar(2048),
    OUT p_exch_group_no_str varchar(2048),
    OUT p_monitor_ctrl_type int,
    OUT p_moni_value_type int,
    OUT p_monitor_param_value int,
    OUT p_moni_value_flag int,
    OUT p_warn_posi_value decimal(18,4),
    OUT p_appd_value decimal(18,4),
    OUT p_close_posi_value decimal(18,4),
    OUT p_max_moni_value decimal(18,4),
    OUT p_curr_moni_value decimal(18,4),
    OUT p_curr_result_moni_value decimal(18,4),
    OUT p_contrs_stock_code varchar(6),
    OUT p_contrs_exch_no int,
    OUT p_contrs_max_moni_value decimal(18,4),
    OUT p_contrs_curr_moni_value decimal(18,4),
    OUT p_contrs_result_moni_value decimal(18,4),
    OUT p_moni_result_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_moni_set_status varchar(2),
    OUT p_close_posi_flag int,
    OUT p_close_ratio_level_one decimal(18,12),
    OUT p_close_ratio_level_two decimal(18,12),
    OUT p_close_ratio_level_three decimal(18,12),
    OUT p_remark_info varchar(255),
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
    declare v_moni_set_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_monitor_ctrl_type int;
    declare v_moni_value_type int;
    declare v_monitor_param_value int;
    declare v_moni_value_flag int;
    declare v_warn_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_update_times int;
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";
    SET v_monitor_ctrl_type = 0;
    SET v_moni_value_type = 0;
    SET v_monitor_param_value = 0;
    SET v_moni_value_flag = 0;
    SET v_warn_posi_value = 0;
    SET v_appd_value = 0;
    SET v_close_posi_value = 0;
    SET v_max_moni_value = 0;
    SET v_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_stock_code = " ";
    SET v_contrs_exch_no = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_close_posi_flag = 0;
    SET v_close_ratio_level_one = 0;
    SET v_close_ratio_level_two = 0;
    SET v_close_ratio_level_three = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_证券风险监控设置表][字段][字段变量][{记录序号}=@监控设置序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no_str, exch_group_no_str, monitor_ctrl_type, 
        moni_value_type, monitor_param_value, moni_value_flag, warn_posi_value, 
        appd_value, close_posi_value, max_moni_value, curr_moni_value, 
        curr_result_moni_value, contrs_stock_code, contrs_exch_no, contrs_max_moni_value, 
        contrs_curr_moni_value, contrs_result_moni_value, moni_result_value, moni_result_status, 
        moni_set_status, close_posi_flag, close_ratio_level_one, close_ratio_level_two, 
        close_ratio_level_three, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_pd_no_str, v_exch_group_no_str, v_monitor_ctrl_type, 
        v_moni_value_type, v_monitor_param_value, v_moni_value_flag, v_warn_posi_value, 
        v_appd_value, v_close_posi_value, v_max_moni_value, v_curr_moni_value, 
        v_curr_result_moni_value, v_contrs_stock_code, v_contrs_exch_no, v_contrs_max_moni_value, 
        v_contrs_curr_moni_value, v_contrs_result_moni_value, v_moni_result_value, v_moni_result_status, 
        v_moni_set_status, v_close_posi_flag, v_close_ratio_level_one, v_close_ratio_level_two, 
        v_close_ratio_level_three, v_remark_info from db_rksecu.tb_rkserk_stock_monitor_set where row_id=v_moni_set_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no_str = v_pd_no_str;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_monitor_ctrl_type = v_monitor_ctrl_type;
    SET p_moni_value_type = v_moni_value_type;
    SET p_monitor_param_value = v_monitor_param_value;
    SET p_moni_value_flag = v_moni_value_flag;
    SET p_warn_posi_value = v_warn_posi_value;
    SET p_appd_value = v_appd_value;
    SET p_close_posi_value = v_close_posi_value;
    SET p_max_moni_value = v_max_moni_value;
    SET p_curr_moni_value = v_curr_moni_value;
    SET p_curr_result_moni_value = v_curr_result_moni_value;
    SET p_contrs_stock_code = v_contrs_stock_code;
    SET p_contrs_exch_no = v_contrs_exch_no;
    SET p_contrs_max_moni_value = v_contrs_max_moni_value;
    SET p_contrs_curr_moni_value = v_contrs_curr_moni_value;
    SET p_contrs_result_moni_value = v_contrs_result_moni_value;
    SET p_moni_result_value = v_moni_result_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_moni_set_status = v_moni_set_status;
    SET p_close_posi_flag = v_close_posi_flag;
    SET p_close_ratio_level_one = v_close_ratio_level_one;
    SET p_close_ratio_level_two = v_close_ratio_level_two;
    SET p_close_ratio_level_three = v_close_ratio_level_three;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取单条账户风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetSingleProductMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetSingleProductMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no_str varchar(2048),
    OUT p_exch_group_no_str varchar(2048),
    OUT p_moni_role_type int,
    OUT p_moni_value_flag int,
    OUT p_moni_value_type int,
    OUT p_warn_posi_value decimal(18,4),
    OUT p_warn_trig_oper_type int,
    OUT p_close_posi_value decimal(18,4),
    OUT p_close_trig_oper_type int,
    OUT p_appd_value decimal(18,4),
    OUT p_appd_trig_oper_type int,
    OUT p_begin_moni_date int,
    OUT p_begin_moni_value decimal(18,4),
    OUT p_max_moni_value decimal(18,4),
    OUT p_curr_moni_value decimal(18,4),
    OUT p_curr_result_moni_value decimal(18,4),
    OUT p_contrs_stock_code varchar(6),
    OUT p_contrs_exch_no int,
    OUT p_contrs_max_moni_value decimal(18,4),
    OUT p_contrs_curr_moni_value decimal(18,4),
    OUT p_contrs_result_moni_value decimal(18,4),
    OUT p_moni_result_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_moni_set_status varchar(2),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_stock_asset_ratio decimal(18,12),
    OUT p_close_posi_flag int,
    OUT p_close_ratio_level_one decimal(18,12),
    OUT p_close_ratio_level_two decimal(18,12),
    OUT p_close_ratio_level_three decimal(18,12),
    OUT p_remark_info varchar(255),
    OUT p_time_stamp int,
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
    declare v_moni_set_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_time_stamp int;
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_share decimal(18,2);
    declare v_begin_asset_value decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);

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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no_str = " ";
    SET v_exch_group_no_str = " ";
    SET v_moni_role_type = 0;
    SET v_moni_value_flag = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_warn_trig_oper_type = 0;
    SET v_close_posi_value = 0;
    SET v_close_trig_oper_type = 0;
    SET v_appd_value = 0;
    SET v_appd_trig_oper_type = 0;
    SET v_begin_moni_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_moni_value = 0;
    SET v_max_moni_value = 0;
    SET v_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_stock_code = " ";
    SET v_contrs_exch_no = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_nav_asset = 0;
    SET v_stock_asset_ratio = 0;
    SET v_close_posi_flag = 0;
    SET v_close_ratio_level_one = 0;
    SET v_close_ratio_level_two = 0;
    SET v_close_ratio_level_three = 0;
    SET v_remark_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_share = 0;
    SET v_begin_asset_value = 0;
    SET v_hk_thrgh_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_账户风险监控设置表][字段][字段变量][{记录序号}=@监控设置序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no_str, exch_group_no_str, moni_role_type, moni_value_flag, 
        moni_value_type, warn_posi_value, warn_trig_oper_type, close_posi_value, 
        close_trig_oper_type, appd_value, appd_trig_oper_type, begin_moni_date, 
        begin_moni_value, max_moni_value, curr_moni_value, curr_result_moni_value, 
        contrs_stock_code, contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, 
        contrs_result_moni_value, moni_result_value, moni_result_status, moni_set_status, 
        cash_asset, fund_asset, bond_asset, stock_asset, 
        repo_asset, nav_asset, stock_asset_ratio, close_posi_flag, 
        close_ratio_level_one, close_ratio_level_two, close_ratio_level_three, remark_info, 
        time_stamp, pd_share, begin_asset_value, hk_thrgh_stock_asset into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no_str, v_exch_group_no_str, v_moni_role_type, v_moni_value_flag, 
        v_moni_value_type, v_warn_posi_value, v_warn_trig_oper_type, v_close_posi_value, 
        v_close_trig_oper_type, v_appd_value, v_appd_trig_oper_type, v_begin_moni_date, 
        v_begin_moni_value, v_max_moni_value, v_curr_moni_value, v_curr_result_moni_value, 
        v_contrs_stock_code, v_contrs_exch_no, v_contrs_max_moni_value, v_contrs_curr_moni_value, 
        v_contrs_result_moni_value, v_moni_result_value, v_moni_result_status, v_moni_set_status, 
        v_cash_asset, v_fund_asset, v_bond_asset, v_stock_asset, 
        v_repo_asset, v_nav_asset, v_stock_asset_ratio, v_close_posi_flag, 
        v_close_ratio_level_one, v_close_ratio_level_two, v_close_ratio_level_three, v_remark_info, 
        v_time_stamp, v_pd_share, v_begin_asset_value, v_hk_thrgh_stock_asset from db_rksecu.tb_rkserk_product_monitor_set where row_id=v_moni_set_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no_str = v_pd_no_str;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_moni_role_type = v_moni_role_type;
    SET p_moni_value_flag = v_moni_value_flag;
    SET p_moni_value_type = v_moni_value_type;
    SET p_warn_posi_value = v_warn_posi_value;
    SET p_warn_trig_oper_type = v_warn_trig_oper_type;
    SET p_close_posi_value = v_close_posi_value;
    SET p_close_trig_oper_type = v_close_trig_oper_type;
    SET p_appd_value = v_appd_value;
    SET p_appd_trig_oper_type = v_appd_trig_oper_type;
    SET p_begin_moni_date = v_begin_moni_date;
    SET p_begin_moni_value = v_begin_moni_value;
    SET p_max_moni_value = v_max_moni_value;
    SET p_curr_moni_value = v_curr_moni_value;
    SET p_curr_result_moni_value = v_curr_result_moni_value;
    SET p_contrs_stock_code = v_contrs_stock_code;
    SET p_contrs_exch_no = v_contrs_exch_no;
    SET p_contrs_max_moni_value = v_contrs_max_moni_value;
    SET p_contrs_curr_moni_value = v_contrs_curr_moni_value;
    SET p_contrs_result_moni_value = v_contrs_result_moni_value;
    SET p_moni_result_value = v_moni_result_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_moni_set_status = v_moni_set_status;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_nav_asset = v_nav_asset;
    SET p_stock_asset_ratio = v_stock_asset_ratio;
    SET p_close_posi_flag = v_close_posi_flag;
    SET p_close_ratio_level_one = v_close_ratio_level_one;
    SET p_close_ratio_level_two = v_close_ratio_level_two;
    SET p_close_ratio_level_three = v_close_ratio_level_three;
    SET p_remark_info = v_remark_info;
    SET p_time_stamp = v_time_stamp;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取单条T0操作员阈值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetSingleT0OporResult;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetSingleT0OporResult(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_detail_posi_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int,
    OUT p_lngsht_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_pandl_ratio decimal(18,12),
    OUT p_un_close_posi_qty decimal(18,2),
    OUT p_un_close_marke_value decimal(18,4),
    OUT p_last_price decimal(16,9),
    OUT p_up_limit_price decimal(16,9),
    OUT p_down_limit_price decimal(16,9),
    OUT p_cost_price decimal(16,9),
    OUT p_last_tshold_value decimal(18,4),
    OUT p_float_pandl decimal(18,4),
    OUT p_posi_status varchar(2),
    OUT p_moni_result_status varchar(2),
    OUT p_posi_limit_status varchar(2),
    OUT p_opor_warn_tshold decimal(18,4),
    OUT p_opor_stop_tshold decimal(18,4),
    OUT p_stock_warn_ratio decimal(18,12),
    OUT p_stock_stop_ratio decimal(18,12),
    OUT p_stock_warn_amt decimal(18,4),
    OUT p_stock_stop_amt decimal(18,4),
    OUT p_open_close_permission int,
    OUT p_posi_limit_time int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_detail_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_cost_price decimal(16,9);
    declare v_last_tshold_value decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_moni_result_status varchar(2);
    declare v_posi_limit_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_open_close_permission int;
    declare v_posi_limit_time int;
    declare v_update_times int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_detail_posi_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_lngsht_type = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_realize_pandl = 0;
    SET v_pandl_ratio = 0;
    SET v_un_close_posi_qty = 0;
    SET v_un_close_marke_value = 0;
    SET v_last_price = 0;
    SET v_up_limit_price = 0;
    SET v_down_limit_price = 0;
    SET v_cost_price = 0;
    SET v_last_tshold_value = 0;
    SET v_float_pandl = 0;
    SET v_posi_status = "0";
    SET v_moni_result_status = " ";
    SET v_posi_limit_status = " ";
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_open_close_permission = 0;
    SET v_posi_limit_time = 5;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_T0操作员阈值计算表][字段][字段变量][{交易组编号}=@交易组编号# and {操作员编号} = @操作员编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        detail_posi_id, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_code, stock_acco_no, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_price, 
        up_limit_price, down_limit_price, cost_price, last_tshold_value, 
        float_pandl, posi_status, moni_result_status, posi_limit_status, 
        opor_warn_tshold, opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, 
        stock_warn_amt, stock_stop_amt, open_close_permission, posi_limit_time into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_detail_posi_id, v_co_no, v_pd_no, v_exch_group_no, 
        v_asset_acco_no, v_exch_no, v_stock_code, v_stock_acco_no, 
        v_stock_code_no, v_lngsht_type, v_curr_qty, v_open_posi_date, 
        v_open_posi_time, v_open_posi_price, v_open_posi_value, v_open_posi_fee, 
        v_close_posi_qty, v_close_posi_market_value, v_close_posi_fee, v_realize_pandl, 
        v_pandl_ratio, v_un_close_posi_qty, v_un_close_marke_value, v_last_price, 
        v_up_limit_price, v_down_limit_price, v_cost_price, v_last_tshold_value, 
        v_float_pandl, v_posi_status, v_moni_result_status, v_posi_limit_status, 
        v_opor_warn_tshold, v_opor_stop_tshold, v_stock_warn_ratio, v_stock_stop_ratio, 
        v_stock_warn_amt, v_stock_stop_amt, v_open_close_permission, v_posi_limit_time from db_rksecu.tb_rkserk_opor_tshold_result where exch_group_no=v_exch_group_no and opor_no = v_opor_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;
    SET p_pandl_ratio = v_pandl_ratio;
    SET p_un_close_posi_qty = v_un_close_posi_qty;
    SET p_un_close_marke_value = v_un_close_marke_value;
    SET p_last_price = v_last_price;
    SET p_up_limit_price = v_up_limit_price;
    SET p_down_limit_price = v_down_limit_price;
    SET p_cost_price = v_cost_price;
    SET p_last_tshold_value = v_last_tshold_value;
    SET p_float_pandl = v_float_pandl;
    SET p_posi_status = v_posi_status;
    SET p_moni_result_status = v_moni_result_status;
    SET p_posi_limit_status = v_posi_limit_status;
    SET p_opor_warn_tshold = v_opor_warn_tshold;
    SET p_opor_stop_tshold = v_opor_stop_tshold;
    SET p_stock_warn_ratio = v_stock_warn_ratio;
    SET p_stock_stop_ratio = v_stock_stop_ratio;
    SET p_stock_warn_amt = v_stock_warn_amt;
    SET p_stock_stop_amt = v_stock_stop_amt;
    SET p_open_close_permission = v_open_close_permission;
    SET p_posi_limit_time = v_posi_limit_time;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取单条T0操作员阈值汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetSingleT0OporSumResult;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetSingleT0OporSumResult(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_float_pandl decimal(18,4),
    OUT p_pandl_ratio decimal(18,12),
    OUT p_un_close_posi_qty decimal(18,2),
    OUT p_un_close_marke_value decimal(18,4),
    OUT p_last_tshold_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_opor_warn_tshold decimal(18,4),
    OUT p_opor_stop_tshold decimal(18,4),
    OUT p_open_close_permission int,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_tshold_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_open_close_permission int;
    declare v_update_times int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_realize_pandl = 0;
    SET v_float_pandl = 0;
    SET v_pandl_ratio = 0;
    SET v_un_close_posi_qty = 0;
    SET v_un_close_marke_value = 0;
    SET v_last_tshold_value = 0;
    SET v_moni_result_status = " ";
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_open_close_permission = 0;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_T0操作员阈值汇总计算表][字段][字段变量][{机构编号}=@操作员机构编号# and {操作员编号} = @操作员编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, curr_qty, open_posi_value, open_posi_fee, 
        close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, 
        float_pandl, pandl_ratio, un_close_posi_qty, un_close_marke_value, 
        last_tshold_value, moni_result_status, opor_warn_tshold, opor_stop_tshold, 
        open_close_permission into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_curr_qty, v_open_posi_value, v_open_posi_fee, 
        v_close_posi_qty, v_close_posi_market_value, v_close_posi_fee, v_realize_pandl, 
        v_float_pandl, v_pandl_ratio, v_un_close_posi_qty, v_un_close_marke_value, 
        v_last_tshold_value, v_moni_result_status, v_opor_warn_tshold, v_opor_stop_tshold, 
        v_open_close_permission from db_rksecu.tb_rkserk_opor_tshold_sum_result where co_no=v_opor_co_no and opor_no = v_opor_no limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;
    SET p_float_pandl = v_float_pandl;
    SET p_pandl_ratio = v_pandl_ratio;
    SET p_un_close_posi_qty = v_un_close_posi_qty;
    SET p_un_close_marke_value = v_un_close_marke_value;
    SET p_last_tshold_value = v_last_tshold_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_opor_warn_tshold = v_opor_warn_tshold;
    SET p_opor_stop_tshold = v_opor_stop_tshold;
    SET p_open_close_permission = v_open_close_permission;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步大宗交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncBlockTradePosition;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncBlockTradePosition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_posi_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_strike_date int,
    IN p_release_date int,
    IN p_deal_status varchar(2),
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
    declare v_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_strike_date int;
    declare v_release_date int;
    declare v_deal_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_code varchar(6);

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
    SET v_posi_id = p_posi_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_fair_price = p_fair_price;
    SET v_strike_date = p_strike_date;
    SET v_release_date = p_release_date;
    SET v_deal_status = p_deal_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控证券_计算_大宗交易持仓表][字段][字段变量][{持仓序号}=@持仓序号#,{机构编号}=@机构编号#,{产品编号}=@产品编号#,{资产账户编号}=@资产账户编号#,{交易组编号}=@交易组编号#,{市场编号}=@市场编号#,{股东代码编号}=@股东代码编号#,{证券代码编号}=@证券代码编号#,{成交数量}=@成交数量#,{成交价格}=@成交价格#,{公允价格}=@公允价格#,{成交日期}=@成交日期#,{解禁日期}=@解禁日期#,{处理状态}=@处理状态#][5][@交易组编号#,@证券代码#,@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksecc_block_trade_posi (
        create_date, create_time, update_date, 
        update_time, update_times, posi_id, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        stock_acco_no, stock_code_no, strike_qty, strike_price, 
        fair_price, strike_date, release_date, deal_status) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_posi_id, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_strike_qty, v_strike_price, 
        v_fair_price, v_strike_date, v_release_date, v_deal_status) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_id=v_posi_id,co_no=v_co_no,pd_no=v_pd_no,asset_acco_no=v_asset_acco_no,exch_group_no=v_exch_group_no,exch_no=v_exch_no,stock_acco_no=v_stock_acco_no,stock_code_no=v_stock_code_no,strike_qty=v_strike_qty,strike_price=v_strike_price,fair_price=v_fair_price,strike_date=v_strike_date,release_date=v_release_date,deal_status=v_deal_status;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.19.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取单条操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetSingleOporMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetSingleOporMonitor(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_moni_role_type int,
    OUT p_moni_value_flag int,
    OUT p_moni_value_type int,
    OUT p_warn_posi_value decimal(18,4),
    OUT p_warn_trig_oper_type int,
    OUT p_close_posi_value decimal(18,4),
    OUT p_close_trig_oper_type int,
    OUT p_appd_value decimal(18,4),
    OUT p_appd_trig_oper_type int,
    OUT p_begin_moni_date int,
    OUT p_begin_moni_value decimal(18,4),
    OUT p_max_moni_value decimal(18,4),
    OUT p_curr_moni_value decimal(18,4),
    OUT p_curr_result_moni_value decimal(18,4),
    OUT p_contrs_stock_code varchar(6),
    OUT p_contrs_exch_no int,
    OUT p_contrs_max_moni_value decimal(18,4),
    OUT p_contrs_curr_moni_value decimal(18,4),
    OUT p_contrs_result_moni_value decimal(18,4),
    OUT p_moni_result_value decimal(18,4),
    OUT p_moni_result_status varchar(2),
    OUT p_moni_set_status varchar(2),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_nav_asset decimal(18,4),
    OUT p_stock_asset_ratio decimal(18,12),
    OUT p_close_posi_flag int,
    OUT p_close_ratio_level_one decimal(18,12),
    OUT p_close_ratio_level_two decimal(18,12),
    OUT p_close_ratio_level_three decimal(18,12),
    OUT p_remark_info varchar(255),
    OUT p_time_stamp int,
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
    declare v_moni_set_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_moni_role_type int;
    declare v_moni_value_flag int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_warn_trig_oper_type int;
    declare v_close_posi_value decimal(18,4);
    declare v_close_trig_oper_type int;
    declare v_appd_value decimal(18,4);
    declare v_appd_trig_oper_type int;
    declare v_begin_moni_date int;
    declare v_begin_moni_value decimal(18,4);
    declare v_max_moni_value decimal(18,4);
    declare v_curr_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_stock_code varchar(6);
    declare v_contrs_exch_no int;
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_set_status varchar(2);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_close_posi_flag int;
    declare v_close_ratio_level_one decimal(18,12);
    declare v_close_ratio_level_two decimal(18,12);
    declare v_close_ratio_level_three decimal(18,12);
    declare v_remark_info varchar(255);
    declare v_time_stamp int;
    declare v_update_times int;
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
    SET v_moni_set_id = p_moni_set_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_moni_role_type = 0;
    SET v_moni_value_flag = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_warn_trig_oper_type = 0;
    SET v_close_posi_value = 0;
    SET v_close_trig_oper_type = 0;
    SET v_appd_value = 0;
    SET v_appd_trig_oper_type = 0;
    SET v_begin_moni_date = date_format(curdate(),'%Y%m%d');
    SET v_begin_moni_value = 0;
    SET v_max_moni_value = 0;
    SET v_curr_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_stock_code = " ";
    SET v_contrs_exch_no = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_contrs_curr_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_set_status = " ";
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_stock_asset = 0;
    SET v_repo_asset = 0;
    SET v_nav_asset = 0;
    SET v_stock_asset_ratio = 0;
    SET v_close_posi_flag = 0;
    SET v_close_ratio_level_one = 0;
    SET v_close_ratio_level_two = 0;
    SET v_close_ratio_level_three = 0;
    SET v_remark_info = " ";
    SET v_time_stamp = unix_timestamp();
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_操作员风险监控设置表][字段][字段变量][{记录序号}=@监控设置序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, moni_role_type, moni_value_flag, moni_value_type, 
        warn_posi_value, warn_trig_oper_type, close_posi_value, close_trig_oper_type, 
        appd_value, appd_trig_oper_type, begin_moni_date, begin_moni_value, 
        max_moni_value, curr_moni_value, curr_result_moni_value, contrs_stock_code, 
        contrs_exch_no, contrs_max_moni_value, contrs_curr_moni_value, contrs_result_moni_value, 
        moni_result_value, moni_result_status, moni_set_status, cash_asset, 
        fund_asset, bond_asset, stock_asset, repo_asset, 
        nav_asset, stock_asset_ratio, close_posi_flag, close_ratio_level_one, 
        close_ratio_level_two, close_ratio_level_three, remark_info, time_stamp into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_moni_role_type, v_moni_value_flag, v_moni_value_type, 
        v_warn_posi_value, v_warn_trig_oper_type, v_close_posi_value, v_close_trig_oper_type, 
        v_appd_value, v_appd_trig_oper_type, v_begin_moni_date, v_begin_moni_value, 
        v_max_moni_value, v_curr_moni_value, v_curr_result_moni_value, v_contrs_stock_code, 
        v_contrs_exch_no, v_contrs_max_moni_value, v_contrs_curr_moni_value, v_contrs_result_moni_value, 
        v_moni_result_value, v_moni_result_status, v_moni_set_status, v_cash_asset, 
        v_fund_asset, v_bond_asset, v_stock_asset, v_repo_asset, 
        v_nav_asset, v_stock_asset_ratio, v_close_posi_flag, v_close_ratio_level_one, 
        v_close_ratio_level_two, v_close_ratio_level_three, v_remark_info, v_time_stamp from db_rksecu.tb_rkserk_opor_monitor_set where row_id=v_moni_set_id limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_moni_role_type = v_moni_role_type;
    SET p_moni_value_flag = v_moni_value_flag;
    SET p_moni_value_type = v_moni_value_type;
    SET p_warn_posi_value = v_warn_posi_value;
    SET p_warn_trig_oper_type = v_warn_trig_oper_type;
    SET p_close_posi_value = v_close_posi_value;
    SET p_close_trig_oper_type = v_close_trig_oper_type;
    SET p_appd_value = v_appd_value;
    SET p_appd_trig_oper_type = v_appd_trig_oper_type;
    SET p_begin_moni_date = v_begin_moni_date;
    SET p_begin_moni_value = v_begin_moni_value;
    SET p_max_moni_value = v_max_moni_value;
    SET p_curr_moni_value = v_curr_moni_value;
    SET p_curr_result_moni_value = v_curr_result_moni_value;
    SET p_contrs_stock_code = v_contrs_stock_code;
    SET p_contrs_exch_no = v_contrs_exch_no;
    SET p_contrs_max_moni_value = v_contrs_max_moni_value;
    SET p_contrs_curr_moni_value = v_contrs_curr_moni_value;
    SET p_contrs_result_moni_value = v_contrs_result_moni_value;
    SET p_moni_result_value = v_moni_result_value;
    SET p_moni_result_status = v_moni_result_status;
    SET p_moni_set_status = v_moni_set_status;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_nav_asset = v_nav_asset;
    SET p_stock_asset_ratio = v_stock_asset_ratio;
    SET p_close_posi_flag = v_close_posi_flag;
    SET p_close_ratio_level_one = v_close_ratio_level_one;
    SET p_close_ratio_level_two = v_close_ratio_level_two;
    SET p_close_ratio_level_three = v_close_ratio_level_three;
    SET p_remark_info = v_remark_info;
    SET p_time_stamp = v_time_stamp;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取操作员风险监控设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetOporMonitor;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetOporMonitor(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@初始化日期#] */
    select date_format(curdate(),'%Y%m%d') into v_init_date;


    /* [获取表记录][风控证券_风控_操作员风险监控设置表][{记录序号},
{机构编号},
{操作员编号} as {业务操作员编号},
{监控值类型},
{监控值方式},
{对比证券代码},
{对比市场编号},{监控设置状态},{起始监控日期},{更新次数}][{记录序号} > @记录序号# ][@指定行数#] */
    if v_row_count = -1 then
        select row_id,
    co_no,
    opor_no as busi_opor_no,
    moni_value_type,
    moni_value_flag,
    contrs_stock_code,
    contrs_exch_no,moni_set_status,begin_moni_date,update_times from db_rksecu.tb_rkserk_opor_monitor_set where row_id > v_row_id ;
    else
        select row_id,
    co_no,
    opor_no as busi_opor_no,
    moni_value_type,
    moni_value_flag,
    contrs_stock_code,
    contrs_exch_no,moni_set_status,begin_moni_date,update_times from db_rksecu.tb_rkserk_opor_monitor_set where row_id > v_row_id  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_更新操作员风险监控设置计算值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_UpdateOporMonitorSetServiceValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_UpdateOporMonitorSetServiceValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_moni_set_id bigint,
    IN p_curr_moni_value decimal(18,4),
    IN p_cash_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_stock_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_nav_asset decimal(18,4),
    IN p_contrs_curr_moni_value decimal(18,4),
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
    declare v_moni_set_id bigint;
    declare v_curr_moni_value decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_contrs_curr_moni_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_max_moni_value decimal(18,4);
    declare v_contrs_max_moni_value decimal(18,4);
    declare v_moni_result_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_moni_value_flag int;
    declare v_moni_role_type int;
    declare v_moni_value_type int;
    declare v_warn_posi_value decimal(18,4);
    declare v_close_posi_value decimal(18,4);
    declare v_appd_value decimal(18,4);
    declare v_begin_moni_value decimal(18,4);
    declare v_curr_result_moni_value decimal(18,4);
    declare v_contrs_result_moni_value decimal(18,4);
    declare v_stock_asset_ratio decimal(18,12);
    declare v_update_date int;
    declare v_update_time int;
    declare v_curr_tmstp int;

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
    SET v_moni_set_id = p_moni_set_id;
    SET v_curr_moni_value = p_curr_moni_value;
    SET v_cash_asset = p_cash_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_stock_asset = p_stock_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_nav_asset = p_nav_asset;
    SET v_contrs_curr_moni_value = p_contrs_curr_moni_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_max_moni_value = 0;
    SET v_contrs_max_moni_value = 0;
    SET v_moni_result_value = 0;
    SET v_moni_result_status = " ";
    SET v_moni_value_flag = 0;
    SET v_moni_role_type = 0;
    SET v_moni_value_type = 0;
    SET v_warn_posi_value = 0;
    SET v_close_posi_value = 0;
    SET v_appd_value = 0;
    SET v_begin_moni_value = 0;
    SET v_curr_result_moni_value = 0;
    SET v_contrs_result_moni_value = 0;
    SET v_stock_asset_ratio = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_curr_tmstp = unix_timestamp();

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_风控_操作员风险监控设置表][{最大监控值},{对比最大监控值},{监控结果},{监控结果状态},{监控值方式},{监控结果},{监控角色},{监控值类型},{预警线},{平仓线},{追加线},{起始监控值}][@最大监控值#,@对比最大监控值#,@监控结果#,@监控结果状态#,@监控值方式#,@监控结果#,@监控角色#,@监控值类型#,@预警线#,@平仓线#,@追加线#,@起始监控值#][{记录序号} = @监控设置序号#] */
    select max_moni_value,contrs_max_moni_value,moni_result_value,moni_result_status,moni_value_flag,moni_result_value,moni_role_type,moni_value_type,warn_posi_value,close_posi_value,appd_value,begin_moni_value into v_max_moni_value,v_contrs_max_moni_value,v_moni_result_value,v_moni_result_status,v_moni_value_flag,v_moni_result_value,v_moni_role_type,v_moni_value_type,v_warn_posi_value,v_close_posi_value,v_appd_value,v_begin_moni_value from db_rksecu.tb_rkserk_opor_monitor_set where row_id = v_moni_set_id limit 1;


    /* set @监控结果状态# = 《监控结果状态-正常》; */
    set v_moni_result_status = "1";

    /* if @最大监控值# < @当前监控值# then */
    if v_max_moni_value < v_curr_moni_value then

        /* set @最大监控值# = @当前监控值#; */
        set v_max_moni_value = v_curr_moni_value;
    end if;

    /* if @对比最大监控值# < @对比当前监控值# then */
    if v_contrs_max_moni_value < v_contrs_curr_moni_value then

        /* set @对比最大监控值# = @对比当前监控值#; */
        set v_contrs_max_moni_value = v_contrs_curr_moni_value;
    end if;

    /* if @监控值方式# = 《监控值方式-固定值》 then */
    if v_moni_value_flag = 1 then

      /* set @监控结果# = @当前监控值#; */
      set v_moni_result_value = v_curr_moni_value;

      /* if @当前监控值# <= @预警线# and @预警线# <> 0 then */
      if v_curr_moni_value <= v_warn_posi_value and v_warn_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-预警》; */
        set v_moni_result_status = "2";
     end if;

      /* if @当前监控值# <= @追加线# and @追加线# <> 0 then */
      if v_curr_moni_value <= v_appd_value and v_appd_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-追加》; */
        set v_moni_result_status = "3";
     end if;

      /* if @当前监控值# <= @平仓线# and @平仓线# <> 0 then */
      if v_curr_moni_value <= v_close_posi_value and v_close_posi_value <> 0 then

        /* set @监控结果状态# = 《监控结果状态-止损》; */
        set v_moni_result_status = "4";
     end if;

    /* elseif @监控值方式# = 《监控值方式-最大回撤》 or @监控值方式# = 《监控值方式-对比最大回撤》 then */
    elseif v_moni_value_flag = 2 or v_moni_value_flag = 3 then

      /* if @最大监控值# > 0 then */
      if v_max_moni_value > 0 then

        /* set @当前监控结果# = round((@最大监控值# - @当前监控值#)/@最大监控值#,4); */
        set v_curr_result_moni_value = round((v_max_moni_value - v_curr_moni_value)/v_max_moni_value,4);

        /* set @监控结果# =@当前监控结果#; */
        set v_moni_result_value =v_curr_result_moni_value;

        /* if @监控值方式# = 《监控值方式-对比最大回撤》 then */
        if v_moni_value_flag = 3 then

          /* if @对比最大监控值# > 0 then */
          if v_contrs_max_moni_value > 0 then

            /* set @对比监控结果# = round((@对比最大监控值#-@对比当前监控值#)/@对比最大监控值#,4); */
            set v_contrs_result_moni_value = round((v_contrs_max_moni_value-v_contrs_curr_moni_value)/v_contrs_max_moni_value,4);

            /* if @对比监控结果# = 0 then */
            if v_contrs_result_moni_value = 0 then

              /* set @监控结果# = 0; */
              set v_moni_result_value = 0;

              /* if @当前监控结果# > 0 then */
              if v_curr_result_moni_value > 0 then

                /* set @监控结果# = -9999; */
                set v_moni_result_value = -9999;
              end if;
            else

              /* set @监控结果# = ifnull(round(@当前监控结果#/@对比监控结果#,4),0); */
              set v_moni_result_value = ifnull(round(v_curr_result_moni_value/v_contrs_result_moni_value,4),0);
            end if;
          else

            /* set @对比监控结果# =0; */
            set v_contrs_result_moni_value =0;

            /* set @监控结果# = 0; */
            set v_moni_result_value = 0;
          end if;
        end if;

        /* if @监控结果# >= @预警线# and @预警线# <> 0 then */
        if v_moni_result_value >= v_warn_posi_value and v_warn_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-预警》; */
          set v_moni_result_status = "2";
       end if;

        /* if @监控结果# >= @追加线# and @追加线# <> 0 then */
        if v_moni_result_value >= v_appd_value and v_appd_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-追加》; */
          set v_moni_result_status = "3";
       end if;

        /* if (@监控结果# >= @平仓线#  or  (@监控结果# = -9999 and @监控值方式# = 《监控值方式-对比最大回撤》))  and @平仓线# <> 0 then */
        if (v_moni_result_value >= v_close_posi_value  or  (v_moni_result_value = -9999 and v_moni_value_flag = 3))  and v_close_posi_value <> 0 then

          /* set @监控结果状态# = 《监控结果状态-止损》; */
          set v_moni_result_status = "4";
        end if;
      end if;
    end if;

    /* if @净资产# <> 0 then */
    if v_nav_asset <> 0 then

      /* set @股票资产占比# = Round(@股票资产#/@净资产#,4); */
      set v_stock_asset_ratio = Round(v_stock_asset/v_nav_asset,4);
    end if;

    /* if @监控值类型# = 《监控值类型-净值》 then */
    if v_moni_value_type = 2 then

        /* set @监控结果# = Round(@监控结果#,2); */
        set v_moni_result_value = Round(v_moni_result_value,2);

        /* set @当前监控值# = Round(@当前监控值#,2); */
        set v_curr_moni_value = Round(v_curr_moni_value,2);

        /* set @最大监控值# = Round(@最大监控值#,2); */
        set v_max_moni_value = Round(v_max_moni_value,2);

    /* elseif @监控值类型# = 《监控值类型-单位净值》 then */
    elseif v_moni_value_type = 1 then

        /* set @监控结果# = Round(@监控结果#,4); */
        set v_moni_result_value = Round(v_moni_result_value,4);

        /* set @当前监控值# = Round(@当前监控值#,4); */
        set v_curr_moni_value = Round(v_curr_moni_value,4);

        /* set @最大监控值# = Round(@最大监控值#,4); */
        set v_max_moni_value = Round(v_max_moni_value,4);
    end if;

    /* set @对比最大监控值# = Round(@对比最大监控值#,4); */
    set v_contrs_max_moni_value = Round(v_contrs_max_moni_value,4);

    /* set @对比当前监控值# = Round(@对比当前监控值#,4); */
    set v_contrs_curr_moni_value = Round(v_contrs_curr_moni_value,4);

    /* set @现金资产# = Round(@现金资产#,2); */
    set v_cash_asset = Round(v_cash_asset,2);

    /* set @基金资产# = Round(@基金资产#,2); */
    set v_fund_asset = Round(v_fund_asset,2);

    /* set @债券资产# = Round(@债券资产#,2); */
    set v_bond_asset = Round(v_bond_asset,2);

    /* set @股票资产# = Round(@股票资产#,2); */
    set v_stock_asset = Round(v_stock_asset,2);

    /* set @回购资产# = Round(@回购资产#,2); */
    set v_repo_asset = Round(v_repo_asset,2);

    /* set @净资产# = Round(@净资产#,2); */
    set v_nav_asset = Round(v_nav_asset,2);

    /* [更新表记录][风控证券_风控_操作员风险监控设置表][{最大监控值}=@最大监控值#,{当前监控值}=@当前监控值#,{当前监控结果} = @当前监控结果#,{对比最大监控值}=@对比最大监控值#,{对比当前监控值}=@对比当前监控值#,{对比监控结果} = @对比监控结果#,{监控结果} = @监控结果#,{监控结果状态}=@监控结果状态#,{时间戳}=@当前时间戳#,{现金资产}=@现金资产#,{基金资产}=@基金资产#,{债券资产}=@债券资产#,{股票资产}=@股票资产#,{回购资产}=@回购资产#,{净资产}=@净资产#,{股票资产占比} = @股票资产占比#][{记录序号}=@监控设置序号#][2][@监控设置序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_rksecu.tb_rkserk_opor_monitor_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, max_moni_value=v_max_moni_value,curr_moni_value=v_curr_moni_value,curr_result_moni_value = v_curr_result_moni_value,contrs_max_moni_value=v_contrs_max_moni_value,contrs_curr_moni_value=v_contrs_curr_moni_value,contrs_result_moni_value = v_contrs_result_moni_value,moni_result_value = v_moni_result_value,moni_result_status=v_moni_result_status,time_stamp=v_curr_tmstp,cash_asset=v_cash_asset,fund_asset=v_fund_asset,bond_asset=v_bond_asset,stock_asset=v_stock_asset,repo_asset=v_repo_asset,nav_asset=v_nav_asset,stock_asset_ratio = v_stock_asset_ratio where row_id=v_moni_set_id;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.22.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("监控设置序号=",v_moni_set_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("监控设置序号=",v_moni_set_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_更新T0操作员触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_UpdateT0OporTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_UpdateT0OporTrigInfo(
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
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_lngsht_type int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_price decimal(16,9),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_pandl_ratio decimal(18,12),
    IN p_un_close_posi_qty decimal(18,2),
    IN p_un_close_marke_value decimal(18,4),
    IN p_last_price decimal(16,9),
    IN p_cost_price decimal(16,9),
    IN p_last_tshold_value decimal(18,4),
    IN p_float_pandl decimal(18,4),
    IN p_moni_result_status varchar(2),
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_stock_warn_ratio decimal(18,12),
    IN p_stock_stop_ratio decimal(18,12),
    IN p_stock_warn_amt decimal(18,4),
    IN p_stock_stop_amt decimal(18,4),
    IN p_open_close_permission int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_cost_price decimal(16,9);
    declare v_last_tshold_value decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_open_close_permission int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_price = p_open_posi_price;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_pandl_ratio = p_pandl_ratio;
    SET v_un_close_posi_qty = p_un_close_posi_qty;
    SET v_un_close_marke_value = p_un_close_marke_value;
    SET v_last_price = p_last_price;
    SET v_cost_price = p_cost_price;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_float_pandl = p_float_pandl;
    SET v_moni_result_status = p_moni_result_status;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_stock_warn_ratio = p_stock_warn_ratio;
    SET v_stock_stop_ratio = p_stock_stop_ratio;
    SET v_stock_warn_amt = p_stock_warn_amt;
    SET v_stock_stop_amt = p_stock_stop_amt;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][风控证券_风控_T0操作员触警流水表][字段][字段变量][2][@操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tbjour_rkserk_opor_tshold_risk_trig(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code_no, stock_acco_no, lngsht_type, curr_qty, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, pandl_ratio, 
        un_close_posi_qty, un_close_marke_value, last_price, cost_price, 
        last_tshold_value, float_pandl, moni_result_status, opor_warn_tshold, 
        opor_stop_tshold, stock_warn_ratio, stock_stop_ratio, stock_warn_amt, 
        stock_stop_amt, open_close_permission) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_code_no, v_stock_acco_no, v_lngsht_type, v_curr_qty, 
        v_open_posi_price, v_open_posi_value, v_open_posi_fee, v_close_posi_qty, 
        v_close_posi_market_value, v_close_posi_fee, v_realize_pandl, v_pandl_ratio, 
        v_un_close_posi_qty, v_un_close_marke_value, v_last_price, v_cost_price, 
        v_last_tshold_value, v_float_pandl, v_moni_result_status, v_opor_warn_tshold, 
        v_opor_stop_tshold, v_stock_warn_ratio, v_stock_stop_ratio, v_stock_warn_amt, 
        v_stock_stop_amt, v_open_close_permission);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.23.2";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_更新T0操作员汇总触警流水信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_UpdateT0OporSumTrigInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_UpdateT0OporSumTrigInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_float_pandl decimal(18,4),
    IN p_pandl_ratio decimal(18,12),
    IN p_un_close_posi_qty decimal(18,2),
    IN p_un_close_marke_value decimal(18,4),
    IN p_last_tshold_value decimal(18,4),
    IN p_moni_result_status varchar(2),
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_open_close_permission int,
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
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_float_pandl decimal(18,4);
    declare v_pandl_ratio decimal(18,12);
    declare v_un_close_posi_qty decimal(18,2);
    declare v_un_close_marke_value decimal(18,4);
    declare v_last_tshold_value decimal(18,4);
    declare v_moni_result_status varchar(2);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_open_close_permission int;
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
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_float_pandl = p_float_pandl;
    SET v_pandl_ratio = p_pandl_ratio;
    SET v_un_close_posi_qty = p_un_close_posi_qty;
    SET v_un_close_marke_value = p_un_close_marke_value;
    SET v_last_tshold_value = p_last_tshold_value;
    SET v_moni_result_status = p_moni_result_status;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][风控证券_风控_T0操作员汇总触警流水表][字段][字段变量][2][@操作员编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tbjour_rkserk_opor_tshold_sum_risk_trig(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        curr_qty, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_market_value, close_posi_fee, realize_pandl, float_pandl, 
        pandl_ratio, un_close_posi_qty, un_close_marke_value, last_tshold_value, 
        moni_result_status, opor_warn_tshold, opor_stop_tshold, open_close_permission) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_curr_qty, v_open_posi_value, v_open_posi_fee, v_close_posi_qty, 
        v_close_posi_market_value, v_close_posi_fee, v_realize_pandl, v_float_pandl, 
        v_pandl_ratio, v_un_close_posi_qty, v_un_close_marke_value, v_last_tshold_value, 
        v_moni_result_status, v_opor_warn_tshold, v_opor_stop_tshold, v_open_close_permission);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.24.2";
        SET v_error_info =  CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_更新合规触警流水序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_UpdateComplianceTriggerId;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_UpdateComplianceTriggerId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_compli_trig_id bigint,
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
    declare v_compli_trig_id bigint;
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
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @合规触警序号# = 1; */
    set v_compli_trig_id = 1;

    /* [插入重复更新][风控证券_风控_合规触警流水序号表][字段][字段变量][{合规触警序号} = {合规触警序号}+1][1][@机构编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rkserk_compliancetrigger_id (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, compli_trig_id) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_compli_trig_id) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, compli_trig_id = compli_trig_id+1;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.25.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_获取合规触警序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_GetComplianceTriggerId;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_GetComplianceTriggerId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表全记录][风控证券_风控_合规触警流水序号表][{机构编号},{合规触警序号}][1=1] */
    select co_no,compli_trig_id from db_rksecu.tb_rkserk_compliancetrigger_id where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_新增合规触警流水数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_AddComplianceTrigData;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_AddComplianceTrigData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_client_risk_rule_id int,
    IN p_risk_item_id int,
    IN p_compli_trig_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_order_dir int,
    IN p_dime_id bigint,
    IN p_stock_code_no int,
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_unit_nav_flag int,
    IN p_trig_type int,
    IN p_compli_rules_remark varchar(255),
    IN p_risk_rule_action varchar(32),
    IN p_risk_rule_type int,
    IN p_risk_rule_value_str varchar(255),
    IN p_risk_rule_calc_str varchar(255),
    IN p_remark_info varchar(255),
    IN p_pd_no_str varchar(2048),
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
    declare v_client_risk_rule_id int;
    declare v_risk_item_id int;
    declare v_compli_trig_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_order_dir int;
    declare v_dime_id bigint;
    declare v_stock_code_no int;
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_unit_nav_flag int;
    declare v_trig_type int;
    declare v_compli_rules_remark varchar(255);
    declare v_risk_rule_action varchar(32);
    declare v_risk_rule_type int;
    declare v_risk_rule_value_str varchar(255);
    declare v_risk_rule_calc_str varchar(255);
    declare v_remark_info varchar(255);
    declare v_pd_no_str varchar(2048);
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
    SET v_client_risk_rule_id = p_client_risk_rule_id;
    SET v_risk_item_id = p_risk_item_id;
    SET v_compli_trig_id = p_compli_trig_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_order_dir = p_order_dir;
    SET v_dime_id = p_dime_id;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_unit_nav_flag = p_unit_nav_flag;
    SET v_trig_type = p_trig_type;
    SET v_compli_rules_remark = p_compli_rules_remark;
    SET v_risk_rule_action = p_risk_rule_action;
    SET v_risk_rule_type = p_risk_rule_type;
    SET v_risk_rule_value_str = p_risk_rule_value_str;
    SET v_risk_rule_calc_str = p_risk_rule_calc_str;
    SET v_remark_info = p_remark_info;
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][风控证券_风控_客户风险触警流水表][字段][字段变量][1][@客户风险规则序号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tbjour_rkserk_secu_client_risk_trig(
        create_date, create_time, update_date, 
        update_time, update_times, client_risk_rule_id, risk_item_id, 
        compli_trig_id, co_no, pd_no, exch_group_no, 
        order_dir, dime_id, stock_code_no, trig_stage_type, 
        compli_calc_level, unit_nav_flag, trig_type, compli_rules_remark, 
        risk_rule_action, risk_rule_type, risk_rule_value_str, risk_rule_calc_str, 
        remark_info, opor_no, pd_no_str) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_client_risk_rule_id, v_risk_item_id, 
        v_compli_trig_id, v_co_no, v_pd_no, v_exch_group_no, 
        v_order_dir, v_dime_id, v_stock_code_no, v_trig_stage_type, 
        v_compli_calc_level, v_unit_nav_flag, v_trig_type, v_compli_rules_remark, 
        v_risk_rule_action, v_risk_rule_type, v_risk_rule_value_str, v_risk_rule_calc_str, 
        v_remark_info, v_opor_no, v_pd_no_str);
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.27.1";
        SET v_error_info =  CONCAT(concat("客户风险规则序号=",v_client_risk_rule_id),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_接口_同步交易组信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rkseif_SyncExchGroupInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rkseif_SyncExchGroupInfo(
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
    IN p_exch_group_code varchar(32),
    IN p_exch_group_status varchar(2),
    IN p_default_group_flag int,
    IN p_exch_group_pd_share decimal(18,2),
    IN p_begin_NAV decimal(18,4),
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
    declare v_exch_group_code varchar(32);
    declare v_exch_group_status varchar(2);
    declare v_default_group_flag int;
    declare v_exch_group_pd_share decimal(18,2);
    declare v_begin_NAV decimal(18,4);
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
    SET v_exch_group_code = p_exch_group_code;
    SET v_exch_group_status = p_exch_group_status;
    SET v_default_group_flag = p_default_group_flag;
    SET v_exch_group_pd_share = p_exch_group_pd_share;
    SET v_begin_NAV = p_begin_NAV;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][风控证券_计算_交易组信息表][字段][字段变量][{机构编号} = @机构编号#, {产品编号} =@产品编号#,{交易组编号}=@交易组编号#,{交易组编码} =@交易组编码#,{交易组状态}=@交易组状态#,{默认组标志}=@默认组标志#,{交易组产品份额} = @交易组产品份额#,{期初净资产} = @期初净资产#][5][@交易组编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_rksecu.tb_rksecc_exch_group_info (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, exch_group_code, exch_group_status, default_group_flag, 
        exch_group_pd_share, begin_NAV) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_exch_group_code, v_exch_group_status, v_default_group_flag, 
        v_exch_group_pd_share, v_begin_NAV) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no = v_co_no, pd_no =v_pd_no,exch_group_no=v_exch_group_no,exch_group_code =v_exch_group_code,exch_group_status=v_exch_group_status,default_group_flag=v_default_group_flag,exch_group_pd_share = v_exch_group_pd_share,begin_NAV = v_begin_NAV;
    if v_error_code = "1" then
                
        SET v_error_code = "rksecuA.5.28.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


