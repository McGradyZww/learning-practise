DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_转入成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_AddStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_AddStrike(
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
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_net_price_flag int,
    IN p_intrst_days int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_clear_entry_type int,
    IN p_busi_jour_no bigint,
    IN p_strike_deal_type int,
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
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
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_clear_entry_type int;
    declare v_busi_jour_no bigint;
    declare v_strike_deal_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_arrive_date int;
    declare v_deal_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_tmp_strike_qty decimal(18,2);

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
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_net_price_flag = p_net_price_flag;
    SET v_intrst_days = p_intrst_days;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_busi_jour_no = p_busi_jour_no;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_tmp_strike_qty = 0;

    
    label_pro:BEGIN
    

    /* set @到账日期#=@初始化日期#; */
    set v_arrive_date=v_init_date;

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* if @成交处理方式#=《成交处理方式-汇总》 then */
    if v_strike_deal_type=2 then
        #如果成交回报接口是汇总方式, 仅清算成交量最大的成交回报

        /* [插入重复更新][清算证券_融资融券清算_成交控制表][字段][字段变量][{成交数量}={成交数量}+@成交数量#][1][@资产账户编号#, @申报日期#, @申报编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clcrdtcl_strike_ctrl (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, report_date, report_no, 
            strike_qty) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_report_date, v_report_no, 
            v_strike_qty) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, strike_qty=strike_qty+v_strike_qty;
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.21.1.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
            end if;
            leave label_pro;
        end if;


        /* [记录不存在插入表记录][清算证券_融资融券清算_成交表][字段][字段变量][{资产账户编号} = @资产账户编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][2][@资产账户编号#, @申报日期#, @申报编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clcrdtcl_strike (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            opor_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, exch_no, stock_acco_no, stock_code_no, 
            stock_code, stock_type, asset_type, strike_date, 
            strike_time, strike_no, report_date, report_time, 
            report_no, order_date, order_time, order_no, 
            order_dir, order_price, order_qty, strike_price, 
            strike_qty, strike_amt, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
            busi_jour_no, deal_flag) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_stock_code, v_stock_type, v_asset_type, v_strike_date, 
            v_strike_time, v_strike_no, v_report_date, v_report_time, 
            v_report_no, v_order_date, v_order_time, v_order_no, 
            v_order_dir, v_order_price, v_order_qty, v_strike_price, 
            v_strike_qty, v_strike_amt, v_stamp_tax, v_trans_fee, 
            v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
            v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
            v_stock_settle_fee, v_arrive_date, v_net_price_flag, v_intrst_days, 
            v_par_value, v_bond_accr_intrst, v_bond_rate_type, v_clear_entry_type, 
            v_busi_jour_no, v_deal_flag 
            from dual 
            where not exists(select * from db_clsecu.tb_clcrdtcl_strike where asset_acco_no = v_asset_acco_no and report_date = v_report_date and report_no = v_report_no);
        if v_error_code <> "0" then
                    
            SET v_error_code = "clsecuA.21.1.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][清算证券_融资融券清算_成交表][{成交数量}][@临时_成交数量#][{资产账户编号} = @资产账户编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][3][@资产账户编号#, @申报日期#, @申报编号#] */
        select strike_qty into v_tmp_strike_qty from db_clsecu.tb_clcrdtcl_strike where asset_acco_no = v_asset_acco_no and report_date = v_report_date and report_no = v_report_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clsecuA.21.1.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
            end if;
            leave label_pro;
        end if;


        /* if @成交数量# > @临时_成交数量# then */
        if v_strike_qty > v_tmp_strike_qty then

            /* [更新表记录][清算证券_融资融券清算_成交表][{成交价格} = @成交价格# , {成交数量} = @成交数量# , {成交金额} = @成交金额# , {印花税} = @印花税# , {过户费} = @过户费# , {经手费} = @经手费# , {证管费} = @证管费# , {其他费用} = @其他费用# , {交易佣金} = @交易佣金# , {其他佣金} = @其他佣金#][{资产账户编号} = @资产账户编号# and {申报日期} = @申报日期# and {申报编号} = @申报编号#][4][@资产账户编号#, @申报日期#, @申报编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_clsecu.tb_clcrdtcl_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_price = v_strike_price , strike_qty = v_strike_qty , strike_amt = v_strike_amt , stamp_tax = v_stamp_tax , trans_fee = v_trans_fee , brkage_fee = v_brkage_fee , SEC_charges = v_SEC_charges , other_fee = v_other_fee , trade_commis = v_trade_commis , other_commis = v_other_commis where asset_acco_no = v_asset_acco_no and report_date = v_report_date and report_no = v_report_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "clsecuA.21.1.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
                end if;
                leave label_pro;
            end if;

        end if;
    else

        /* [插入表记录][清算证券_融资融券清算_成交表][字段][字段变量][1][@资产账户编号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clcrdtcl_strike(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            opor_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, exch_no, stock_acco_no, stock_code_no, 
            stock_code, stock_type, asset_type, strike_date, 
            strike_time, strike_no, report_date, report_time, 
            report_no, order_date, order_time, order_no, 
            order_dir, order_price, order_qty, strike_price, 
            strike_qty, strike_amt, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
            busi_jour_no, deal_flag) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_stock_code, v_stock_type, v_asset_type, v_strike_date, 
            v_strike_time, v_strike_no, v_report_date, v_report_time, 
            v_report_no, v_order_date, v_order_time, v_order_no, 
            v_order_dir, v_order_price, v_order_qty, v_strike_price, 
            v_strike_qty, v_strike_amt, v_stamp_tax, v_trans_fee, 
            v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
            v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
            v_stock_settle_fee, v_arrive_date, v_net_price_flag, v_intrst_days, 
            v_par_value, v_bond_accr_intrst, v_bond_rate_type, v_clear_entry_type, 
            v_busi_jour_no, v_deal_flag);
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.21.1.1";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryOutBusi;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryOutBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_strike_no varchar(64),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_order_dir_str varchar(1024),
    IN p_deal_flag int,
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
    declare v_init_date int;
    declare v_strike_no varchar(64);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_dir_str varchar(1024);
    declare v_deal_flag int;
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
    SET v_init_date = p_init_date;
    SET v_strike_no = p_strike_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_flag = p_deal_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_融资融券清算_成交表][字段][{成交日期}=@初始化日期# and (@成交编号#=0 or {成交编号}=@成交编号#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=" " or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@处理标志#=0 or {处理标志}=@处理标志#) and (@记录序号#=0 or {记录序号}>@记录序号#)  order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, arrive_date, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        clear_entry_type, busi_jour_no, deal_flag from db_clsecu.tb_clcrdtcl_strike where strike_date=v_init_date and (v_strike_no=0 or strike_no=v_strike_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=" " or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_row_id=0 or row_id>v_row_id)  order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, arrive_date, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        clear_entry_type, busi_jour_no, deal_flag from db_clsecu.tb_clcrdtcl_strike where strike_date=v_init_date and (v_strike_no=0 or strike_no=v_strike_no) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=" " or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (v_row_id=0 or row_id>v_row_id)  order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_更新获取成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdateGetStrike;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdateGetStrike(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_chann_commis decimal(18,4),
    OUT p_divi_commis decimal(18,4),
    OUT p_trade_tax decimal(18,4),
    OUT p_trade_cost_fee decimal(18,4),
    OUT p_trade_system_use_fee decimal(18,4),
    OUT p_stock_settle_fee decimal(18,4),
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_arrive_date int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_clear_entry_type int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_arrive_date int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_clear_entry_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_busi_jour_no bigint;
    declare v_deal_flag int;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_clear_entry_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_busi_jour_no = 0;
    SET v_deal_flag = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录变量][清算证券_融资融券清算_成交表][字段][字段变量][{记录序号} = @查询序号# and {处理标志}=《处理标志-未处理》][4][@查询序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, arrive_date, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        clear_entry_type, busi_jour_no, deal_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_opor_no, v_pd_no, v_exch_group_no, 
        v_asset_acco_no, v_pass_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_strike_date, v_strike_time, v_strike_no, v_report_date, 
        v_report_time, v_report_no, v_order_date, v_order_time, 
        v_order_no, v_order_dir, v_order_price, v_order_qty, 
        v_strike_price, v_strike_qty, v_strike_amt, v_stamp_tax, 
        v_trans_fee, v_brkage_fee, v_SEC_charges, v_other_fee, 
        v_trade_commis, v_other_commis, v_trade_tax, v_trade_cost_fee, 
        v_trade_system_use_fee, v_stock_settle_fee, v_arrive_date, v_net_price_flag, 
        v_intrst_days, v_par_value, v_bond_accr_intrst, v_bond_rate_type, 
        v_clear_entry_type, v_busi_jour_no, v_deal_flag from db_clsecu.tb_clcrdtcl_strike where row_id = v_qry_no and deal_flag=2 limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.21.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询序号=",v_qry_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询序号=",v_qry_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算证券_融资融券清算_成交表][{处理标志}=《处理标志-已处理》][{记录序号}=@记录序号# and  {处理标志}=《处理标志-未处理》  ][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=1 where row_id=v_row_id and  deal_flag=2  ;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号#=@操作员编号#; */
    set v_busi_opor_no=v_opor_no;

    /* [获取影响行数][@记录个数#] */
    SET v_record_count=ROW_COUNT();

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_chann_commis = v_chann_commis;
    SET p_divi_commis = v_divi_commis;
    SET p_trade_tax = v_trade_tax;
    SET p_trade_cost_fee = v_trade_cost_fee;
    SET p_trade_system_use_fee = v_trade_system_use_fee;
    SET p_stock_settle_fee = v_stock_settle_fee;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_arrive_date = v_arrive_date;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_clear_entry_type = v_clear_entry_type;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_设置成交记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdateBusiClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdateBusiClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
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
    declare v_deal_flag int;
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_成交表][{处理标志}=@处理标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_strike set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.5.2";
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
use db_clsecu;;

# 原子_清算证券_融资融券清算_清算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_DealClear;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_DealClear(
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
    IN p_pass_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_pre_entry_amt decimal(18,4),
    IN p_pre_entry_qty decimal(18,2),
    IN p_debt_amt decimal(18,4),
    IN p_debt_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_busi_jour_no bigint,
    IN p_clear_entry_type int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_debt_type int,
    IN p_intrst_days int,
    IN p_arrive_date int,
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_par_value decimal(16,9),
    IN p_split_strike_flag int,
    IN p_busi_flag int,
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
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
    declare v_busi_jour_no bigint;
    declare v_clear_entry_type int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_intrst_days int;
    declare v_arrive_date int;
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_par_value decimal(16,9);
    declare v_split_strike_flag int;
    declare v_busi_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_split_strike_qty decimal(18,2);
    declare v_split_strike_amt decimal(18,4);
    declare v_split_stamp_tax decimal(18,4);
    declare v_split_trans_fee decimal(18,4);
    declare v_split_brkage decimal(18,4);
    declare v_split_SEC_charges decimal(18,4);
    declare v_split_other_fee decimal(18,4);
    declare v_split_brkage_commis decimal(18,4);
    declare v_split_other_commis decimal(18,4);
    declare v_split_trade_tax decimal(18,4);
    declare v_split_trade_cost_fee decimal(18,4);
    declare v_split_trade_system_use_fee decimal(18,4);
    declare v_split_stock_settle_fee decimal(18,4);
    declare v_strike_num int;
    declare v_strike_aver_price decimal(16,9);
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_deal_flag int;
    declare v_clear_loan_sell_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_debt_jour_no int;
    declare v_entry_exgp_debt_jour_no int;
    declare v_entry_asac_debt_jour_no int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_debt_amt = p_debt_amt;
    SET v_debt_qty = p_debt_qty;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_busi_jour_no = p_busi_jour_no;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_debt_type = p_debt_type;
    SET v_intrst_days = p_intrst_days;
    SET v_arrive_date = p_arrive_date;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_par_value = p_par_value;
    SET v_split_strike_flag = p_split_strike_flag;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_split_strike_qty = 0;
    SET v_split_strike_amt = 0;
    SET v_split_stamp_tax = 0;
    SET v_split_trans_fee = 0;
    SET v_split_brkage = 0;
    SET v_split_SEC_charges = 0;
    SET v_split_other_fee = 0;
    SET v_split_brkage_commis = 0;
    SET v_split_other_commis = 0;
    SET v_split_trade_tax = 0;
    SET v_split_trade_cost_fee = 0;
    SET v_split_trade_system_use_fee = 0;
    SET v_split_stock_settle_fee = 0;
    SET v_strike_num = 0;
    SET v_strike_aver_price = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_deal_flag = 0;
    SET v_clear_loan_sell_flag = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_debt_jour_no = 0;
    SET v_entry_exgp_debt_jour_no = 0;
    SET v_entry_asac_debt_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @分笔累计成交数量# = @成交数量#; */
    set v_split_strike_qty = v_strike_qty;

    /* set @分笔累计成交金额# = @成交金额#; */
    set v_split_strike_amt = v_strike_amt;

    /* set @分笔累计印花税# = @印花税#; */
    set v_split_stamp_tax = v_stamp_tax;

    /* set @分笔累计过户费# = @过户费#; */
    set v_split_trans_fee = v_trans_fee;

    /* set @分笔累计经手费# = @经手费#; */
    set v_split_brkage = v_brkage_fee;

    /* set @分笔累计证管费# = @证管费#; */
    set v_split_SEC_charges = v_SEC_charges;

    /* set @分笔累计其他费用# = @其他费用#; */
    set v_split_other_fee = v_other_fee;

    /* set @分笔累计交易佣金# = @交易佣金#; */
    set v_split_brkage_commis = v_trade_commis;

    /* set @分笔累计其他佣金# = @其他佣金#; */
    set v_split_other_commis = v_other_commis;

    /* set @分笔累计交易征费# = @交易征费#; */
    set v_split_trade_tax = v_trade_tax;

    /* set @分笔累计交易费# = @交易费#; */
    set v_split_trade_cost_fee = v_trade_cost_fee;

    /* set @分笔累计交易系统使用费# = @交易系统使用费#; */
    set v_split_trade_system_use_fee = v_trade_system_use_fee;

    /* set @分笔累计股份交收费# = @股份交收费#; */
    set v_split_stock_settle_fee = v_stock_settle_fee;

    /* set @成交笔数# = 1; */
    set v_strike_num = 1;

    /* set @成交均价# = @成交价格#; */
    set v_strike_aver_price = v_strike_price;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* set @回滚状态# = 《回滚状态-未回滚》; */
    set v_undo_status = "2";

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @清算融券卖出所得标志# = 《清算融券卖出所得标志-未处理》; */
    set v_clear_loan_sell_flag = 2;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账持仓负债流水号# = 0; */
    set v_entry_posi_debt_jour_no = 0;

    /* set @入账交易组负债流水号#=0; */
    set v_entry_exgp_debt_jour_no=0;

    /* set @入账资产账户负债流水号#=0; */
    set v_entry_asac_debt_jour_no=0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* set @对账流水号# = 0; */
    set v_deli_jour_no = 0;
    #对资金处理取2位小数

    /* set @待入账金额# = round(@待入账金额#, 2); */
    set v_pre_entry_amt = round(v_pre_entry_amt, 2);

    /* if @清算入账类型# = 《清算入账类型-分笔入账》 then */
    if v_clear_entry_type = 1 then

        /* [插入表记录][清算证券_融资融券清算_待入账记录表][字段][字段变量][1][@市场编号#,@成交日期#,@成交编号#,@订单方向#,@资产账户编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clcrdtcl_pre_entry(
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            opor_no, pd_no, pass_no, exch_group_no, 
            asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
            stock_code, stock_type, asset_type, debt_type, 
            strike_date, strike_time, strike_no, report_date, 
            report_time, report_no, order_date, order_time, 
            order_no, order_dir, order_price, order_qty, 
            strike_price, strike_qty, strike_amt, strike_num, 
            pre_entry_qty, pre_entry_amt, debt_qty, debt_amt, 
            all_fee, stamp_tax, trans_fee, brkage_fee, 
            SEC_charges, other_fee, trade_commis, other_commis, 
            trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
            busi_flag, entry_status, deal_flag, clear_loan_sell_flag, 
            undo_status, busi_jour_no, entry_money_jour_no, entry_exgp_debt_jour_no, 
            entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, arrive_date, 
            intrst_days, bond_accr_intrst, bond_rate_type) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_opor_no, v_pd_no, v_pass_no, v_exch_group_no, 
            v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
            v_strike_date, v_strike_time, v_strike_no, v_report_date, 
            v_report_time, v_report_no, v_order_date, v_order_time, 
            v_order_no, v_order_dir, v_order_price, v_order_qty, 
            v_strike_price, v_strike_qty, v_strike_amt, v_strike_num, 
            v_pre_entry_qty, v_pre_entry_amt, v_debt_qty, v_debt_amt, 
            v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
            v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
            v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
            v_busi_flag, v_entry_status, v_deal_flag, v_clear_loan_sell_flag, 
            v_undo_status, v_busi_jour_no, v_entry_money_jour_no, v_entry_exgp_debt_jour_no, 
            v_entry_asac_debt_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_arrive_date, 
            v_intrst_days, v_bond_accr_intrst, v_bond_rate_type);
        if v_error_code = "1" then
                    
            SET v_error_code = "clsecuA.21.11.1";
            SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* if @分笔成交标志#=《分笔成交标志-多笔成交》 then */
        if v_split_strike_flag=2 then
            #重置合并清算表所需要的字段值

            /* set @待入账金额# = 0; */
            set v_pre_entry_amt = 0;

            /* set @待入账数量# = 0; */
            set v_pre_entry_qty = 0;

            /* set  @负债金额#=0; */
            set  v_debt_amt=0;

            /* set @负债数量#=0; */
            set v_debt_qty=0;
            #set @业务标志# = 《业务标志-合并清算入账》;

            /* set @处理标志# = 《处理标志-未处理》; */
            set v_deal_flag = 2;

            /* [插入重复更新][清算证券_融资融券清算_合并清算表][字段][字段变量][{分笔累计成交数量} = {分笔累计成交数量} + @成交数量#, {分笔累计成交金额} = {分笔累计成交金额} + @成交金额#, {分笔累计印花税} = {分笔累计印花税} + @印花税#, {分笔累计过户费} = {分笔累计过户费} + @过户费#, {分笔累计经手费} = {分笔累计经手费} + @经手费#, {分笔累计证管费} = {分笔累计证管费} + @证管费#, {分笔累计其他费用} = {分笔累计其他费用} + @其他费用#, {分笔累计交易佣金} = {分笔累计交易佣金} + @交易佣金#,{分笔累计其他佣金} = {分笔累计其他佣金} + @其他佣金#, {分笔累计交易征费} = {分笔累计交易征费} + @交易征费# ,{分笔累计交易费} = {分笔累计交易费} + @交易费#, {分笔累计交易系统使用费} = {分笔累计交易系统使用费} + @交易系统使用费#, {分笔累计股份交收费} =  {分笔累计股份交收费} +  @股份交收费#,{成交笔数} = {成交笔数} + @成交笔数#, {成交均价} = {分笔累计成交金额}/{分笔累计成交数量}][2][@订单日期#,@订单编号#,@市场编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_clsecu.tb_clcrdtcl_merge_clear (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                opor_no, pd_no, exch_group_no, asset_acco_no, 
                pass_no, exch_no, stock_acco_no, stock_code, 
                stock_code_no, stock_type, asset_type, strike_date, 
                strike_time, strike_no, report_date, report_time, 
                report_no, order_date, order_time, order_no, 
                order_dir, order_price, order_qty, strike_num, 
                strike_aver_price, pre_entry_qty, pre_entry_amt, split_strike_qty, 
                split_strike_amt, split_stamp_tax, split_trans_fee, split_brkage, 
                split_SEC_charges, split_other_fee, split_brkage_commis, split_other_commis, 
                split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, split_stock_settle_fee, 
                arrive_date, net_price_flag, intrst_days, par_value, 
                bond_accr_intrst, bond_rate_type, clear_entry_type, busi_flag, 
                deal_flag) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
                v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code, 
                v_stock_code_no, v_stock_type, v_asset_type, v_strike_date, 
                v_strike_time, v_strike_no, v_report_date, v_report_time, 
                v_report_no, v_order_date, v_order_time, v_order_no, 
                v_order_dir, v_order_price, v_order_qty, v_strike_num, 
                v_strike_aver_price, v_pre_entry_qty, v_pre_entry_amt, v_split_strike_qty, 
                v_split_strike_amt, v_split_stamp_tax, v_split_trans_fee, v_split_brkage, 
                v_split_SEC_charges, v_split_other_fee, v_split_brkage_commis, v_split_other_commis, 
                v_split_trade_tax, v_split_trade_cost_fee, v_split_trade_system_use_fee, v_split_stock_settle_fee, 
                v_arrive_date, v_net_price_flag, v_intrst_days, v_par_value, 
                v_bond_accr_intrst, v_bond_rate_type, v_clear_entry_type, v_busi_flag, 
                v_deal_flag) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, split_strike_qty = split_strike_qty + v_strike_qty, split_strike_amt = split_strike_amt + v_strike_amt, split_stamp_tax = split_stamp_tax + v_stamp_tax, split_trans_fee = split_trans_fee + v_trans_fee, split_brkage = split_brkage + v_brkage_fee, split_SEC_charges = split_SEC_charges + v_SEC_charges, split_other_fee = split_other_fee + v_other_fee, split_brkage_commis = split_brkage_commis + v_trade_commis,split_other_commis = split_other_commis + v_other_commis, split_trade_tax = split_trade_tax + v_trade_tax ,split_trade_cost_fee = split_trade_cost_fee + v_trade_cost_fee, split_trade_system_use_fee = split_trade_system_use_fee + v_trade_system_use_fee, split_stock_settle_fee =  split_stock_settle_fee +  v_stock_settle_fee,strike_num = strike_num + v_strike_num, strike_aver_price = split_strike_amt/split_strike_qty;
            if v_error_code = "1" then
                        
                SET v_error_code = "clsecuA.21.11.2";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单日期=",v_order_date,",","订单编号=",v_order_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单日期=",v_order_date,",","订单编号=",v_order_no,",","市场编号=",v_exch_no);
                end if;
                leave label_pro;
            end if;

        end if;
    else

        /* if @分笔成交标志#=《分笔成交标志-多笔成交》 then */
        if v_split_strike_flag=2 then
            #如果是分笔成交，先写一笔待入账记录，以便后续处理时能保持按第一笔成交的顺序入账
            #插入待入账记录表时，因没有唯一索引约束，因此需要判断同一市场编号的成交日期成交编号是否已经存在
            #检查同一笔申报是否已经有成交回来，如果有则认为不再插入
           # [记录不存在插入表记录][清算证券_融资融券清算_待入账记录表][字段][字段变量][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][3][@资产账户编号#,@市场编号#,@申报日期#,@申报编号#]
            #重置合并清算表所需要的字段值

            /* set @待入账金额# = 0; */
            set v_pre_entry_amt = 0;

            /* set @待入账数量# = 0; */
            set v_pre_entry_qty = 0;

            /* set  @负债金额#=0; */
            set  v_debt_amt=0;

            /* set @负债数量#=0; */
            set v_debt_qty=0;
            #set @业务标志# = 《业务标志-合并清算入账》;

            /* set @处理标志# = 《处理标志-未处理》; */
            set v_deal_flag = 2;

            /* [插入重复更新][清算证券_融资融券清算_合并清算表][字段][字段变量][{分笔累计成交数量} = {分笔累计成交数量} + @成交数量#, {分笔累计成交金额} = {分笔累计成交金额} + @成交金额#, {分笔累计印花税} = {分笔累计印花税} + @印花税#, {分笔累计过户费} = {分笔累计过户费} + @过户费#, {分笔累计经手费} = {分笔累计经手费} + @经手费#, {分笔累计证管费} = {分笔累计证管费} + @证管费#, {分笔累计其他费用} = {分笔累计其他费用} + @其他费用#, {分笔累计交易佣金} = {分笔累计交易佣金} + @交易佣金#,{分笔累计其他佣金} = {分笔累计其他佣金} + @其他佣金#, {分笔累计交易征费} = {分笔累计交易征费} + @交易征费# ,{分笔累计交易费} = {分笔累计交易费} + @交易费#, {分笔累计交易系统使用费} = {分笔累计交易系统使用费} + @交易系统使用费#, {分笔累计股份交收费} =  {分笔累计股份交收费} +  @股份交收费#, {成交笔数} = {成交笔数} + @成交笔数#, {成交均价} = {分笔累计成交金额}/{分笔累计成交数量}][4][@订单日期#,@订单编号#,@市场编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_clsecu.tb_clcrdtcl_merge_clear (
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                opor_no, pd_no, exch_group_no, asset_acco_no, 
                pass_no, exch_no, stock_acco_no, stock_code, 
                stock_code_no, stock_type, asset_type, strike_date, 
                strike_time, strike_no, report_date, report_time, 
                report_no, order_date, order_time, order_no, 
                order_dir, order_price, order_qty, strike_num, 
                strike_aver_price, pre_entry_qty, pre_entry_amt, split_strike_qty, 
                split_strike_amt, split_stamp_tax, split_trans_fee, split_brkage, 
                split_SEC_charges, split_other_fee, split_brkage_commis, split_other_commis, 
                split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, split_stock_settle_fee, 
                arrive_date, net_price_flag, intrst_days, par_value, 
                bond_accr_intrst, bond_rate_type, clear_entry_type, busi_flag, 
                deal_flag) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
                v_pass_no, v_exch_no, v_stock_acco_no, v_stock_code, 
                v_stock_code_no, v_stock_type, v_asset_type, v_strike_date, 
                v_strike_time, v_strike_no, v_report_date, v_report_time, 
                v_report_no, v_order_date, v_order_time, v_order_no, 
                v_order_dir, v_order_price, v_order_qty, v_strike_num, 
                v_strike_aver_price, v_pre_entry_qty, v_pre_entry_amt, v_split_strike_qty, 
                v_split_strike_amt, v_split_stamp_tax, v_split_trans_fee, v_split_brkage, 
                v_split_SEC_charges, v_split_other_fee, v_split_brkage_commis, v_split_other_commis, 
                v_split_trade_tax, v_split_trade_cost_fee, v_split_trade_system_use_fee, v_split_stock_settle_fee, 
                v_arrive_date, v_net_price_flag, v_intrst_days, v_par_value, 
                v_bond_accr_intrst, v_bond_rate_type, v_clear_entry_type, v_busi_flag, 
                v_deal_flag) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, split_strike_qty = split_strike_qty + v_strike_qty, split_strike_amt = split_strike_amt + v_strike_amt, split_stamp_tax = split_stamp_tax + v_stamp_tax, split_trans_fee = split_trans_fee + v_trans_fee, split_brkage = split_brkage + v_brkage_fee, split_SEC_charges = split_SEC_charges + v_SEC_charges, split_other_fee = split_other_fee + v_other_fee, split_brkage_commis = split_brkage_commis + v_trade_commis,split_other_commis = split_other_commis + v_other_commis, split_trade_tax = split_trade_tax + v_trade_tax ,split_trade_cost_fee = split_trade_cost_fee + v_trade_cost_fee, split_trade_system_use_fee = split_trade_system_use_fee + v_trade_system_use_fee, split_stock_settle_fee =  split_stock_settle_fee +  v_stock_settle_fee, strike_num = strike_num + v_strike_num, strike_aver_price = split_strike_amt/split_strike_qty;
            if v_error_code = "1" then
                        
                SET v_error_code = "clsecuA.21.11.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("订单日期=",v_order_date,",","订单编号=",v_order_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("订单日期=",v_order_date,",","订单编号=",v_order_no,",","市场编号=",v_exch_no);
                end if;
                leave label_pro;
            end if;

        else

            /* [插入表记录][清算证券_融资融券清算_待入账记录表][字段][字段变量][5][@市场编号#,@成交日期#,@成交编号#,@资产账户编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_clsecu.tb_clcrdtcl_pre_entry(
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                opor_no, pd_no, pass_no, exch_group_no, 
                asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
                stock_code, stock_type, asset_type, debt_type, 
                strike_date, strike_time, strike_no, report_date, 
                report_time, report_no, order_date, order_time, 
                order_no, order_dir, order_price, order_qty, 
                strike_price, strike_qty, strike_amt, strike_num, 
                pre_entry_qty, pre_entry_amt, debt_qty, debt_amt, 
                all_fee, stamp_tax, trans_fee, brkage_fee, 
                SEC_charges, other_fee, trade_commis, other_commis, 
                trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
                busi_flag, entry_status, deal_flag, clear_loan_sell_flag, 
                undo_status, busi_jour_no, entry_money_jour_no, entry_exgp_debt_jour_no, 
                entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, arrive_date, 
                intrst_days, bond_accr_intrst, bond_rate_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_opor_no, v_pd_no, v_pass_no, v_exch_group_no, 
                v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
                v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
                v_strike_date, v_strike_time, v_strike_no, v_report_date, 
                v_report_time, v_report_no, v_order_date, v_order_time, 
                v_order_no, v_order_dir, v_order_price, v_order_qty, 
                v_strike_price, v_strike_qty, v_strike_amt, v_strike_num, 
                v_pre_entry_qty, v_pre_entry_amt, v_debt_qty, v_debt_amt, 
                v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
                v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
                v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
                v_busi_flag, v_entry_status, v_deal_flag, v_clear_loan_sell_flag, 
                v_undo_status, v_busi_jour_no, v_entry_money_jour_no, v_entry_exgp_debt_jour_no, 
                v_entry_asac_debt_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_arrive_date, 
                v_intrst_days, v_bond_accr_intrst, v_bond_rate_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "clsecuA.21.11.5";
                SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_更新获取合并清算记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_GetMergeClear;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_GetMergeClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_num int,
    OUT p_strike_aver_price decimal(16,9),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_split_strike_qty decimal(18,2),
    OUT p_split_strike_amt decimal(18,4),
    OUT p_split_stamp_tax decimal(18,4),
    OUT p_split_trans_fee decimal(18,4),
    OUT p_split_brkage decimal(18,4),
    OUT p_split_SEC_charges decimal(18,4),
    OUT p_split_other_fee decimal(18,4),
    OUT p_split_brkage_commis decimal(18,4),
    OUT p_split_other_commis decimal(18,4),
    OUT p_split_trade_tax decimal(18,4),
    OUT p_split_trade_cost_fee decimal(18,4),
    OUT p_split_trade_system_use_fee decimal(18,4),
    OUT p_split_stock_settle_fee decimal(18,4),
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_net_price_flag int,
    OUT p_intrst_days int,
    OUT p_par_value decimal(16,9),
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_clear_entry_type int,
    OUT p_busi_flag int,
    OUT p_deal_flag int,
    OUT p_arrive_date int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_num int;
    declare v_strike_aver_price decimal(16,9);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_split_strike_qty decimal(18,2);
    declare v_split_strike_amt decimal(18,4);
    declare v_split_stamp_tax decimal(18,4);
    declare v_split_trans_fee decimal(18,4);
    declare v_split_brkage decimal(18,4);
    declare v_split_SEC_charges decimal(18,4);
    declare v_split_other_fee decimal(18,4);
    declare v_split_brkage_commis decimal(18,4);
    declare v_split_other_commis decimal(18,4);
    declare v_split_trade_tax decimal(18,4);
    declare v_split_trade_cost_fee decimal(18,4);
    declare v_split_trade_system_use_fee decimal(18,4);
    declare v_split_stock_settle_fee decimal(18,4);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_net_price_flag int;
    declare v_intrst_days int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_clear_entry_type int;
    declare v_busi_flag int;
    declare v_deal_flag int;
    declare v_arrive_date int;
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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_num = 0;
    SET v_strike_aver_price = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_split_strike_qty = 0;
    SET v_split_strike_amt = 0;
    SET v_split_stamp_tax = 0;
    SET v_split_trans_fee = 0;
    SET v_split_brkage = 0;
    SET v_split_SEC_charges = 0;
    SET v_split_other_fee = 0;
    SET v_split_brkage_commis = 0;
    SET v_split_other_commis = 0;
    SET v_split_trade_tax = 0;
    SET v_split_trade_cost_fee = 0;
    SET v_split_trade_system_use_fee = 0;
    SET v_split_stock_settle_fee = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_net_price_flag = 0;
    SET v_intrst_days = 0;
    SET v_par_value = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_clear_entry_type = 0;
    SET v_busi_flag = 0;
    SET v_deal_flag = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录变量][清算证券_融资融券清算_合并清算表][字段][字段变量][{记录序号} = @查询序号# and {处理标志}=《处理标志-未处理》 ][4][@查询序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code, stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_num, strike_aver_price, pre_entry_qty, pre_entry_amt, 
        split_strike_qty, split_strike_amt, split_stamp_tax, split_trans_fee, 
        split_brkage, split_SEC_charges, split_other_fee, split_brkage_commis, 
        split_other_commis, split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, 
        split_stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
        busi_flag, deal_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_opor_no, v_pd_no, v_exch_group_no, 
        v_asset_acco_no, v_pass_no, v_exch_no, v_stock_acco_no, 
        v_stock_code, v_stock_code_no, v_stock_type, v_asset_type, 
        v_strike_date, v_strike_time, v_strike_no, v_report_date, 
        v_report_time, v_report_no, v_order_date, v_order_time, 
        v_order_no, v_order_dir, v_order_price, v_order_qty, 
        v_strike_num, v_strike_aver_price, v_pre_entry_qty, v_pre_entry_amt, 
        v_split_strike_qty, v_split_strike_amt, v_split_stamp_tax, v_split_trans_fee, 
        v_split_brkage, v_split_SEC_charges, v_split_other_fee, v_split_brkage_commis, 
        v_split_other_commis, v_split_trade_tax, v_split_trade_cost_fee, v_split_trade_system_use_fee, 
        v_split_stock_settle_fee, v_arrive_date, v_net_price_flag, v_intrst_days, 
        v_par_value, v_bond_accr_intrst, v_bond_rate_type, v_clear_entry_type, 
        v_busi_flag, v_deal_flag from db_clsecu.tb_clcrdtcl_merge_clear where row_id = v_qry_no and deal_flag=2  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.21.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询序号=",v_qry_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询序号=",v_qry_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算证券_融资融券清算_合并清算表][{处理标志}=《处理标志-已处理》][{记录序号}=@记录序号#  and {处理标志}=《处理标志-未处理》][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_merge_clear set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=1 where row_id=v_row_id  and deal_flag=2;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号#=@操作员编号#; */
    set v_busi_opor_no=v_opor_no;

    /* [获取影响行数][@记录个数#] */
    SET v_record_count=ROW_COUNT();

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_num = v_strike_num;
    SET p_strike_aver_price = v_strike_aver_price;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_split_strike_qty = v_split_strike_qty;
    SET p_split_strike_amt = v_split_strike_amt;
    SET p_split_stamp_tax = v_split_stamp_tax;
    SET p_split_trans_fee = v_split_trans_fee;
    SET p_split_brkage = v_split_brkage;
    SET p_split_SEC_charges = v_split_SEC_charges;
    SET p_split_other_fee = v_split_other_fee;
    SET p_split_brkage_commis = v_split_brkage_commis;
    SET p_split_other_commis = v_split_other_commis;
    SET p_split_trade_tax = v_split_trade_tax;
    SET p_split_trade_cost_fee = v_split_trade_cost_fee;
    SET p_split_trade_system_use_fee = v_split_trade_system_use_fee;
    SET p_split_stock_settle_fee = v_split_stock_settle_fee;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_net_price_flag = v_net_price_flag;
    SET p_intrst_days = v_intrst_days;
    SET p_par_value = v_par_value;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_clear_entry_type = v_clear_entry_type;
    SET p_busi_flag = v_busi_flag;
    SET p_deal_flag = v_deal_flag;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_设置合并清算记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdateMergeClearFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdateMergeClearFlag(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_deal_flag int,
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
    declare v_deal_flag int;
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
    SET v_row_id = p_row_id;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_合并清算表][{处理标志}=@处理标志#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_merge_clear set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.13.2";
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
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询合并清算记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryMergeClear;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryMergeClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_strike_date int,
    IN p_busi_flag int,
    IN p_deal_flag int,
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
    declare v_strike_date int;
    declare v_busi_flag int;
    declare v_deal_flag int;
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
    SET v_strike_date = p_strike_date;
    SET v_busi_flag = p_busi_flag;
    SET v_deal_flag = p_deal_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_融资融券清算_合并清算表][字段][(@成交日期#=0 or {成交日期}=@成交日期#) and (@业务标志#=0 or {业务标志}=@业务标志#) and (@处理标志#=0 or {处理标志}=@处理标志#) and ({记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code, stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_num, strike_aver_price, pre_entry_qty, pre_entry_amt, 
        split_strike_qty, split_strike_amt, split_stamp_tax, split_trans_fee, 
        split_brkage, split_SEC_charges, split_other_fee, split_brkage_commis, 
        split_other_commis, split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, 
        split_stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
        busi_flag, deal_flag from db_clsecu.tb_clcrdtcl_merge_clear where (v_strike_date=0 or strike_date=v_strike_date) and (v_busi_flag=0 or busi_flag=v_busi_flag) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code, stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_num, strike_aver_price, pre_entry_qty, pre_entry_amt, 
        split_strike_qty, split_strike_amt, split_stamp_tax, split_trans_fee, 
        split_brkage, split_SEC_charges, split_other_fee, split_brkage_commis, 
        split_other_commis, split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, 
        split_stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
        busi_flag, deal_flag from db_clsecu.tb_clcrdtcl_merge_clear where (v_strike_date=0 or strike_date=v_strike_date) and (v_busi_flag=0 or busi_flag=v_busi_flag) and (v_deal_flag=0 or deal_flag=v_deal_flag) and (row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_合并清算处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_DealMergeClear;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_DealMergeClear(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_pass_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_no int,
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_aver_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_pre_entry_amt decimal(18,4),
    IN p_pre_entry_qty decimal(18,2),
    IN p_debt_amt decimal(18,4),
    IN p_debt_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_stamp_tax decimal(18,4),
    IN p_trans_fee decimal(18,4),
    IN p_brkage_fee decimal(18,4),
    IN p_SEC_charges decimal(18,4),
    IN p_other_fee decimal(18,4),
    IN p_trade_commis decimal(18,4),
    IN p_other_commis decimal(18,4),
    IN p_trade_tax decimal(18,4),
    IN p_trade_cost_fee decimal(18,4),
    IN p_trade_system_use_fee decimal(18,4),
    IN p_stock_settle_fee decimal(18,4),
    IN p_busi_flag int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_intrst_days int,
    IN p_arrive_date int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_clear_entry_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_jour_no bigint
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_pass_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_aver_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
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
    declare v_busi_flag int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_intrst_days int;
    declare v_arrive_date int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_clear_entry_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_jour_no bigint;
    declare v_tmp_row_id bigint;
    declare v_debt_type int;
    declare v_busi_jour_no bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_debt_jour_no int;
    declare v_entry_asac_debt_jour_no int;
    declare v_entry_posi_debt_jour_no int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_deal_flag int;
    declare v_clear_loan_sell_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_pass_no = p_pass_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_no = p_order_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_aver_price = p_strike_aver_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_debt_amt = p_debt_amt;
    SET v_debt_qty = p_debt_qty;
    SET v_all_fee = p_all_fee;
    SET v_stamp_tax = p_stamp_tax;
    SET v_trans_fee = p_trans_fee;
    SET v_brkage_fee = p_brkage_fee;
    SET v_SEC_charges = p_SEC_charges;
    SET v_other_fee = p_other_fee;
    SET v_trade_commis = p_trade_commis;
    SET v_other_commis = p_other_commis;
    SET v_trade_tax = p_trade_tax;
    SET v_trade_cost_fee = p_trade_cost_fee;
    SET v_trade_system_use_fee = p_trade_system_use_fee;
    SET v_stock_settle_fee = p_stock_settle_fee;
    SET v_busi_flag = p_busi_flag;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_intrst_days = p_intrst_days;
    SET v_arrive_date = p_arrive_date;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_jour_no = 0;
    SET v_tmp_row_id = 0;
    SET v_debt_type = 0;
    SET v_busi_jour_no = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_debt_jour_no = 0;
    SET v_entry_asac_debt_jour_no = 0;
    SET v_entry_posi_debt_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_deal_flag = 0;
    SET v_clear_loan_sell_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #因后续更新表记录时会将记录序号变量冲掉，因此需临时保存一下

    /* set @临时_记录序号# = @记录序号#; */
    set v_tmp_row_id = v_row_id;

    /* if  @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-买券还券》 or @订单方向# = 《订单方向-直接还款》 then */
    if  v_order_dir = 5 or v_order_dir = 8 or v_order_dir = 14 then

        /* set @负债类型# = 《负债类型-融资》; */
        set v_debt_type = 1;

    /* elseif   @订单方向# = 《订单方向-融券卖出》 or @订单方向# = 《订单方向-卖券还款》 or @订单方向# = 《订单方向-直接还券》 then */
    elseif   v_order_dir = 6 or v_order_dir = 7 or v_order_dir = 15 then

        /* set @负债类型# = 《负债类型-融券》; */
        set v_debt_type = 2;
    else

        /* set @负债类型# = 《负债类型-信用交易》; */
        set v_debt_type = 3;
    end if;

    /* set @成交流水号# = 0; */
    set v_busi_jour_no = 0;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组负债流水号#=0; */
    set v_entry_exgp_debt_jour_no=0;

    /* set @入账资产账户负债流水号#=0; */
    set v_entry_asac_debt_jour_no=0;

    /* set @入账持仓负债流水号# = 0; */
    set v_entry_posi_debt_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* set @对账流水号# = 0; */
    set v_deli_jour_no = 0;

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @清算融券卖出所得标志# = 《清算融券卖出所得标志-未处理》; */
    set v_clear_loan_sell_flag = 2;
    #对资金处理取2位小数

    /* set @待入账金额# = round(@待入账金额#, 2); */
    set v_pre_entry_amt = round(v_pre_entry_amt, 2);

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* set @回滚状态# = 《回滚状态-未回滚》; */
    set v_undo_status = "2";

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* if @清算入账类型#=《清算入账类型-分笔入账》 then */
    if v_clear_entry_type=1 then

        /* if  @资产账户编号#>0 then */
        if  v_asset_acco_no>0 then

            /* [插入表记录][清算证券_融资融券清算_待入账记录表][字段][字段变量][1][@市场编号#,@成交日期#,@成交编号#,@资产账户编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_clsecu.tb_clcrdtcl_pre_entry(
                create_date, create_time, update_date, 
                update_time, update_times, init_date, co_no, 
                opor_no, pd_no, pass_no, exch_group_no, 
                asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
                stock_code, stock_type, asset_type, debt_type, 
                strike_date, strike_time, strike_no, report_date, 
                report_time, report_no, order_date, order_time, 
                order_no, order_dir, order_price, order_qty, 
                strike_price, strike_qty, strike_amt, strike_num, 
                pre_entry_qty, pre_entry_amt, debt_qty, debt_amt, 
                all_fee, stamp_tax, trans_fee, brkage_fee, 
                SEC_charges, other_fee, trade_commis, other_commis, 
                trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
                busi_flag, entry_status, deal_flag, clear_loan_sell_flag, 
                undo_status, busi_jour_no, entry_money_jour_no, entry_exgp_debt_jour_no, 
                entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, arrive_date, 
                intrst_days, bond_accr_intrst, bond_rate_type) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_init_date, v_co_no, 
                v_opor_no, v_pd_no, v_pass_no, v_exch_group_no, 
                v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
                v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
                v_strike_date, v_strike_time, v_strike_no, v_report_date, 
                v_report_time, v_report_no, v_order_date, v_order_time, 
                v_order_no, v_order_dir, v_order_price, v_order_qty, 
                v_strike_price, v_strike_qty, v_strike_amt, v_strike_num, 
                v_pre_entry_qty, v_pre_entry_amt, v_debt_qty, v_debt_amt, 
                v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
                v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
                v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
                v_busi_flag, v_entry_status, v_deal_flag, v_clear_loan_sell_flag, 
                v_undo_status, v_busi_jour_no, v_entry_money_jour_no, v_entry_exgp_debt_jour_no, 
                v_entry_asac_debt_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_arrive_date, 
                v_intrst_days, v_bond_accr_intrst, v_bond_rate_type);
            if v_error_code = "1" then
                        
                SET v_error_code = "clsecuA.21.15.1";
                SET v_error_info =  CONCAT(concat("市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;
    else

        /* [记录不存在插入表记录][清算证券_融资融券清算_待入账记录表][字段][字段变量][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][3][@资产账户编号#,@市场编号#,@申报日期#,@申报编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clsecu.tb_clcrdtcl_pre_entry (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            opor_no, pd_no, pass_no, exch_group_no, 
            asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
            stock_code, stock_type, asset_type, debt_type, 
            strike_date, strike_time, strike_no, report_date, 
            report_time, report_no, order_date, order_time, 
            order_no, order_dir, order_price, order_qty, 
            strike_price, strike_qty, strike_amt, strike_num, 
            pre_entry_qty, pre_entry_amt, debt_qty, debt_amt, 
            all_fee, stamp_tax, trans_fee, brkage_fee, 
            SEC_charges, other_fee, trade_commis, other_commis, 
            trade_tax, trade_cost_fee, trade_system_use_fee, stock_settle_fee, 
            busi_flag, entry_status, deal_flag, clear_loan_sell_flag, 
            undo_status, busi_jour_no, entry_money_jour_no, entry_exgp_debt_jour_no, 
            entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, arrive_date, 
            intrst_days, bond_accr_intrst, bond_rate_type) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_opor_no, v_pd_no, v_pass_no, v_exch_group_no, 
            v_asset_acco_no, v_exch_no, v_stock_acco_no, v_stock_code_no, 
            v_stock_code, v_stock_type, v_asset_type, v_debt_type, 
            v_strike_date, v_strike_time, v_strike_no, v_report_date, 
            v_report_time, v_report_no, v_order_date, v_order_time, 
            v_order_no, v_order_dir, v_order_price, v_order_qty, 
            v_strike_price, v_strike_qty, v_strike_amt, v_strike_num, 
            v_pre_entry_qty, v_pre_entry_amt, v_debt_qty, v_debt_amt, 
            v_all_fee, v_stamp_tax, v_trans_fee, v_brkage_fee, 
            v_SEC_charges, v_other_fee, v_trade_commis, v_other_commis, 
            v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, v_stock_settle_fee, 
            v_busi_flag, v_entry_status, v_deal_flag, v_clear_loan_sell_flag, 
            v_undo_status, v_busi_jour_no, v_entry_money_jour_no, v_entry_exgp_debt_jour_no, 
            v_entry_asac_debt_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_arrive_date, 
            v_intrst_days, v_bond_accr_intrst, v_bond_rate_type 
            from dual 
            where not exists(select * from db_clsecu.tb_clcrdtcl_pre_entry where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no);
        if v_error_code <> "0" then
                    
            SET v_error_code = "clsecuA.21.15.3";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","申报日期=",v_report_date,",","申报编号=",v_report_no);
            end if;
            leave label_pro;
        end if;

        #[更新表记录][清算证券_融资融券清算_待入账记录表][{成交笔数}=@成交笔数#,{成交价格}=@成交价格#,{成交数量}=@成交数量#,{成交金额}=@成交金额#,{待入账金额}=@待入账金额#,{待入账数量}=@待入账数量#,{负债金额}=@负债金额#,{负债数量}=@负债数量#,{全部费用}=@全部费用#,{证管费}=@证管费#,{过户费}=@过户费#,{经手费}=@经手费#,{印花税}=@印花税#,{其他费用}=@其他费用#,{交易佣金}=@交易佣金#,{其他佣金}=@其他佣金#,{交易征费} = @交易征费#, {交易费} = @交易费#, {交易系统使用费} = @交易系统使用费#, {股份交收费} = @股份交收费#][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][2][@市场编号#,@成交日期#,@成交编号#,@资产账户编号#]
    end if;
    #因前面更新表记录时将记录序号变量冲掉，需要重置回来

    /* set @记录序号# = @临时_记录序号#; */
    set v_row_id = v_tmp_row_id;

    /* set @处理标志# = 《处理标志-已处理》; */
    set v_deal_flag = 1;

    /* [更新表记录][清算证券_融资融券清算_合并清算表][{处理标志}=@处理标志#][{记录序号}=@记录序号# and {市场编号}=@市场编号# and {订单日期}=@订单日期# and {订单编号}=@订单编号#][3][@记录序号#,@市场编号#,@订单日期#,@订单编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_merge_clear set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag where row_id=v_row_id and exch_no=v_exch_no and order_date=v_order_date and order_no=v_order_no;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.15.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","市场编号=",v_exch_no,",","订单日期=",v_order_date,",","订单编号=",v_order_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","市场编号=",v_exch_no,",","订单日期=",v_order_date,",","订单编号=",v_order_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_jour_no = v_entry_jour_no;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_更新待入账记录入账状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdatePreEntryEntryStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdatePreEntryEntryStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_entry_status varchar(2),
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
    declare v_row_id bigint;
    declare v_entry_status varchar(2);
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
    SET v_init_date = p_init_date;
    SET v_row_id = p_row_id;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_待入账记录表][{入账状态}=@入账状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status=v_entry_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.21.2";
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
use db_clsecu;;

# 原子_清算证券_融资融券清算_更新待入账记录回滚状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdatePreEntryUndoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdatePreEntryUndoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_undo_status varchar(2),
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
    declare v_row_id bigint;
    declare v_undo_status varchar(2);
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
    SET v_init_date = p_init_date;
    SET v_row_id = p_row_id;
    SET v_undo_status = p_undo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_待入账记录表][{回滚状态}=@回滚状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, undo_status=v_undo_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.22.2";
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
use db_clsecu;;

# 原子_清算证券_融资融券清算_更新待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdatePreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdatePreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_posi_jour_no bigint,
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
    declare v_row_id bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
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
    SET v_init_date = p_init_date;
    SET v_row_id = p_row_id;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_待入账记录表][{入账资金流水号}=@入账资金流水号#, {入账持仓流水号}=@入账持仓流水号#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_money_jour_no=v_entry_money_jour_no, entry_posi_jour_no=v_entry_posi_jour_no where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.23.2";
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
use db_clsecu;;

# 原子_清算证券_融资融券清算_更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdateGetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_busi_opor_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_pass_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_code varchar(6),
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_debt_qty decimal(18,2),
    OUT p_debt_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_chann_commis decimal(18,4),
    OUT p_divi_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_busi_jour_no bigint,
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_stock_type int,
    OUT p_asset_type int,
    OUT p_debt_type int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_bond_rate_type int,
    OUT p_arrive_date int
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_pass_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_busi_jour_no bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_debt_type int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_arrive_date int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_deal_flag int;
    declare v_clear_loan_sell_flag int;
    declare v_entry_exgp_debt_jour_no int;
    declare v_entry_asac_debt_jour_no int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;

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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_busi_opor_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_pass_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_busi_jour_no = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_debt_type = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_deal_flag = 0;
    SET v_clear_loan_sell_flag = 0;
    SET v_entry_exgp_debt_jour_no = 0;
    SET v_entry_asac_debt_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录变量][清算证券_融资融券清算_待入账记录表][字段][字段变量][{记录序号} = @查询序号# and {入账状态} <>《入账状态-已入账》 ][4][@初始化日期#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, pass_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
        debt_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, deal_flag, 
        clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
        entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        arrive_date, intrst_days, bond_accr_intrst, bond_rate_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_opor_no, v_pd_no, v_pass_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_debt_type, v_strike_date, v_strike_time, v_strike_no, 
        v_report_date, v_report_time, v_report_no, v_order_date, 
        v_order_time, v_order_no, v_order_dir, v_order_price, 
        v_order_qty, v_strike_price, v_strike_qty, v_strike_amt, 
        v_strike_num, v_pre_entry_qty, v_pre_entry_amt, v_debt_qty, 
        v_debt_amt, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_busi_flag, v_entry_status, v_deal_flag, 
        v_clear_loan_sell_flag, v_undo_status, v_busi_jour_no, v_entry_money_jour_no, 
        v_entry_exgp_debt_jour_no, v_entry_asac_debt_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
        v_arrive_date, v_intrst_days, v_bond_accr_intrst, v_bond_rate_type from db_clsecu.tb_clcrdtcl_pre_entry where row_id = v_qry_no and entry_status <>"1"  limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.21.24.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算证券_融资融券清算_待入账记录表][{入账状态}=《入账状态-已入账》, {回滚状态}=《回滚状态-未回滚》 ][{记录序号}=@记录序号# and {入账状态} <>《入账状态-已入账》][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1", undo_status="2"  where row_id=v_row_id and entry_status <>"1";
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.24.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号#=@操作员编号#; */
    set v_busi_opor_no=v_opor_no;

    /* [获取影响行数][@记录个数#] */
    SET v_record_count=ROW_COUNT();

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_pass_no = v_pass_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_code = v_stock_code;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_debt_qty = v_debt_qty;
    SET p_debt_amt = v_debt_amt;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_chann_commis = v_chann_commis;
    SET p_divi_commis = v_divi_commis;
    SET p_other_commis = v_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_busi_jour_no = v_busi_jour_no;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_stock_type = v_stock_type;
    SET p_asset_type = v_asset_type;
    SET p_debt_type = v_debt_type;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_bond_rate_type = v_bond_rate_type;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_更新获取回滚待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdateGetPreEntryUndo;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdateGetPreEntryUndo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_report_date int,
    IN p_report_no varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_debt_type int,
    OUT p_stock_code varchar(6),
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_time int,
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_stamp_tax decimal(18,4),
    OUT p_trans_fee decimal(18,4),
    OUT p_brkage_fee decimal(18,4),
    OUT p_SEC_charges decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_chann_commis decimal(18,4),
    OUT p_divi_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_busi_jour_no bigint,
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_debt_jour_no int,
    OUT p_entry_asac_debt_jour_no int,
    OUT p_entry_exgp_posi_jour_no bigint,
    OUT p_entry_asac_posi_jour_no bigint,
    OUT p_deli_jour_no bigint,
    OUT p_stock_type int,
    OUT p_intrst_days int,
    OUT p_bond_accr_intrst decimal(18,12),
    OUT p_clear_entry_type int
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
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_debt_type int;
    declare v_stock_code varchar(6);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_time int;
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_stamp_tax decimal(18,4);
    declare v_trans_fee decimal(18,4);
    declare v_brkage_fee decimal(18,4);
    declare v_SEC_charges decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_chann_commis decimal(18,4);
    declare v_divi_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_busi_jour_no bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_debt_jour_no int;
    declare v_entry_asac_debt_jour_no int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_stock_type int;
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_clear_entry_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_asset_type int;
    declare v_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_trade_tax decimal(18,4);
    declare v_trade_cost_fee decimal(18,4);
    declare v_trade_system_use_fee decimal(18,4);
    declare v_stock_settle_fee decimal(18,4);
    declare v_deal_flag int;
    declare v_clear_loan_sell_flag int;
    declare v_arrive_date int;
    declare v_bond_rate_type int;

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
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_debt_type = 0;
    SET v_stock_code = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_all_fee = 0;
    SET v_stamp_tax = 0;
    SET v_trans_fee = 0;
    SET v_brkage_fee = 0;
    SET v_SEC_charges = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_chann_commis = 0;
    SET v_divi_commis = 0;
    SET v_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_busi_jour_no = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_debt_jour_no = 0;
    SET v_entry_asac_debt_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_stock_type = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_clear_entry_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_asset_type = 0;
    SET v_debt_qty = 0;
    SET v_debt_amt = 0;
    SET v_trade_tax = 0;
    SET v_trade_cost_fee = 0;
    SET v_trade_system_use_fee = 0;
    SET v_stock_settle_fee = 0;
    SET v_deal_flag = 0;
    SET v_clear_loan_sell_flag = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_bond_rate_type = 0;

    
    label_pro:BEGIN
    

    /* set @记录序号# = 0; */
    set v_row_id = 0;

    /* [锁定获取表记录变量][清算证券_融资融券清算_待入账记录表][字段][字段变量][{资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {申报日期}=@申报日期# and {申报编号}=@申报编号#][4][@资产账户编号#, @市场编号#, @申报日期#, @申报编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, pass_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
        debt_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, deal_flag, 
        clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
        entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        arrive_date, intrst_days, bond_accr_intrst, bond_rate_type into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_opor_no, v_pd_no, v_pass_no, 
        v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_stock_type, v_asset_type, 
        v_debt_type, v_strike_date, v_strike_time, v_strike_no, 
        v_report_date, v_report_time, v_report_no, v_order_date, 
        v_order_time, v_order_no, v_order_dir, v_order_price, 
        v_order_qty, v_strike_price, v_strike_qty, v_strike_amt, 
        v_strike_num, v_pre_entry_qty, v_pre_entry_amt, v_debt_qty, 
        v_debt_amt, v_all_fee, v_stamp_tax, v_trans_fee, 
        v_brkage_fee, v_SEC_charges, v_other_fee, v_trade_commis, 
        v_other_commis, v_trade_tax, v_trade_cost_fee, v_trade_system_use_fee, 
        v_stock_settle_fee, v_busi_flag, v_entry_status, v_deal_flag, 
        v_clear_loan_sell_flag, v_undo_status, v_busi_jour_no, v_entry_money_jour_no, 
        v_entry_exgp_debt_jour_no, v_entry_asac_debt_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, 
        v_arrive_date, v_intrst_days, v_bond_accr_intrst, v_bond_rate_type from db_clsecu.tb_clcrdtcl_pre_entry where asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and report_date=v_report_date and report_no=v_report_no limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clsecuA.21.25.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,","," 市场编号=", v_exch_no,","," 申报日期=", v_report_date,","," 申报编号=", v_report_no);
        end if;
        leave label_pro;
    end if;

    #[更新表记录][清算证券_融资融券清算_待入账记录表][{入账状态} = 《入账状态-未入账》,  {回滚状态}=《回滚状态-已回滚》][{记录序号}=@记录序号#][2][@记录序号#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_debt_type = v_debt_type;
    SET p_stock_code = v_stock_code;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_time = v_report_time;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_all_fee = v_all_fee;
    SET p_stamp_tax = v_stamp_tax;
    SET p_trans_fee = v_trans_fee;
    SET p_brkage_fee = v_brkage_fee;
    SET p_SEC_charges = v_SEC_charges;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_chann_commis = v_chann_commis;
    SET p_divi_commis = v_divi_commis;
    SET p_other_commis = v_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_busi_jour_no = v_busi_jour_no;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_debt_jour_no = v_entry_exgp_debt_jour_no;
    SET p_entry_asac_debt_jour_no = v_entry_asac_debt_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;
    SET p_stock_type = v_stock_type;
    SET p_intrst_days = v_intrst_days;
    SET p_bond_accr_intrst = v_bond_accr_intrst;
    SET p_clear_entry_type = v_clear_entry_type;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryPreEntry(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_entry_status varchar(2),
    IN p_undo_status varchar(2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_融资融券清算_待入账记录表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#)  and (@入账状态# = " " or {入账状态}=@入账状态#) and (@回滚状态# = " " or {回滚状态}=@回滚状态#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, pass_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
        debt_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, deal_flag, 
        clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
        entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        arrive_date, intrst_days, bond_accr_intrst, bond_rate_type from db_clsecu.tb_clcrdtcl_pre_entry where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, pass_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
        debt_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, deal_flag, 
        clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
        entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        arrive_date, intrst_days, bond_accr_intrst, bond_rate_type from db_clsecu.tb_clcrdtcl_pre_entry where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no)  and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_入账异常处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_DealEntryError;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_DealEntryError(
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
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_undo_error_no int,
    IN p_remark_info varchar(255),
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
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_undo_error_no int;
    declare v_remark_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_undo_error_no = p_undo_error_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][清算证券_融资融券清算_入账异常表][字段][字段变量][1][@初始化日期#,@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@股东代码编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clcrdtcl_entry_error(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, undo_error_no, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_type, v_undo_error_no, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.27.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","市场编号=",v_exch_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_回写入账流水号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdateEntryJour;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdateEntryJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_debt_jour_no int,
    IN p_entry_asac_debt_jour_no int,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_debt_jour_no int;
    declare v_entry_asac_debt_jour_no int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
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
    SET v_row_id = p_row_id;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_debt_jour_no = p_entry_exgp_debt_jour_no;
    SET v_entry_asac_debt_jour_no = p_entry_asac_debt_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_待入账记录表][{入账资金流水号} = @入账资金流水号#,  {入账交易组负债流水号} = @入账交易组负债流水号#, {入账资产账户负债流水号} = @入账资产账户负债流水号#,{入账交易组持仓流水号} = @入账交易组持仓流水号#, {入账资产账户持仓流水号} = @入账资产账户持仓流水号#][{记录序号} = @记录序号#][1]["融资融券回写入账流水失败"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_money_jour_no = v_entry_money_jour_no,  entry_exgp_debt_jour_no = v_entry_exgp_debt_jour_no, entry_asac_debt_jour_no = v_entry_asac_debt_jour_no,entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no, entry_asac_posi_jour_no = v_entry_asac_posi_jour_no where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.28.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("融资融券回写入账流水失败","#",v_mysql_message);
        else
            SET v_error_info = "融资融券回写入账流水失败";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_入账记录回滚处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_DealEntryJourUndo;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_DealEntryJourUndo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_exch_no int,
    IN p_order_date int,
    IN p_order_no int,
    IN p_clear_entry_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_jour_no bigint,
    OUT p_repo_pd_jour_no bigint,
    OUT p_valid_flag int
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
    declare v_exch_no int;
    declare v_order_date int;
    declare v_order_no int;
    declare v_clear_entry_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_jour_no bigint;
    declare v_repo_pd_jour_no bigint;
    declare v_valid_flag int;
    declare v_tmp_busi_jour_no bigint;

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
    SET v_exch_no = p_exch_no;
    SET v_order_date = p_order_date;
    SET v_order_no = p_order_no;
    SET v_clear_entry_type = p_clear_entry_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_jour_no = 0;
    SET v_repo_pd_jour_no = 0;
    SET v_valid_flag = 0;
    SET v_tmp_busi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @有效标志# = 1; */
    set v_valid_flag = 1;
    #获取内部成交流水号

    /* set  @回购流水号#=0; */
    set  v_repo_pd_jour_no=0;

    /* [表记录变量不检验][清算证券_融资融券清算_待入账记录表][{成交流水号}][@成交流水号#][{记录序号} =@记录序号#] */
    select busi_jour_no into v_busi_jour_no from db_clsecu.tb_clcrdtcl_pre_entry where row_id =v_row_id limit 1;


    /* [删除表记录][清算证券_融资融券清算_待入账记录表][{记录序号} = @记录序号#][3]["删除入账记录失败"] */
    delete from db_clsecu.tb_clcrdtcl_pre_entry 
        where row_id = v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.29.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("删除入账记录失败","#",v_mysql_message);
        else
            SET v_error_info = "删除入账记录失败";
        end if;
        leave label_pro;
    end if;


    /* if @清算入账类型# = 《清算入账类型-分笔入账》 then */
    if v_clear_entry_type = 1 then
        #获取外部成交流水号

        /* set @临时_成交流水号# = @成交流水号#; */
        set v_tmp_busi_jour_no = v_busi_jour_no;

        /* [表记录变量不检验][清算证券_融资融券清算_成交表][{成交流水号}][@成交流水号#][{记录序号} = @临时_成交流水号#] */
        select busi_jour_no into v_busi_jour_no from db_clsecu.tb_clcrdtcl_strike where row_id = v_tmp_busi_jour_no limit 1;

        if FOUND_ROWS() = 0 then

            /* set @成交流水号# = 0; */
            set v_busi_jour_no = 0;

            /* set @回购流水号# = 0; */
            set v_repo_pd_jour_no = 0;
            leave label_pro;
        end if;

        /* [删除表记录][清算证券_融资融券清算_成交表][{记录序号} = @临时_成交流水号#][4]["删除成交记录失败"] */
        delete from db_clsecu.tb_clcrdtcl_strike 
            where row_id = v_tmp_busi_jour_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "clsecuA.21.29.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("删除成交记录失败","#",v_mysql_message);
            else
                SET v_error_info = "删除成交记录失败";
            end if;
            leave label_pro;
        end if;


        /* [删除表记录][清算证券_融资融券清算_合并清算表][{订单日期} = @订单日期# and {订单编号} = @订单编号# and {市场编号} = @市场编号#][5][""] */
        delete from db_clsecu.tb_clcrdtcl_merge_clear 
            where order_date = v_order_date and order_no = v_order_no and exch_no = v_exch_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "clsecuA.21.29.5";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("","#",v_mysql_message);
            else
                SET v_error_info = "";
            end if;
            leave label_pro;
        end if;


        /* set @有效标志# = 0; */
        set v_valid_flag = 0;
    else
        #获取外部成交流水号

        /* [表记录变量不检验][清算证券_融资融券清算_成交表][{记录序号}, {成交流水号}][@记录序号#, @成交流水号#][{市场编号} = @市场编号# and {订单编号} = @订单编号# and {订单日期} = @订单日期#] */
        select row_id, busi_jour_no into v_row_id, v_busi_jour_no from db_clsecu.tb_clcrdtcl_strike where exch_no = v_exch_no and order_no = v_order_no and order_date = v_order_date limit 1;

        if FOUND_ROWS() = 0 then

            /* set @成交流水号# = 0; */
            set v_busi_jour_no = 0;

            /* set @回购流水号# = 0; */
            set v_repo_pd_jour_no = 0;

            /* set @有效标志# = 0; */
            set v_valid_flag = 0;
            leave label_pro;
        end if;

        /* [删除表记录][清算证券_融资融券清算_成交表][{记录序号} = @记录序号#][5]["删除成交记录失败"] */
        delete from db_clsecu.tb_clcrdtcl_strike 
            where row_id = v_row_id;
        if v_error_code = 1 then
                    
            SET v_error_code = "clsecuA.21.29.5";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("删除成交记录失败","#",v_mysql_message);
            else
                SET v_error_info = "删除成交记录失败";
            end if;
            leave label_pro;
        end if;


        /* [删除表记录][清算证券_融资融券清算_合并清算表][{订单日期} = @订单日期# and {订单编号} = @订单编号# and {市场编号} = @市场编号#][6][""] */
        delete from db_clsecu.tb_clcrdtcl_merge_clear 
            where order_date = v_order_date and order_no = v_order_no and exch_no = v_exch_no;
        if v_error_code = 1 then
                    
            SET v_error_code = "clsecuA.21.29.6";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT("","#",v_mysql_message);
            else
                SET v_error_info = "";
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_jour_no = v_busi_jour_no;
    SET p_repo_pd_jour_no = v_repo_pd_jour_no;
    SET p_valid_flag = v_valid_flag;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_获取回滚入账信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_GetPreEntryInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_GetPreEntryInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_report_date int,
    OUT p_report_no varchar(32),
    OUT p_arrive_date int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_arrive_date int;

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_no = " ";
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][清算证券_融资融券清算_待入账记录表][{资产账户编号}, {市场编号}, {申报日期}, {申报编号},{到账日期}][@资产账户编号#, @市场编号#, @申报日期#, @申报编号#,@到账日期#][{记录序号} = @查询记录序号#][1][@查询记录序号#] */
    select asset_acco_no, exch_no, report_date, report_no,arrive_date into v_asset_acco_no, v_exch_no, v_report_date, v_report_no,v_arrive_date from db_clsecu.tb_clcrdtcl_pre_entry where row_id = v_query_row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_report_date = v_report_date;
    SET p_report_no = v_report_no;
    SET p_arrive_date = v_arrive_date;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询还款还券待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryRetuPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryRetuPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_order_dir_str varchar(1024),
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
    declare v_order_dir_str varchar(1024);
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
    SET v_order_dir_str = p_order_dir_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* select {初始化日期} ,{机构编号},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{证券代码编号},{市场编号},{证券代码},{证券类型},{资产类型},{订单方向},sum(abs({成交数量})) as {成交数量},sum({成交金额}) as {成交金额},sum(abs({待入账金额})) as {待入账金额},sum(abs({待入账数量})) as {待入账数量},sum({全部费用}) as {全部费用}  from ~清算证券_融资融券清算_待入账记录表^ where (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0)  and {处理标志}<>《处理标志-已处理》  group by {机构编号},{交易组编号},{证券代码编号},{市场编号},{资产账户编号},{订单方向} order by {交易组编号},{资产账户编号},{证券代码编号},{订单方向}; */
    select init_date ,co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,exch_no,stock_code,stock_type,asset_type,order_dir,sum(abs(strike_qty)) as strike_qty,sum(strike_amt) as strike_amt,sum(abs(pre_entry_amt)) as pre_entry_amt,sum(abs(pre_entry_qty)) as pre_entry_qty,sum(all_fee) as all_fee  from db_clsecu.tb_clcrdtcl_pre_entry where (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0)  and deal_flag<>1  group by co_no,exch_group_no,stock_code_no,exch_no,asset_acco_no,order_dir order by exch_group_no,asset_acco_no,stock_code_no,order_dir;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询融券卖出所得金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryLoanSellAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryLoanSellAmt(
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
    

    /* select {机构编号},{产品编号},{资产账户编号},{交易组编号}, sum(if({订单方向}=《订单方向-融券卖出》,abs({待入账金额}),0)) as {融券卖出金额},sum(if({订单方向}<>《订单方向-融券卖出》,abs({待入账金额}),0)) as {融券买入金额}  from ~清算证券_融资融券清算_待入账记录表^  where {负债类型}=《负债类型-融券》 and  {清算融券卖出所得标志}=《清算融券卖出所得标志-未处理》   group by {机构编号},{交易组编号},{资产账户编号} order by {交易组编号},{资产账户编号}; */
    select co_no,pd_no,asset_acco_no,exch_group_no, sum(if(order_dir=6,abs(pre_entry_amt),0)) as loan_sell_amt,sum(if(order_dir<>6,abs(pre_entry_amt),0)) as loan_buy_amt  from db_clsecu.tb_clcrdtcl_pre_entry  where debt_type=2 and  clear_loan_sell_flag=2   group by co_no,exch_group_no,asset_acco_no order by exch_group_no,asset_acco_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_设置待入账记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdatePreEntryDealFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdatePreEntryDealFlag(
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
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_order_dir_str varchar(1024),
    IN p_deal_flag int,
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
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_order_dir_str varchar(1024);
    declare v_deal_flag int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_order_dir_str = p_order_dir_str;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_待入账记录表][{处理标志}=@处理标志#][{机构编号}=@机构编号#  and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) ][2][@交易组编号#,@证券代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag where co_no=v_co_no  and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_no=v_exch_no and stock_code_no=v_stock_code_no and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) ;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_设置清算融券卖出所得处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_UpdatePreEntryLoanSellFlag;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_UpdatePreEntryLoanSellFlag(
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
    IN p_clear_loan_sell_flag int,
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
    declare v_clear_loan_sell_flag int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_clear_loan_sell_flag = p_clear_loan_sell_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算证券_融资融券清算_待入账记录表][{清算融券卖出所得标志}=@清算融券卖出所得标志#][{机构编号}=@机构编号#  and {产品编号}=@产品编号# and {交易组编号}=@交易组编号#  and {资产账户编号}=@资产账户编号# and  {负债类型}=《负债类型-融券》][2][@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clsecu.tb_clcrdtcl_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, clear_loan_sell_flag=v_clear_loan_sell_flag where co_no=v_co_no  and pd_no=v_pd_no and exch_group_no=v_exch_group_no  and asset_acco_no=v_asset_acco_no and  debt_type=2;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.34.2";
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
use db_clsecu;;

# 原子_清算证券_融资融券清算_数据统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_DataTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_DataTotal(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #为避免插入重复，先删除证券清算统计表数据

    /* [删除表记录][清算证券_融资融券清算_统计表][{初始化日期}=@初始化日期#][1][@初始化日期#] */
    delete from db_clsecu.tb_clcrdtcl_clear_total 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #从待入账记录表统计已入账记录数据，清算数据
    #统计产品相关数据，市场编号、证券代码、订单方向、业务标志

    /* set @机构编号# = 0; */
    set v_co_no = 0;

    /* set @产品编号# = 0; */
    set v_pd_no = 0;

    /* set @交易组编号# = 0; */
    set v_exch_group_no = 0;

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_融资融券清算_统计表][清算证券_融资融券清算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{清算笔数},{订单方向},{成交笔数},{成交均价},{成交数量},{成交金额},{入账数量},{入账金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{渠道佣金},{分成佣金},{其他佣金},{外部全部费用},{外部印花税},{外部过户费},{外部经手费},{外部证管费},{外部其他费用},{外部交易佣金},{外部渠道佣金},{外部分成佣金},{外部其他佣金}][@初始化日期#, {业务标志}, @机构编号#, @产品编号#,@交易组编号#,@资产账户编号#, {市场编号}, @股东代码编号#,{证券代码编号},count(*), {订单方向}, sum({成交笔数}), sum({成交金额})/sum({成交数量}), sum({成交数量}), sum({成交金额}), sum({待入账数量}), sum({待入账金额}), sum({全部费用}), sum({印花税}), sum({过户费}), sum({经手费}), sum({证管费}), sum({其他费用}), sum({交易佣金}), sum({渠道佣金}), sum({分成佣金}), sum({其他佣金}), sum({外部全部费用}), sum({外部印花税}), sum({外部过户费}), sum({外部经手费}), sum({外部证管费}), sum({外部其他费用}), sum({外部交易佣金}), sum({外部渠道佣金}), sum({外部分成佣金}), sum({外部其他佣金})][{初始化日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][2][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clcrdtcl_clear_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,clear_num,order_dir,strike_num,strike_aver_price,strike_qty,strike_amt,entry_qty,entry_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,chann_commis,divi_commis,other_commis,out_all_fee,out_stamp_tax,out_trans_fee,out_brkage,out_SEC_charges,out_other_fee,out_brkage_commis,out_chann_commis,out_divi_commis,out_other_commis) 
        select 
        v_init_date, busi_flag, v_co_no, v_pd_no,v_exch_group_no,v_asset_acco_no, exch_no, v_stock_acco_no,stock_code_no,count(*), order_dir, sum(strike_num), sum(strike_amt)/sum(strike_qty), sum(strike_qty), sum(strike_amt), sum(pre_entry_qty), sum(pre_entry_amt), sum(all_fee), sum(stamp_tax), sum(trans_fee), sum(brkage_fee), sum(SEC_charges), sum(other_fee), sum(trade_commis), sum(chann_commis), sum(divi_commis), sum(other_commis), sum(out_all_fee), sum(out_stamp_tax), sum(out_trans_fee), sum(out_brkage), sum(out_SEC_charges), sum(out_other_fee), sum(out_brkage_commis), sum(out_chann_commis), sum(out_divi_commis), sum(out_other_commis) 
        from db_clsecu.tb_clcrdtcl_pre_entry 
        where init_date=v_init_date and entry_status = "1" group by exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品相关数据，机构编号、产品编号、市场编号、证券代码、订单方向、业务标志

    /* set @交易组编号# = 0; */
    set v_exch_group_no = 0;

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_融资融券清算_统计表][清算证券_融资融券清算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{订单方向},{清算笔数},{成交笔数},{成交均价},{成交数量},{成交金额},{入账数量},{入账金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{渠道佣金},{分成佣金},{其他佣金},{外部全部费用},{外部印花税},{外部过户费},{外部经手费},{外部证管费},{外部其他费用},{外部交易佣金},{外部渠道佣金},{外部分成佣金},{外部其他佣金}][@初始化日期#, {业务标志}, {机构编号},{产品编号},@交易组编号#,@资产账户编号#, {市场编号}, @股东代码编号#,{证券代码编号},count(*), {订单方向}, sum({成交笔数}), sum({成交金额})/sum({成交数量}), sum({成交数量}), sum({成交金额}), sum({待入账数量}), sum({待入账金额}), sum({全部费用}), sum({印花税}), sum({过户费}), sum({经手费}), sum({证管费}), sum({其他费用}), sum({交易佣金}), sum({渠道佣金}), sum({分成佣金}), sum({其他佣金}), sum({外部全部费用}), sum({外部印花税}), sum({外部过户费}), sum({外部经手费}), sum({外部证管费}), sum({外部其他费用}), sum({外部交易佣金}), sum({外部渠道佣金}), sum({外部分成佣金}), sum({外部其他佣金})][{初始化日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][3][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clcrdtcl_clear_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,order_dir,clear_num,strike_num,strike_aver_price,strike_qty,strike_amt,entry_qty,entry_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,chann_commis,divi_commis,other_commis,out_all_fee,out_stamp_tax,out_trans_fee,out_brkage,out_SEC_charges,out_other_fee,out_brkage_commis,out_chann_commis,out_divi_commis,out_other_commis) 
        select 
        v_init_date, busi_flag, co_no,pd_no,v_exch_group_no,v_asset_acco_no, exch_no, v_stock_acco_no,stock_code_no,count(*), order_dir, sum(strike_num), sum(strike_amt)/sum(strike_qty), sum(strike_qty), sum(strike_amt), sum(pre_entry_qty), sum(pre_entry_amt), sum(all_fee), sum(stamp_tax), sum(trans_fee), sum(brkage_fee), sum(SEC_charges), sum(other_fee), sum(trade_commis), sum(chann_commis), sum(divi_commis), sum(other_commis), sum(out_all_fee), sum(out_stamp_tax), sum(out_trans_fee), sum(out_brkage), sum(out_SEC_charges), sum(out_other_fee), sum(out_brkage_commis), sum(out_chann_commis), sum(out_divi_commis), sum(out_other_commis) 
        from db_clsecu.tb_clcrdtcl_pre_entry 
        where init_date=v_init_date and entry_status = "1" group by co_no, pd_no, exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品单元相关数据，机构编号、产品编号、交易单元、市场编号、证券代码、订单方向、业务标志

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_融资融券清算_统计表][清算证券_融资融券清算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{清算笔数},{订单方向},{成交笔数},{成交均价},{成交数量},{成交金额},{入账数量},{入账金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{渠道佣金},{分成佣金},{其他佣金},{外部全部费用},{外部印花税},{外部过户费},{外部经手费},{外部证管费},{外部其他费用},{外部交易佣金},{外部渠道佣金},{外部分成佣金},{外部其他佣金}][@初始化日期#, {业务标志}, {机构编号}, {产品编号}, {交易组编号}, @资产账户编号#, {市场编号}, @股东代码编号#, {证券代码编号}, count(*), {订单方向}, sum({成交笔数}), sum({成交金额})/sum({成交数量}), sum({成交数量}), sum({成交金额}), sum({待入账数量}), sum({待入账金额}), sum({全部费用}), sum({印花税}), sum({过户费}), sum({经手费}), sum({证管费}), sum({其他费用}), sum({交易佣金}), sum({渠道佣金}), sum({分成佣金}), sum({其他佣金}), sum({外部全部费用}), sum({外部印花税}), sum({外部过户费}), sum({外部经手费}), sum({外部证管费}), sum({外部其他费用}), sum({外部交易佣金}), sum({外部渠道佣金}), sum({外部分成佣金}), sum({外部其他佣金})][{初始化日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {交易单元}, {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][4][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clcrdtcl_clear_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,clear_num,order_dir,strike_num,strike_aver_price,strike_qty,strike_amt,entry_qty,entry_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,chann_commis,divi_commis,other_commis,out_all_fee,out_stamp_tax,out_trans_fee,out_brkage,out_SEC_charges,out_other_fee,out_brkage_commis,out_chann_commis,out_divi_commis,out_other_commis) 
        select 
        v_init_date, busi_flag, co_no, pd_no, exch_group_no, v_asset_acco_no, exch_no, v_stock_acco_no, stock_code_no, count(*), order_dir, sum(strike_num), sum(strike_amt)/sum(strike_qty), sum(strike_qty), sum(strike_amt), sum(pre_entry_qty), sum(pre_entry_amt), sum(all_fee), sum(stamp_tax), sum(trans_fee), sum(brkage_fee), sum(SEC_charges), sum(other_fee), sum(trade_commis), sum(chann_commis), sum(divi_commis), sum(other_commis), sum(out_all_fee), sum(out_stamp_tax), sum(out_trans_fee), sum(out_brkage), sum(out_SEC_charges), sum(out_other_fee), sum(out_brkage_commis), sum(out_chann_commis), sum(out_divi_commis), sum(out_other_commis) 
        from db_clsecu.tb_clcrdtcl_pre_entry 
        where init_date=v_init_date and entry_status = "1" group by co_no, pd_no, part_code, exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.201.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品单元资产账户相关数据，机构编号、产品编号、交易单元、资产账户、市场编号、证券代码、订单方向、业务标志

    /* set @股东代码编号# = 0; */
    set v_stock_acco_no = 0;

    /* [读取插入表记录][清算证券_融资融券清算_统计表][清算证券_融资融券清算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{清算笔数},{订单方向},{成交笔数},{成交均价},{成交数量},{成交金额},{入账数量},{入账金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{渠道佣金},{分成佣金},{其他佣金},{外部全部费用},{外部印花税},{外部过户费},{外部经手费},{外部证管费},{外部其他费用},{外部交易佣金},{外部渠道佣金},{外部分成佣金},{外部其他佣金}][@初始化日期#, {业务标志}, {机构编号}, {产品编号}, {交易组编号}, {资产账户编号},{市场编号}, @股东代码编号#, {证券代码编号}, count(*), {订单方向}, sum({成交笔数}), sum({成交金额})/sum({成交数量}), sum({成交数量}), sum({成交金额}), sum({待入账数量}), sum({待入账金额}), sum({全部费用}), sum({印花税}), sum({过户费}), sum({经手费}), sum({证管费}), sum({其他费用}), sum({交易佣金}), sum({渠道佣金}), sum({分成佣金}), sum({其他佣金}), sum({外部全部费用}), sum({外部印花税}), sum({外部过户费}), sum({外部经手费}), sum({外部证管费}), sum({外部其他费用}), sum({外部交易佣金}), sum({外部渠道佣金}), sum({外部分成佣金}), sum({外部其他佣金})][{初始化日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {交易单元}, {资产账户编号}, {市场编号}, {证券代码编号}, {订单方向}, {业务标志}][5][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clcrdtcl_clear_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,clear_num,order_dir,strike_num,strike_aver_price,strike_qty,strike_amt,entry_qty,entry_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,chann_commis,divi_commis,other_commis,out_all_fee,out_stamp_tax,out_trans_fee,out_brkage,out_SEC_charges,out_other_fee,out_brkage_commis,out_chann_commis,out_divi_commis,out_other_commis) 
        select 
        v_init_date, busi_flag, co_no, pd_no, exch_group_no, asset_acco_no,exch_no, v_stock_acco_no, stock_code_no, count(*), order_dir, sum(strike_num), sum(strike_amt)/sum(strike_qty), sum(strike_qty), sum(strike_amt), sum(pre_entry_qty), sum(pre_entry_amt), sum(all_fee), sum(stamp_tax), sum(trans_fee), sum(brkage_fee), sum(SEC_charges), sum(other_fee), sum(trade_commis), sum(chann_commis), sum(divi_commis), sum(other_commis), sum(out_all_fee), sum(out_stamp_tax), sum(out_trans_fee), sum(out_brkage), sum(out_SEC_charges), sum(out_other_fee), sum(out_brkage_commis), sum(out_chann_commis), sum(out_divi_commis), sum(out_other_commis) 
        from db_clsecu.tb_clcrdtcl_pre_entry 
        where init_date=v_init_date and entry_status = "1" group by co_no, pd_no, part_code, asset_acco_no, exch_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.201.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品单元资产账户相关数据，机构编号、产品编号、交易单元、资产账户、市场编号、股东代码、证券代码、订单方向、业务标志

    /* [读取插入表记录][清算证券_融资融券清算_统计表][清算证券_融资融券清算_待入账记录表][{初始化日期},{业务标志},{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{股东代码编号},{证券代码编号},{清算笔数},{订单方向},{成交笔数},{成交均价},{成交数量},{成交金额},{入账数量},{入账金额},{全部费用},{印花税},{过户费},{经手费},{证管费},{其他费用},{交易佣金},{渠道佣金},{分成佣金},{其他佣金},{外部全部费用},{外部印花税},{外部过户费},{外部经手费},{外部证管费},{外部其他费用},{外部交易佣金},{外部渠道佣金},{外部分成佣金},{外部其他佣金}][@初始化日期#, {业务标志}, {机构编号}, {产品编号}, {交易组编号},{资产账户编号},  {市场编号}, {股东代码编号}, {证券代码编号}, count(*), {订单方向}, sum({成交笔数}), sum({成交金额})/sum({成交数量}), sum({成交数量}), sum({成交金额}), sum({待入账数量}), sum({待入账金额}), sum({全部费用}), sum({印花税}), sum({过户费}), sum({经手费}), sum({证管费}), sum({其他费用}), sum({交易佣金}), sum({渠道佣金}), sum({分成佣金}), sum({其他佣金}), sum({外部全部费用}), sum({外部印花税}), sum({外部过户费}), sum({外部经手费}), sum({外部证管费}), sum({外部其他费用}), sum({外部交易佣金}), sum({外部渠道佣金}), sum({外部分成佣金}), sum({外部其他佣金})][{初始化日期}=@初始化日期# and {入账状态} = 《入账状态-已入账》 group by {机构编号}, {产品编号}, {交易单元}, {资产账户编号}, {市场编号}, {股东代码编号}, {证券代码编号}, {订单方向}, {业务标志}][6][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clcrdtcl_clear_total (
        init_date,busi_flag,co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_acco_no,stock_code_no,clear_num,order_dir,strike_num,strike_aver_price,strike_qty,strike_amt,entry_qty,entry_amt,all_fee,stamp_tax,trans_fee,brkage_fee,SEC_charges,other_fee,trade_commis,chann_commis,divi_commis,other_commis,out_all_fee,out_stamp_tax,out_trans_fee,out_brkage,out_SEC_charges,out_other_fee,out_brkage_commis,out_chann_commis,out_divi_commis,out_other_commis) 
        select 
        v_init_date, busi_flag, co_no, pd_no, exch_group_no,asset_acco_no,  exch_no, stock_acco_no, stock_code_no, count(*), order_dir, sum(strike_num), sum(strike_amt)/sum(strike_qty), sum(strike_qty), sum(strike_amt), sum(pre_entry_qty), sum(pre_entry_amt), sum(all_fee), sum(stamp_tax), sum(trans_fee), sum(brkage_fee), sum(SEC_charges), sum(other_fee), sum(trade_commis), sum(chann_commis), sum(divi_commis), sum(other_commis), sum(out_all_fee), sum(out_stamp_tax), sum(out_trans_fee), sum(out_brkage), sum(out_SEC_charges), sum(out_other_fee), sum(out_brkage_commis), sum(out_chann_commis), sum(out_divi_commis), sum(out_other_commis) 
        from db_clsecu.tb_clcrdtcl_pre_entry 
        where init_date=v_init_date and entry_status = "1" group by co_no, pd_no, part_code, asset_acco_no, exch_no, stock_acco_no, stock_code_no, order_dir, busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.201.6";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询统计数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryTotalData;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryTotalData(
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
    IN p_exch_no_str varchar(2048),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
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
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算证券_融资融券清算_统计表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        busi_flag, clear_num, order_dir, strike_num, 
        strike_aver_price, strike_qty, strike_amt, entry_qty, 
        entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        chann_commis, divi_commis, other_commis from db_clsecu.tb_clcrdtcl_clear_total where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        busi_flag, clear_num, order_dir, strike_num, 
        strike_aver_price, strike_qty, strike_amt, entry_qty, 
        entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        chann_commis, divi_commis, other_commis from db_clsecu.tb_clcrdtcl_clear_total where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_获取清算处理统计值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_GetClrTotalData;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_GetClrTotalData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pre_clr_strike_qty decimal(18,2),
    OUT p_alr_clr_strike_qty decimal(18,2),
    OUT p_pre_entry_record_qty decimal(18,2),
    OUT p_alr_entry_record_qty decimal(18,2)
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
    declare v_pre_clr_strike_qty decimal(18,2);
    declare v_alr_clr_strike_qty decimal(18,2);
    declare v_pre_entry_record_qty decimal(18,2);
    declare v_alr_entry_record_qty decimal(18,2);

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
    SET v_pre_clr_strike_qty = 0;
    SET v_alr_clr_strike_qty = 0;
    SET v_pre_entry_record_qty = 0;
    SET v_alr_entry_record_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录数量][清算证券_融资融券清算_成交表][@待清算成交数#][{成交日期} = @初始化日期#  and {处理标志}=《处理标志-未处理》 ] */
    select count(1) into v_pre_clr_strike_qty from db_clsecu.tb_clcrdtcl_strike where strike_date = v_init_date  and deal_flag=2 ;


    /* [获取表记录数量][清算证券_融资融券清算_成交表][@已清算成交数#][{成交日期} = @初始化日期#  and {处理标志}=《处理标志-已处理》] */
    select count(1) into v_alr_clr_strike_qty from db_clsecu.tb_clcrdtcl_strike where strike_date = v_init_date  and deal_flag=1;


    /* [获取表记录数量][清算证券_融资融券清算_待入账记录表][@待入账记录数#][{入账状态} <>《入账状态-已入账》] */
    select count(1) into v_pre_entry_record_qty from db_clsecu.tb_clcrdtcl_pre_entry where entry_status <>"1";


    /* [获取表记录数量][清算证券_融资融券清算_待入账记录表][@已入账记录数#][{入账状态} =《入账状态-已入账》] */
    select count(1) into v_alr_entry_record_qty from db_clsecu.tb_clcrdtcl_pre_entry where entry_status ="1";

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pre_clr_strike_qty = v_pre_clr_strike_qty;
    SET p_alr_clr_strike_qty = v_alr_clr_strike_qty;
    SET p_pre_entry_record_qty = v_pre_entry_record_qty;
    SET p_alr_entry_record_qty = v_alr_entry_record_qty;

END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询清算成交记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryClearStrikeId;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryClearStrikeId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* [获取表记录][清算证券_融资融券清算_成交表][字段][{记录序号}>@查询序号# and {处理标志}=《处理标志-未处理》 order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, opor_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, exch_no, stock_acco_no, 
            stock_code_no, stock_code, stock_type, asset_type, 
            strike_date, strike_time, strike_no, report_date, 
            report_time, report_no, order_date, order_time, 
            order_no, order_dir, order_price, order_qty, 
            strike_price, strike_qty, strike_amt, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, arrive_date, net_price_flag, 
            intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
            clear_entry_type, busi_jour_no, deal_flag from db_clsecu.tb_clcrdtcl_strike where row_id>v_qry_no and deal_flag=2 order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, opor_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, exch_no, stock_acco_no, 
            stock_code_no, stock_code, stock_type, asset_type, 
            strike_date, strike_time, strike_no, report_date, 
            report_time, report_no, order_date, order_time, 
            order_no, order_dir, order_price, order_qty, 
            strike_price, strike_qty, strike_amt, stamp_tax, 
            trans_fee, brkage_fee, SEC_charges, other_fee, 
            trade_commis, other_commis, trade_tax, trade_cost_fee, 
            trade_system_use_fee, stock_settle_fee, arrive_date, net_price_flag, 
            intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
            clear_entry_type, busi_jour_no, deal_flag from db_clsecu.tb_clcrdtcl_strike where row_id>v_qry_no and deal_flag=2 order by row_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询合并清算记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryMergeClearId;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryMergeClearId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* [获取表记录][清算证券_融资融券清算_合并清算表][字段][{记录序号}>@查询序号# and {处理标志}=《处理标志-未处理》 order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, opor_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, exch_no, stock_acco_no, 
            stock_code, stock_code_no, stock_type, asset_type, 
            strike_date, strike_time, strike_no, report_date, 
            report_time, report_no, order_date, order_time, 
            order_no, order_dir, order_price, order_qty, 
            strike_num, strike_aver_price, pre_entry_qty, pre_entry_amt, 
            split_strike_qty, split_strike_amt, split_stamp_tax, split_trans_fee, 
            split_brkage, split_SEC_charges, split_other_fee, split_brkage_commis, 
            split_other_commis, split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, 
            split_stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
            busi_flag, deal_flag from db_clsecu.tb_clcrdtcl_merge_clear where row_id>v_qry_no and deal_flag=2 order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, opor_no, pd_no, exch_group_no, 
            asset_acco_no, pass_no, exch_no, stock_acco_no, 
            stock_code, stock_code_no, stock_type, asset_type, 
            strike_date, strike_time, strike_no, report_date, 
            report_time, report_no, order_date, order_time, 
            order_no, order_dir, order_price, order_qty, 
            strike_num, strike_aver_price, pre_entry_qty, pre_entry_amt, 
            split_strike_qty, split_strike_amt, split_stamp_tax, split_trans_fee, 
            split_brkage, split_SEC_charges, split_other_fee, split_brkage_commis, 
            split_other_commis, split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, 
            split_stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
            par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
            busi_flag, deal_flag from db_clsecu.tb_clcrdtcl_merge_clear where row_id>v_qry_no and deal_flag=2 order by row_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_查询待入账记录序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_QueryPreEntryId;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_QueryPreEntryId(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
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
    declare v_qry_no int;
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
    SET v_qry_no = p_qry_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* [获取表记录][清算证券_融资融券清算_待入账记录表][字段][{记录序号}>@查询序号# and {入账状态} <>《入账状态-已入账》 order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, opor_no, pd_no, pass_no, 
            exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, stock_code, stock_type, asset_type, 
            debt_type, strike_date, strike_time, strike_no, 
            report_date, report_time, report_no, order_date, 
            order_time, order_no, order_dir, order_price, 
            order_qty, strike_price, strike_qty, strike_amt, 
            strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
            debt_amt, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, busi_flag, entry_status, deal_flag, 
            clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
            entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
            arrive_date, intrst_days, bond_accr_intrst, bond_rate_type from db_clsecu.tb_clcrdtcl_pre_entry where row_id>v_qry_no and entry_status <>"1" order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, opor_no, pd_no, pass_no, 
            exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
            stock_code_no, stock_code, stock_type, asset_type, 
            debt_type, strike_date, strike_time, strike_no, 
            report_date, report_time, report_no, order_date, 
            order_time, order_no, order_dir, order_price, 
            order_qty, strike_price, strike_qty, strike_amt, 
            strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
            debt_amt, all_fee, stamp_tax, trans_fee, 
            brkage_fee, SEC_charges, other_fee, trade_commis, 
            other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
            stock_settle_fee, busi_flag, entry_status, deal_flag, 
            clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
            entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
            arrive_date, intrst_days, bond_accr_intrst, bond_rate_type from db_clsecu.tb_clcrdtcl_pre_entry where row_id>v_qry_no and entry_status <>"1" order by row_id limit v_row_count;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_融资融券清算_数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clcrdtcl_DataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_clcrdtcl_DataToHis(
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
    declare v_table_name varchar(64);

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
    SET v_table_name = " ";

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~清算证券_融资融券清算_成交表^"; */
    set v_table_name = "db_clsecu.tb_clcrdtcl_strike";

    /* [数据归历史][清算证券_融资融券清算_成交表][字段][1=1][1][@数据表名称#,@初始化日期#] */
    insert into db_clsecu_his.tb_clcrdtcl_strike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, arrive_date, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        clear_entry_type, busi_jour_no, deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_price, strike_qty, strike_amt, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, arrive_date, net_price_flag, 
        intrst_days, par_value, bond_accr_intrst, bond_rate_type, 
        clear_entry_type, busi_jour_no, deal_flag 
        from db_clsecu.tb_clcrdtcl_strike 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.301.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_融资融券清算_成交表][1=1][3][@数据表名称#,@初始化日期#] */
    delete from db_clsecu.tb_clcrdtcl_strike 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.301.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~清算证券_融资融券清算_待入账记录表^"; */
    set v_table_name = "db_clsecu.tb_clcrdtcl_pre_entry";

    /* [数据归历史][清算证券_融资融券清算_待入账记录表][字段][1=1 ][1][@数据表名称#,@初始化日期#] */
    insert into db_clsecu_his.tb_clcrdtcl_pre_entry_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, pass_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
        debt_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, deal_flag, 
        clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
        entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        arrive_date, intrst_days, bond_accr_intrst, bond_rate_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, pass_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_code, stock_type, asset_type, 
        debt_type, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_date, 
        order_time, order_no, order_dir, order_price, 
        order_qty, strike_price, strike_qty, strike_amt, 
        strike_num, pre_entry_qty, pre_entry_amt, debt_qty, 
        debt_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, busi_flag, entry_status, deal_flag, 
        clear_loan_sell_flag, undo_status, busi_jour_no, entry_money_jour_no, 
        entry_exgp_debt_jour_no, entry_asac_debt_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, 
        arrive_date, intrst_days, bond_accr_intrst, bond_rate_type 
        from db_clsecu.tb_clcrdtcl_pre_entry 
        where 1=1 ;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.301.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_融资融券清算_待入账记录表][1=1 ][3][@数据表名称#,@初始化日期#] */
    delete from db_clsecu.tb_clcrdtcl_pre_entry 
        where 1=1 ;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.301.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~清算证券_融资融券清算_入账异常表^"; */
    set v_table_name = "db_clsecu.tb_clcrdtcl_entry_error";

    /* [数据归历史][清算证券_融资融券清算_入账异常表][字段][1=1][1][@数据表名称#,@初始化日期#] */
    insert into db_clsecu_his.tb_clcrdtcl_entry_error_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        undo_error_no, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_type, 
        undo_error_no, remark_info 
        from db_clsecu.tb_clcrdtcl_entry_error 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.301.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_融资融券清算_入账异常表][1=1][3][@数据表名称#,@初始化日期#] */
    delete from db_clsecu.tb_clcrdtcl_entry_error 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.301.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~清算证券_融资融券清算_合并清算表^"; */
    set v_table_name = "db_clsecu.tb_clcrdtcl_merge_clear";

    /* [数据归历史][清算证券_融资融券清算_合并清算表][字段][1=1][1][@数据表名称#,@初始化日期#] */
    insert into db_clsecu_his.tb_clcrdtcl_merge_clear_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code, stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_num, strike_aver_price, pre_entry_qty, pre_entry_amt, 
        split_strike_qty, split_strike_amt, split_stamp_tax, split_trans_fee, 
        split_brkage, split_SEC_charges, split_other_fee, split_brkage_commis, 
        split_other_commis, split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, 
        split_stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
        busi_flag, deal_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, opor_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, exch_no, stock_acco_no, 
        stock_code, stock_code_no, stock_type, asset_type, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        strike_num, strike_aver_price, pre_entry_qty, pre_entry_amt, 
        split_strike_qty, split_strike_amt, split_stamp_tax, split_trans_fee, 
        split_brkage, split_SEC_charges, split_other_fee, split_brkage_commis, 
        split_other_commis, split_trade_tax, split_trade_cost_fee, split_trade_system_use_fee, 
        split_stock_settle_fee, arrive_date, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, clear_entry_type, 
        busi_flag, deal_flag 
        from db_clsecu.tb_clcrdtcl_merge_clear 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.301.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_融资融券清算_合并清算表][1=1][3][@数据表名称#,@初始化日期#] */
    delete from db_clsecu.tb_clcrdtcl_merge_clear 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.301.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~清算证券_融资融券清算_统计表^"; */
    set v_table_name = "db_clsecu.tb_clcrdtcl_clear_total";

    /* [数据归历史][清算证券_融资融券清算_统计表][字段][1=1][1][@数据表名称#,@初始化日期#] */
    insert into db_clsecu_his.tb_clcrdtcl_clear_total_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        busi_flag, clear_num, order_dir, strike_num, 
        strike_aver_price, strike_qty, strike_amt, entry_qty, 
        entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        chann_commis, divi_commis, other_commis) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        busi_flag, clear_num, order_dir, strike_num, 
        strike_aver_price, strike_qty, strike_amt, entry_qty, 
        entry_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        chann_commis, divi_commis, other_commis 
        from db_clsecu.tb_clcrdtcl_clear_total 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.21.301.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_融资融券清算_统计表][1=1][3][@数据表名称#,@初始化日期#] */
    delete from db_clsecu.tb_clcrdtcl_clear_total 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.301.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][清算证券_融资融券清算_成交控制表][1=1][3][@数据表名称#] */
    delete from db_clsecu.tb_clcrdtcl_strike_ctrl 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "clsecuA.21.301.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


