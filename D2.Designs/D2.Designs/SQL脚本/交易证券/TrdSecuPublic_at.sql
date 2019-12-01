DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_获取业务记录编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetCoBusiRecordNo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetCoBusiRecordNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_record_no_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_no bigint
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
    declare v_record_no_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_tmp_curr_no bigint;

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
    SET v_record_no_type = p_record_no_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_tmp_curr_no = 0;

    
    label_pro:BEGIN
    
    #当前编号，从0开始

    /* set @当前编号#=1; */
    set v_curr_no=1;
    #按机构区分，以避免多机构锁同一条记录。编号最多6位。

    /* [插入重复更新][交易证券_公用_业务记录编号表][字段][字段变量][{当前编号}={当前编号} + 1][1][@机构编号#, @编号类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_co_busi_record_no (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, record_no_type, 
        curr_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_record_no_type, 
        v_curr_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no=curr_no + 1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.901.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][交易证券_公用_业务记录编号表][{当前编号}][@当前编号#][{机构编号}=@机构编号# and {编号类型}=@编号类型#] */
    select curr_no into v_curr_no from db_tdsecu.tb_tdsepb_co_busi_record_no where co_no=v_co_no and record_no_type=v_record_no_type limit 1;

    #如果到了100000，重置为1

    /* if @当前编号# > 99999 then */
    if v_curr_no > 99999 then

        /* set @临时_当前编号# = @当前编号#; */
        set v_tmp_curr_no = v_curr_no;

        /* set @当前编号# = 1; */
        set v_curr_no = 1;

        /* [插入重复更新][交易证券_公用_业务记录编号表][字段][字段变量][{当前编号}= 1][1][@机构编号#, @编号类型#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdsepb_co_busi_record_no (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, record_no_type, 
            curr_no) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_record_no_type, 
            v_curr_no) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_no= 1;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.1.901.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,","," 编号类型=", v_record_no_type);
            end if;
            leave label_pro;
        end if;


        /* set @当前编号# = @临时_当前编号#; */
        set v_curr_no = v_tmp_curr_no;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_no = v_curr_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算市价价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetMarketPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetMarketPrice(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_dir int,
    IN p_price_type int,
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_last_price decimal(16,9),
    IN p_asac_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_price decimal(16,9)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_dir int;
    declare v_price_type int;
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_last_price decimal(16,9);
    declare v_asac_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_price decimal(16,9);
    declare v_market_price_ratio decimal(18,12);

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
    SET v_order_dir = p_order_dir;
    SET v_price_type = p_price_type;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_last_price = p_last_price;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_price = 0;
    SET v_market_price_ratio = 0;

    
    label_pro:BEGIN
    
    #市价价格获取

    /* if @价格类型# <> 《价格类型-限价》 then */
    if v_price_type <> 1 then

        /* if substring(@资产账户业务控制配置串#,6,1) = 《市价冻结方式-涨跌停价》 then */
        if substring(v_asac_busi_config_str,6,1) = 1 then

            /* if @订单方向# = 《订单方向-买入》 then */
            if v_order_dir = 1 then

                /* set @订单价格# = @涨停价#; */
                set v_order_price = v_up_limit_price;
            else

                /* set @订单价格# = @跌停价#; */
                set v_order_price = v_down_limit_price;
            end if;

        /* elseif substring(@资产账户业务控制配置串#,6,1) = 《市价冻结方式-浮动比例》 then */
        elseif substring(v_asac_busi_config_str,6,1) = 3 then

            /* if @订单方向# = 《订单方向-买入》 then */
            if v_order_dir = 1 then

                /* set @订单价格# = @最新价# * (1+@市价冻结浮动比例#); */
                set v_order_price = v_last_price * (1+v_market_price_ratio);
            else

                /* set @订单价格# = @最新价# * (1-@市价冻结浮动比例#); */
                set v_order_price = v_last_price * (1-v_market_price_ratio);
            end if;
        else

            /* set @订单价格# = @最新价#; */
            set v_order_price = v_last_price;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_price = v_order_price;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算指令冻结金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetCommFrozenAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetCommFrozenAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_calc_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_calc_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_calc_dir = p_calc_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令冻结数量#=0; */
    set v_comm_frozen_qty=0;

    /* if @指令方向#=《指令方向-买入》 or @指令方向#=《指令方向-基金申购》 then */
    if v_comm_dir=1 or v_comm_dir=9 then

        /* set @指令冻结金额#=@指令实际限价# * @指令数量#; */
        set v_comm_frozen_amt=v_limit_actual_price * v_comm_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @指令冻结金额#=@指令冻结金额# + @债券计提利息# * @指令数量#; */
            set v_comm_frozen_amt=v_comm_frozen_amt + v_bond_accr_intrst * v_comm_qty;
        end if;

    /* elseif @指令方向#=《指令方向-卖出》 or @指令方向#=《指令方向-基金赎回》 or @指令方向# = 《指令方向-基金转换》  or  @指令方向#=《指令方向-零股卖出》   then */
    elseif v_comm_dir=2 or v_comm_dir=10 or v_comm_dir = 12  or  v_comm_dir=31   then

        /* set @指令冻结数量#=@指令数量#; */
        set v_comm_frozen_qty=v_comm_qty;

    /* elseif @指令方向#=《指令方向-融券回购》 then */
    elseif v_comm_dir=4 then

        /* set @指令冻结金额#=@指令数量# * @票面面值#; */
        set v_comm_frozen_amt=v_comm_qty * v_par_value;
    end if;

    /* set @指令冻结金额#=Round(@计算方向# * @指令冻结金额#,2); */
    set v_comm_frozen_amt=Round(v_calc_dir * v_comm_frozen_amt,2);

    /* set @指令冻结数量#=@计算方向# * @指令冻结数量#; */
    set v_comm_frozen_qty=v_calc_dir * v_comm_frozen_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算交易冻结金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetExchFrozenAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetExchFrozenAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_all_fee decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_frozen_amt decimal(18,4),
    OUT p_trade_frozen_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_all_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_all_fee = p_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;

    
    label_pro:BEGIN
    
    #交易冻结金额获取

    /* if @订单方向#=《订单方向-买入》 or @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-基金申购》  then */
    if v_order_dir=1 or v_order_dir = 5 or v_order_dir = 9  then

        /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @交易冻结金额#=@订单数量# * (@订单价格# + @债券计提利息#) + @全部费用#; */
            set v_trade_frozen_amt=v_order_qty * (v_order_price + v_bond_accr_intrst) + v_all_fee;
        else

            /* set @交易冻结金额#=@订单数量# * @订单价格# + @全部费用#; */
            set v_trade_frozen_amt=v_order_qty * v_order_price + v_all_fee;
        end if;

        /* set @交易冻结数量#=0; */
        set v_trade_frozen_qty=0;

    /* elseif @订单方向#=《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》  or @订单方向# = 《订单方向-基金赎回》 or  @订单方向# = 《订单方向-基金转换》  then */
    elseif v_order_dir=2 or v_order_dir = 31  or v_order_dir = 10 or  v_order_dir = 12  then

        /* set @交易冻结金额#=0; */
        set v_trade_frozen_amt=0;

        /* set @交易冻结数量#=@订单数量#; */
        set v_trade_frozen_qty=v_order_qty;

    /* elseif @订单方向#=《订单方向-融券回购》 then */
    elseif v_order_dir=4 then

        /* set @交易冻结金额#=@订单数量# * @票面面值# + @全部费用#; */
        set v_trade_frozen_amt=v_order_qty * v_par_value + v_all_fee;

        /* set @交易冻结数量#=0; */
        set v_trade_frozen_qty=0;
    else

        /* set @交易冻结金额#=0; */
        set v_trade_frozen_amt=0;

        /* set @交易冻结数量#=0; */
        set v_trade_frozen_qty=0;
    end if;

    /* set @交易冻结金额#=Round(@交易冻结金额#,2); */
    set v_trade_frozen_amt=Round(v_trade_frozen_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_frozen_amt = v_trade_frozen_amt;
    SET p_trade_frozen_qty = v_trade_frozen_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算撤单交易变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetCancelExchChangeAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetCancelExchChangeAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_total_strike_qty decimal(18,2),
    IN p_all_wtdraw_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_calc_dir int;

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_total_strike_qty = p_total_strike_qty;
    SET v_all_wtdraw_qty = p_all_wtdraw_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_calc_dir = 1;

    
    label_pro:BEGIN
    
    #交易变动金额获取

    /* set @交易变动金额# = 0; */
    set v_trade_occur_amt = 0;

    /* set @交易变动数量# = 0; */
    set v_trade_occur_qty = 0;

    /* set @交易变动金额# = @订单冻结金额#; */
    set v_trade_occur_amt = v_order_frozen_amt;

    /* set @计算方向# = 《计算方向-减去》; */
    set v_calc_dir = -1;

    /* set @交易变动数量# = @计算方向# * @撤单数量#; */
    set v_trade_occur_qty = v_calc_dir * v_wtdraw_qty;

    /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》 or @订单方向# = 《订单方向-基金申购》 then */
    if v_order_dir = 1 or v_order_dir = 4 or v_order_dir = 9 then

        /* if @订单数量# > @总撤单数量#  + @总成交数量# then */
        if v_order_qty > v_all_wtdraw_qty  + v_total_strike_qty then

            /* set @交易变动金额# = round(@订单冻结金额# * @撤单数量#/ (@订单数量# - @总成交数量# - (@总撤单数量# - @撤单数量#)), 2); */
            set v_trade_occur_amt = round(v_order_frozen_amt * v_wtdraw_qty/ (v_order_qty - v_total_strike_qty - (v_all_wtdraw_qty - v_wtdraw_qty)), 2);
        else

            /* set @交易变动金额# = @订单冻结金额#; */
            set v_trade_occur_amt = v_order_frozen_amt;
        end if;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》 or  @订单方向# = 《订单方向-基金赎回》 then */
    elseif v_order_dir = 2 or v_order_dir = 31 or  v_order_dir = 10 then

        /* set @交易变动金额# = @订单价格# * @撤单数量#; */
        set v_trade_occur_amt = v_order_price * v_wtdraw_qty;

        /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3 then

            /* set @交易变动金额# = (@订单价格# + @债券计提利息#) * @撤单数量#; */
            set v_trade_occur_amt = (v_order_price + v_bond_accr_intrst) * v_wtdraw_qty;
        end if;

    /* elseif @订单方向# = 《订单方向-融资回购》 then */
    elseif v_order_dir = 3 then

        /* set @交易变动金额# = @票面面值# * @撤单数量#; */
        set v_trade_occur_amt = v_par_value * v_wtdraw_qty;
    else

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;
    end if;

    /* set @交易变动金额# = @计算方向# * Round(@交易变动金额#,2); */
    set v_trade_occur_amt = v_calc_dir * Round(v_trade_occur_amt,2);

    /* set @交易变动数量# = @计算方向# * @撤单数量#; */
    set v_trade_occur_qty = v_calc_dir * v_wtdraw_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算成交交易变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetStrikeExchChangeAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetStrikeExchChangeAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_total_strike_qty decimal(18,2),
    IN p_all_wtdraw_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_deal_capital_release_type int,
    IN p_strike_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_deal_capital_release_type int;
    declare v_strike_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_calc_dir int;

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_total_strike_qty = p_total_strike_qty;
    SET v_all_wtdraw_qty = p_all_wtdraw_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_deal_capital_release_type = p_deal_capital_release_type;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_calc_dir = 1;

    
    label_pro:BEGIN
    
    #交易变动金额获取

    /* set @交易变动金额# = @订单冻结金额#; */
    set v_trade_occur_amt = v_order_frozen_amt;

    /* set @计算方向# = 《计算方向-减去》; */
    set v_calc_dir = -1;

    /* set @交易变动数量# = @成交数量# * @计算方向#; */
    set v_trade_occur_qty = v_strike_qty * v_calc_dir;

    /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》  or @订单方向# = 《订单方向-融资买入》  or @订单方向# = 《订单方向-基金申购》 then */
    if v_order_dir = 1 or v_order_dir = 4  or v_order_dir = 5  or v_order_dir = 9 then

        /* if @订单数量# > @总撤单数量#  + @总成交数量# then */
        if v_order_qty > v_all_wtdraw_qty  + v_total_strike_qty then

            /* if @部成资金占用释放方式# = 《部成资金占用释放方式-按比例》 then */
            if v_deal_capital_release_type = 1 then

                /* set @交易变动金额# = Round(@订单冻结金额# * @成交数量# / (@订单数量# - (@总成交数量# - @成交数量#) - @总撤单数量#), 2); */
                set v_trade_occur_amt = Round(v_order_frozen_amt * v_strike_qty / (v_order_qty - (v_total_strike_qty - v_strike_qty) - v_all_wtdraw_qty), 2);

            /* elseif  @部成资金占用释放方式# = 《部成资金占用释放方式-按成交金额》 then */
            elseif  v_deal_capital_release_type = 2 then

                /* set @交易变动金额# = Round(@成交金额# , 2); */
                set v_trade_occur_amt = Round(v_strike_amt , 2);
            end if;
        else

            /* set @交易变动金额# = @订单冻结金额#; */
            set v_trade_occur_amt = v_order_frozen_amt;
        end if;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》  or @订单方向# = 《订单方向-基金赎回》 then */
    elseif v_order_dir = 2 or v_order_dir = 31  or v_order_dir = 10 then

        /* set @交易变动金额# = @订单价格# * @成交数量#; */
        set v_trade_occur_amt = v_order_price * v_strike_qty;

        /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3 then

            /* set @交易变动金额# = (@订单价格# + @债券计提利息#) * @成交数量#; */
            set v_trade_occur_amt = (v_order_price + v_bond_accr_intrst) * v_strike_qty;
        end if;

    /* elseif @订单方向# = 《订单方向-融资回购》 then */
    elseif v_order_dir = 3 then

        /* set @交易变动金额# = @票面面值# * @成交数量#; */
        set v_trade_occur_amt = v_par_value * v_strike_qty;
    else

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;
    end if;

    /* set @交易变动金额# = @交易变动金额# * @计算方向#; */
    set v_trade_occur_amt = v_trade_occur_amt * v_calc_dir;

    /* set @交易变动金额# = Round(@交易变动金额#,2); */
    set v_trade_occur_amt = Round(v_trade_occur_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算成交变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetStrikeOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetStrikeOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_all_fee decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_occur_amt decimal(18,4),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_strike_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_all_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_all_fee = p_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_occur_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strike_occur_qty = 0;

    
    label_pro:BEGIN
    
    #成交债券计提利息获取

    /* set @成交债券计提利息# = 0; */
    set v_strike_bond_accr_intrst = 0;

    /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
    if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3 then

        /* set @成交债券计提利息# = @债券计提利息# * @成交数量#; */
        set v_strike_bond_accr_intrst = v_bond_accr_intrst * v_strike_qty;
    end if;

    /* set @成交债券计提利息# = round(@成交债券计提利息#,2); */
    set v_strike_bond_accr_intrst = round(v_strike_bond_accr_intrst,2);
    #成交变动金额获取

    /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》  or @订单方向# = 《订单方向-基金申购》 then */
    if v_order_dir = 1  or v_order_dir = 5  or v_order_dir = 9 then

        /* if (@成交金额# = 0) or (@证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_strike_amt = 0) or (v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3) then

            /* set @成交变动金额# = @成交价格# * @成交数量# + @全部费用# + @债券计提利息# * @成交数量#; */
            set v_strike_occur_amt = v_strike_price * v_strike_qty + v_all_fee + v_bond_accr_intrst * v_strike_qty;
        else

            /* set @成交变动金额# = @成交金额# + @全部费用#; */
            set v_strike_occur_amt = v_strike_amt + v_all_fee;
        end if;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》  or @订单方向# = 《订单方向-基金赎回》 then */
    elseif v_order_dir = 2 or v_order_dir = 31  or v_order_dir = 10 then

        /* if (@成交金额# = 0) or (@证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_strike_amt = 0) or (v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3) then

            /* set @成交变动金额# = @成交价格# * @成交数量# - @全部费用# + @债券计提利息# * @成交数量#; */
            set v_strike_occur_amt = v_strike_price * v_strike_qty - v_all_fee + v_bond_accr_intrst * v_strike_qty;
        else

            /* set @成交变动金额# = @成交金额# - @全部费用#; */
            set v_strike_occur_amt = v_strike_amt - v_all_fee;
        end if;

    /* elseif @订单方向# = 《订单方向-融资回购》 then */
    elseif v_order_dir = 3 then

        /* if @成交金额# > 0 then */
        if v_strike_amt > 0 then

            /* set @成交变动金额# = @成交金额# - @全部费用#; */
            set v_strike_occur_amt = v_strike_amt - v_all_fee;
        else

            /* set @成交变动金额# = @票面面值# * @成交数量# - @全部费用#; */
            set v_strike_occur_amt = v_par_value * v_strike_qty - v_all_fee;
        end if;

    /* elseif @订单方向# = 《订单方向-融券回购》 then */
    elseif v_order_dir = 4 then

        /* if @成交金额# > 0 then */
        if v_strike_amt > 0 then

            /* set @成交变动金额# = @成交金额# + @全部费用#; */
            set v_strike_occur_amt = v_strike_amt + v_all_fee;
        else

            /* set @成交变动金额# = @票面面值# * @成交数量# + @全部费用#; */
            set v_strike_occur_amt = v_par_value * v_strike_qty + v_all_fee;
        end if;
    else

        /* set @成交变动金额# = 0; */
        set v_strike_occur_amt = 0;
    end if;

    /* set @成交变动金额# = Round(@成交变动金额#,2); */
    set v_strike_occur_amt = Round(v_strike_occur_amt,2);

    /* set @成交变动数量# = @成交数量#; */
    set v_strike_occur_qty = v_strike_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_occur_amt = v_strike_occur_amt;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_strike_occur_qty = v_strike_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算指令状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CaclCommStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CaclCommStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_status varchar(2),
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;

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
    SET v_comm_qty = p_comm_qty;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;

    #判断指令完成日期和指令完成时间

    /* if @指令数量# - @指令撤销数量# - @成交数量# <> 0 then */
    if v_comm_qty - v_comm_cancel_qty - v_strike_qty <> 0 then

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;
    end if;
    #订单状态与指令状态都遵守固定的规律，中途有任何跳跃时均以后者为准
    #指令状态顺序：未执行-部分执行-全部执行-待撤销-部分撤销-全部撤销
    #以下判断顺序中，按顺序判断状态

    /* set @指令状态#=《指令状态-未执行》; */
    set v_comm_status="1";

    /* if @订单数量#=0 then */
    if v_order_qty=0 then

        /* set @指令状态#=《指令状态-未执行》; */
        set v_comm_status="1";

    /* elseif @指令数量#>@指令撤销数量# + @订单数量# then */
    elseif v_comm_qty>v_comm_cancel_qty + v_order_qty then

        /* set @指令状态#=《指令状态-部分执行》; */
        set v_comm_status="2";
    end if;

    /* if @指令数量#=@订单数量# then */
    if v_comm_qty=v_order_qty then

        /* set @指令状态#=《指令状态-全部执行》; */
        set v_comm_status="3";
    end if;

    /* if @指令数量#>@指令撤销数量# and @指令撤销数量#>0 then */
    if v_comm_qty>v_comm_cancel_qty and v_comm_cancel_qty>0 then

        /* set @指令状态#=《指令状态-部分撤销》; */
        set v_comm_status="5";
    end if;

    /* if @指令数量#=@指令撤销数量# then */
    if v_comm_qty=v_comm_cancel_qty then

        /* set @指令状态#=《指令状态-全部撤销》; */
        set v_comm_status="6";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_status = v_comm_status;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算指令成交状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CaclCommStrikeStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CaclCommStrikeStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_status varchar(2),
    OUT p_comm_comple_date int,
    OUT p_comm_comple_time int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;

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
    SET v_comm_qty = p_comm_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;

    #判断指令完成日期和指令完成时间

    /* if @指令数量# - @指令撤销数量# - @成交数量# <> 0 then */
    if v_comm_qty - v_comm_cancel_qty - v_strike_qty <> 0 then

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;
    end if;
    #成交状态处理

    /* set @成交状态#=《成交状态-未成》; */
    set v_strike_status="1";

    /* if @指令数量#>@成交数量# and @成交数量# > 0 then */
    if v_comm_qty>v_strike_qty and v_strike_qty > 0 then

        /* set @成交状态#=《成交状态-部成》; */
        set v_strike_status="2";

    /* elseif @指令数量#=@成交数量#  and @成交数量# > 0 then */
    elseif v_comm_qty=v_strike_qty  and v_strike_qty > 0 then

        /* set @成交状态#=《成交状态-已成》; */
        set v_strike_status="3";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_status = v_strike_status;
    SET p_comm_comple_date = v_comm_comple_date;
    SET p_comm_comple_time = v_comm_comple_time;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算订单状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CaclOrderStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CaclOrderStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_old_order_status varchar(2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_old_order_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_status varchar(2);

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
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_old_order_status = p_old_order_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_status = "0";

    
    label_pro:BEGIN
    
    #订单状态与指令状态都遵守固定的规律，中途有任何跳跃时均以后者为准
    #订单状态顺序：未报-已报-部成-已成-待撤-部撤-已撤-废单
    #以下判断顺序中，按顺序判断状态

    /* set @订单状态#=@原订单状态#; */
    set v_order_status=v_old_order_status;
    #对于已撤、已成、废单的状态，不允许再更改

    /* if (@订单状态# <> 《订单状态-已撤》 and @订单状态# <> 《订单状态-已成》 and @订单状态# <> 《订单状态-废单》) then */
    if (v_order_status <> "4" and v_order_status <> "6" and v_order_status <> "8") then
        #根据成交数量判断是否是成交类的订单状态

        /* if @成交数量#=0 then */
        if v_strike_qty=0 then

            /* set @订单状态#=《订单状态-已报》; */
            set v_order_status="2";
        else

            /* if @订单数量#>@成交数量# then */
            if v_order_qty>v_strike_qty then

                /* set @订单状态#=《订单状态-部成》; */
                set v_order_status="5";

            /* elseif @订单数量#=@成交数量# then */
            elseif v_order_qty=v_strike_qty then

                /* set @订单状态#=《订单状态-已成》; */
                set v_order_status="6";
            end if;
        end if;
        #根据撤单数量判断是否是撤单类的订单状态，撤单后于成交，即成交类的状态可以变更为撤单类的状态，反过来则不行！

        /* if @撤单数量#>0 then */
        if v_wtdraw_qty>0 then

            /* if @订单数量#>@撤单数量# then */
            if v_order_qty>v_wtdraw_qty then

                /* set @订单状态#=《订单状态-部撤》; */
                set v_order_status="7";

            /* elseif @订单数量#=@撤单数量# then */
            elseif v_order_qty=v_wtdraw_qty then

                /* set @订单状态#=《订单状态-已撤》; */
                set v_order_status="4";
            end if;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_status = v_order_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算下单交易变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetOrderTradeOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetOrderTradeOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;

    
    label_pro:BEGIN
    
    #交易变动金额获取

    /* set @交易变动金额# = 0; */
    set v_trade_occur_amt = 0;

    /* set @交易变动数量# = 0; */
    set v_trade_occur_qty = 0;

    /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-融券回购》  or @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-基金申购》  then */
    if v_order_dir = 1 or v_order_dir = 4  or v_order_dir = 5 or v_order_dir = 9  then

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-零股卖出》 or  @订单方向# = 《订单方向-基金赎回》 then */
    elseif v_order_dir = 2 or v_order_dir = 31 or  v_order_dir = 10 then

        /* set @交易变动金额# = @订单价格# * @订单数量#; */
        set v_trade_occur_amt = v_order_price * v_order_qty;

        /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》  then */
        if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3  then

            /* set @交易变动金额# = (@订单价格# + @债券计提利息#) * @订单数量#; */
            set v_trade_occur_amt = (v_order_price + v_bond_accr_intrst) * v_order_qty;
        end if;

    /* elseif @订单方向# = 《订单方向-融资回购》 then */
    elseif v_order_dir = 3 then

        /* set @交易变动金额# = @票面面值# * @订单数量#; */
        set v_trade_occur_amt = v_par_value * v_order_qty;
    end if;

    /* set @交易变动金额# = Round(@交易变动金额#,2); */
    set v_trade_occur_amt = Round(v_trade_occur_amt,2);

    /* set @交易变动数量# = @订单数量#; */
    set v_trade_occur_qty = v_order_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算指令变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetCommOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetCommOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_calc_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_calc_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_calc_dir = p_calc_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* if @指令方向#=《指令方向-买入》 or @指令方向#=《指令方向-卖出》 or @指令方向# = 《指令方向-基金申购》 or  @指令方向# = 《指令方向-基金赎回》  or   @指令方向#=《指令方向-零股卖出》  then */
    if v_comm_dir=1 or v_comm_dir=2 or v_comm_dir = 9 or  v_comm_dir = 10  or   v_comm_dir=31  then

        /* set @指令变动金额#=@指令实际限价# * @指令数量#; */
        set v_comm_occur_amt=v_limit_actual_price * v_comm_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @指令变动金额#=@指令变动金额# + @债券计提利息# * @指令数量#; */
            set v_comm_occur_amt=v_comm_occur_amt + v_bond_accr_intrst * v_comm_qty;
        end if;

    /* elseif @指令方向#=《指令方向-融资回购》 or @指令方向#=《指令方向-融券回购》 then */
    elseif v_comm_dir=3 or v_comm_dir=4 then

        /* set @指令变动金额#=@指令数量# * @票面面值#; */
        set v_comm_occur_amt=v_comm_qty * v_par_value;
    end if;

    /* set @指令变动金额#=Round(@计算方向# * @指令变动金额#,2); */
    set v_comm_occur_amt=Round(v_calc_dir * v_comm_occur_amt,2);

    /* set @指令变动数量#=@计算方向# * @指令数量#; */
    set v_comm_occur_qty=v_calc_dir * v_comm_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算撤单指令变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetCancelCommOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetCancelCommOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_wtdraw_qty decimal(18,2),
    IN p_comm_status varchar(2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_calc_dir int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_calc_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_comm_status = p_comm_status;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_calc_dir = p_calc_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;
    #指令是待撤销、部分撤销、全部撤销 订单撤销时，不需要再将指令相关金额与数量回退到资金持仓表

    /* [检查正常返回][@指令状态# = 《指令状态-待撤销》 or @指令状态# = 《指令状态-部分撤销》 or @指令状态# = 《指令状态-全部撤销》 ] */
    if v_comm_status = "4" or v_comm_status = "5" or v_comm_status = "6"  then
        leave label_pro;
    end if;


    /* set @指令变动数量# = @撤单数量#; */
    set v_comm_occur_qty = v_wtdraw_qty;

    /* if @指令方向#=《指令方向-买入》 or @指令方向#=《指令方向-卖出》 or @指令方向#=《指令方向-基金申购》 or @指令方向#=《指令方向-基金赎回》 or   @指令方向#=《指令方向-零股卖出》  then */
    if v_comm_dir=1 or v_comm_dir=2 or v_comm_dir=9 or v_comm_dir=10 or   v_comm_dir=31  then

        /* set @指令变动金额#=@指令实际限价# * @指令变动数量#; */
        set v_comm_occur_amt=v_limit_actual_price * v_comm_occur_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @指令变动金额#=@指令变动金额# + @债券计提利息# * @指令变动数量#; */
            set v_comm_occur_amt=v_comm_occur_amt + v_bond_accr_intrst * v_comm_occur_qty;
        end if;

    /* elseif @指令方向#=《指令方向-融资回购》 or @指令方向#=《指令方向-融券回购》 then */
    elseif v_comm_dir=3 or v_comm_dir=4 then

        /* set @指令变动金额#=@指令变动数量# * @票面面值#; */
        set v_comm_occur_amt=v_comm_occur_qty * v_par_value;
    end if;

    /* set @指令变动金额#=Round(@计算方向# * @指令变动金额#,2); */
    set v_comm_occur_amt=Round(v_calc_dir * v_comm_occur_amt,2);

    /* set @指令变动数量#=@计算方向# * @指令变动数量#; */
    set v_comm_occur_qty=v_calc_dir * v_comm_occur_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算指令汇总状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CaclCommSumStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CaclCommSumStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_comm_cancel_qty decimal(18,2),
    IN p_comm_await_cancel_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_sum_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_comm_await_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_sum_status varchar(2);
    declare v_comm_comple_date int;
    declare v_comm_comple_time int;

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
    SET v_comm_qty = p_comm_qty;
    SET v_order_qty = p_order_qty;
    SET v_comm_cancel_qty = p_comm_cancel_qty;
    SET v_comm_await_cancel_qty = p_comm_await_cancel_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_sum_status = "0";
    SET v_comm_comple_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_comple_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取机器日期][@指令完成日期#] */
    select date_format(curdate(),'%Y%m%d') into v_comm_comple_date;


    /* [获取机器时间][@指令完成时间#] */
    select date_format(curtime(),'%H%i%s') into v_comm_comple_time;

    #判断指令完成日期和指令完成时间

    /* if @指令数量# - @指令撤销数量# - @成交数量# <> 0 then */
    if v_comm_qty - v_comm_cancel_qty - v_strike_qty <> 0 then

        /* set @指令完成日期#=0; */
        set v_comm_comple_date=0;

        /* set @指令完成时间#=0; */
        set v_comm_comple_time=0;
    end if;
    #订单状态与指令状态都遵守固定的规律，中途有任何跳跃时均以后者为准
    #指令状态顺序：未执行-部分执行-全部执行-待撤销-部分撤销-全部撤销
    #以下判断顺序中，按顺序判断状态

    /* set @指令汇总状态#=《指令汇总状态-未执行》; */
    set v_comm_sum_status="1";

    /* if @订单数量#=0 and @指令撤销数量# = 0 and @指令待撤销数量# = 0 then */
    if v_order_qty=0 and v_comm_cancel_qty = 0 and v_comm_await_cancel_qty = 0 then

        /* set @指令汇总状态#=《指令状态-未执行》; */
        set v_comm_sum_status="1";

    /* elseif @订单数量# > 0 and @指令数量# > @订单数量# and @指令撤销数量# = 0 and @指令待撤销数量# = 0  then */
    elseif v_order_qty > 0 and v_comm_qty > v_order_qty and v_comm_cancel_qty = 0 and v_comm_await_cancel_qty = 0  then

        /* set @指令汇总状态#=《指令汇总状态-部分执行》; */
        set v_comm_sum_status="2";

    /* elseif @指令数量#=@订单数量# and @指令撤销数量# = 0 and @指令待撤销数量# = 0 then */
    elseif v_comm_qty=v_order_qty and v_comm_cancel_qty = 0 and v_comm_await_cancel_qty = 0 then

        /* set @指令汇总状态#=《指令汇总状态-全部执行》; */
        set v_comm_sum_status="3";

    /* elseif @指令撤销数量# = 0 and @指令待撤销数量# > 0 then */
    elseif v_comm_cancel_qty = 0 and v_comm_await_cancel_qty > 0 then

        /* set @指令汇总状态#=《指令汇总状态-待撤销》; */
        set v_comm_sum_status="4";

    /* elseif @指令撤销数量# > 0 and @指令数量# > @指令撤销数量# then */
    elseif v_comm_cancel_qty > 0 and v_comm_qty > v_comm_cancel_qty then

        /* set @指令汇总状态#=《指令汇总状态-部分撤销》; */
        set v_comm_sum_status="5";

    /* elseif @指令数量# = @指令撤销数量# then */
    elseif v_comm_qty = v_comm_cancel_qty then

        /* set @指令汇总状态#=《指令汇总状态-全部撤销》; */
        set v_comm_sum_status="6";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_sum_status = v_comm_sum_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算订单汇总状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CaclOrderSumStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CaclOrderSumStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_order_qty decimal(18,2),
    IN p_wtdraw_qty decimal(18,2),
    IN p_strike_qty decimal(18,2),
    IN p_waste_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_sum_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_order_qty decimal(18,2);
    declare v_wtdraw_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_waste_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_sum_status varchar(2);

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
    SET v_order_qty = p_order_qty;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_strike_qty = p_strike_qty;
    SET v_waste_qty = p_waste_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_sum_status = "0";

    
    label_pro:BEGIN
    

    /* set @订单汇总状态# = 《订单汇总状态-未成》; */
    set v_order_sum_status = "1";

    /* if @订单数量# = @废单数量# then */
    if v_order_qty = v_waste_qty then

        /* set @订单汇总状态# = 《订单汇总状态-全废》; */
        set v_order_sum_status = "7";

    /* elseif @订单数量# > @废单数量# and @废单数量# > 0  then */
    elseif v_order_qty > v_waste_qty and v_waste_qty > 0  then

        /* set @订单汇总状态# = 《订单汇总状态-部废》; */
        set v_order_sum_status = "6";

    /* elseif @订单数量# = @撤单数量# then */
    elseif v_order_qty = v_wtdraw_qty then

        /* set @订单汇总状态# = 《订单汇总状态-全撤》; */
        set v_order_sum_status = "5";

    /* elseif @订单数量# > @撤单数量# and @撤单数量# > 0  then */
    elseif v_order_qty > v_wtdraw_qty and v_wtdraw_qty > 0  then

        /* set @订单汇总状态# = 《订单汇总状态-部撤》; */
        set v_order_sum_status = "4";

    /* elseif @订单数量# = @成交数量# then */
    elseif v_order_qty = v_strike_qty then

        /* set @订单汇总状态# = 《订单汇总状态-全成》; */
        set v_order_sum_status = "3";

    /* elseif @订单数量# > @成交数量# and @成交数量# > 0  then */
    elseif v_order_qty > v_strike_qty and v_strike_qty > 0  then

        /* set @订单汇总状态# = 《订单汇总状态-部成》; */
        set v_order_sum_status = "2";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_sum_status = v_order_sum_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算指令汇总审批状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CaclCommSumApprStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CaclCommSumApprStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_comm_qty decimal(18,2),
    IN p_comm_appr_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_sum_approve_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_comm_qty decimal(18,2);
    declare v_comm_appr_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_sum_approve_status varchar(2);

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
    SET v_comm_qty = p_comm_qty;
    SET v_comm_appr_qty = p_comm_appr_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_sum_approve_status = "0";

    
    label_pro:BEGIN
    

    /* set @指令汇总审批状态# = 《指令汇总审批状态-未审批》; */
    set v_comm_sum_approve_status = "1";

    /* if  @指令审批数量# > 0 and @指令数量# > @指令审批数量# then */
    if  v_comm_appr_qty > 0 and v_comm_qty > v_comm_appr_qty then

        /* set @指令汇总审批状态# = 《指令汇总审批状态-部分审批》; */
        set v_comm_sum_approve_status = "2";

    /* elseif  @指令审批数量# > 0 and @指令数量# = @指令审批数量# then */
    elseif  v_comm_appr_qty > 0 and v_comm_qty = v_comm_appr_qty then

        /* set @指令汇总审批状态# = 《指令汇总审批状态-全部审批》; */
        set v_comm_sum_approve_status = "3";
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_sum_approve_status = v_comm_sum_approve_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算指令金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetCommAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetCommAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_amt decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_amt decimal(18,4);

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
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_amt = 0;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令金额#=0; */
    set v_comm_amt=0;

    /* if @指令方向#=《指令方向-买入》 or @指令方向#=《指令方向-卖出》 or @指令方向# = 《指令方向-基金申购》 or @指令方向# = 《指令方向-基金赎回》   or   @指令方向#=《指令方向-零股卖出》    or   @指令方向#=《指令方向-融资买入》   or   @指令方向#=《指令方向-卖券还款》   or   @指令方向#=《指令方向-融券卖出》   or   @指令方向#=《指令方向-买券还券》 then */
    if v_comm_dir=1 or v_comm_dir=2 or v_comm_dir = 9 or v_comm_dir = 10   or   v_comm_dir=31    or   v_comm_dir=5   or   v_comm_dir=7   or   v_comm_dir=6   or   v_comm_dir=8 then

        /* set @指令金额#=@指令实际限价# * @指令数量#; */
        set v_comm_amt=v_limit_actual_price * v_comm_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @指令金额#=@指令金额# + @债券计提利息# * @指令数量#; */
            set v_comm_amt=v_comm_amt + v_bond_accr_intrst * v_comm_qty;
        end if;

    /* elseif @指令方向#=《指令方向-融资回购》 or @指令方向#=《指令方向-融券回购》 then */
    elseif v_comm_dir=3 or v_comm_dir=4 then

        /* set @指令金额#=@指令数量# * @票面面值#; */
        set v_comm_amt=v_comm_qty * v_par_value;
    end if;

    /* set @指令金额#=Round(@指令金额#,2); */
    set v_comm_amt=Round(v_comm_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_amt = v_comm_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_更新报盘机状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_UpdateOfferStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_UpdateOfferStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_offer_name varchar(32),
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
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_offer_name varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_name varchar(64);

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
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_offer_name = p_offer_name;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_name = " ";

    
    label_pro:BEGIN
    

    /* [插入重复更新][交易证券_公用_通道状态表][字段][字段变量][{通道状态}=@通道状态#][1][@通道名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_offerstatus (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, pass_no, 
        pass_status, offer_name) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_pass_no, 
        v_pass_status, v_offer_name) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pass_status=v_pass_status;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.1.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道名称=",v_pass_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道名称=",v_pass_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_获取通道状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetChannelStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetChannelStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pass_status varchar(2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pass_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pass_status varchar(2);

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
    SET v_pass_no = p_pass_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pass_status = "0";

    
    label_pro:BEGIN
    

    /* set @通道状态# = "0"; */
    set v_pass_status = "0";

    /* [获取表记录变量语句][交易证券_公用_通道状态表][{通道状态}][@通道状态#][{通道编号}=@通道编号#][4][@通道编号#] */
    select pass_status into v_pass_status from db_tdsecu.tb_tdsepb_offerstatus where pass_no=v_pass_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pass_status = v_pass_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_获取指令审批操作员序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetCommOperNo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetCommOperNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_comm_appr_oper int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_appr_oper_no int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_pd_no int;
    declare v_comm_appr_oper int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_appr_oper_no int;

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
    SET v_pd_no = p_pd_no;
    SET v_comm_appr_oper = p_comm_appr_oper;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_appr_oper_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_公用_指令审批操作员表][{指令审批操作员序号}][@指令审批操作员序号#][{产品编号}=@产品编号# and {指令审批操作员}=@指令审批操作员#][4][@产品编号#,@指令审批操作员#] */
    select comm_appr_oper_no into v_comm_appr_oper_no from db_tdsecu.tb_tdsepb_approper where pd_no=v_pd_no and comm_appr_oper=v_comm_appr_oper limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_appr_oper_no = v_comm_appr_oper_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_新增篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_AddBasket;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_AddBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_basket_name varchar(64),
    IN p_weight_type int,
    IN p_is_public int,
    IN p_compos_count int,
    IN p_basket_status varchar(2),
    IN p_cash_replace_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_basket_id bigint
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
    declare v_basket_name varchar(64);
    declare v_weight_type int;
    declare v_is_public int;
    declare v_compos_count int;
    declare v_basket_status varchar(2);
    declare v_cash_replace_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_basket_id bigint;
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
    SET v_basket_name = p_basket_name;
    SET v_weight_type = p_weight_type;
    SET v_is_public = p_is_public;
    SET v_compos_count = p_compos_count;
    SET v_basket_status = p_basket_status;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_basket_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][交易证券_公用_篮子属性表][字段][字段变量][1][@篮子名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_baskeinfo(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        basket_name, weight_type, is_public, compos_count, 
        basket_status, cash_replace_amt) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_basket_name, v_weight_type, v_is_public, v_compos_count, 
        v_basket_status, v_cash_replace_amt);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.11.1";
        SET v_error_info =  CONCAT(concat("篮子名称=",v_basket_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@篮子序号#] */
    select LAST_INSERT_ID() into v_basket_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_basket_id = v_basket_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_修改篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_ModiBasket;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_ModiBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
    IN p_basket_name varchar(64),
    IN p_weight_type int,
    IN p_is_public int,
    IN p_compos_count int,
    IN p_basket_status varchar(2),
    IN p_cash_replace_amt decimal(18,4),
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
    declare v_basket_id bigint;
    declare v_basket_name varchar(64);
    declare v_weight_type int;
    declare v_is_public int;
    declare v_compos_count int;
    declare v_basket_status varchar(2);
    declare v_cash_replace_amt decimal(18,4);
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
    SET v_basket_id = p_basket_id;
    SET v_basket_name = p_basket_name;
    SET v_weight_type = p_weight_type;
    SET v_is_public = p_is_public;
    SET v_compos_count = p_compos_count;
    SET v_basket_status = p_basket_status;
    SET v_cash_replace_amt = p_cash_replace_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_公用_篮子属性表][{篮子名称}=@篮子名称#, {权重类型}=@权重类型#,{是否公用}=@是否公用#, {成份股个数}=@成份股个数#, {篮子状态}=@篮子状态#,{现金替代金额} = @现金替代金额#][{记录序号}=@篮子序号# and {机构编号} = @操作员机构编号#][2][@篮子序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsepb_baskeinfo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, basket_name=v_basket_name, weight_type=v_weight_type,is_public=v_is_public, compos_count=v_compos_count, basket_status=v_basket_status,cash_replace_amt = v_cash_replace_amt where row_id=v_basket_id and co_no = v_opor_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("篮子序号=",v_basket_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("篮子序号=",v_basket_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_删除篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_DropBasket;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_DropBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
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
    declare v_basket_id bigint;
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
    SET v_basket_id = p_basket_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][交易证券_公用_篮子成份表][{篮子序号}=@篮子序号# and {机构编号} = @操作员机构编号#][3][@篮子序号#] */
    delete from db_tdsecu.tb_tdsepb_basketcomp 
        where basket_id=v_basket_id and co_no = v_opor_co_no;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.13.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("篮子序号=",v_basket_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("篮子序号=",v_basket_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_公用_篮子属性表][{记录序号}=@篮子序号# and {机构编号} = @操作员机构编号#][3][@篮子序号#] */
    delete from db_tdsecu.tb_tdsepb_baskeinfo 
        where row_id=v_basket_id and co_no = v_opor_co_no;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.13.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("篮子序号=",v_basket_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("篮子序号=",v_basket_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_查询篮子
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_QueryBasket;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_QueryBasket(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_公用_篮子属性表][{记录序号} as {篮子序号},{篮子名称},{权重类型},{是否公用},{成份股个数},{篮子状态},{操作员编号},{现金替代金额}][{机构编号}=@机构编号# and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id as basket_id,basket_name,weight_type,is_public,compos_count,basket_status,opor_no,cash_replace_amt from db_tdsecu.tb_tdsepb_baskeinfo where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no);
    else
        select row_id as basket_id,basket_name,weight_type,is_public,compos_count,basket_status,opor_no,cash_replace_amt from db_tdsecu.tb_tdsepb_baskeinfo where co_no=v_co_no and (v_query_opor_no=0 or opor_no=v_query_opor_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_新增篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_AddBasketComposition;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_AddBasketComposition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
    IN p_co_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_compos_qty decimal(18,2),
    IN p_compos_ratio decimal(18,12),
    IN p_repl_stock_code_no int,
    IN p_repl_qty decimal(18,2),
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
    declare v_basket_id bigint;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_compos_qty decimal(18,2);
    declare v_compos_ratio decimal(18,12);
    declare v_repl_stock_code_no int;
    declare v_repl_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_basket_no int;

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
    SET v_basket_id = p_basket_id;
    SET v_co_no = p_co_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_compos_qty = p_compos_qty;
    SET v_compos_ratio = p_compos_ratio;
    SET v_repl_stock_code_no = p_repl_stock_code_no;
    SET v_repl_qty = p_repl_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_basket_no = 0;

    
    label_pro:BEGIN
    

    /* [插入重复更新][交易证券_公用_篮子成份表][字段][字段变量][{成份数量}=@成份数量#,{成份比例}=@成份比例#,{替代证券代码编号}=@替代证券代码编号#,{替代数量}=@替代数量#][1][@篮子编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_basketcomp (
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        basket_id, exch_no, stock_code_no, compos_qty, 
        compos_ratio, repl_stock_code_no, repl_qty) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_basket_id, v_exch_no, v_stock_code_no, v_compos_qty, 
        v_compos_ratio, v_repl_stock_code_no, v_repl_qty) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, compos_qty=v_compos_qty,compos_ratio=v_compos_ratio,repl_stock_code_no=v_repl_stock_code_no,repl_qty=v_repl_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("篮子编号=",v_basket_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("篮子编号=",v_basket_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_修改篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_ModifyBasketComposition;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_ModifyBasketComposition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_basket_id bigint,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_compos_qty decimal(18,2),
    IN p_compos_ratio decimal(18,12),
    IN p_repl_stock_code_no int,
    IN p_repl_qty decimal(18,2),
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
    declare v_basket_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_compos_qty decimal(18,2);
    declare v_compos_ratio decimal(18,12);
    declare v_repl_stock_code_no int;
    declare v_repl_qty decimal(18,2);
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
    SET v_basket_id = p_basket_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_compos_qty = p_compos_qty;
    SET v_compos_ratio = p_compos_ratio;
    SET v_repl_stock_code_no = p_repl_stock_code_no;
    SET v_repl_qty = p_repl_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_公用_篮子成份表][{成份数量}=@成份数量# ,{成份比例}=@成份比例# ,{替代证券代码编号}=@替代证券代码编号#,{替代数量}=@替代数量#][{记录序号}=@记录序号# and {篮子序号} = @篮子序号# and {机构编号} = @操作员机构编号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsepb_basketcomp set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, compos_qty=v_compos_qty ,compos_ratio=v_compos_ratio ,repl_stock_code_no=v_repl_stock_code_no,repl_qty=v_repl_qty where row_id=v_row_id and basket_id = v_basket_id and co_no = v_opor_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.22.2";
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
use db_tdsecu;;

# 原子_交易证券_公用_删除篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_DropBasketCompostion;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_DropBasketCompostion(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_basket_id bigint,
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
    declare v_row_id bigint;
    declare v_basket_id bigint;
    declare v_stock_code_no int;
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
    SET v_basket_id = p_basket_id;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][交易证券_公用_篮子成份表][(@记录序号# = 0 or {记录序号}=@记录序号#) and {篮子序号}=@篮子序号# and {证券代码编号}=@证券代码编号# and {机构编号} = @操作员机构编号#][3][@记录序号#,@篮子序号#,@证券代码编号#] */
    delete from db_tdsecu.tb_tdsepb_basketcomp 
        where (v_row_id = 0 or row_id=v_row_id) and basket_id=v_basket_id and stock_code_no=v_stock_code_no and co_no = v_opor_co_no;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.23.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","篮子序号=",v_basket_id,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","篮子序号=",v_basket_id,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_查询篮子成份
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_QueryBasketComposition;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_QueryBasketComposition(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_basket_id bigint,
    IN p_co_no int,
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
    declare v_basket_id bigint;
    declare v_co_no int;
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
    SET v_basket_id = p_basket_id;
    SET v_co_no = p_co_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_公用_篮子成份表][字段][{机构编号}=@机构编号# and {篮子序号}=@篮子序号#][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, basket_id, exch_no, stock_code_no, 
        compos_qty, compos_ratio, repl_stock_code_no, repl_qty from db_tdsecu.tb_tdsepb_basketcomp where co_no=v_co_no and basket_id=v_basket_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, basket_id, exch_no, stock_code_no, 
        compos_qty, compos_ratio, repl_stock_code_no, repl_qty from db_tdsecu.tb_tdsepb_basketcomp where co_no=v_co_no and basket_id=v_basket_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_DataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_DataToHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_order_date int;

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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_order_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* [数据归历史][交易证券_指令_指令表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1000][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseap_command_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag 
        from db_tdsecu.tb_tdseap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1000";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令表][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1001][@初始化日期#] */
    delete from db_tdsecu.tb_tdseap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1001";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_指令_指令表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_指令_指令汇总表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1010][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseap_sumcommand_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, comm_remark_info, read_flag, acco_concat_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, comm_remark_info, read_flag, acco_concat_info 
        from db_tdsecu.tb_tdseap_sumcommand 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1010";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令汇总表][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1011][@初始化日期#] */
    delete from db_tdsecu.tb_tdseap_sumcommand 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1011";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_指令_指令汇总表][{初始化日期}=@下日初始化日期#][1=1][1012][@下日初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1012";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_指令_指令流水表][字段][{初始化日期}<=@初始化日期#][1020][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseap_command_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info, 
        exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info, 
        exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1020";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令流水表][{初始化日期}<=@初始化日期#][1021][@初始化日期#] */
    delete from db_tdsecu.tb_tdseap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1021";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_指令_指令分发表][字段][{初始化日期}<=@初始化日期#][1030][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseap_command_dispense_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, disp_date, disp_time, 
        before_comm_executor, comm_executor, is_withdraw, disp_flag, 
        disp_remark, exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, disp_date, disp_time, 
        before_comm_executor, comm_executor, is_withdraw, disp_flag, 
        disp_remark, exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_dispense 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1030";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令分发表][{初始化日期}<=@初始化日期#][1031][@初始化日期#] */
    delete from db_tdsecu.tb_tdseap_command_dispense 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1031";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_指令_指令审批表][字段][{初始化日期}<=@初始化日期#][1040][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseap_command_approve_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_opor, comm_dir, 
        comm_qty, comm_limit_price, limit_actual_price, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_appr_status, 
        comm_appr_remark, exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_opor, comm_dir, 
        comm_qty, comm_limit_price, limit_actual_price, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_appr_status, 
        comm_appr_remark, exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1040";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令审批表][{初始化日期}<=@初始化日期#][1041][@初始化日期#] */
    delete from db_tdsecu.tb_tdseap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1041";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_订单表][字段][{订单日期}<=@初始化日期#][1050][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdsetd_order_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag 
        from db_tdsecu.tb_tdsetd_order 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1050";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_订单表][{订单日期}<=@初始化日期#][1051][@初始化日期#] */
    delete from db_tdsecu.tb_tdsetd_order 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1051";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_订单汇总表][字段][{订单日期}<=@初始化日期#][1060][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdsetd_sumorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag 
        from db_tdsecu.tb_tdsetd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1060";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_订单汇总表][{订单日期}<=@初始化日期#][1061][@初始化日期#] */
    delete from db_tdsecu.tb_tdsetd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1061";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_新股申购表][字段][{订单日期}<=@初始化日期#][1070][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdsetd_purchaseorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_type, 
        report_date, report_time, report_no, order_date, 
        order_time, order_id, order_dir, order_price, 
        order_qty, all_fee, other_fee, trade_commis, 
        other_commis, order_frozen_amt, nav_asset, rsp_info, 
        compli_trig_id, trade_code_no, target_code_no, sett_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_type, 
        report_date, report_time, report_no, order_date, 
        order_time, order_id, order_dir, order_price, 
        order_qty, all_fee, other_fee, trade_commis, 
        other_commis, order_frozen_amt, nav_asset, rsp_info, 
        compli_trig_id, trade_code_no, target_code_no, sett_flag 
        from db_tdsecu.tb_tdsetd_purchaseorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1070";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_新股申购表][{订单日期}<=@订单日期#][1071][@初始化日期#] */
    delete from db_tdsecu.tb_tdsetd_purchaseorder 
        where order_date<=v_order_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1071";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_撤单表][字段][{撤单日期}<=@初始化日期#][1080][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdsetd_cancel_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco 
        from db_tdsecu.tb_tdsetd_cancel 
        where wtdraw_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1080";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_撤单表][{撤单日期}<=@初始化日期#][1081][@初始化日期#] */
    delete from db_tdsecu.tb_tdsetd_cancel 
        where wtdraw_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1081";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_预埋订单表][字段][{订单日期}<=@初始化日期#][1090][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdsetd_preorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace 
        from db_tdsecu.tb_tdsetd_preorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1090";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_预埋订单表][{订单日期}<=@初始化日期#][1091][@初始化日期#] */
    delete from db_tdsecu.tb_tdsetd_preorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1091";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_篮子订单表][字段][{订单日期}<=@初始化日期#][1100][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdsetd_basketorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt 
        from db_tdsecu.tb_tdsetd_basketorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1100";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_篮子订单表][{订单日期}<=@初始化日期#][1101][@初始化日期#] */
    delete from db_tdsecu.tb_tdsetd_basketorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_改单表][字段][{改单日期}<=@初始化日期#][1110][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdsetd_modifyorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, modi_order_date, modi_order_time, 
        modi_batch_no, order_id, comm_id, order_price, 
        order_qty, order_dir, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, modi_order_date, modi_order_time, 
        modi_batch_no, order_id, comm_id, order_price, 
        order_qty, order_dir, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way 
        from db_tdsecu.tb_tdsetd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1110";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_改单表][{改单日期}<=@初始化日期#][1111][@初始化日期#] */
    delete from db_tdsecu.tb_tdsetd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1111";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_报盘_订单回报表][字段][{初始化日期}<=@初始化日期#][1120][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdserp_orderrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no 
        from db_tdsecu.tb_tdserp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1120";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_订单回报表][{初始化日期}<=@初始化日期#][1121][@初始化日期#] */
    delete from db_tdsecu.tb_tdserp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_报盘_成交回报表][字段][{初始化日期}<=@初始化日期#][1130][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdserp_strikersp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type 
        from db_tdsecu.tb_tdserp_strikersp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1130";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交回报表][{初始化日期}<=@初始化日期#][1131][@初始化日期#] */
    delete from db_tdsecu.tb_tdserp_strikersp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1131";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_报盘_成交表][字段][{订单日期}<=@初始化日期#][1140][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdserp_strike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type 
        from db_tdsecu.tb_tdserp_strike 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1140";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交表][{订单日期}<=@初始化日期#][1141][@初始化日期#] */
    delete from db_tdsecu.tb_tdserp_strike 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1141";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_报盘_成交汇总表][字段][{订单日期}<=@初始化日期#][1150][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdserp_sumstrike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag 
        from db_tdsecu.tb_tdserp_sumstrike 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1150";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交汇总表][{订单日期}<=@初始化日期#][1151][@初始化日期#] */
    delete from db_tdsecu.tb_tdserp_sumstrike 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1151";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_历史交易组业务资金表][{初始化日期}=@初始化日期#][1160][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_busi_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1160";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组业务资金表][字段][1161][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt 
        from db_tdsecu.tb_tdseac_exgp_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1161";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金表][{交易组编号} >0 and {冻结金额}=0 and {解冻金额}=0 and {指令冻结金额}=0 and {指令解冻金额}=0 and {指令占用金额}=0 and {交易冻结金额}=0 and {交易占用金额}=0 and {交易释放金额}=0][1162][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capit 
        where exch_group_no >0 and frozen_amt=0 and unfroz_amt=0 and comm_frozen_amt=0 and comm_unfroz_amt=0 and comm_capt_amt=0 and trade_frozen_amt=0 and trade_capt_amt=0 and trade_releas_amt=0;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1162";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_交易组业务资金表][{成交占用金额}=0 , {成交释放金额}=0][1=1][1163][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_amt=0 , strike_releas_amt=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1163";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_历史交易组业务持仓表][{初始化日期}=@初始化日期#][1170][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_busi_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1170";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组业务持仓表][字段][1171][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl 
        from db_tdsecu.tb_tdseac_exgp_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1171";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务持仓表][{交易组编号} >0 and {指令冻结数量} = 0 and {指令解冻数量} = 0 and {指令占用数量} = 0 and {指令释放数量} = 0 and {交易冻结数量} = 0 and {交易解冻数量} = 0 and {交易占用数量} = 0 and {交易释放数量} = 0][1172][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_posi 
        where exch_group_no >0 and comm_frozen_qty = 0 and comm_unfroz_qty = 0 and comm_capt_qty = 0 and comm_releas_qty = 0 and trade_frozen_qty = 0 and trade_unfroz_qty = 0 and trade_capt_qty = 0 and trade_releas_qty = 0;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1172";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_交易组业务持仓表][{成交占用数量} = 0 , {成交释放数量} = 0 , {成交冻结数量} = 0 , {成交解冻数量} = 0][1=1][1173][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_exgp_busi_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_qty = 0 , strike_releas_qty = 0 , strike_frozen_qty = 0 , strike_unfroz_qty = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1173";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_账户_交易组业务资金持仓变动流水表][字段][{初始化日期}<=@初始化日期#][1180][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capit_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info 
        from db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1180";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金持仓变动流水表][{初始化日期}<=@初始化日期#][1181][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1181";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_历史资产账户业务资金表][{初始化日期}=@初始化日期#][1190][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdseac_asac_busi_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1190";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户业务资金表][字段][1191][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_frozen_amt, trade_unfroz_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_frozen_amt, trade_unfroz_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt 
        from db_tdsecu.tb_tdseac_asac_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1191";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金表][{资产账户编号} >0 and {冻结金额}=0 and {解冻金额}=0 and {指令冻结金额}=0 and {指令解冻金额}=0 and {指令占用金额}=0 and {交易冻结金额}=0 and {交易占用金额}=0 and {交易释放金额}=0][1192][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capit 
        where asset_acco_no >0 and frozen_amt=0 and unfroz_amt=0 and comm_frozen_amt=0 and comm_unfroz_amt=0 and comm_capt_amt=0 and trade_frozen_amt=0 and trade_capt_amt=0 and trade_releas_amt=0;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1192";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_资产账户业务资金表][{成交占用金额}=0 , {成交释放金额}=0][1=1][1193][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_asac_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_amt=0 , strike_releas_amt=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1193";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_历史资产账户业务持仓表][{初始化日期}=@初始化日期#][1200][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdseac_asac_busi_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1200";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户业务持仓表][字段][1201][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
        strike_frozen_qty, strike_unfroz_qty, realize_pandl, cost_amt, 
        intrst_cost_amt, intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
        strike_frozen_qty, strike_unfroz_qty, realize_pandl, cost_amt, 
        intrst_cost_amt, intrst_pandl 
        from db_tdsecu.tb_tdseac_asac_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1201";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务持仓表][{资产账户编号} >0 and {指令冻结数量} = 0 and {指令解冻数量} = 0 and {指令占用数量} = 0 and {指令释放数量} = 0 and {交易冻结数量} = 0 and {交易解冻数量} = 0 and {交易占用数量} = 0 and {交易释放数量} = 0][1202][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_posi 
        where asset_acco_no >0 and comm_frozen_qty = 0 and comm_unfroz_qty = 0 and comm_capt_qty = 0 and comm_releas_qty = 0 and trade_frozen_qty = 0 and trade_unfroz_qty = 0 and trade_capt_qty = 0 and trade_releas_qty = 0;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1202";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_资产账户业务持仓表][{成交占用数量} = 0 , {成交释放数量} = 0 , {成交冻结数量} = 0 , {成交解冻数量} = 0][1=1][1203][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_asac_busi_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_qty = 0 , strike_releas_qty = 0 , strike_frozen_qty = 0 , strike_unfroz_qty = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1203";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_账户_资产账户业务资金持仓变动流水表][字段][{初始化日期}<=@初始化日期#][1210][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capit_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info 
        from db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1210";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金持仓变动流水表][{初始化日期}<=@初始化日期#][1211][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1211";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #质押记录也统一到账户那边处理

    /* [删除表记录][交易证券_账户_历史交易组债券质押表][{初始化日期}=@初始化日期#][1220][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1220";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组债券质押表][字段][1221][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty, target_code_no) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty, target_code_no 
        from db_tdsecu.tb_tdseac_exgp_bond_impawn;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1221";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组债券质押表][1=1][1222][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_exgp_bond_impawn 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1222";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_历史资产账户债券质押表][{初始化日期}=@初始化日期#][1230][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdseac_asac_bond_impawn_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1230";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户债券质押表][字段][1231][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_asac_bond_impawn_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty, 
        target_code_no) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty, 
        target_code_no 
        from db_tdsecu.tb_tdseac_asac_bond_impawn;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1231";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户债券质押表][1=1][1232][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_asac_bond_impawn 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1232";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_账户_债券回购表][字段][{初始化日期}<=@初始化日期#][1240][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_bond_repo_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, comm_id, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, comm_id, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status 
        from db_tdsecu.tb_tdseac_bond_repo 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1240";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_债券回购表][{初始化日期}<=@初始化日期#][1241][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_bond_repo 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1241";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #增强交易相关归档

    /* [删除表记录][交易证券_T0_历史证券持仓明细表][{初始化日期}=@初始化日期#][1250][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdset0_stock_posi_detail_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1250";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_T0_证券持仓明细表][字段][1251][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdset0_stock_posi_detail_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, lngsht_type, 
        curr_qty, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
        close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
        realize_pandl, over_night_pandl, posi_status, remark_info) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, lngsht_type, 
        curr_qty, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
        close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
        realize_pandl, over_night_pandl, posi_status, remark_info 
        from db_tdsecu.tb_tdset0_stock_posi_detail;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1251";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_证券持仓明细表][{持仓状态}=《持仓状态-已平仓》][1252][@初始化日期#] */
    delete from db_tdsecu.tb_tdset0_stock_posi_detail 
        where posi_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1252";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_历史证券持仓汇总表][{初始化日期}=@初始化日期#][1260][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdset0_stock_posi_sum_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1260";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_T0_证券持仓汇总表][字段][1261][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdset0_stock_posi_sum_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
        total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
        total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
        total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
        long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
        long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
        long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
        realize_pandl, over_night_pandl, open_posi_date, open_posi_time) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
        total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
        total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
        total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
        long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
        long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
        long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
        realize_pandl, over_night_pandl, open_posi_date, open_posi_time 
        from db_tdsecu.tb_tdset0_stock_posi_sum;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1261";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_证券持仓汇总表][{机构编号} > 0 and ({总多头当前数量}+{总空头当前数量}-{总多头平仓数量}-{总空头平仓数量} = 0) ][1262][@初始化日期#] */
    delete from db_tdsecu.tb_tdset0_stock_posi_sum 
        where co_no > 0 and (total_long_curr_qty+total_short_curr_qty-total_long_close_posi_qty-total_short_close_posi_qty = 0) ;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1262";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_交易证券_T0_证券平仓成交明细表][{初始化日期}=@初始化日期#][1270][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdset0_close_posi_strike_detail_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1270";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_T0_证券平仓成交明细表][字段][1271][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdset0_close_posi_strike_detail_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, lngsht_type, 
        detail_posi_id, strike_no, close_posi_date, close_posi_time, 
        close_posi_price, close_posi_qty, close_posi_market_value, close_posi_fee, 
        realize_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, lngsht_type, 
        detail_posi_id, strike_no, close_posi_date, close_posi_time, 
        close_posi_price, close_posi_qty, close_posi_market_value, close_posi_fee, 
        realize_pandl 
        from db_tdsecu.tb_tdset0_close_posi_strike_detail;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1271";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_证券平仓成交明细表][1=1][1272][@初始化日期#] */
    delete from db_tdsecu.tb_tdset0_close_posi_strike_detail 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1272";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_历史操作员券源设置表][{初始化日期}=@初始化日期#][1300][@初始化日期#] */
    delete from db_tdsecu_his.tb_tdset0_opor_stock_source_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.51.1300";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_T0_操作员券源设置表][字段][1301][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdset0_opor_stock_source_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, begin_qty, 
        source_stock_qty, single_limit_qty, assigned_qty, trade_releas_qty, 
        trade_capt_qty, strike_releas_qty, strike_capt_qty, total_realize_pandl, 
        over_night_pandl, sum_realize_pandl, total_open_posi_fee, total_close_posi_fee, 
        out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, out_strike_capt_qty, 
        over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, diff_qty, 
        t0_buy_type, remark_info) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, begin_qty, 
        source_stock_qty, single_limit_qty, assigned_qty, trade_releas_qty, 
        trade_capt_qty, strike_releas_qty, strike_capt_qty, total_realize_pandl, 
        over_night_pandl, sum_realize_pandl, total_open_posi_fee, total_close_posi_fee, 
        out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, out_strike_capt_qty, 
        over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, diff_qty, 
        t0_buy_type, remark_info 
        from db_tdsecu.tb_tdset0_opor_stock_source;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1301";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_操作员券源设置表][{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0,{总实现盈亏} = 0,{总开仓费用} = 0,{总平仓费用} = 0,{外部交易释放数量} = 0,{外部交易占用数量} = 0,{外部成交释放数量} = 0,{外部成交占用数量} = 0][1=1][1302][@初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_releas_qty = 0,trade_capt_qty = 0,strike_releas_qty = 0,strike_capt_qty = 0,total_realize_pandl = 0,total_open_posi_fee = 0,total_close_posi_fee = 0,out_order_releas_qty = 0,out_order_capt_qty = 0,out_strike_releas_qty = 0,out_strike_capt_qty = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1302";
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
use db_tdsecu;;

# 原子_交易证券_公用_获取操作流水号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetOperJourNo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetOperJourNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_oper_target varchar(64),
    IN p_init_date int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_oper_jour_no bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_oper_target varchar(64);
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_jour_no bigint;

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
    SET v_oper_target = p_oper_target;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_公用_交易初始化控制表][{操作流水号}][@操作流水号#][{操作对象} = @操作对象#] */
    select oper_jour_no into v_oper_jour_no from db_tdsecu.tb_tdsepb_initctrl where oper_target = v_oper_target limit 1;


    /* set @操作流水号# = ifnull(@操作流水号#,0); */
    set v_oper_jour_no = ifnull(v_oper_jour_no,0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_oper_jour_no = v_oper_jour_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_更新操作流水号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_UpdateOperJourNo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_UpdateOperJourNo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_oper_target varchar(64),
    IN p_init_date int,
    IN p_oper_jour_no bigint,
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
    declare v_oper_target varchar(64);
    declare v_init_date int;
    declare v_oper_jour_no bigint;
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
    SET v_oper_target = p_oper_target;
    SET v_init_date = p_init_date;
    SET v_oper_jour_no = p_oper_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][交易证券_公用_交易初始化控制表][字段][字段变量][{操作流水号}=@操作流水号#, {初始化日期}=@初始化日期#][1][@操作对象#,@初始化日期#,@操作流水号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_initctrl (
        create_date, create_time, update_date, 
        update_time, update_times, oper_target, init_date, 
        oper_jour_no) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_oper_target, v_init_date, 
        v_oper_jour_no) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, oper_jour_no=v_oper_jour_no, init_date=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.53.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作对象=",v_oper_target,",","初始化日期=",v_init_date,",","操作流水号=",v_oper_jour_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作对象=",v_oper_target,",","初始化日期=",v_init_date,",","操作流水号=",v_oper_jour_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_交易归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_TradeArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_TradeArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    declare v_next_init_date int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_table_name varchar(64);
    declare v_update_date int;
    declare v_update_time int;
    declare v_remark_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_flag int;
    declare v_basket_id bigint;
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_oper_func_code varchar(16);
    declare v_combo_code varchar(32);
    declare v_comm_remark_info varchar(1024);
    declare v_comm_appr_qty decimal(18,2);
    declare v_acco_concat_info varchar(4096);
    declare v_order_date int;
    declare v_detail_posi_id bigint;
    declare v_busi_opor_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_date int;
    declare v_close_posi_time int;
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_total_realize_pandl decimal(18,4);
    declare v_total_long_curr_qty decimal(18,2);
    declare v_total_short_curr_qty decimal(18,2);
    declare v_total_long_open_posi_value decimal(18,4);
    declare v_total_short_open_posi_value decimal(18,4);
    declare v_total_long_open_posi_fee decimal(18,4);
    declare v_total_short_open_posi_fee decimal(18,4);
    declare v_total_long_close_posi_value decimal(18,4);
    declare v_total_short_close_posi_value decimal(18,4);
    declare v_total_long_close_posi_qty decimal(18,2);
    declare v_total_short_close_posi_qty decimal(18,2);
    declare v_total_long_close_posi_fee decimal(18,4);
    declare v_total_short_close_posi_fee decimal(18,4);
    declare v_long_curr_qty decimal(18,2);
    declare v_short_curr_qty decimal(18,2);
    declare v_long_open_posi_value decimal(18,4);
    declare v_short_open_posi_value decimal(18,4);
    declare v_long_open_posi_fee decimal(18,4);
    declare v_short_open_posi_fee decimal(18,4);
    declare v_long_close_posi_qty decimal(18,2);
    declare v_short_close_posi_qty decimal(18,2);
    declare v_long_close_posi_value decimal(18,4);
    declare v_short_close_posi_value decimal(18,4);
    declare v_long_close_posi_fee decimal(18,4);
    declare v_short_close_posi_fee decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_remark_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_flag = 0;
    SET v_basket_id = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_strike_status = "0";
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_oper_func_code = " ";
    SET v_combo_code = " ";
    SET v_comm_remark_info = " ";
    SET v_comm_appr_qty = 0;
    SET v_acco_concat_info = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_detail_posi_id = 0;
    SET v_busi_opor_no = 0;
    SET v_lngsht_type = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_strike_no = " ";
    SET v_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_posi_status = "0";
    SET v_total_realize_pandl = 0;
    SET v_total_long_curr_qty = 0;
    SET v_total_short_curr_qty = 0;
    SET v_total_long_open_posi_value = 0;
    SET v_total_short_open_posi_value = 0;
    SET v_total_long_open_posi_fee = 0;
    SET v_total_short_open_posi_fee = 0;
    SET v_total_long_close_posi_value = 0;
    SET v_total_short_close_posi_value = 0;
    SET v_total_long_close_posi_qty = 0;
    SET v_total_short_close_posi_qty = 0;
    SET v_total_long_close_posi_fee = 0;
    SET v_total_short_close_posi_fee = 0;
    SET v_long_curr_qty = 0;
    SET v_short_curr_qty = 0;
    SET v_long_open_posi_value = 0;
    SET v_short_open_posi_value = 0;
    SET v_long_open_posi_fee = 0;
    SET v_short_open_posi_fee = 0;
    SET v_long_close_posi_qty = 0;
    SET v_short_close_posi_qty = 0;
    SET v_long_close_posi_value = 0;
    SET v_short_close_posi_value = 0;
    SET v_long_close_posi_fee = 0;
    SET v_short_close_posi_fee = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~交易证券_指令_指令表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command";

    /* [数据归历史][交易证券_指令_指令表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1000][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag 
        from db_tdsecu.tb_tdseap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1000";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令表][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1001][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1001";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_指令_指令表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @备注信息#= " "; */
    set v_remark_info= " ";
    #汇总表先删除所有记录，再根据剩下的明细表再次进行汇总

    /* set @数据表名称# = "~交易证券_指令_指令汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_sumcommand";

    /* [数据归历史][交易证券_指令_指令汇总表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1010][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_sumcommand_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, comm_remark_info, read_flag, acco_concat_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, comm_remark_info, read_flag, acco_concat_info 
        from db_tdsecu.tb_tdseap_sumcommand 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1010";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令汇总表][1=1][1262][@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_sumcommand 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1262";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #指令汇总新表，归档，清空当前表 不重新生成。

    /* set @数据表名称# = "~交易证券_交易运维_指令汇总考核表^"; */
    set v_table_name = "db_tdsecu.tb_tdsebk_sumcommand_check";

    /* [数据归历史][交易证券_交易运维_指令汇总考核表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1013][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsebk_sumcommand_check_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
        exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
        valid_qty_allday, comm_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
        exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
        valid_qty_allday, comm_remark_info 
        from db_tdsecu.tb_tdsebk_sumcommand_check 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1013";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易运维_指令汇总考核表][1=1][1263][@数据表名称#] */
    delete from db_tdsecu.tb_tdsebk_sumcommand_check 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1263";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @记录序号# = 0 ; */
    set v_row_id = 0 ;
    loop_label:loop

        /* 调用【原子_交易证券_指令_循环锁定获取指令】*/
        call db_tdsecu.pra_tdseap_LoopLockGetComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_comm_id,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_status,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_qty,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_flag,
            v_basket_id,
            v_comm_amt,
            v_strike_amt,
            v_comm_oper_way,
            v_strike_status,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_oper_func_code,
            v_combo_code,
            v_comm_remark_info);

        /* set @记录序号# = @指令序号#; */
        set v_row_id = v_comm_id;

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* if @指令审批状态# = 《指令审批状态-审批通过》 or @指令审批状态# = 《指令审批状态-不审批》 then */
            if v_comm_appr_status = "2" or v_comm_appr_status = "4" then

                /* set @指令审批数量# = @指令数量#; */
                set v_comm_appr_qty = v_comm_qty;
            else

                /* set @指令审批数量# = 0; */
                set v_comm_appr_qty = 0;
            end if;

            /* set @账户拼接信息# = ""; */
            set v_acco_concat_info = "";

            /* 调用【原子_交易证券_指令_指令更新汇总指令】*/
            call db_tdsecu.pra_tdseap_CommUpdateSumComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_oper_func_code,
                v_init_date,
                v_comm_date,
                v_comm_time,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_comm_executor,
                v_comm_batch_no,
                v_comm_dir,
                v_comm_limit_price,
                v_limit_actual_price,
                v_comm_qty,
                v_comm_amt,
                v_order_qty,
                v_comm_cancel_qty,
                v_strike_amt,
                v_strike_qty,
                v_comm_appr_qty,
                v_comm_begin_date,
                v_comm_end_date,
                v_comm_begin_time,
                v_comm_end_time,
                v_net_price_flag,
                v_par_value,
                v_impawn_ratio,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_strike_status,
                v_comm_status,
                v_comm_appr_status,
                v_basket_id,
                v_comm_oper_way,
                v_exter_comm_flag,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_comm_remark_info,
                v_acco_concat_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.1.54.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_指令更新汇总指令出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;
    end loop;

    /* [更新表记录][交易证券_指令_指令汇总表][{初始化日期}=@下日初始化日期#][1=1][1012][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1012";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #重新汇总指令时，重新计算汇总指令暂停状态。| 明细全为暂停，才暂停。Modify by wjp 20181012   事务层-重算订单时 调用下单更新指令。
    #update   ~交易证券_指令_指令汇总表^  a set a.{指令汇总状态} = 《指令汇总状态-暂停执行》 where  a.{指令批号} in (select t1.{指令批号}  from 
#(select count(*) a,{指令批号}  from ~交易证券_指令_指令表^ t where {指令状态}=《指令状态-暂停执行》 group by {指令批号},{机构编号}) as t1,
#(select count(*) b,{指令批号}  from ~交易证券_指令_指令表^ t group by {指令批号},{机构编号}) as t2 WHERE t1.{指令批号}= t2.{指令批号} and t1.a=t2.b);

    /* set @数据表名称# = "~交易证券_指令_指令流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_jour";

    /* [数据归历史][交易证券_指令_指令流水表][字段][{初始化日期}<=@初始化日期#][1020][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info, 
        exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info, 
        exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1020";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令流水表][{初始化日期}<=@初始化日期#][1021][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1021";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_指令_指令分发表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_dispense";

    /* [数据归历史][交易证券_指令_指令分发表][字段][{初始化日期}<=@初始化日期#][1030][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_dispense_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, disp_date, disp_time, 
        before_comm_executor, comm_executor, is_withdraw, disp_flag, 
        disp_remark, exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, disp_date, disp_time, 
        before_comm_executor, comm_executor, is_withdraw, disp_flag, 
        disp_remark, exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_dispense 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1030";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令分发表][{初始化日期}<=@初始化日期#][1031][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_dispense 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1031";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_指令_指令审批表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_approve";

    /* [数据归历史][交易证券_指令_指令审批表][字段][{初始化日期}<=@初始化日期#][1040][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_approve_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_opor, comm_dir, 
        comm_qty, comm_limit_price, limit_actual_price, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_appr_status, 
        comm_appr_remark, exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_opor, comm_dir, 
        comm_qty, comm_limit_price, limit_actual_price, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_appr_status, 
        comm_appr_remark, exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1040";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令审批表][{初始化日期}<=@初始化日期#][1041][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1041";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_指令_指令转发审批表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_dispense_approve";

    /* [数据归历史][交易证券_指令_指令转发审批表][字段][{初始化日期}<=@初始化日期#][1042][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_dispense_approve_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, comm_executor, disp_flag, 
        disp_remark, before_comm_executor, is_withdraw, exter_comm_flag, 
        comm_dispense_appr_status, comm_dispense_appr_opor, comm_dispense_appr_date, comm_dispense_appr_time, 
        comm_dispense_appr_remark) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, comm_executor, disp_flag, 
        disp_remark, before_comm_executor, is_withdraw, exter_comm_flag, 
        comm_dispense_appr_status, comm_dispense_appr_opor, comm_dispense_appr_date, comm_dispense_appr_time, 
        comm_dispense_appr_remark 
        from db_tdsecu.tb_tdseap_command_dispense_approve 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1042";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令转发审批表][{初始化日期}<=@初始化日期#][1043][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_dispense_approve 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1043";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_order";

    /* [数据归历史][交易证券_交易_订单表][字段][{订单日期}<=@初始化日期#][1050][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_order_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag 
        from db_tdsecu.tb_tdsetd_order 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1050";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_订单表][{订单日期}<=@初始化日期#][1051][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_order 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1051";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_订单汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_sumorder";

    /* [数据归历史][交易证券_交易_订单汇总表][字段][{订单日期}<=@初始化日期#][1060][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_sumorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag 
        from db_tdsecu.tb_tdsetd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1060";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_订单汇总表][{订单日期}<=@初始化日期#][1061][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1061";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_新股申购表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_purchaseorder";

    /* [数据归历史][交易证券_交易_新股申购表][字段][{订单日期}<=@初始化日期#][1070][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_purchaseorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_type, 
        report_date, report_time, report_no, order_date, 
        order_time, order_id, order_dir, order_price, 
        order_qty, all_fee, other_fee, trade_commis, 
        other_commis, order_frozen_amt, nav_asset, rsp_info, 
        compli_trig_id, trade_code_no, target_code_no, sett_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_type, 
        report_date, report_time, report_no, order_date, 
        order_time, order_id, order_dir, order_price, 
        order_qty, all_fee, other_fee, trade_commis, 
        other_commis, order_frozen_amt, nav_asset, rsp_info, 
        compli_trig_id, trade_code_no, target_code_no, sett_flag 
        from db_tdsecu.tb_tdsetd_purchaseorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1070";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_新股申购表][{订单日期}<=@订单日期#][1071][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_purchaseorder 
        where order_date<=v_order_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1071";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_撤单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_cancel";

    /* [数据归历史][交易证券_交易_撤单表][字段][{撤单日期}<=@初始化日期#][1080][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_cancel_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco 
        from db_tdsecu.tb_tdsetd_cancel 
        where wtdraw_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1080";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_撤单表][{撤单日期}<=@初始化日期#][1081][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_cancel 
        where wtdraw_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1081";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_撤单回报表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_cancelrsp";

    /* [数据归历史][交易证券_报盘_撤单回报表][字段][{初始化日期}<=@初始化日期#][1082][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_cancelrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, out_acco, exch_no, stock_code, 
        report_date, report_time, report_no, wtdraw_qty, 
        rsp_status, rsp_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, out_acco, exch_no, stock_code, 
        report_date, report_time, report_no, wtdraw_qty, 
        rsp_status, rsp_info 
        from db_tdsecu.tb_tdserp_cancelrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1082";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_撤单回报表][{初始化日期}<=@初始化日期#][1083][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_cancelrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1083";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_预埋订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_preorder";

    /* [数据归历史][交易证券_交易_预埋订单表][字段][{预埋订单状态}=《预埋订单状态-已执行》][1090][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_preorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace 
        from db_tdsecu.tb_tdsetd_preorder 
        where pre_order_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1090";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_预埋订单表][{预埋订单状态}=《预埋订单状态-已执行》][1091][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_preorder 
        where pre_order_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1091";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_预埋订单表][字段][{触发日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-时间触发》][1090][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_preorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace 
        from db_tdsecu.tb_tdsetd_preorder 
        where trig_date<=v_init_date and pre_order_type= 3;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1090";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_预埋订单表][{触发日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-时间触发》][1091][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_preorder 
        where trig_date<=v_init_date and pre_order_type= 3;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1091";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_预埋订单表][字段][{预埋结束日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-价格触发》][1090][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_preorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace 
        from db_tdsecu.tb_tdsetd_preorder 
        where pre_end_date<=v_init_date and pre_order_type= 2;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1090";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_预埋订单表][{预埋结束日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-价格触发》][1091][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_preorder 
        where pre_end_date<=v_init_date and pre_order_type= 2;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1091";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_预埋订单表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_preorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_篮子订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_basketorder";

    /* [数据归历史][交易证券_交易_篮子订单表][字段][{订单日期}<=@初始化日期#][1100][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_basketorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt 
        from db_tdsecu.tb_tdsetd_basketorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1100";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_篮子订单表][{订单日期}<=@初始化日期#][1101][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_basketorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_改单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_modifyorder";

    /* [数据归历史][交易证券_交易_改单表][字段][{改单日期}<=@初始化日期#][1110][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_modifyorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, modi_order_date, modi_order_time, 
        modi_batch_no, order_id, comm_id, order_price, 
        order_qty, order_dir, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, modi_order_date, modi_order_time, 
        modi_batch_no, order_id, comm_id, order_price, 
        order_qty, order_dir, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way 
        from db_tdsecu.tb_tdsetd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1110";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_改单表][{改单日期}<=@初始化日期#][1111][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1111";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_订单回报表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_orderrsp";

    /* [数据归历史][交易证券_报盘_订单回报表][字段][{初始化日期}<=@初始化日期#][1120][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_orderrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no 
        from db_tdsecu.tb_tdserp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1120";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_订单回报表][{初始化日期}<=@初始化日期#][1121][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_成交回报表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_strikersp";

    /* [数据归历史][交易证券_报盘_成交回报表][字段][{初始化日期}<=@初始化日期#][1130][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_strikersp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type 
        from db_tdsecu.tb_tdserp_strikersp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1130";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交回报表][{初始化日期}<=@初始化日期#][1131][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_strikersp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1131";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_成交表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_strike";

    /* [数据归历史][交易证券_报盘_成交表][字段][{订单日期}<=@初始化日期#][1140][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_strike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type 
        from db_tdsecu.tb_tdserp_strike 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1140";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交表][{订单日期}<=@初始化日期#][1141][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_strike 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1141";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_成交汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_sumstrike";

    /* [数据归历史][交易证券_报盘_成交汇总表][字段][{订单日期}<=@初始化日期#][1150][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_sumstrike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag 
        from db_tdsecu.tb_tdserp_sumstrike 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1150";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交汇总表][{订单日期}<=@初始化日期#][1151][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_sumstrike 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1151";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史交易组业务资金表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_exgp_busi_capit_his";

    /* [删除表记录][交易证券_账户_历史交易组业务资金表][{初始化日期}=@初始化日期#][1160][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_busi_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1160";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组业务资金表][字段][1161][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt 
        from db_tdsecu.tb_tdseac_exgp_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1161";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金表][1=1][1162][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1162";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史交易组业务持仓表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_exgp_busi_posi_his";

    /* [删除表记录][交易证券_账户_历史交易组业务持仓表][{初始化日期}=@初始化日期#][1170][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_busi_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1170";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组业务持仓表][字段][1171][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl 
        from db_tdsecu.tb_tdseac_exgp_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1171";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务持仓表][1=1][1172][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1172";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_交易组业务资金持仓变动流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour";

    /* [数据归历史][交易证券_账户_交易组业务资金持仓变动流水表][字段][{初始化日期}<=@初始化日期#][1180][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capit_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info 
        from db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1180";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金持仓变动流水表][{初始化日期}<=@初始化日期#][1181][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1181";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史资产账户业务资金表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_asac_busi_capit_his";

    /* [删除表记录][交易证券_账户_历史资产账户业务资金表][{初始化日期}=@初始化日期#][1190][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_asac_busi_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1190";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户业务资金表][字段][1191][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_frozen_amt, trade_unfroz_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_frozen_amt, trade_unfroz_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt 
        from db_tdsecu.tb_tdseac_asac_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1191";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金表][1=1][1192][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1192";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史资产账户业务持仓表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_asac_busi_posi_his";

    /* [删除表记录][交易证券_账户_历史资产账户业务持仓表][{初始化日期}=@初始化日期#][1200][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_asac_busi_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1200";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户业务持仓表][字段][1201][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
        strike_frozen_qty, strike_unfroz_qty, realize_pandl, cost_amt, 
        intrst_cost_amt, intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
        strike_frozen_qty, strike_unfroz_qty, realize_pandl, cost_amt, 
        intrst_cost_amt, intrst_pandl 
        from db_tdsecu.tb_tdseac_asac_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1201";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务持仓表][1=1][1202][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1202";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户业务资金持仓变动流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour";

    /* [数据归历史][交易证券_账户_资产账户业务资金持仓变动流水表][字段][{初始化日期}<=@初始化日期#][1210][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capit_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info 
        from db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1210";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金持仓变动流水表][{初始化日期}<=@初始化日期#][1211][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1211";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史交易组债券质押表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his";
    #质押记录也统一到账户那边处理

    /* [删除表记录][交易证券_账户_历史交易组债券质押表][{初始化日期}=@初始化日期#][1220][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1220";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组债券质押表][字段][1221][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty, target_code_no) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty, target_code_no 
        from db_tdsecu.tb_tdseac_exgp_bond_impawn;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1221";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组债券质押表][1=1][1222][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_bond_impawn 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1222";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史资产账户债券质押表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_asac_bond_impawn_his";

    /* [删除表记录][交易证券_账户_历史资产账户债券质押表][{初始化日期}=@初始化日期#][1230][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_asac_bond_impawn_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1230";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户债券质押表][字段][1231][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_bond_impawn_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty, 
        target_code_no) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty, 
        target_code_no 
        from db_tdsecu.tb_tdseac_asac_bond_impawn;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1231";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户债券质押表][1=1][1232][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_bond_impawn 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1232";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_债券回购表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_bond_repo";

    /* [数据归历史][交易证券_账户_债券回购表][字段][{初始化日期}<=@初始化日期#][1240][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_bond_repo_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, comm_id, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, comm_id, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status 
        from db_tdsecu.tb_tdseac_bond_repo 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1240";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_债券回购表][{初始化日期}<=@初始化日期#][1241][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_bond_repo 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1241";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_债券回购表][{初始化日期}=@下日初始化日期#][1=1][1253][@下日初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_bond_repo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_T0_历史证券持仓明细表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdset0_stock_posi_detail_his";
    #增强交易相关归档
    #[删除表记录][交易证券_T0_历史证券持仓明细表][{初始化日期}=@初始化日期#][1250][@初始化日期#,@数据表名称#]

    /* [不分日期数据归历史][交易证券_T0_证券持仓明细表][字段][1251][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_stock_posi_detail_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, lngsht_type, 
        curr_qty, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
        close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
        realize_pandl, over_night_pandl, posi_status, remark_info) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, lngsht_type, 
        curr_qty, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
        close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
        realize_pandl, over_night_pandl, posi_status, remark_info 
        from db_tdsecu.tb_tdset0_stock_posi_detail;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1251";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;

    #持仓状态新增 已作废，当前表一起删除 modify by wjp 20181012

    /* [删除表记录][交易证券_T0_证券持仓明细表][{持仓状态}=《持仓状态-已平仓》or {持仓状态}=《持仓状态-已作废》 ][1252][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_stock_posi_detail 
        where posi_status="2"or posi_status="3" ;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1252";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_证券持仓明细表][{隔夜盈亏}={隔夜盈亏}+{实现盈亏}][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, over_night_pandl=over_night_pandl+realize_pandl where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_证券持仓明细表][{实现盈亏}=0][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_T0_历史证券持仓汇总表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdset0_stock_posi_sum_his";
    #[删除表记录][交易证券_T0_历史证券持仓汇总表][{初始化日期}=@初始化日期#][1260][@初始化日期#,@数据表名称#]

    /* [不分日期数据归历史][交易证券_T0_证券持仓汇总表][字段][1261][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_stock_posi_sum_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
        total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
        total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
        total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
        long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
        long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
        long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
        realize_pandl, over_night_pandl, open_posi_date, open_posi_time) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
        total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
        total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
        total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
        long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
        long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
        long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
        realize_pandl, over_night_pandl, open_posi_date, open_posi_time 
        from db_tdsecu.tb_tdset0_stock_posi_sum;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1261";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;

    #set @数据表名称# = "~交易证券_T0_操作员阈值设置表^";
    #[不分日期数据归历史][交易证券_T0_操作员阈值设置表][字段][1301][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_T0_操作员阈值设置表][{当前金额}={当前金额} + {成交释放金额} - {成交占用金额}][1=1][1302][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_T0_操作员阈值设置表][{金额差额} = {金额差额} + {成交释放金额} - {成交占用金额}][1=1][1302][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_T0_操作员阈值设置表][{交易占用金额} = 0,{交易释放金额} = 0,{成交占用金额} = 0,{成交释放金额} = 0][1=1][1302][@初始化日期#,@数据表名称#]

    /* set @数据表名称# = "~交易证券_T0_操作员券源设置表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_opor_stock_source";
    #[删除表记录][交易证券_T0_历史操作员券源设置表][{初始化日期}=@初始化日期#][1300][@初始化日期#,@数据表名称#]

    /* [不分日期数据归历史][交易证券_T0_操作员券源设置表][字段][1301][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_opor_stock_source_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, begin_qty, 
        source_stock_qty, single_limit_qty, assigned_qty, trade_releas_qty, 
        trade_capt_qty, strike_releas_qty, strike_capt_qty, total_realize_pandl, 
        over_night_pandl, sum_realize_pandl, total_open_posi_fee, total_close_posi_fee, 
        out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, out_strike_capt_qty, 
        over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, diff_qty, 
        t0_buy_type, remark_info) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, begin_qty, 
        source_stock_qty, single_limit_qty, assigned_qty, trade_releas_qty, 
        trade_capt_qty, strike_releas_qty, strike_capt_qty, total_realize_pandl, 
        over_night_pandl, sum_realize_pandl, total_open_posi_fee, total_close_posi_fee, 
        out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, out_strike_capt_qty, 
        over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, diff_qty, 
        t0_buy_type, remark_info 
        from db_tdsecu.tb_tdset0_opor_stock_source;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1301";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* update ~交易证券_T0_操作员券源设置表^ set {隔夜盈亏} = ({隔夜盈亏}+{总实现盈亏}) where {成交占用数量} <>  {成交释放数量}; */
    update db_tdsecu.tb_tdset0_opor_stock_source set over_night_pandl = (over_night_pandl+total_realize_pandl) where strike_capt_qty <>  strike_releas_qty;

    /* [更新表记录][交易证券_T0_操作员券源设置表][{数量差额} = {数量差额} + {成交释放数量} - {成交占用数量}][1=1][1302][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, diff_qty = diff_qty + strike_releas_qty - strike_capt_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_操作员券源设置表][{隔夜仓强平交易买入数量}= 0,{隔夜仓强平交易卖出数量}=0,{隔夜仓强平成交卖出数量}=0,{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0,{总实现盈亏} = 0,{总开仓费用} = 0,{总平仓费用} = 0,{外部交易释放数量} = 0,{外部交易占用数量} = 0,{外部成交释放数量} = 0,{外部成交占用数量} = 0][1=1][1302][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, over_night_trade_buy_qty= 0,over_night_trade_sell_qty=0,over_night_strike_sell_qty=0,trade_releas_qty = 0,trade_capt_qty = 0,strike_releas_qty = 0,strike_capt_qty = 0,total_realize_pandl = 0,total_open_posi_fee = 0,total_close_posi_fee = 0,out_order_releas_qty = 0,out_order_capt_qty = 0,out_strike_releas_qty = 0,out_strike_capt_qty = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #增加券源流水表的归档。Modify by wjp20180929

    /* set @数据表名称# = "~交易证券_T0_操作员券源设置流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_opor_stock_source_jour";

    /* [数据归历史][交易证券_T0_操作员券源设置流水表][字段][{初始化日期}<=@初始化日期#][1303][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_opor_stock_source_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info 
        from db_tdsecu.tb_tdset0_opor_stock_source_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1303";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_操作员券源设置流水表][{初始化日期}<=@初始化日期#][1304][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_opor_stock_source_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1304";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #set @数据表名称# = "~交易证券_T0_交易组业务资金表^";
    #[不分日期数据归历史][交易证券_T0_交易组业务资金表][字段][1305][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_T0_交易组业务资金表][{当前金额}={当前金额} + {成交释放金额} - {成交占用金额}][1=1][1302][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_T0_交易组业务资金表][{交易释放金额} = 0,{交易占用金额} = 0,{成交释放金额} = 0,{成交占用金额} = 0,{指令占用金额}=0,{指令释放金额}=0][1=1][1302][@初始化日期#,@数据表名称#]
    #汇总表先删除所有记录，再根据剩下的明细表再次进行汇总

    /* set @数据表名称# = "~交易证券_T0_证券持仓汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_stock_posi_sum";

    /* [删除表记录][交易证券_T0_证券持仓汇总表][1=1][1262][@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_stock_posi_sum 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1262";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* 调用【原子_交易证券_T0_锁定获取持仓明细记录】*/
        call db_tdsecu.pra_tdset0_LockGetPosiDetail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info,
            v_detail_posi_id,
            v_busi_opor_no,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_lngsht_type,
            v_curr_qty,
            v_open_posi_date,
            v_open_posi_time,
            v_open_posi_price,
            v_open_posi_value,
            v_open_posi_fee,
            v_close_posi_qty,
            v_close_posi_date,
            v_close_posi_time,
            v_close_posi_market_value,
            v_close_posi_fee,
            v_strike_no,
            v_realize_pandl,
            v_over_night_pandl,
            v_posi_status);

        /* set @操作员编号# = @业务操作员编号#; */
        set v_opor_no = v_busi_opor_no;

        /* set @总实现盈亏#=0; */
        set v_total_realize_pandl=0;

        /* set @总多头当前数量#=0; */
        set v_total_long_curr_qty=0;

        /* set @总空头当前数量#=0; */
        set v_total_short_curr_qty=0;

        /* set @总多头开仓市值#=0; */
        set v_total_long_open_posi_value=0;

        /* set @总空头开仓市值#=0; */
        set v_total_short_open_posi_value=0;

        /* set @总多头开仓费用#=0; */
        set v_total_long_open_posi_fee=0;

        /* set @总空头开仓费用#=0; */
        set v_total_short_open_posi_fee=0;

        /* set @总多头平仓市值#=0; */
        set v_total_long_close_posi_value=0;

        /* set @总空头平仓市值#=0; */
        set v_total_short_close_posi_value=0;

        /* set @总多头平仓数量#=0; */
        set v_total_long_close_posi_qty=0;

        /* set @总空头平仓数量#=0; */
        set v_total_short_close_posi_qty=0;

        /* set @总多头平仓费用#=0; */
        set v_total_long_close_posi_fee=0;

        /* set @总空头平仓费用#=0; */
        set v_total_short_close_posi_fee=0;

        /* set @多头当前数量#=0; */
        set v_long_curr_qty=0;

        /* set @空头当前数量#=0; */
        set v_short_curr_qty=0;

        /* set @多头开仓市值#=0; */
        set v_long_open_posi_value=0;

        /* set @空头开仓市值#=0; */
        set v_short_open_posi_value=0;

        /* set @多头开仓费用#=0; */
        set v_long_open_posi_fee=0;

        /* set @空头开仓费用#=0; */
        set v_short_open_posi_fee=0;

        /* set @多头平仓数量#=0; */
        set v_long_close_posi_qty=0;

        /* set @空头平仓数量#=0; */
        set v_short_close_posi_qty=0;

        /* set @多头平仓市值#=0; */
        set v_long_close_posi_value=0;

        /* set @空头平仓市值#=0; */
        set v_short_close_posi_value=0;

        /* set @多头平仓费用#=0; */
        set v_long_close_posi_fee=0;

        /* set @空头平仓费用#=0; */
        set v_short_close_posi_fee=0;

        /* set @实现盈亏#=0; */
        set v_realize_pandl=0;

        /* set @记录序号# = @明细持仓序号#; */
        set v_row_id = v_detail_posi_id;

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* if @多空类型#= 《多空类型-多头》 then */
            if v_lngsht_type= 1 then

                /* set @总多头当前数量# = @当前数量#; */
                set v_total_long_curr_qty = v_curr_qty;

                /* set @多头当前数量# = @当前数量#; */
                set v_long_curr_qty = v_curr_qty;

                /* set @总多头开仓市值# = @开仓市值#; */
                set v_total_long_open_posi_value = v_open_posi_value;

                /* set @多头开仓市值# = @开仓市值#; */
                set v_long_open_posi_value = v_open_posi_value;

                /* set @总多头开仓费用# = @开仓费用#; */
                set v_total_long_open_posi_fee = v_open_posi_fee;

                /* set @多头开仓费用# = @开仓费用#; */
                set v_long_open_posi_fee = v_open_posi_fee;

                /* set @总多头平仓市值# = @平仓市值#; */
                set v_total_long_close_posi_value = v_close_posi_market_value;

                /* set @多头平仓市值# = @平仓市值#; */
                set v_long_close_posi_value = v_close_posi_market_value;

                /* set @总多头平仓数量# = @平仓数量#; */
                set v_total_long_close_posi_qty = v_close_posi_qty;

                /* set @多头平仓数量# = @平仓数量#; */
                set v_long_close_posi_qty = v_close_posi_qty;

                /* set @总多头平仓费用# = @平仓费用#; */
                set v_total_long_close_posi_fee = v_close_posi_fee;

                /* set @多头平仓费用# = @平仓费用#; */
                set v_long_close_posi_fee = v_close_posi_fee;

                /* [插入重复更新][交易证券_T0_证券持仓汇总表][字段][字段变量][{总多头当前数量}={总多头当前数量} + @当前数量#,{多头当前数量}={多头当前数量}+@当前数量#,{总多头开仓市值}={总多头开仓市值} + @开仓市值#,{多头开仓市值}={多头开仓市值}+@开仓市值#,{总多头开仓费用}={总多头开仓费用} + @开仓费用#,{多头开仓费用}={多头开仓费用}+@开仓费用#,{总多头平仓市值}={总多头平仓市值} + @平仓市值#,{多头平仓市值}={多头平仓市值}+@平仓市值#,{总多头平仓数量}={总多头平仓数量} + @平仓数量#,{多头平仓数量}={多头平仓数量}+@平仓数量#,{总多头平仓费用}={总多头平仓费用} + @平仓费用#,{多头平仓费用}={多头平仓费用}+@平仓费用#,{隔夜盈亏}={隔夜盈亏} + @隔夜盈亏#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_tdsecu.tb_tdset0_stock_posi_sum (
                    create_date, create_time, update_date, 
                    update_time, update_times, opor_no, co_no, 
                    pd_no, exch_group_no, asset_acco_no, exch_no, 
                    stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
                    total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
                    total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
                    total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
                    long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
                    long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
                    long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
                    realize_pandl, over_night_pandl, open_posi_date, open_posi_time) 
                values(
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_opor_no, v_co_no, 
                    v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                    v_stock_code, v_stock_acco_no, v_stock_code_no, v_total_long_curr_qty, 
                    v_total_short_curr_qty, v_total_long_open_posi_value, v_total_short_open_posi_value, v_total_long_open_posi_fee, 
                    v_total_short_open_posi_fee, v_total_long_close_posi_value, v_total_short_close_posi_value, v_total_long_close_posi_qty, 
                    v_total_short_close_posi_qty, v_total_long_close_posi_fee, v_total_short_close_posi_fee, v_total_realize_pandl, 
                    v_long_curr_qty, v_short_curr_qty, v_long_open_posi_value, v_short_open_posi_value, 
                    v_long_open_posi_fee, v_short_open_posi_fee, v_long_close_posi_qty, v_short_close_posi_qty, 
                    v_long_close_posi_value, v_short_close_posi_value, v_long_close_posi_fee, v_short_close_posi_fee, 
                    v_realize_pandl, v_over_night_pandl, v_open_posi_date, v_open_posi_time) 
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_long_curr_qty=total_long_curr_qty + v_curr_qty,long_curr_qty=long_curr_qty+v_curr_qty,total_long_open_posi_value=total_long_open_posi_value + v_open_posi_value,long_open_posi_value=long_open_posi_value+v_open_posi_value,total_long_open_posi_fee=total_long_open_posi_fee + v_open_posi_fee,long_open_posi_fee=long_open_posi_fee+v_open_posi_fee,total_long_close_posi_value=total_long_close_posi_value + v_close_posi_market_value,long_close_posi_value=long_close_posi_value+v_close_posi_market_value,total_long_close_posi_qty=total_long_close_posi_qty + v_close_posi_qty,long_close_posi_qty=long_close_posi_qty+v_close_posi_qty,total_long_close_posi_fee=total_long_close_posi_fee + v_close_posi_fee,long_close_posi_fee=long_close_posi_fee+v_close_posi_fee,over_night_pandl=over_night_pandl + v_over_night_pandl;
                if v_error_code = "1" then
                            
                    SET v_error_code = "tdsecuA.1.54.1";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
                    end if;
                    leave label_pro;
                end if;

                #[更新表记录][交易证券_T0_操作员阈值设置表][{成交占用金额} ={成交占用金额}+ (@开仓市值# + @开仓费用#),{成交释放金额} = {成交释放金额}+(@平仓市值# - @平仓费用#)][{操作员编号}=@操作员编号#][1302][""]
                #[更新表记录][交易证券_T0_操作员券源设置表][{成交释放数量} = {成交释放数量}+@当前数量#,{成交占用数量} = {成交占用数量}+@平仓数量#,{总开仓费用} = {总开仓费用} + @开仓费用#,{总平仓费用} = {总平仓费用} + @平仓费用#][{操作员编号} = @操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][""]
            else

                /* set @总空头当前数量# = @当前数量#; */
                set v_total_short_curr_qty = v_curr_qty;

                /* set @空头当前数量# = @当前数量#; */
                set v_short_curr_qty = v_curr_qty;

                /* set @总空头开仓市值# = @开仓市值#; */
                set v_total_short_open_posi_value = v_open_posi_value;

                /* set @空头开仓市值# = @开仓市值#; */
                set v_short_open_posi_value = v_open_posi_value;

                /* set @总空头开仓费用# = @开仓费用#; */
                set v_total_short_open_posi_fee = v_open_posi_fee;

                /* set @空头开仓费用# = @开仓费用#; */
                set v_short_open_posi_fee = v_open_posi_fee;

                /* set @总空头平仓市值# = @平仓市值#; */
                set v_total_short_close_posi_value = v_close_posi_market_value;

                /* set @空头平仓市值# = @平仓市值#; */
                set v_short_close_posi_value = v_close_posi_market_value;

                /* set @总空头平仓数量# = @平仓数量#; */
                set v_total_short_close_posi_qty = v_close_posi_qty;

                /* set @空头平仓数量# = @平仓数量#; */
                set v_short_close_posi_qty = v_close_posi_qty;

                /* set @总空头平仓费用# = @平仓费用#; */
                set v_total_short_close_posi_fee = v_close_posi_fee;

                /* set @空头平仓费用# = @平仓费用#; */
                set v_short_close_posi_fee = v_close_posi_fee;

                /* [插入重复更新][交易证券_T0_证券持仓汇总表][字段][字段变量][{总空头当前数量}={总空头当前数量} + @当前数量#,{空头当前数量} ={空头当前数量}+@当前数量#,{总空头开仓市值}={总空头开仓市值} + @开仓市值#,{空头开仓市值}={空头开仓市值} + @开仓市值#,{总空头开仓费用}={总空头开仓费用} + @开仓费用#,{空头开仓费用}={空头开仓费用} + @开仓费用#,{总空头平仓市值}={总空头平仓市值} + @平仓市值#,{空头平仓市值}={空头平仓市值} + @平仓市值#,{总空头平仓数量}={总空头平仓数量} + @平仓数量#,{空头平仓数量}={空头平仓数量} + @平仓数量#,{总空头平仓费用}={总空头平仓费用} + @平仓费用#,{空头平仓费用}={空头平仓费用} + @平仓费用#,{隔夜盈亏}={隔夜盈亏} + @隔夜盈亏#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_tdsecu.tb_tdset0_stock_posi_sum (
                    create_date, create_time, update_date, 
                    update_time, update_times, opor_no, co_no, 
                    pd_no, exch_group_no, asset_acco_no, exch_no, 
                    stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
                    total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
                    total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
                    total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
                    long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
                    long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
                    long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
                    realize_pandl, over_night_pandl, open_posi_date, open_posi_time) 
                values(
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_opor_no, v_co_no, 
                    v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                    v_stock_code, v_stock_acco_no, v_stock_code_no, v_total_long_curr_qty, 
                    v_total_short_curr_qty, v_total_long_open_posi_value, v_total_short_open_posi_value, v_total_long_open_posi_fee, 
                    v_total_short_open_posi_fee, v_total_long_close_posi_value, v_total_short_close_posi_value, v_total_long_close_posi_qty, 
                    v_total_short_close_posi_qty, v_total_long_close_posi_fee, v_total_short_close_posi_fee, v_total_realize_pandl, 
                    v_long_curr_qty, v_short_curr_qty, v_long_open_posi_value, v_short_open_posi_value, 
                    v_long_open_posi_fee, v_short_open_posi_fee, v_long_close_posi_qty, v_short_close_posi_qty, 
                    v_long_close_posi_value, v_short_close_posi_value, v_long_close_posi_fee, v_short_close_posi_fee, 
                    v_realize_pandl, v_over_night_pandl, v_open_posi_date, v_open_posi_time) 
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_short_curr_qty=total_short_curr_qty + v_curr_qty,short_curr_qty =short_curr_qty+v_curr_qty,total_short_open_posi_value=total_short_open_posi_value + v_open_posi_value,short_open_posi_value=short_open_posi_value + v_open_posi_value,total_short_open_posi_fee=total_short_open_posi_fee + v_open_posi_fee,short_open_posi_fee=short_open_posi_fee + v_open_posi_fee,total_short_close_posi_value=total_short_close_posi_value + v_close_posi_market_value,short_close_posi_value=short_close_posi_value + v_close_posi_market_value,total_short_close_posi_qty=total_short_close_posi_qty + v_close_posi_qty,short_close_posi_qty=short_close_posi_qty + v_close_posi_qty,total_short_close_posi_fee=total_short_close_posi_fee + v_close_posi_fee,short_close_posi_fee=short_close_posi_fee + v_close_posi_fee,over_night_pandl=over_night_pandl + v_over_night_pandl;
                if v_error_code = "1" then
                            
                    SET v_error_code = "tdsecuA.1.54.1";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
                    end if;
                    leave label_pro;
                end if;

                #[更新表记录][交易证券_T0_操作员阈值设置表][{成交占用金额} = {成交占用金额}+(@平仓市值# + @平仓费用#),{成交释放金额} = {成交释放金额}+(@开仓市值# - @开仓费用#)][{操作员编号}=@操作员编号#][1302][""]
                #[更新表记录][交易证券_T0_操作员券源设置表][{成交释放数量} = {成交释放数量}+@平仓数量#,{成交占用数量} ={成交占用数量}+ @当前数量#,{总开仓费用} = {总开仓费用} + @开仓费用#,{总平仓费用} = {总平仓费用} + @平仓费用#][{操作员编号} = @操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][""]
            end if;
        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;
    end loop;

    /* set @数据表名称# = "~交易证券_T0_证券平仓成交明细表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_close_posi_strike_detail";

    /* [数据归历史][交易证券_T0_证券平仓成交明细表][字段][{初始化日期}<=@初始化日期#][1240][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_close_posi_strike_detail_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        lngsht_type, detail_posi_id, strike_no, close_posi_date, 
        close_posi_time, close_posi_price, close_posi_qty, close_posi_market_value, 
        close_posi_fee, realize_pandl) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        lngsht_type, detail_posi_id, strike_no, close_posi_date, 
        close_posi_time, close_posi_price, close_posi_qty, close_posi_market_value, 
        close_posi_fee, realize_pandl 
        from db_tdsecu.tb_tdset0_close_posi_strike_detail 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1240";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_证券平仓成交明细表][{初始化日期}<=@初始化日期#][1241][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_close_posi_strike_detail 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1241";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_证券平仓成交明细表][{初始化日期}=@下日初始化日期#][1=1][1253][@下日初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_close_posi_strike_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_T0_持仓作废流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_posi_cancel_jour";

    /* [数据归历史][交易证券_T0_持仓作废流水表][字段][{初始化日期}<=@初始化日期#][1242][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_posi_cancel_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, stock_acco_no, exch_no, stock_code, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        waste_qty, busi_opor_no, waste_date, waste_time, 
        detail_posi_id) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, stock_acco_no, exch_no, stock_code, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        waste_qty, busi_opor_no, waste_date, waste_time, 
        detail_posi_id 
        from db_tdsecu.tb_tdset0_posi_cancel_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1242";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_持仓作废流水表][{初始化日期}<=@初始化日期#][1243][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_posi_cancel_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1243";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_待执行订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_pendorder";

    /* [数据归历史][交易证券_交易_待执行订单表][字段][{订单日期}<=@初始化日期#][1310][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_pendorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, comm_id, 
        comm_batch_no, order_date, order_time, order_batch_no, 
        order_dir, price_type, exec_price_type, price_offset, 
        order_qty, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, order_oper_way, 
        external_no, pend_order_status, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, comm_id, 
        comm_batch_no, order_date, order_time, order_batch_no, 
        order_dir, price_type, exec_price_type, price_offset, 
        order_qty, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, order_oper_way, 
        external_no, pend_order_status, remark_info 
        from db_tdsecu.tb_tdsetd_pendorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1310";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_待执行订单表][{订单日期}<=@初始化日期#][1311][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_pendorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1311";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_策略_策略表^"; */
    set v_table_name = "db_tdsecu.tb_tdsest_strategyorder";

    /* [数据归历史][交易证券_策略_策略表][字段][{策略日期}<=@初始化日期#][1320][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsest_strategyorder_his (
        row_id, create_date, create_time, 
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
        comm_id) 
        select 
        row_id, create_date, create_time, 
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
        comm_id 
        from db_tdsecu.tb_tdsest_strategyorder 
        where strategy_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1320";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_策略_策略表][{策略日期}<=@初始化日期#][1321][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsest_strategyorder 
        where strategy_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1321";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_策略_策略汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdsest_strategyordersum";

    /* [数据归历史][交易证券_策略_策略汇总表][字段][{策略日期}<=@初始化日期#][1320][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsest_strategyordersum_his (
        row_id, create_date, create_time, 
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
        external_no, order_batch_no, comm_batch_no, strategy_oper_way) 
        select 
        row_id, create_date, create_time, 
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
        external_no, order_batch_no, comm_batch_no, strategy_oper_way 
        from db_tdsecu.tb_tdsest_strategyordersum 
        where strategy_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1320";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_策略_策略汇总表][{策略日期}<=@初始化日期#][1321][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsest_strategyordersum 
        where strategy_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1321";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_策略_策略流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdsest_strategyorder_jour";

    /* [数据归历史][交易证券_策略_策略流水表][字段][{策略日期}<=@初始化日期#][1330][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsest_strategyorder_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, comm_opor, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, strategy_batch_no, strategy_id, orig_strategy_id, 
        exch_no, stock_acco_no, stock_acco, stock_type, 
        asset_type, stock_code, stock_code_no, strategy_dir, 
        strategy_qty, cash_strategy_qty, strategy_price, price_type, 
        exch_crncy_type, strategy_date, strategy_time, strategy_status, 
        strategy_deal_status, strategy_deal_kind, order_id, order_qty, 
        order_amt, wtdraw_qty, strike_id, strike_qty, 
        strike_amt, order_batch_no, strategy_oper_way, remark_info, 
        comm_batch_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, comm_opor, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, strategy_batch_no, strategy_id, orig_strategy_id, 
        exch_no, stock_acco_no, stock_acco, stock_type, 
        asset_type, stock_code, stock_code_no, strategy_dir, 
        strategy_qty, cash_strategy_qty, strategy_price, price_type, 
        exch_crncy_type, strategy_date, strategy_time, strategy_status, 
        strategy_deal_status, strategy_deal_kind, order_id, order_qty, 
        order_amt, wtdraw_qty, strike_id, strike_qty, 
        strike_amt, order_batch_no, strategy_oper_way, remark_info, 
        comm_batch_no 
        from db_tdsecu.tb_tdsest_strategyorder_jour 
        where strategy_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1330";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_策略_策略流水表][{策略日期}<=@初始化日期#][1331][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsest_strategyorder_jour 
        where strategy_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1331";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #组合交易

    /* set @数据表名称# = "~交易证券_交易_组合交易流水记录表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_combotradelog";

    /* [数据归历史][交易证券_交易_组合交易流水记录表][字段][{组合日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_combotradelog_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        combo_code, order_batch_no, order_dir, combo_copies, 
        combo_date, combo_time) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        combo_code, order_batch_no, order_dir, combo_copies, 
        combo_date, combo_time 
        from db_tdsecu.tb_tdsetd_combotradelog 
        where combo_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1400";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_组合交易流水记录表][{组合日期}<=@初始化日期#][1401][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_combotradelog 
        where combo_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1401";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_组合持仓表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_comboposi";

    /* [数据归历史][交易证券_账户_组合持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{组合代码},
{证券代码},
{市场编号},
{证券代码编号},
{开仓日期},
{持仓数量},
{当前数量},
{冻结数量},
{解冻数量},
{待交收数量},
{交易冻结数量},
{交易解冻数量},
{交易占用数量},
{交易释放数量},
{成交占用数量},
{成交释放数量},
{成交冻结数量},
{成交解冻数量},
{实现盈亏},
{成本金额},
{利息成本金额},
{利息收益},{持仓状态}][1=1][1410][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_comboposi_his (
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    open_posi_date,
    posi_qty,
    curr_qty,
    frozen_qty,
    unfroz_qty,
    pre_settle_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl,posi_status) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    open_posi_date,
    posi_qty,
    curr_qty,
    frozen_qty,
    unfroz_qty,
    pre_settle_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl,posi_status 
        from db_tdsecu.tb_tdseac_comboposi 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1410";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_组合持仓表][{持仓状态}=《持仓状态-已平仓》][1411][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_comboposi 
        where posi_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1411";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓表][{当前数量} = {当前数量} + {成交释放数量} - {成交占用数量}][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboposi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty + strike_releas_qty - strike_capt_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓表][{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboposi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_releas_qty = 0,trade_capt_qty = 0,strike_releas_qty = 0,strike_capt_qty = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboposi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_组合持仓汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_comboposisum";

    /* [数据归历史][交易证券_账户_组合持仓汇总表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{组合代码},
{证券代码},
{市场编号},
{证券代码编号},
{持仓数量},
{当前数量},
{冻结数量},
{解冻数量},
{待交收数量},
{交易冻结数量},
{交易解冻数量},
{交易占用数量},
{交易释放数量},
{成交占用数量},
{成交释放数量},
{成交冻结数量},
{成交解冻数量},
{实现盈亏},
{成本金额},
{利息成本金额},
{利息收益},{持仓状态}][1=1][1410][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_comboposisum_his (
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    posi_qty,
    curr_qty,
    frozen_qty,
    unfroz_qty,
    pre_settle_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl,posi_status) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    posi_qty,
    curr_qty,
    frozen_qty,
    unfroz_qty,
    pre_settle_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl,posi_status 
        from db_tdsecu.tb_tdseac_comboposisum 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1410";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_组合持仓汇总表][{持仓状态}=《持仓状态-已平仓》][1411][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_comboposisum 
        where posi_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1411";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓汇总表][{当前数量} = {当前数量} + {成交释放数量} - {成交占用数量}][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboposisum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty + strike_releas_qty - strike_capt_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓汇总表][{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboposisum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_releas_qty = 0,trade_capt_qty = 0,strike_releas_qty = 0,strike_capt_qty = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓汇总表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboposisum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_组合收益表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_comboincome";

    /* [数据归历史][交易证券_账户_组合收益表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{开仓日期},
{组合代码},
{组合份数},
{组合状态},
{组合成本},
{组合市值},
{实现盈亏},
{累计实现盈亏},{指令批号},{状态更新日期}][1=1][1420][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_comboincome_his (
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    open_posi_date,
    combo_code,
    combo_copies,
    combo_status,
    combo_cost,
    combo_market_value,
    realize_pandl,
    sum_realize_pandl,comm_batch_no,status_update_date) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    open_posi_date,
    combo_code,
    combo_copies,
    combo_status,
    combo_cost,
    combo_market_value,
    realize_pandl,
    sum_realize_pandl,comm_batch_no,status_update_date 
        from db_tdsecu.tb_tdseac_comboincome 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1420";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合收益表][{实现盈亏} = 0,{组合市值} = 0,{初始化日期}=@下日初始化日期#][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboincome set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl = 0,combo_market_value = 0,init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_组合收益汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_comboincomesum";

    /* [数据归历史][交易证券_账户_组合收益汇总表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},
{机构编号},
{产品编号},
{交易组编号},
{组合代码},
{组合份数},
{组合状态},
{组合成本},
{组合市值},
{实现盈亏},
{累计实现盈亏},{指令批号},{状态更新日期}][1=1][1420][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_comboincomesum_his (
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    combo_code,
    combo_copies,
    combo_status,
    combo_cost,
    combo_market_value,
    realize_pandl,
    sum_realize_pandl,comm_batch_no,status_update_date) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    exch_group_no,
    combo_code,
    combo_copies,
    combo_status,
    combo_cost,
    combo_market_value,
    realize_pandl,
    sum_realize_pandl,comm_batch_no,status_update_date 
        from db_tdsecu.tb_tdseac_comboincomesum 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1420";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合收益汇总表][{实现盈亏} = 0,{组合市值} = 0,{初始化日期}=@下日初始化日期#][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_comboincomesum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl = 0,combo_market_value = 0,init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_组合持仓入账流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_combo_posi_entry_jour";

    /* [数据归历史][交易证券_账户_组合持仓入账流水表][字段][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][1][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdseac_combo_posi_entry_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        occur_qty, old_arrive_date, arrive_date, entry_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, target_code_no, 
        occur_qty, old_arrive_date, arrive_date, entry_status 
        from db_tdsecu.tb_tdseac_combo_posi_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_组合持仓入账流水表][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][3][@初始化日期#] */
    delete from db_tdsecu.tb_tdseac_combo_posi_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_组合持仓入账流水表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_combo_posi_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_体外交易差额记录表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_outtradedifflog";

    /* [数据归历史][交易证券_报盘_体外交易差额记录表][字段][{初始化日期}<=@初始化日期# and {处理状态} =《处理状态-成功》][1][@初始化日期#] */
    insert into db_tdsecu_his.tb_tdserp_outtradedifflog_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        out_acco, stock_acco, exch_no, stock_code, 
        stock_code_no, order_date, order_id, strike_date, 
        strike_id, order_dir, occur_amt, occur_qty, 
        amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
        deal_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        out_acco, stock_acco, exch_no, stock_code, 
        stock_code_no, order_date, order_id, strike_date, 
        strike_id, order_dir, occur_amt, occur_qty, 
        amt_diff, diff_qty, deal_amt_diff, deal_diff_qty, 
        deal_status 
        from db_tdsecu.tb_tdserp_outtradedifflog 
        where init_date<=v_init_date and deal_status ="1";
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_体外交易差额记录表][{初始化日期}<=@初始化日期#  and {处理状态} =《处理状态-成功》][3][@初始化日期#] */
    delete from db_tdsecu.tb_tdserp_outtradedifflog 
        where init_date<=v_init_date  and deal_status ="1";
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_报盘_体外交易差额记录表][{初始化日期}=@下日初始化日期#][1=1][1003][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdserp_outtradedifflog set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1003";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_组合持仓划转流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_combopositransferlog";

    /* [数据归历史][交易证券_账户_组合持仓划转流水表][字段][{初始化日期}<=@初始化日期#][1030][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_combopositransferlog_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, combo_code, stock_code, exch_no, 
        stock_code_no, combo_posi_id, source_date, occur_cost_amt, 
        occur_qty, target_combo_posi_id, target_date, target_combo_code, 
        target_exch_group_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, combo_code, stock_code, exch_no, 
        stock_code_no, combo_posi_id, source_date, occur_cost_amt, 
        occur_qty, target_combo_posi_id, target_date, target_combo_code, 
        target_exch_group_no 
        from db_tdsecu.tb_tdseac_combopositransferlog 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1030";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_组合持仓划转流水表][{初始化日期}<=@初始化日期#][1031][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_combopositransferlog 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1031";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易运维_场外基金成交回报表^"; */
    set v_table_name = "db_tdsecu.tb_tdsebk_off_site_fundrsp";

    /* [数据归历史][交易证券_交易运维_场外基金成交回报表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsebk_off_site_fundrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info 
        from db_tdsecu.tb_tdsebk_off_site_fundrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易运维_场外基金成交回报表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsebk_off_site_fundrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #两融表处理

    /* set @数据表名称# = "~交易证券_账户_交易组业务资金负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_busi_capital_debt";

    /* [数据归历史][交易证券_账户_交易组业务资金负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capital_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        debt_loan_sell_strike_amt, debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, 
        loan_return_comm_amt, return_strike_fee) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        debt_loan_sell_strike_amt, debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, 
        loan_return_comm_amt, return_strike_fee 
        from db_tdsecu.tb_tdseac_exgp_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户业务资金负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_busi_capital_debt";

    /* [数据归历史][交易证券_账户_资产账户业务资金负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capital_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, debt_loan_sell_strike_amt, 
        debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, loan_return_comm_amt, 
        return_strike_fee) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, debt_loan_sell_strike_amt, 
        debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, loan_return_comm_amt, 
        return_strike_fee 
        from db_tdsecu.tb_tdseac_asac_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_交易组业务持仓负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_busi_posi_debt";

    /* [数据归历史][交易证券_账户_交易组业务持仓负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_posi_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, invest_type, debt_type, 
        debt_fina_buy_strike_qty, fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, 
        debt_fina_buy_order_qty, fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, 
        debt_fina_buy_comm_qty, fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, 
        debt_fina_buy_strike_amt, fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, 
        debt_fina_buy_order_amt, fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, 
        debt_fina_buy_comm_amt, fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, 
        debt_strike_fee, return_strike_fee, debt_interest, return_interest_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, invest_type, debt_type, 
        debt_fina_buy_strike_qty, fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, 
        debt_fina_buy_order_qty, fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, 
        debt_fina_buy_comm_qty, fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, 
        debt_fina_buy_strike_amt, fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, 
        debt_fina_buy_order_amt, fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, 
        debt_fina_buy_comm_amt, fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, 
        debt_strike_fee, return_strike_fee, debt_interest, return_interest_amt 
        from db_tdsecu.tb_tdseac_exgp_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务持仓负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户业务持仓负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_busi_posi_debt";

    /* [数据归历史][交易证券_账户_资产账户业务持仓负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_posi_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, invest_type, debt_type, debt_fina_buy_strike_qty, 
        fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, debt_fina_buy_order_qty, 
        fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, debt_fina_buy_comm_qty, 
        fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, debt_fina_buy_strike_amt, 
        fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, debt_fina_buy_order_amt, 
        fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, debt_fina_buy_comm_amt, 
        fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, debt_strike_fee, 
        return_strike_fee, debt_interest, return_interest_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, invest_type, debt_type, debt_fina_buy_strike_qty, 
        fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, debt_fina_buy_order_qty, 
        fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, debt_fina_buy_comm_qty, 
        fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, debt_fina_buy_strike_amt, 
        fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, debt_fina_buy_order_amt, 
        fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, debt_fina_buy_comm_amt, 
        fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, debt_strike_fee, 
        return_strike_fee, debt_interest, return_interest_amt 
        from db_tdsecu.tb_tdseac_asac_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务持仓负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_交易组负债明细表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_debtjour";

    /* [数据归历史][交易证券_账户_交易组负债明细表][字段][{初始化日期}<=@初始化日期# and {负债状态} = 《负债状态-已归还》][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_debtjour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code, 
        stock_code_no, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, debt_order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, debt_status, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code, 
        stock_code_no, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, debt_order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, debt_status, remark_info 
        from db_tdsecu.tb_tdseac_exgp_debtjour 
        where init_date<=v_init_date and debt_status = 2;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组负债明细表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_debtjour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户负债明细表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_debtjour";

    /* [数据归历史][交易证券_账户_资产账户负债明细表][字段][{初始化日期}<=@初始化日期# and {负债状态} = 《负债状态-已归还》][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_debtjour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, debt_order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, debt_status, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, debt_order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, debt_status, remark_info 
        from db_tdsecu.tb_tdseac_asac_debtjour 
        where init_date<=v_init_date and debt_status = 2;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.54.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户负债明细表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_debtjour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.54.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_新增组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_AddCombo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_AddCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_combo_code varchar(32),
    IN p_comb_name varchar(64),
    IN p_is_public int,
    IN p_create_failure_validity_date int,
    IN p_create_end_validity_date int,
    IN p_rebalance_failure_validity_date int,
    IN p_rebalance_end_validity_date int,
    IN p_repair_failure_validity_date int,
    IN p_repair_end_validity_date int,
    IN p_broke_validity_date int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_combo_id bigint
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
    declare v_combo_code varchar(32);
    declare v_comb_name varchar(64);
    declare v_is_public int;
    declare v_create_failure_validity_date int;
    declare v_create_end_validity_date int;
    declare v_rebalance_failure_validity_date int;
    declare v_rebalance_end_validity_date int;
    declare v_repair_failure_validity_date int;
    declare v_repair_end_validity_date int;
    declare v_broke_validity_date int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_id bigint;
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
    SET v_combo_code = p_combo_code;
    SET v_comb_name = p_comb_name;
    SET v_is_public = p_is_public;
    SET v_create_failure_validity_date = p_create_failure_validity_date;
    SET v_create_end_validity_date = p_create_end_validity_date;
    SET v_rebalance_failure_validity_date = p_rebalance_failure_validity_date;
    SET v_rebalance_end_validity_date = p_rebalance_end_validity_date;
    SET v_repair_failure_validity_date = p_repair_failure_validity_date;
    SET v_repair_end_validity_date = p_repair_end_validity_date;
    SET v_broke_validity_date = p_broke_validity_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][交易证券_公用_组合表][字段][字段变量][1][@组合名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_combo(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        combo_code, comb_name, is_public, create_failure_validity_date, 
        create_end_validity_date, rebalance_failure_validity_date, rebalance_end_validity_date, repair_failure_validity_date, 
        repair_end_validity_date, broke_validity_date, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_combo_code, v_comb_name, v_is_public, v_create_failure_validity_date, 
        v_create_end_validity_date, v_rebalance_failure_validity_date, v_rebalance_end_validity_date, v_repair_failure_validity_date, 
        v_repair_end_validity_date, v_broke_validity_date, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.31.1";
        SET v_error_info =  CONCAT(concat("组合名称=",v_comb_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@组合序号#] */
    select LAST_INSERT_ID() into v_combo_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_combo_id = v_combo_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_修改组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_ModiCombo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_ModiCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_id bigint,
    IN p_combo_code varchar(32),
    IN p_comb_name varchar(64),
    IN p_is_public int,
    IN p_create_failure_validity_date int,
    IN p_create_end_validity_date int,
    IN p_rebalance_failure_validity_date int,
    IN p_rebalance_end_validity_date int,
    IN p_repair_failure_validity_date int,
    IN p_repair_end_validity_date int,
    IN p_broke_validity_date int,
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
    declare v_combo_id bigint;
    declare v_combo_code varchar(32);
    declare v_comb_name varchar(64);
    declare v_is_public int;
    declare v_create_failure_validity_date int;
    declare v_create_end_validity_date int;
    declare v_rebalance_failure_validity_date int;
    declare v_rebalance_end_validity_date int;
    declare v_repair_failure_validity_date int;
    declare v_repair_end_validity_date int;
    declare v_broke_validity_date int;
    declare v_remark_info varchar(255);
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
    SET v_combo_id = p_combo_id;
    SET v_combo_code = p_combo_code;
    SET v_comb_name = p_comb_name;
    SET v_is_public = p_is_public;
    SET v_create_failure_validity_date = p_create_failure_validity_date;
    SET v_create_end_validity_date = p_create_end_validity_date;
    SET v_rebalance_failure_validity_date = p_rebalance_failure_validity_date;
    SET v_rebalance_end_validity_date = p_rebalance_end_validity_date;
    SET v_repair_failure_validity_date = p_repair_failure_validity_date;
    SET v_repair_end_validity_date = p_repair_end_validity_date;
    SET v_broke_validity_date = p_broke_validity_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_公用_组合表][{组合代码}=@组合代码#, {组合名称}=@组合名称#,{是否公用} = @是否公用#, {备注信息}=@备注信息#,{创建失败有效期} = @创建失败有效期#,{创建结束有效期} = @创建结束有效期#,{再平衡失败有效期} = @再平衡失败有效期#,{再平衡结束有效期} = @再平衡结束有效期#,{补单失败有效期} = @补单失败有效期#,{补单结束有效期} = @补单结束有效期#,{破坏有效期} = @破坏有效期#][{记录序号}=@组合序号# and {机构编号} = @操作员机构编号#][2][@组合序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsepb_combo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_code=v_combo_code, comb_name=v_comb_name,is_public = v_is_public, remark_info=v_remark_info,create_failure_validity_date = v_create_failure_validity_date,create_end_validity_date = v_create_end_validity_date,rebalance_failure_validity_date = v_rebalance_failure_validity_date,rebalance_end_validity_date = v_rebalance_end_validity_date,repair_failure_validity_date = v_repair_failure_validity_date,repair_end_validity_date = v_repair_end_validity_date,broke_validity_date = v_broke_validity_date where row_id=v_combo_id and co_no = v_opor_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组合序号=",v_combo_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("组合序号=",v_combo_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_删除组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_DelCombo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_DelCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_id bigint,
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
    declare v_combo_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_code varchar(32);

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
    SET v_combo_id = p_combo_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_code = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_公用_组合表][{组合代码}][@组合代码#][{记录序号}=@组合序号#][4][@组合序号#] */
    select combo_code into v_combo_code from db_tdsecu.tb_tdsepb_combo where row_id=v_combo_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.1.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组合序号=",v_combo_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("组合序号=",v_combo_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_公用_组合表][{记录序号}=@组合序号#][3][@组合序号#] */
    delete from db_tdsecu.tb_tdsepb_combo 
        where row_id=v_combo_id;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.33.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组合序号=",v_combo_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("组合序号=",v_combo_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_公用_组合证券表][{组合代码}=@组合代码#][3][@组合代码#] */
    delete from db_tdsecu.tb_tdsepb_combostock 
        where combo_code=v_combo_code;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.33.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组合代码=",v_combo_code),"#",v_mysql_message);
        else
            SET v_error_info = concat("组合代码=",v_combo_code);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_查询组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_QueryCombo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_QueryCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_公用_组合表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, combo_code, comb_name, is_public, 
        create_failure_validity_date, create_end_validity_date, rebalance_failure_validity_date, rebalance_end_validity_date, 
        repair_failure_validity_date, repair_end_validity_date, broke_validity_date, remark_info from db_tdsecu.tb_tdsepb_combo where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no=0 or opor_no=v_query_opor_no);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, combo_code, comb_name, is_public, 
        create_failure_validity_date, create_end_validity_date, rebalance_failure_validity_date, rebalance_end_validity_date, 
        repair_failure_validity_date, repair_end_validity_date, broke_validity_date, remark_info from db_tdsecu.tb_tdsepb_combo where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no=0 or opor_no=v_query_opor_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_获取单个组合
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetSingleCombo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetSingleCombo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_combo_code varchar(32),
    OUT p_comb_name varchar(64),
    OUT p_is_public int,
    OUT p_create_failure_validity_date int,
    OUT p_create_end_validity_date int,
    OUT p_rebalance_failure_validity_date int,
    OUT p_rebalance_end_validity_date int,
    OUT p_repair_failure_validity_date int,
    OUT p_repair_end_validity_date int,
    OUT p_broke_validity_date int,
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
    declare v_combo_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_combo_code varchar(32);
    declare v_comb_name varchar(64);
    declare v_is_public int;
    declare v_create_failure_validity_date int;
    declare v_create_end_validity_date int;
    declare v_rebalance_failure_validity_date int;
    declare v_rebalance_end_validity_date int;
    declare v_repair_failure_validity_date int;
    declare v_repair_end_validity_date int;
    declare v_broke_validity_date int;
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
    SET v_combo_id = p_combo_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_combo_code = " ";
    SET v_comb_name = " ";
    SET v_is_public = 0;
    SET v_create_failure_validity_date = 0;
    SET v_create_end_validity_date = 0;
    SET v_rebalance_failure_validity_date = 0;
    SET v_rebalance_end_validity_date = 0;
    SET v_repair_failure_validity_date = 0;
    SET v_repair_end_validity_date = 0;
    SET v_broke_validity_date = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_公用_组合表][字段][字段变量][{记录序号}=@组合序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, combo_code, comb_name, is_public, 
        create_failure_validity_date, create_end_validity_date, rebalance_failure_validity_date, rebalance_end_validity_date, 
        repair_failure_validity_date, repair_end_validity_date, broke_validity_date, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_combo_code, v_comb_name, v_is_public, 
        v_create_failure_validity_date, v_create_end_validity_date, v_rebalance_failure_validity_date, v_rebalance_end_validity_date, 
        v_repair_failure_validity_date, v_repair_end_validity_date, v_broke_validity_date, v_remark_info from db_tdsecu.tb_tdsepb_combo where row_id=v_combo_id limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_combo_code = v_combo_code;
    SET p_comb_name = v_comb_name;
    SET p_is_public = v_is_public;
    SET p_create_failure_validity_date = v_create_failure_validity_date;
    SET p_create_end_validity_date = v_create_end_validity_date;
    SET p_rebalance_failure_validity_date = v_rebalance_failure_validity_date;
    SET p_rebalance_end_validity_date = v_rebalance_end_validity_date;
    SET p_repair_failure_validity_date = v_repair_failure_validity_date;
    SET p_repair_end_validity_date = v_repair_end_validity_date;
    SET p_broke_validity_date = v_broke_validity_date;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_新增组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_AddComboStock;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_AddComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_combo_code varchar(32),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_combo_ratio decimal(18,12),
    IN p_combo_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_combo_stock_id bigint
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
    declare v_combo_code varchar(32);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_combo_ratio decimal(18,12);
    declare v_combo_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_combo_stock_id bigint;
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
    SET v_combo_code = p_combo_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_combo_ratio = p_combo_ratio;
    SET v_combo_qty = p_combo_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_combo_stock_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][交易证券_公用_组合证券表][字段][字段变量][1][@组合代码#,@证券代码#,@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_combostock(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        combo_code, exch_no, stock_code, stock_code_no, 
        combo_ratio, combo_qty) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_combo_code, v_exch_no, v_stock_code, v_stock_code_no, 
        v_combo_ratio, v_combo_qty);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.36.1";
        SET v_error_info =  CONCAT(concat("组合代码=",v_combo_code,",","证券代码=",v_stock_code,",","市场编号=",v_exch_no),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@组合证券序号#] */
    select LAST_INSERT_ID() into v_combo_stock_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_combo_stock_id = v_combo_stock_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_修改组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_ModiComboStock;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_ModiComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_stock_id bigint,
    IN p_combo_code varchar(32),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_combo_ratio decimal(18,12),
    IN p_combo_qty decimal(18,2),
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
    declare v_combo_stock_id bigint;
    declare v_combo_code varchar(32);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_combo_ratio decimal(18,12);
    declare v_combo_qty decimal(18,2);
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
    SET v_combo_stock_id = p_combo_stock_id;
    SET v_combo_code = p_combo_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_combo_ratio = p_combo_ratio;
    SET v_combo_qty = p_combo_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_公用_组合证券表][{组合代码}=@组合代码#, {市场编号}=@市场编号#,{证券代码}=@证券代码#, {证券代码编号}=@证券代码编号#,{组合比例} = @组合比例#,{组合数量} = @组合数量#][{记录序号}=@组合证券序号# and {机构编号} = @操作员机构编号#][2][@组合证券序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsepb_combostock set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, combo_code=v_combo_code, exch_no=v_exch_no,stock_code=v_stock_code, stock_code_no=v_stock_code_no,combo_ratio = v_combo_ratio,combo_qty = v_combo_qty where row_id=v_combo_stock_id and co_no = v_opor_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.37.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组合证券序号=",v_combo_stock_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("组合证券序号=",v_combo_stock_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_删除组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_DelComboStock;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_DelComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_code varchar(32),
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
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
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
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][交易证券_公用_组合证券表][{组合代码}=@组合代码# and {证券代码编号} = @证券代码编号#][3][@组合代码#,@证券代码编号#] */
    delete from db_tdsecu.tb_tdsepb_combostock 
        where combo_code=v_combo_code and stock_code_no = v_stock_code_no;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.38.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("组合代码=",v_combo_code,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_查询组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_QueryComboStock;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_QueryComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_combo_code varchar(32),
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
    declare v_query_opor_no int;
    declare v_combo_code varchar(32);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_combo_code = p_combo_code;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_公用_组合证券表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#) and ( @组合代码# = " " or {组合代码} = @组合代码#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, combo_code, exch_no, stock_code, 
        stock_code_no, combo_ratio, combo_qty from db_tdsecu.tb_tdsepb_combostock where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no=0 or opor_no=v_query_opor_no) and ( v_combo_code = " " or combo_code = v_combo_code);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, combo_code, exch_no, stock_code, 
        stock_code_no, combo_ratio, combo_qty from db_tdsecu.tb_tdsepb_combostock where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no=0 or opor_no=v_query_opor_no) and ( v_combo_code = " " or combo_code = v_combo_code) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_获取单个组合证券
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetSingleComboStock;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetSingleComboStock(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_combo_code varchar(32),
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_combo_ratio decimal(18,12),
    OUT p_combo_qty decimal(18,2),
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
    declare v_combo_code varchar(32);
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_combo_ratio decimal(18,12);
    declare v_combo_qty decimal(18,2);
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
    SET v_combo_code = p_combo_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_combo_ratio = 0;
    SET v_combo_qty = 0;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_公用_组合证券表][字段][字段变量][{组合代码}=@组合代码# and {证券代码编号} = @证券代码编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, combo_code, exch_no, stock_code, 
        stock_code_no, combo_ratio, combo_qty into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_combo_code, v_exch_no, v_stock_code, 
        v_stock_code_no, v_combo_ratio, v_combo_qty from db_tdsecu.tb_tdsepb_combostock where combo_code=v_combo_code and stock_code_no = v_stock_code_no limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_combo_ratio = v_combo_ratio;
    SET p_combo_qty = v_combo_qty;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_查询获取t0机构
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_QueryGetT0Company;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_QueryGetT0Company(
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
    
    select distinct co_no from tb_tdset0_opor_tshold_set;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_归档更新t0资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_BackUpUpdateT0Capit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_BackUpUpdateT0Capit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_deal_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_T0_limit_method int;
    declare v_table_name varchar(64);
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
    SET v_co_no = p_co_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_deal_flag = p_deal_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_T0_limit_method = 0;
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* set @数据表名称# = "~交易证券_T0_操作员阈值设置表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_opor_tshold_set";
    #只归档1次 modify by wjp 20181030

    /* if @处理标志# = 0  then */
    if v_deal_flag = 0  then

        /* [删除表记录][交易证券_T0_历史操作员阈值设置表][{初始化日期}=@初始化日期#][4][@初始化日期#] */
        delete from db_tdsecu_his.tb_tdset0_opor_tshold_set_his 
            where init_date=v_init_date;
        if v_error_code = 1 then
                    
            SET v_error_code = "tdsecuA.1.42.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
            leave label_pro;
        end if;


       /* [不分日期数据归历史][交易证券_T0_操作员阈值设置表][字段][1301][@初始化日期#,@数据表名称#] */
       insert into db_tdsecu_his.tb_tdset0_opor_tshold_set_his (init_date,
           create_date, create_time, update_date, 
           update_time, update_times, co_no, opor_no, 
           begin_amt, curr_amt, frozen_amt, opor_warn_tshold, 
           opor_stop_tshold, order_limit_time, per_secu_posi_ratio, posi_limit_time, 
           order_ctrl_qty, order_ctrl_amt, stock_warn_ratio, stock_stop_ratio, 
           stock_warn_amt, stock_stop_amt, trig_oper_type, open_close_permission, 
           risk_oper, fee_calc_type, permit_margin_trade, buy_fee_ratio, 
           sell_fee_ratio, buy_min_fee, sell_min_fee, trade_capt_amt, 
           trade_releas_amt, strike_capt_amt, strike_releas_amt, sum_realize_pandl, 
           amt_diff, remark_info) 
           select v_init_date,
           create_date, create_time, update_date, 
           update_time, update_times, co_no, opor_no, 
           begin_amt, curr_amt, frozen_amt, opor_warn_tshold, 
           opor_stop_tshold, order_limit_time, per_secu_posi_ratio, posi_limit_time, 
           order_ctrl_qty, order_ctrl_amt, stock_warn_ratio, stock_stop_ratio, 
           stock_warn_amt, stock_stop_amt, trig_oper_type, open_close_permission, 
           risk_oper, fee_calc_type, permit_margin_trade, buy_fee_ratio, 
           sell_fee_ratio, buy_min_fee, sell_min_fee, trade_capt_amt, 
           trade_releas_amt, strike_capt_amt, strike_releas_amt, sum_realize_pandl, 
           amt_diff, remark_info 
           from db_tdsecu.tb_tdset0_opor_tshold_set;
       if v_error_code = "1" then
                   
           SET v_error_code = "tdsecuA.1.42.1301";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
               else
                   SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
               end if;
           leave label_pro;
       end if;

    end if;

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then

        /* [更新表记录][交易证券_T0_操作员阈值设置表][{金额差额} = {金额差额} + {成交释放金额} - {成交占用金额}][{操作员编号}<>0 and {机构编号}=@机构编号#][1302][@初始化日期#,@数据表名称#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_diff = amt_diff + strike_releas_amt - strike_capt_amt where opor_no<>0 and co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.1.42.1302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][交易证券_T0_操作员阈值设置表][{当前金额}={当前金额} + {成交释放金额} - {成交占用金额},{金额差额} = {金额差额} + {成交释放金额} - {成交占用金额}][{操作员编号}<>0 and {机构编号}=@机构编号#][1302][@初始化日期#,@数据表名称#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt + strike_releas_amt - strike_capt_amt,amt_diff = amt_diff + strike_releas_amt - strike_capt_amt where opor_no<>0 and co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.1.42.1302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
            leave label_pro;
        end if;

    end if;
    #[更新表记录][交易证券_T0_操作员阈值设置表][{当前金额}={当前金额} + {成交释放金额} - {成交占用金额}][1=1][1302][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_T0_操作员阈值设置表][{金额差额} = {金额差额} + {成交释放金额} - {成交占用金额}][1=1][1302][@初始化日期#,@数据表名称#]

    /* [更新表记录][交易证券_T0_操作员阈值设置表][{交易占用金额} = 0,{交易释放金额} = 0,{成交占用金额} = 0,{成交释放金额} = 0][{操作员编号}<>0 and {机构编号}=@机构编号#][1302][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_capt_amt = 0,trade_releas_amt = 0,strike_capt_amt = 0,strike_releas_amt = 0 where opor_no<>0 and co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.42.1302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_T0_交易组业务资金表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_exgp_busi_capit";

    /* if @处理标志# = 0  then */
    if v_deal_flag = 0  then

        /* [删除表记录][交易证券_T0_历史交易组业务资金表][{初始化日期}=@初始化日期#][4][@初始化日期#] */
        delete from db_tdsecu_his.tb_tdset0_exgp_busi_capit_his 
            where init_date=v_init_date;
        if v_error_code = 1 then
                    
            SET v_error_code = "tdsecuA.1.42.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
            leave label_pro;
        end if;


        /* [不分日期数据归历史][交易证券_T0_交易组业务资金表][字段][1305][@初始化日期#,@数据表名称#] */
        insert into db_tdsecu_his.tb_tdset0_exgp_busi_capit_his (init_date,
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, opor_no, exch_crncy_type, 
            begin_amt, curr_amt, frozen_amt, unfroz_amt, 
            comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
            trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, trade_releas_amt, 
            strike_capt_amt, strike_releas_amt) 
            select v_init_date,
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, opor_no, exch_crncy_type, 
            begin_amt, curr_amt, frozen_amt, unfroz_amt, 
            comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
            trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, trade_releas_amt, 
            strike_capt_amt, strike_releas_amt 
            from db_tdsecu.tb_tdset0_exgp_busi_capit;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.1.42.1305";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
                else
                    SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
                end if;
            leave label_pro;
        end if;

    end if;
    #机构限额 则 当前金额不变 从而不影响 可用金额。

    /* if @T0限额方式# = 《T0限额方式-不限额》 then */
    if v_T0_limit_method = 0 then

        /* [更新表记录][交易证券_T0_交易组业务资金表][{当前金额}={当前金额} + {成交释放金额} - {成交占用金额}][{操作员编号}<>0 and {机构编号}=@机构编号#][1306][@初始化日期#,@数据表名称#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt + strike_releas_amt - strike_capt_amt where opor_no<>0 and co_no=v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.1.42.1306";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [更新表记录][交易证券_T0_交易组业务资金表][{交易释放金额} = 0,{交易占用金额} = 0,{成交释放金额} = 0,{成交占用金额} = 0,{指令占用金额}=0,{指令释放金额}=0][{操作员编号}<>0 and {机构编号}=@机构编号#][1307][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_releas_amt = 0,trade_capt_amt = 0,strike_releas_amt = 0,strike_capt_amt = 0,comm_capt_amt=0,comm_releas_amt=0 where opor_no<>0 and co_no=v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.42.1307";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券指令冻结金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanCommFrozenAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanCommFrozenAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_calc_dir int,
    IN p_comm_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_frozen_amt decimal(18,4),
    OUT p_comm_frozen_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_calc_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_frozen_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_calc_dir = p_calc_dir;
    SET v_comm_amt = p_comm_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_frozen_amt = 0;
    SET v_comm_frozen_qty = 0;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令冻结金额#=0; */
    set v_comm_frozen_amt=0;

    /* set @指令冻结数量#=0; */
    set v_comm_frozen_qty=0;

    /* if @指令方向#=《指令方向-买入》 or @指令方向#=《指令方向-买券还券》 then */
    if v_comm_dir=1 or v_comm_dir=8 then

        /* set @指令冻结金额#=@指令实际限价# * @指令数量#; */
        set v_comm_frozen_amt=v_limit_actual_price * v_comm_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @指令冻结金额#=@指令冻结金额# + @债券计提利息# * @指令数量#; */
            set v_comm_frozen_amt=v_comm_frozen_amt + v_bond_accr_intrst * v_comm_qty;
        end if;

    /* elseif @指令方向#=《指令方向-卖出》 or  @指令方向#=《指令方向-卖券还款》  then */
    elseif v_comm_dir=2 or  v_comm_dir=7  then

        /* set @指令冻结数量#=@指令数量#; */
        set v_comm_frozen_qty=v_comm_qty;

    /* elseif @指令方向#=《指令方向-直接还款》  then */
    elseif v_comm_dir=14  then

        /* set @指令冻结金额#=@指令金额#; */
        set v_comm_frozen_amt=v_comm_amt;

    /* elseif @指令方向#=《指令方向-直接还券》   then */
    elseif v_comm_dir=15   then

        /* set @指令冻结数量#=@指令数量#; */
        set v_comm_frozen_qty=v_comm_qty;
    end if;

    /* set @指令冻结金额#=Round(@计算方向# * @指令冻结金额#,2); */
    set v_comm_frozen_amt=Round(v_calc_dir * v_comm_frozen_amt,2);

    /* set @指令冻结数量#=@计算方向# * @指令冻结数量#; */
    set v_comm_frozen_qty=v_calc_dir * v_comm_frozen_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_frozen_amt = v_comm_frozen_amt;
    SET p_comm_frozen_qty = v_comm_frozen_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券指令变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanCommOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanCommOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_comm_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_calc_dir int,
    IN p_comm_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_calc_dir int;
    declare v_comm_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_comm_qty = p_comm_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_calc_dir = p_calc_dir;
    SET v_comm_amt = p_comm_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;

    
    label_pro:BEGIN
    

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* if @指令方向# = 《指令方向-直接还款》 then */
    if v_comm_dir = 14 then

        /* set @指令变动金额# = @指令金额#; */
        set v_comm_occur_amt = v_comm_amt;

    /* elseif @指令方向# = 《指令方向-直接还券》 then */
    elseif v_comm_dir = 15 then

        /* set @指令变动数量#= @指令数量# * @计算方向#; */
        set v_comm_occur_qty= v_comm_qty * v_calc_dir;
    else

        /* set @指令变动数量#= @指令数量# * @计算方向#; */
        set v_comm_occur_qty= v_comm_qty * v_calc_dir;

        /* set @指令变动金额#=@指令实际限价# * @指令数量#; */
        set v_comm_occur_amt=v_limit_actual_price * v_comm_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @指令变动金额#=@指令变动金额# + @债券计提利息# * @指令数量#; */
            set v_comm_occur_amt=v_comm_occur_amt + v_bond_accr_intrst * v_comm_qty;
        end if;
    end if;

    /* set @指令变动金额#=Round(@指令变动金额#* @计算方向#,2); */
    set v_comm_occur_amt=Round(v_comm_occur_amt* v_calc_dir,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券交易冻结金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanExchFrozenAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanExchFrozenAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_all_fee decimal(18,4),
    IN p_order_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_frozen_amt decimal(18,4),
    OUT p_trade_frozen_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_all_fee decimal(18,4);
    declare v_order_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_frozen_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_all_fee = p_all_fee;
    SET v_order_amt = p_order_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_frozen_amt = 0;
    SET v_trade_frozen_qty = 0;

    
    label_pro:BEGIN
    
    #交易冻结金额获取

    /* if @订单方向#=《订单方向-买入》 or @订单方向#=《订单方向-买券还券》  then */
    if v_order_dir=1 or v_order_dir=8  then

        /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @交易冻结金额#=@订单数量# * (@订单价格# + @债券计提利息#) + @全部费用#; */
            set v_trade_frozen_amt=v_order_qty * (v_order_price + v_bond_accr_intrst) + v_all_fee;
        else

            /* set @交易冻结金额#=@订单数量# * @订单价格# + @全部费用#; */
            set v_trade_frozen_amt=v_order_qty * v_order_price + v_all_fee;
        end if;

        /* set @交易冻结数量#=0; */
        set v_trade_frozen_qty=0;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向#=《订单方向-卖券还款》   or @订单方向#=《订单方向-直接还券》 then */
    elseif v_order_dir = 2 or v_order_dir=7   or v_order_dir=15 then

        /* set @交易冻结金额#=0; */
        set v_trade_frozen_amt=0;

        /* set @交易冻结数量#=@订单数量#; */
        set v_trade_frozen_qty=v_order_qty;

    /* elseif @订单方向# = 《订单方向-直接还款》   then */
    elseif v_order_dir = 14   then

        /* set @交易冻结金额#=@订单金额#; */
        set v_trade_frozen_amt=v_order_amt;

        /* set @交易冻结数量#=0; */
        set v_trade_frozen_qty=0;
    end if;

    /* set @交易冻结金额#=Round(@交易冻结金额#,2); */
    set v_trade_frozen_amt=Round(v_trade_frozen_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_frozen_amt = v_trade_frozen_amt;
    SET p_trade_frozen_qty = v_trade_frozen_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券交易变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanTradeOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanTradeOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;

    
    label_pro:BEGIN
    
    #交易变动金额获取

    /* set @交易变动金额# = 0; */
    set v_trade_occur_amt = 0;

    /* set @交易变动数量# = 0; */
    set v_trade_occur_qty = 0;

    /* if @订单方向# = 《订单方向-直接还款》   then */
    if v_order_dir = 14   then

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

    /* elseif @订单方向# = 《订单方向-买入》 then */
    elseif v_order_dir = 1 then

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

        /* set @交易变动数量#= @订单数量#; */
        set v_trade_occur_qty= v_order_qty;

    /* elseif @订单方向# = 《订单方向-买券还券》 then */
    elseif v_order_dir = 8 then

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

        /* set @交易变动数量#= @订单数量#; */
        set v_trade_occur_qty= v_order_qty;

    /* elseif @订单方向# = 《订单方向-直接还券》 then */
    elseif v_order_dir = 15 then

        /* set @交易变动数量# = @订单数量#; */
        set v_trade_occur_qty = v_order_qty;
    else

        /* set @交易变动数量#= @订单数量#; */
        set v_trade_occur_qty= v_order_qty;

        /* set @交易变动金额#=@订单价格# * @订单数量#; */
        set v_trade_occur_amt=v_order_price * v_order_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @交易变动金额#=@交易变动金额# + @债券计提利息# * @订单数量#; */
            set v_trade_occur_amt=v_trade_occur_amt + v_bond_accr_intrst * v_order_qty;
        end if;
    end if;

    /* set @交易变动金额#=Round(@交易变动金额#,2); */
    set v_trade_occur_amt=Round(v_trade_occur_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券成交交易变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanStrikeExchChangeAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanStrikeExchChangeAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_strike_qty decimal(18,2),
    IN p_total_strike_qty decimal(18,2),
    IN p_all_wtdraw_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_deal_capital_release_type int,
    IN p_strike_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_strike_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_deal_capital_release_type int;
    declare v_strike_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_strike_qty = p_strike_qty;
    SET v_total_strike_qty = p_total_strike_qty;
    SET v_all_wtdraw_qty = p_all_wtdraw_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_deal_capital_release_type = p_deal_capital_release_type;
    SET v_strike_amt = p_strike_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;

    
    label_pro:BEGIN
    
    #交易变动金额获取

    /* set @交易变动金额# = @订单冻结金额#; */
    set v_trade_occur_amt = v_order_frozen_amt;

    /* if @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-融券卖出》 or  @订单方向#=《订单方向-卖券还款》 or  @订单方向#=《订单方向-卖出》  then */
    if v_order_dir = 5 or v_order_dir = 6 or  v_order_dir=7 or  v_order_dir=2  then

        /* set @交易变动数量#=-1 * @成交数量#; */
        set v_trade_occur_qty=-1 * v_strike_qty;

        /* set @交易变动金额# = @订单价格# * @成交数量#; */
        set v_trade_occur_amt = v_order_price * v_strike_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @交易变动金额# = (@订单价格# + @债券计提利息#) * @成交数量#; */
            set v_trade_occur_amt = (v_order_price + v_bond_accr_intrst) * v_strike_qty;
        end if;

    /* elseif @订单方向#=《订单方向-买券还券》  then */
    elseif v_order_dir=8  then

        /* set @交易变动数量#=-1 * @成交数量#; */
        set v_trade_occur_qty=-1 * v_strike_qty;

        /* if @订单数量# > @总撤单数量#  + @总成交数量# then */
        if v_order_qty > v_all_wtdraw_qty  + v_total_strike_qty then

            /* if @部成资金占用释放方式# = 《部成资金占用释放方式-按比例》 then */
            if v_deal_capital_release_type = 1 then

                /* set @交易变动金额# = Round(@订单冻结金额# * @成交数量# / (@订单数量# - (@总成交数量# - @成交数量#) - @总撤单数量#), 2); */
                set v_trade_occur_amt = Round(v_order_frozen_amt * v_strike_qty / (v_order_qty - (v_total_strike_qty - v_strike_qty) - v_all_wtdraw_qty), 2);

            /* elseif  @部成资金占用释放方式# = 《部成资金占用释放方式-按成交金额》 then */
            elseif  v_deal_capital_release_type = 2 then

                /* set @交易变动金额# = Round(@成交金额# , 2); */
                set v_trade_occur_amt = Round(v_strike_amt , 2);
            end if;
        else

            /* set @交易变动金额# = @订单冻结金额#; */
            set v_trade_occur_amt = v_order_frozen_amt;
        end if;

    /* elseif @订单方向#=《订单方向-直接还款》  then */
    elseif v_order_dir=14  then

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

    /* elseif @订单方向#=《订单方向-直接还券》  then */
    elseif v_order_dir=15  then

        /* set @交易变动数量#=-1 * @成交数量#; */
        set v_trade_occur_qty=-1 * v_strike_qty;
    end if;

    /* set @交易变动金额# = Round(-1*@交易变动金额#,2); */
    set v_trade_occur_amt = Round(-1*v_trade_occur_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券成交变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanStrikeOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanStrikeOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_amt decimal(18,4),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_all_fee decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_strike_occur_amt decimal(18,4),
    OUT p_strike_bond_accr_intrst decimal(18,4),
    OUT p_strike_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_amt decimal(18,4);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_all_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_occur_amt decimal(18,4);
    declare v_strike_bond_accr_intrst decimal(18,4);
    declare v_strike_occur_qty decimal(18,2);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_amt = p_strike_amt;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_all_fee = p_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_occur_amt = 0;
    SET v_strike_bond_accr_intrst = 0;
    SET v_strike_occur_qty = 0;

    
    label_pro:BEGIN
    
    #成交债券计提利息获取

    /* set @成交债券计提利息# = 0; */
    set v_strike_bond_accr_intrst = 0;

    /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
    if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3 then

        /* set @成交债券计提利息# = @债券计提利息# * @成交数量#; */
        set v_strike_bond_accr_intrst = v_bond_accr_intrst * v_strike_qty;
    end if;

    /* set @成交债券计提利息# = round(@成交债券计提利息#,2); */
    set v_strike_bond_accr_intrst = round(v_strike_bond_accr_intrst,2);

    /* set @成交变动数量# = @成交数量#; */
    set v_strike_occur_qty = v_strike_qty;
    #成交变动金额获取

    /* if  @订单方向# = 《订单方向-融资买入》  or @订单方向# = 《订单方向-买券还券》 then */
    if  v_order_dir = 5  or v_order_dir = 8 then

        /* if (@成交金额# = 0) or (@证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_strike_amt = 0) or (v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3) then

            /* set @成交变动金额# = @成交价格# * @成交数量# + @全部费用# + @债券计提利息# * @成交数量#; */
            set v_strike_occur_amt = v_strike_price * v_strike_qty + v_all_fee + v_bond_accr_intrst * v_strike_qty;
        else

            /* set @成交变动金额# = @成交金额# + @全部费用#; */
            set v_strike_occur_amt = v_strike_amt + v_all_fee;
        end if;

    /* elseif @订单方向# = 《订单方向-融券卖出》 or @订单方向# = 《订单方向-卖券还款》 or @订单方向# = 《订单方向-直接还款》  or @订单方向# = 《订单方向-卖出》  then */
    elseif v_order_dir = 6 or v_order_dir = 7 or v_order_dir = 14  or v_order_dir = 2  then

        /* if (@成交金额# = 0) or (@证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》) then */
        if (v_strike_amt = 0) or (v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3) then

            /* set @成交变动金额# = @成交价格# * @成交数量# - @全部费用# + @债券计提利息# * @成交数量#; */
            set v_strike_occur_amt = v_strike_price * v_strike_qty - v_all_fee + v_bond_accr_intrst * v_strike_qty;
        else

            /* set @成交变动金额# = @成交金额# - @全部费用#; */
            set v_strike_occur_amt = v_strike_amt - v_all_fee;
        end if;

    /* elseif @订单方向# = 《订单方向-直接还款》   then */
    elseif v_order_dir = 14   then

        /* set @成交变动数量# = 0; */
        set v_strike_occur_qty = 0;

        /* set @成交变动金额# = @成交金额# - @全部费用#; */
        set v_strike_occur_amt = v_strike_amt - v_all_fee;

    /* elseif @订单方向# = 《订单方向-直接还券》   then */
    elseif v_order_dir = 15   then

        /* set @成交变动金额# = 0; */
        set v_strike_occur_amt = 0;
    else

        /* set @成交变动金额# = 0; */
        set v_strike_occur_amt = 0;
    end if;

    /* set @成交变动金额# = Round(@成交变动金额#,2); */
    set v_strike_occur_amt = Round(v_strike_occur_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_strike_occur_amt = v_strike_occur_amt;
    SET p_strike_bond_accr_intrst = v_strike_bond_accr_intrst;
    SET p_strike_occur_qty = v_strike_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券撤单指令变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanCancelCommOccurAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanCancelCommOccurAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_comm_dir int,
    IN p_limit_actual_price decimal(16,9),
    IN p_wtdraw_qty decimal(18,2),
    IN p_comm_status varchar(2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    IN p_comm_amt decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_comm_occur_amt decimal(18,4),
    OUT p_comm_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_comm_dir int;
    declare v_limit_actual_price decimal(16,9);
    declare v_wtdraw_qty decimal(18,2);
    declare v_comm_status varchar(2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_comm_occur_amt decimal(18,4);
    declare v_comm_occur_qty decimal(18,2);
    declare v_calc_dir int;

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
    SET v_stock_type = p_stock_type;
    SET v_comm_dir = p_comm_dir;
    SET v_limit_actual_price = p_limit_actual_price;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_comm_status = p_comm_status;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_comm_amt = p_comm_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_comm_occur_amt = 0;
    SET v_comm_occur_qty = 0;
    SET v_calc_dir = 1;

    
    label_pro:BEGIN
    
    #指令冻结金额获取

    /* set @指令变动金额#=0; */
    set v_comm_occur_amt=0;

    /* set @指令变动数量#=0; */
    set v_comm_occur_qty=0;

    /* set @计算方向# = 《计算方向-加上》; */
    set v_calc_dir = 1;
    #指令是待撤销、部分撤销、全部撤销 订单撤销时，不需要再将指令相关金额与数量回退到资金持仓表

    /* [检查正常返回][@指令状态# = 《指令状态-待撤销》 or @指令状态# = 《指令状态-部分撤销》 or @指令状态# = 《指令状态-全部撤销》 ] */
    if v_comm_status = "4" or v_comm_status = "5" or v_comm_status = "6"  then
        leave label_pro;
    end if;


    /* if @指令方向# = 《指令方向-直接还款》 then */
    if v_comm_dir = 14 then

        /* set @指令变动金额# = @指令金额#; */
        set v_comm_occur_amt = v_comm_amt;

    /* elseif @指令方向# = 《指令方向-直接还券》 then */
    elseif v_comm_dir = 15 then

        /* set @指令变动数量# = @撤单数量#; */
        set v_comm_occur_qty = v_wtdraw_qty;
    else

        /* set @指令变动数量# = @撤单数量#; */
        set v_comm_occur_qty = v_wtdraw_qty;

        /* set @指令变动金额#=@指令实际限价# * @指令变动数量#; */
        set v_comm_occur_amt=v_limit_actual_price * v_comm_occur_qty;

        /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

            /* set @指令变动金额#=@指令变动金额# + @债券计提利息# * @指令变动数量#; */
            set v_comm_occur_amt=v_comm_occur_amt + v_bond_accr_intrst * v_comm_occur_qty;
        end if;
    end if;

    /* set @指令变动金额#=Round(@计算方向# * @指令变动金额#,2); */
    set v_comm_occur_amt=Round(v_calc_dir * v_comm_occur_amt,2);

    /* set @指令变动数量#=@计算方向# * @指令变动数量#; */
    set v_comm_occur_qty=v_calc_dir * v_comm_occur_qty;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_comm_occur_amt = v_comm_occur_amt;
    SET p_comm_occur_qty = v_comm_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算融资融券撤单交易变动金额和数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetFinaLoanCancelExchChangeAmtAndQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetFinaLoanCancelExchChangeAmtAndQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_frozen_amt decimal(18,4),
    IN p_wtdraw_qty decimal(18,2),
    IN p_total_strike_qty decimal(18,2),
    IN p_all_wtdraw_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_occur_amt decimal(18,4),
    OUT p_trade_occur_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_frozen_amt decimal(18,4);
    declare v_wtdraw_qty decimal(18,2);
    declare v_total_strike_qty decimal(18,2);
    declare v_all_wtdraw_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_occur_amt decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_calc_dir int;

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_wtdraw_qty = p_wtdraw_qty;
    SET v_total_strike_qty = p_total_strike_qty;
    SET v_all_wtdraw_qty = p_all_wtdraw_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_occur_amt = 0;
    SET v_trade_occur_qty = 0;
    SET v_calc_dir = 1;

    
    label_pro:BEGIN
    
    #交易变动金额获取

    /* set @交易变动金额# = 0; */
    set v_trade_occur_amt = 0;

    /* set @交易变动数量# = 0; */
    set v_trade_occur_qty = 0;

    /* set @交易变动金额# = @订单冻结金额#; */
    set v_trade_occur_amt = v_order_frozen_amt;

    /* set @计算方向# = 《计算方向-减去》; */
    set v_calc_dir = -1;

    /* set @交易变动数量# = @计算方向# * @撤单数量#; */
    set v_trade_occur_qty = v_calc_dir * v_wtdraw_qty;

    /* if @订单方向# = 《订单方向-买入》 or @订单方向# = 《订单方向-买券还券》 then */
    if v_order_dir = 1 or v_order_dir = 8 then

        /* if @订单数量# > @总撤单数量#  + @总成交数量# then */
        if v_order_qty > v_all_wtdraw_qty  + v_total_strike_qty then

            /* set @交易变动金额# = round(@订单冻结金额# * @撤单数量#/ (@订单数量# - @总成交数量# - (@总撤单数量# - @撤单数量#)), 2); */
            set v_trade_occur_amt = round(v_order_frozen_amt * v_wtdraw_qty/ (v_order_qty - v_total_strike_qty - (v_all_wtdraw_qty - v_wtdraw_qty)), 2);
        else

            /* set @交易变动金额# = @订单冻结金额#; */
            set v_trade_occur_amt = v_order_frozen_amt;
        end if;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-融资买入》 or @订单方向# = 《订单方向-融券卖出》 or  @订单方向# = 《订单方向-卖券还款》 then */
    elseif v_order_dir = 2 or v_order_dir = 5 or v_order_dir = 6 or  v_order_dir = 7 then

        /* set @交易变动金额# = @订单价格# * @撤单数量#; */
        set v_trade_occur_amt = v_order_price * v_wtdraw_qty;

        /* if @证券类型# > 20 and @证券类型# < 50 and @净价标志# = 《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
        if v_stock_type > 20 and v_stock_type < 50 and v_net_price_flag = 1 and v_bond_rate_type <> 3 then

            /* set @交易变动金额# = (@订单价格# + @债券计提利息#) * @撤单数量#; */
            set v_trade_occur_amt = (v_order_price + v_bond_accr_intrst) * v_wtdraw_qty;
        end if;

    /* elseif @订单方向# = 《订单方向-直接还款》   then */
    elseif v_order_dir = 14   then

        /* set @交易变动数量# = 0; */
        set v_trade_occur_qty = 0;

        /* set @交易变动金额# = @订单冻结金额#; */
        set v_trade_occur_amt = v_order_frozen_amt;

    /* elseif @订单方向# = 《订单方向-直接还券》   then */
    elseif v_order_dir = 15   then

        /* set @交易变动金额# = 0; */
        set v_trade_occur_amt = 0;

        /* set @交易变动数量# = @撤单数量#; */
        set v_trade_occur_qty = v_wtdraw_qty;
    end if;

    /* set @交易变动金额# = @计算方向# * Round(@交易变动金额#,2); */
    set v_trade_occur_amt = v_calc_dir * Round(v_trade_occur_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_occur_amt = v_trade_occur_amt;
    SET p_trade_occur_qty = v_trade_occur_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_计算订单金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetOrderAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetOrderAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_net_price_flag int,
    IN p_par_value decimal(16,9),
    IN p_bond_accr_intrst decimal(18,12),
    IN p_bond_rate_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_order_amt decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_order_amt decimal(18,4);

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
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_net_price_flag = p_net_price_flag;
    SET v_par_value = p_par_value;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_order_amt = 0;

    
    label_pro:BEGIN
    

    /* set @订单金额#=0; */
    set v_order_amt=0;

    /* set @订单金额#=@订单价格# * @订单数量#; */
    set v_order_amt=v_order_price * v_order_qty;

    /* if @证券类型#>20 and @证券类型# < 50 and @净价标志#=《净价标志-净价》 and @债券利率类型# <> 《债券利率类型-零息》 then */
    if v_stock_type>20 and v_stock_type < 50 and v_net_price_flag=1 and v_bond_rate_type <> 3 then

        /* set @订单金额#=@订单金额# + @债券计提利息# * @订单数量#; */
        set v_order_amt=v_order_amt + v_bond_accr_intrst * v_order_qty;
    end if;

    /* set @订单金额#=Round(@订单金额#,2); */
    set v_order_amt=Round(v_order_amt,2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_order_amt = v_order_amt;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_新增指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_AddCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_AddCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_rule_name varchar(64),
    IN p_prior_type int,
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_opor_no_str varchar(2048),
    IN p_distribute_last_trader int,
    IN p_distribute_by_jobs int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint
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
    declare v_rule_name varchar(64);
    declare v_prior_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_opor_no_str varchar(2048);
    declare v_distribute_last_trader int;
    declare v_distribute_by_jobs int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_rule_name = p_rule_name;
    SET v_prior_type = p_prior_type;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_opor_no_str = p_opor_no_str;
    SET v_distribute_last_trader = p_distribute_last_trader;
    SET v_distribute_by_jobs = p_distribute_by_jobs;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0 ; */
    set v_record_count = 0 ;
    #优先级默认最后

    /* if @优先级# = 0 then */
    if v_prior_type = 0 then

        /* [获取表记录数量][交易证券_公用_指令自动分发规则表][@记录个数#][{机构编号} = @机构编号#] */
        select count(1) into v_record_count from db_tdsecu.tb_tdsepb_commautodistributerule where co_no = v_co_no;


        /* set @优先级# = @记录个数# + 1; */
        set v_prior_type = v_record_count + 1;
    end if;

    /* [插入表记录][交易证券_公用_指令自动分发规则表][字段][字段变量][1][@规则名称#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdsepb_commautodistributerule(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        rule_name, prior_type, exch_group_no_str, exch_no_str, 
        stock_type_str, stock_code_str, opor_no_str, distribute_last_trader, 
        distribute_by_jobs, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_rule_name, v_prior_type, v_exch_group_no_str, v_exch_no_str, 
        v_stock_type_str, v_stock_code_str, v_opor_no_str, v_distribute_last_trader, 
        v_distribute_by_jobs, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.51.1";
        SET v_error_info =  CONCAT(concat("规则名称=",v_rule_name),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@记录序号#] */
    select LAST_INSERT_ID() into v_row_id;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_修改指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_ModiCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_ModiCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_rule_name varchar(64),
    IN p_prior_type int,
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no_str varchar(2048),
    IN p_stock_type_str varchar(2048),
    IN p_stock_code_str varchar(4096),
    IN p_opor_no_str varchar(2048),
    IN p_distribute_last_trader int,
    IN p_distribute_by_jobs int,
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_rule_name varchar(64);
    declare v_prior_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_opor_no_str varchar(2048);
    declare v_distribute_last_trader int;
    declare v_distribute_by_jobs int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_prior_type int;
    declare v_record_count int;
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
    SET v_co_no = p_co_no;
    SET v_rule_name = p_rule_name;
    SET v_prior_type = p_prior_type;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no_str = p_exch_no_str;
    SET v_stock_type_str = p_stock_type_str;
    SET v_stock_code_str = p_stock_code_str;
    SET v_opor_no_str = p_opor_no_str;
    SET v_distribute_last_trader = p_distribute_last_trader;
    SET v_distribute_by_jobs = p_distribute_by_jobs;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_prior_type = 0;
    SET v_record_count = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #修改的时候，同时调整别的规则优先级

    /* set @临时_优先级# =0; */
    set v_tmp_prior_type =0;

    /* set @记录个数# =0; */
    set v_record_count =0;

    /* [获取表记录变量语句][交易证券_公用_指令自动分发规则表][{优先级}][@临时_优先级#][{记录序号}=@记录序号#] */
    select prior_type into v_tmp_prior_type from db_tdsecu.tb_tdsepb_commautodistributerule where row_id=v_row_id limit 1;

    #控制修改的优先级不能超过最大优先级

    /* [获取表记录数量][交易证券_公用_指令自动分发规则表][@记录个数#][{机构编号} = @机构编号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdsepb_commautodistributerule where co_no = v_co_no;


    /* [检查报错返回][@记录个数#<@优先级#][643][@记录个数#,@优先级#] */
    if v_record_count<v_prior_type then
        
        SET v_error_code = "tdsecuA.1.52.643";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录个数=",v_record_count,",","优先级=",v_prior_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录个数=",v_record_count,",","优先级=",v_prior_type);
        end if;
        leave label_pro;
    end if;

    #调小

    /* if @临时_优先级# > @优先级# then */
    if v_tmp_prior_type > v_prior_type then

        /* [更新表记录][交易证券_公用_指令自动分发规则表][{优先级}={优先级}+1][{机构编号} = @机构编号# and {优先级} < @临时_优先级# and {优先级} >= @优先级#][2][@机构编号#,@优先级#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsepb_commautodistributerule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, prior_type=prior_type+1 where co_no = v_co_no and prior_type < v_tmp_prior_type and prior_type >= v_prior_type;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.1.52.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","优先级=",v_prior_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","优先级=",v_prior_type);
            end if;
            leave label_pro;
        end if;

    #调大

    /* elseif @临时_优先级# < @优先级# then */
    elseif v_tmp_prior_type < v_prior_type then

        /* [更新表记录][交易证券_公用_指令自动分发规则表][{优先级}={优先级}-1][{机构编号} = @机构编号# and {优先级} > @临时_优先级# and {优先级} <= @优先级#][2][@机构编号#,@优先级#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdsepb_commautodistributerule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, prior_type=prior_type-1 where co_no = v_co_no and prior_type > v_tmp_prior_type and prior_type <= v_prior_type;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.1.52.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","优先级=",v_prior_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","优先级=",v_prior_type);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [更新表记录][交易证券_公用_指令自动分发规则表][{规则名称}=@规则名称#, {优先级}=@优先级#,{交易组编号串} = @交易组编号串#, {市场编号串}=@市场编号串#,{证券类型串} = @证券类型串#,{证券代码串} = @证券代码串#,{操作员编号串} = @操作员编号串#,{指令自动分发同券分发给上次分发的交易员} = @指令自动分发同券分发给上次分发的交易员#,{指令自动分发按工作量分发} = @指令自动分发按工作量分发#,{备注信息} = @备注信息#][{记录序号}=@记录序号# and {机构编号} = @机构编号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsepb_commautodistributerule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, rule_name=v_rule_name, prior_type=v_prior_type,exch_group_no_str = v_exch_group_no_str, exch_no_str=v_exch_no_str,stock_type_str = v_stock_type_str,stock_code_str = v_stock_code_str,opor_no_str = v_opor_no_str,distribute_last_trader = v_distribute_last_trader,distribute_by_jobs = v_distribute_by_jobs,remark_info = v_remark_info where row_id=v_row_id and co_no = v_co_no;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.52.2";
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
use db_tdsecu;;

# 原子_交易证券_公用_删除指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_DelCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_DelCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_rule_name varchar(64);
    declare v_prior_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_opor_no_str varchar(2048);
    declare v_distribute_last_trader int;
    declare v_distribute_by_jobs int;
    declare v_remark_info varchar(255);

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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_rule_name = " ";
    SET v_prior_type = 0;
    SET v_exch_group_no_str = " ";
    SET v_exch_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_stock_code_str = " ";
    SET v_opor_no_str = " ";
    SET v_distribute_last_trader = 0;
    SET v_distribute_by_jobs = 0;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_公用_指令自动分发规则表][字段][字段变量][{记录序号}=@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, rule_name, prior_type, exch_group_no_str, 
        exch_no_str, stock_type_str, stock_code_str, opor_no_str, 
        distribute_last_trader, distribute_by_jobs, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_rule_name, v_prior_type, v_exch_group_no_str, 
        v_exch_no_str, v_stock_type_str, v_stock_code_str, v_opor_no_str, 
        v_distribute_last_trader, v_distribute_by_jobs, v_remark_info from db_tdsecu.tb_tdsepb_commautodistributerule where row_id=v_row_id limit 1;


    /* [删除表记录][交易证券_公用_指令自动分发规则表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_tdsecu.tb_tdsepb_commautodistributerule 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.53.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_公用_指令自动分发规则表][{优先级}={优先级}-1][{机构编号} = @机构编号# and {优先级} >= @优先级#][2][@机构编号#,@优先级#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsepb_commautodistributerule set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, prior_type=prior_type-1 where co_no = v_co_no and prior_type >= v_prior_type;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","优先级=",v_prior_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","优先级=",v_prior_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_查询指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_QueryCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_QueryCommAutoDistributeRule(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
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
    declare v_query_opor_no int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_公用_指令自动分发规则表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@查询操作员编号#=0 or {操作员编号}=@查询操作员编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, rule_name, prior_type, exch_group_no_str, 
        exch_no_str, stock_type_str, stock_code_str, opor_no_str, 
        distribute_last_trader, distribute_by_jobs, remark_info from db_tdsecu.tb_tdsepb_commautodistributerule where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no=0 or opor_no=v_query_opor_no);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, rule_name, prior_type, exch_group_no_str, 
        exch_no_str, stock_type_str, stock_code_str, opor_no_str, 
        distribute_last_trader, distribute_by_jobs, remark_info from db_tdsecu.tb_tdsepb_commautodistributerule where (v_co_no = 0 or co_no=v_co_no) and (v_query_opor_no=0 or opor_no=v_query_opor_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_获取单个指令自动分发规则
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_GetSingleCommAutoDistributeRule;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_GetSingleCommAutoDistributeRule(
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
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_rule_name varchar(64),
    OUT p_prior_type int,
    OUT p_exch_group_no_str varchar(2048),
    OUT p_exch_no_str varchar(2048),
    OUT p_stock_type_str varchar(2048),
    OUT p_stock_code_str varchar(4096),
    OUT p_opor_no_str varchar(2048),
    OUT p_distribute_last_trader int,
    OUT p_distribute_by_jobs int,
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
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_rule_name varchar(64);
    declare v_prior_type int;
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no_str varchar(2048);
    declare v_stock_type_str varchar(2048);
    declare v_stock_code_str varchar(4096);
    declare v_opor_no_str varchar(2048);
    declare v_distribute_last_trader int;
    declare v_distribute_by_jobs int;
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
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_rule_name = " ";
    SET v_prior_type = 0;
    SET v_exch_group_no_str = " ";
    SET v_exch_no_str = " ";
    SET v_stock_type_str = " ";
    SET v_stock_code_str = " ";
    SET v_opor_no_str = " ";
    SET v_distribute_last_trader = 0;
    SET v_distribute_by_jobs = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_公用_指令自动分发规则表][字段][字段变量][{记录序号}=@查询序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, rule_name, prior_type, exch_group_no_str, 
        exch_no_str, stock_type_str, stock_code_str, opor_no_str, 
        distribute_last_trader, distribute_by_jobs, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_rule_name, v_prior_type, v_exch_group_no_str, 
        v_exch_no_str, v_stock_type_str, v_stock_code_str, v_opor_no_str, 
        v_distribute_last_trader, v_distribute_by_jobs, v_remark_info from db_tdsecu.tb_tdsepb_commautodistributerule where row_id=v_qry_no limit 1;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_rule_name = v_rule_name;
    SET p_prior_type = v_prior_type;
    SET p_exch_group_no_str = v_exch_group_no_str;
    SET p_exch_no_str = v_exch_no_str;
    SET p_stock_type_str = v_stock_type_str;
    SET p_stock_code_str = v_stock_code_str;
    SET p_opor_no_str = v_opor_no_str;
    SET p_distribute_last_trader = v_distribute_last_trader;
    SET p_distribute_by_jobs = v_distribute_by_jobs;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_融资融券归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_FinaLoanArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_FinaLoanArchive(
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
    

    /* set @数据表名称# = "~交易证券_账户_交易组业务资金负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_busi_capital_debt";

    /* [数据归历史][交易证券_账户_交易组业务资金负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capital_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        debt_loan_sell_strike_amt, debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, 
        loan_return_comm_amt, return_strike_fee) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        debt_loan_sell_strike_amt, debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, 
        loan_return_comm_amt, return_strike_fee 
        from db_tdsecu.tb_tdseac_exgp_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.56.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.56.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户业务资金负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_busi_capital_debt";

    /* [数据归历史][交易证券_账户_资产账户业务资金负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capital_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, debt_loan_sell_strike_amt, 
        debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, loan_return_comm_amt, 
        return_strike_fee) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, debt_loan_sell_strike_amt, 
        debt_strike_fee, loan_return_strike_amt, loan_return_order_amt, loan_return_comm_amt, 
        return_strike_fee 
        from db_tdsecu.tb_tdseac_asac_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.56.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capital_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.56.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_交易组业务持仓负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_busi_posi_debt";

    /* [数据归历史][交易证券_账户_交易组业务持仓负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_posi_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, invest_type, debt_type, 
        debt_fina_buy_strike_qty, fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, 
        debt_fina_buy_order_qty, fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, 
        debt_fina_buy_comm_qty, fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, 
        debt_fina_buy_strike_amt, fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, 
        debt_fina_buy_order_amt, fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, 
        debt_fina_buy_comm_amt, fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, 
        debt_strike_fee, return_strike_fee, debt_interest, return_interest_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, invest_type, debt_type, 
        debt_fina_buy_strike_qty, fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, 
        debt_fina_buy_order_qty, fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, 
        debt_fina_buy_comm_qty, fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, 
        debt_fina_buy_strike_amt, fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, 
        debt_fina_buy_order_amt, fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, 
        debt_fina_buy_comm_amt, fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, 
        debt_strike_fee, return_strike_fee, debt_interest, return_interest_amt 
        from db_tdsecu.tb_tdseac_exgp_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.56.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务持仓负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.56.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户业务持仓负债表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_busi_posi_debt";

    /* [数据归历史][交易证券_账户_资产账户业务持仓负债表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_posi_debt_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, invest_type, debt_type, debt_fina_buy_strike_qty, 
        fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, debt_fina_buy_order_qty, 
        fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, debt_fina_buy_comm_qty, 
        fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, debt_fina_buy_strike_amt, 
        fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, debt_fina_buy_order_amt, 
        fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, debt_fina_buy_comm_amt, 
        fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, debt_strike_fee, 
        return_strike_fee, debt_interest, return_interest_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, invest_type, debt_type, debt_fina_buy_strike_qty, 
        fina_return_strike_qty, debt_loan_sell_strike_qty, loan_return_strike_qty, debt_fina_buy_order_qty, 
        fina_return_order_qty, debt_loan_sell_order_qty, loan_return_order_qty, debt_fina_buy_comm_qty, 
        fina_return_comm_qty, debt_loan_sell_comm_qty, loan_return_comm_qty, debt_fina_buy_strike_amt, 
        fina_return_strike_amt, debt_loan_sell_strike_amt, loan_return_strike_amt, debt_fina_buy_order_amt, 
        fina_return_order_amt, debt_loan_sell_order_amt, loan_return_order_amt, debt_fina_buy_comm_amt, 
        fina_return_comm_amt, debt_loan_sell_comm_amt, loan_return_comm_amt, debt_strike_fee, 
        return_strike_fee, debt_interest, return_interest_amt 
        from db_tdsecu.tb_tdseac_asac_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.56.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务持仓负债表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_posi_debt 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.56.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_交易组负债明细表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_debtjour";

    /* [数据归历史][交易证券_账户_交易组负债明细表][字段][{初始化日期}<=@初始化日期# and {负债状态} = 《负债状态-已归还》][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_debtjour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code, 
        stock_code_no, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, debt_order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, debt_status, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code, 
        stock_code_no, stock_type, asset_type, debt_type, 
        strike_qty, strike_amt, strike_fee, debt_order_no, 
        report_no, order_date, order_time, order_dir, 
        order_price, order_qty, debt_amt, debt_qty, 
        debt_fee, debt_interest, intrst_base_amt, debt_return_amt, 
        debt_return_qty, return_interest_amt, debt_status, remark_info 
        from db_tdsecu.tb_tdseac_exgp_debtjour 
        where init_date<=v_init_date and debt_status = 2;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.56.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组负债明细表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_debtjour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.56.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户负债明细表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_debtjour";

    /* [数据归历史][交易证券_账户_资产账户负债明细表][字段][{初始化日期}<=@初始化日期# and {负债状态} = 《负债状态-已归还》][1032][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_debtjour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, debt_order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, debt_status, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code, stock_code_no, 
        stock_type, asset_type, debt_type, strike_qty, 
        strike_amt, strike_fee, debt_order_no, report_no, 
        order_date, order_time, order_dir, order_price, 
        order_qty, debt_amt, debt_qty, debt_fee, 
        debt_interest, intrst_base_amt, debt_return_amt, debt_return_qty, 
        return_interest_amt, debt_status, remark_info 
        from db_tdsecu.tb_tdseac_asac_debtjour 
        where init_date<=v_init_date and debt_status = 2;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.56.1032";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户负债明细表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_debtjour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.56.1033";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_组合归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_ComboArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_ComboArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_table_name varchar(64);
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    
    #组合交易
    #set @数据表名称# = "~交易证券_交易_组合交易流水记录表^";
    #[数据归历史][交易证券_交易_组合交易流水记录表][字段][{组合日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#]
    #[删除表记录][交易证券_交易_组合交易流水记录表][{组合日期}<=@初始化日期#][1401][@初始化日期#,@数据表名称#]
    #set @数据表名称# = "~交易证券_账户_组合持仓表^";
    #[数据归历史][交易证券_账户_组合持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{组合代码},{证券代码},{市场编号},{证券代码编号},{开仓日期},{持仓数量},{当前数量},{冻结数量},{解冻数量},{待交收数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{持仓状态}][1=1][1410][@初始化日期#,@数据表名称#]
    #[删除表记录][交易证券_账户_组合持仓表][{持仓状态}=《持仓状态-已平仓》][1411][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合持仓表][{当前数量} = {当前数量} + {成交释放数量} - {成交占用数量}][1=1][1421][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合持仓表][{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0][1=1][1421][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合持仓表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#]
    #set @数据表名称# = "~交易证券_账户_组合持仓汇总表^";
    #[数据归历史][交易证券_账户_组合持仓汇总表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{组合代码},{证券代码},{市场编号},{证券代码编号},{持仓数量},{当前数量},{冻结数量},{解冻数量},{待交收数量},{交易冻结数量},{交易解冻数量},{交易占用数量},{交易释放数量},{成交占用数量},{成交释放数量},{成交冻结数量},{成交解冻数量},{实现盈亏},{成本金额},{利息成本金额},{利息收益},{持仓状态}][1=1][1410][@初始化日期#,@数据表名称#]
    #[删除表记录][交易证券_账户_组合持仓汇总表][{持仓状态}=《持仓状态-已平仓》][1411][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合持仓汇总表][{当前数量} = {当前数量} + {成交释放数量} - {成交占用数量}][1=1][1421][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合持仓汇总表][{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0][1=1][1421][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合持仓汇总表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#]
    #set @数据表名称# = "~交易证券_账户_组合收益表^";
    #[数据归历史][交易证券_账户_组合收益表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{开仓日期},{组合代码},{组合份数},{组合状态},{组合成本},{组合市值},{实现盈亏},{累计实现盈亏},{指令批号},{状态更新日期}][1=1][1420][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合收益表][{实现盈亏} = 0,{组合市值} = 0,{初始化日期}=@下日初始化日期#][1=1][1421][@初始化日期#,@数据表名称#]
    #set @数据表名称# = "~交易证券_账户_组合收益汇总表^";
    #[数据归历史][交易证券_账户_组合收益汇总表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{交易组编号},{组合代码},{组合份数},{组合状态},{组合成本},{组合市值},{实现盈亏},{累计实现盈亏},{指令批号},{状态更新日期}][1=1][1420][@初始化日期#,@数据表名称#]
    #[更新表记录][交易证券_账户_组合收益汇总表][{实现盈亏} = 0,{组合市值} = 0,{初始化日期}=@下日初始化日期#][1=1][1421][@初始化日期#,@数据表名称#]
    #set @数据表名称# = "~交易证券_账户_组合持仓入账流水表^";
    #[数据归历史][交易证券_账户_组合持仓入账流水表][字段][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][1][@初始化日期#]
    #[删除表记录][交易证券_账户_组合持仓入账流水表][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][3][@初始化日期#]
    #[更新表记录][交易证券_账户_组合持仓入账流水表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#]
    #
    #set @数据表名称# = "~交易证券_报盘_体外交易差额记录表^";
    #[数据归历史][交易证券_报盘_体外交易差额记录表][字段][{初始化日期}<=@初始化日期# and {处理状态} =《处理状态-成功》][1][@初始化日期#]
    #[删除表记录][交易证券_报盘_体外交易差额记录表][{初始化日期}<=@初始化日期#  and {处理状态} =《处理状态-成功》][3][@初始化日期#]
    #[更新表记录][交易证券_报盘_体外交易差额记录表][{初始化日期}=@下日初始化日期#][1=1][1003][@下日初始化日期#,@数据表名称#]
    #
    #set @数据表名称# = "~交易证券_账户_组合持仓划转流水表^";
    #[数据归历史][交易证券_账户_组合持仓划转流水表][字段][{初始化日期}<=@初始化日期#][1030][@初始化日期#,@数据表名称#]
    #[删除表记录][交易证券_账户_组合持仓划转流水表][{初始化日期}<=@初始化日期#][1031][@初始化日期#,@数据表名称#]
    #
    #set @数据表名称# = "~交易证券_交易运维_场外基金成交回报表^";
    #[数据归历史][交易证券_交易运维_场外基金成交回报表][字段][{初始化日期}<=@初始化日期#][1032][@初始化日期#,@数据表名称#]
    #[删除表记录][交易证券_交易运维_场外基金成交回报表][{初始化日期}<=@初始化日期#][1033][@初始化日期#,@数据表名称#]
    #交易证券_账户_交易组组合策略持仓表

    /* set @数据表名称# = "~交易证券_账户_交易组组合策略持仓表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_combo_strategy_posi";

    /* [数据归历史][交易证券_账户_交易组组合策略持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},
{初始化日期},
{机构编号},
{产品编号},
{资产账户编号},
{交易组编号},
{股东代码编号},
{组合代码},
{证券代码},
{市场编号},
{证券代码编号},
{证券类型},
{资产类型},
{当前数量},
{指令冻结数量},
{指令解冻数量},
{指令占用数量},
{指令释放数量},
{交易冻结数量},
{交易解冻数量},
{交易占用数量},
{交易释放数量},
{成交占用数量},
{成交释放数量},
{成交冻结数量},
{成交解冻数量},
{实现盈亏},
{累计实现盈亏},
{成本金额},
{利息成本金额},
{利息收益}][{初始化日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_combo_strategy_posi_his (
        create_date,create_time,update_date,update_time,update_times,
    init_date,
    co_no,
    pd_no,
    asset_acco_no,
    exch_group_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    stock_type,
    asset_type,
    curr_qty,
    comm_frozen_qty,
    comm_unfroz_qty,
    comm_capt_qty,
    comm_releas_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    sum_realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl) 
        select 
        create_date,create_time,update_date,update_time,update_times,
    init_date,
    co_no,
    pd_no,
    asset_acco_no,
    exch_group_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    stock_type,
    asset_type,
    curr_qty,
    comm_frozen_qty,
    comm_unfroz_qty,
    comm_capt_qty,
    comm_releas_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    sum_realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl 
        from db_tdsecu.tb_tdseac_exgp_combo_strategy_posi 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1400";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_交易组组合策略持仓表][{当前数量} = {当前数量} + {成交释放数量} - {成交占用数量}][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_exgp_combo_strategy_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty + strike_releas_qty - strike_capt_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_交易组组合策略持仓表][{指令释放数量} = 0,{指令占用数量} = 0,{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0,{实现盈亏} = 0][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_exgp_combo_strategy_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_releas_qty = 0,comm_capt_qty = 0,trade_releas_qty = 0,trade_capt_qty = 0,strike_releas_qty = 0,strike_capt_qty = 0,realize_pandl = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_交易组组合策略持仓表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_exgp_combo_strategy_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #交易证券_账户_资产账户组合策略持仓表

    /* set @数据表名称# = "~交易证券_账户_资产账户组合策略持仓表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_combo_strategy_posi";

    /* [数据归历史][交易证券_账户_资产账户组合策略持仓表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},
{机构编号},
{产品编号},
{资产账户编号},
{股东代码编号},
{组合代码},
{证券代码},
{市场编号},
{证券代码编号},
{证券类型},
{资产类型},
{当前数量},
{指令冻结数量},
{指令解冻数量},
{指令占用数量},
{指令释放数量},
{交易冻结数量},
{交易解冻数量},
{交易占用数量},
{交易释放数量},
{成交占用数量},
{成交释放数量},
{成交冻结数量},
{成交解冻数量},
{实现盈亏},
{累计实现盈亏},
{成本金额},
{利息成本金额},
{利息收益}][{初始化日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_combo_strategy_posi_his (
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    asset_acco_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    stock_type,
    asset_type,
    curr_qty,
    comm_frozen_qty,
    comm_unfroz_qty,
    comm_capt_qty,
    comm_releas_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    sum_realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl) 
        select 
        create_date,create_time,update_date,update_time,update_times,init_date,
    co_no,
    pd_no,
    asset_acco_no,
    stock_acco_no,
    combo_code,
    stock_code,
    exch_no,
    stock_code_no,
    stock_type,
    asset_type,
    curr_qty,
    comm_frozen_qty,
    comm_unfroz_qty,
    comm_capt_qty,
    comm_releas_qty,
    trade_frozen_qty,
    trade_unfroz_qty,
    trade_capt_qty,
    trade_releas_qty,
    strike_capt_qty,
    strike_releas_qty,
    strike_frozen_qty,
    strike_unfroz_qty,
    realize_pandl,
    sum_realize_pandl,
    cost_amt,
    intrst_cost_amt,
    intrst_pandl 
        from db_tdsecu.tb_tdseac_asac_combo_strategy_posi 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1400";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_资产账户组合策略持仓表][{当前数量} = {当前数量} + {成交释放数量} - {成交占用数量}][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_asac_combo_strategy_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty + strike_releas_qty - strike_capt_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_资产账户组合策略持仓表][{指令释放数量} = 0,{指令占用数量} = 0,{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0,{实现盈亏} = 0][1=1][1421][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_asac_combo_strategy_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, comm_releas_qty = 0,comm_capt_qty = 0,trade_releas_qty = 0,trade_capt_qty = 0,strike_releas_qty = 0,strike_capt_qty = 0,realize_pandl = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1421";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_资产账户组合策略持仓表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_asac_combo_strategy_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #交易证券_账户_交易组组合策略收益表

    /* set @数据表名称# = "~交易证券_账户_交易组组合策略收益表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_combo_strategy_income";

    /* [数据归历史][交易证券_账户_交易组组合策略收益表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},
{初始化日期},
{机构编号},
{产品编号},
{资产账户编号},
{交易组编号},
{组合代码},
{组合成本},
{实现盈亏},
{累计实现盈亏}][{初始化日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_combo_strategy_income_his (
        create_date,create_time,update_date,update_time,update_times,
    init_date,
    co_no,
    pd_no,
    asset_acco_no,
    exch_group_no,
    combo_code,
    combo_cost,
    realize_pandl,
    sum_realize_pandl) 
        select 
        create_date,create_time,update_date,update_time,update_times,
    init_date,
    co_no,
    pd_no,
    asset_acco_no,
    exch_group_no,
    combo_code,
    combo_cost,
    realize_pandl,
    sum_realize_pandl 
        from db_tdsecu.tb_tdseac_exgp_combo_strategy_income 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1400";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_交易组组合策略收益表][{实现盈亏} = 0,{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_exgp_combo_strategy_income set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl = 0,init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #交易证券_账户_资产账户组合策略收益表

    /* set @数据表名称# = "~交易证券_账户_资产账户组合策略收益表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_combo_strategy_income";

    /* [数据归历史][交易证券_账户_资产账户组合策略收益表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},
{初始化日期},
{机构编号},
{产品编号},
{资产账户编号},
{组合代码},
{组合成本},
{实现盈亏},
{累计实现盈亏}][{初始化日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_combo_strategy_income_his (
        create_date,create_time,update_date,update_time,update_times,
    init_date,
    co_no,
    pd_no,
    asset_acco_no,
    combo_code,
    combo_cost,
    realize_pandl,
    sum_realize_pandl) 
        select 
        create_date,create_time,update_date,update_time,update_times,
    init_date,
    co_no,
    pd_no,
    asset_acco_no,
    combo_code,
    combo_cost,
    realize_pandl,
    sum_realize_pandl 
        from db_tdsecu.tb_tdseac_asac_combo_strategy_income 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1400";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_资产账户组合策略收益表][{实现盈亏} = 0,{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_asac_combo_strategy_income set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl = 0,init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #交易证券_账户_交易组组合策略持仓流水表

    /* set @数据表名称# = "~交易证券_账户_交易组组合策略持仓流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_combo_strategy_posi_jour";

    /* [数据归历史][交易证券_账户_交易组组合策略持仓流水表][字段][{初始化日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_combo_strategy_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, combo_code, stock_code, exch_no, 
        stock_code_no, jour_after_occur_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, combo_code, stock_code, exch_no, 
        stock_code_no, jour_after_occur_info 
        from db_tdsecu.tb_tdseac_exgp_combo_strategy_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1400";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组组合策略持仓流水表][{初始化日期}<=@初始化日期#][1304][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_combo_strategy_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.57.1304";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #交易证券_账户_资产账户组合策略持仓流水表

    /* set @数据表名称# = "~交易证券_账户_资产账户组合策略持仓流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_combo_strategy_posi_jour";

    /* [数据归历史][交易证券_账户_资产账户组合策略持仓流水表][字段][{初始化日期}<=@初始化日期#][1400][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_combo_strategy_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        combo_code, stock_code, exch_no, stock_code_no, 
        jour_after_occur_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, stock_acco_no, 
        combo_code, stock_code, exch_no, stock_code_no, 
        jour_after_occur_info 
        from db_tdsecu.tb_tdseac_asac_combo_strategy_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.57.1400";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户组合策略持仓流水表][{初始化日期}<=@初始化日期#][1304][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_combo_strategy_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.57.1304";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_策略归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_StrategyArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_StrategyArchive(
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
    

    /* set @数据表名称# = "~交易证券_交易_待执行订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_pendorder";

    /* [数据归历史][交易证券_交易_待执行订单表][字段][{订单日期}<=@初始化日期#][1310][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_pendorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, comm_id, 
        comm_batch_no, order_date, order_time, order_batch_no, 
        order_dir, price_type, exec_price_type, price_offset, 
        order_qty, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, order_oper_way, 
        external_no, pend_order_status, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, comm_id, 
        comm_batch_no, order_date, order_time, order_batch_no, 
        order_dir, price_type, exec_price_type, price_offset, 
        order_qty, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, order_oper_way, 
        external_no, pend_order_status, remark_info 
        from db_tdsecu.tb_tdsetd_pendorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.58.1310";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_待执行订单表][{订单日期}<=@初始化日期#][1311][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_pendorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.58.1311";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_策略_策略表^"; */
    set v_table_name = "db_tdsecu.tb_tdsest_strategyorder";

    /* [数据归历史][交易证券_策略_策略表][字段][{策略日期}<=@初始化日期#][1320][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsest_strategyorder_his (
        row_id, create_date, create_time, 
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
        comm_id) 
        select 
        row_id, create_date, create_time, 
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
        comm_id 
        from db_tdsecu.tb_tdsest_strategyorder 
        where strategy_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.58.1320";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_策略_策略表][{策略日期}<=@初始化日期#][1321][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsest_strategyorder 
        where strategy_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.58.1321";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_策略_策略汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdsest_strategyordersum";

    /* [数据归历史][交易证券_策略_策略汇总表][字段][{策略日期}<=@初始化日期#][1320][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsest_strategyordersum_his (
        row_id, create_date, create_time, 
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
        external_no, order_batch_no, comm_batch_no, strategy_oper_way) 
        select 
        row_id, create_date, create_time, 
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
        external_no, order_batch_no, comm_batch_no, strategy_oper_way 
        from db_tdsecu.tb_tdsest_strategyordersum 
        where strategy_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.58.1320";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_策略_策略汇总表][{策略日期}<=@初始化日期#][1321][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsest_strategyordersum 
        where strategy_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.58.1321";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_策略_策略流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdsest_strategyorder_jour";

    /* [数据归历史][交易证券_策略_策略流水表][字段][{策略日期}<=@初始化日期#][1330][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsest_strategyorder_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, comm_opor, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, strategy_batch_no, strategy_id, orig_strategy_id, 
        exch_no, stock_acco_no, stock_acco, stock_type, 
        asset_type, stock_code, stock_code_no, strategy_dir, 
        strategy_qty, cash_strategy_qty, strategy_price, price_type, 
        exch_crncy_type, strategy_date, strategy_time, strategy_status, 
        strategy_deal_status, strategy_deal_kind, order_id, order_qty, 
        order_amt, wtdraw_qty, strike_id, strike_qty, 
        strike_amt, order_batch_no, strategy_oper_way, remark_info, 
        comm_batch_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, comm_opor, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, strategy_batch_no, strategy_id, orig_strategy_id, 
        exch_no, stock_acco_no, stock_acco, stock_type, 
        asset_type, stock_code, stock_code_no, strategy_dir, 
        strategy_qty, cash_strategy_qty, strategy_price, price_type, 
        exch_crncy_type, strategy_date, strategy_time, strategy_status, 
        strategy_deal_status, strategy_deal_kind, order_id, order_qty, 
        order_amt, wtdraw_qty, strike_id, strike_qty, 
        strike_amt, order_batch_no, strategy_oper_way, remark_info, 
        comm_batch_no 
        from db_tdsecu.tb_tdsest_strategyorder_jour 
        where strategy_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.58.1330";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_策略_策略流水表][{策略日期}<=@初始化日期#][1331][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsest_strategyorder_jour 
        where strategy_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.58.1331";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_T0归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_T0Archive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_T0Archive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_table_name varchar(64);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_detail_posi_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_date int;
    declare v_close_posi_time int;
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_total_realize_pandl decimal(18,4);
    declare v_total_long_curr_qty decimal(18,2);
    declare v_total_short_curr_qty decimal(18,2);
    declare v_total_long_open_posi_value decimal(18,4);
    declare v_total_short_open_posi_value decimal(18,4);
    declare v_total_long_open_posi_fee decimal(18,4);
    declare v_total_short_open_posi_fee decimal(18,4);
    declare v_total_long_close_posi_value decimal(18,4);
    declare v_total_short_close_posi_value decimal(18,4);
    declare v_total_long_close_posi_qty decimal(18,2);
    declare v_total_short_close_posi_qty decimal(18,2);
    declare v_total_long_close_posi_fee decimal(18,4);
    declare v_total_short_close_posi_fee decimal(18,4);
    declare v_long_curr_qty decimal(18,2);
    declare v_short_curr_qty decimal(18,2);
    declare v_long_open_posi_value decimal(18,4);
    declare v_short_open_posi_value decimal(18,4);
    declare v_long_open_posi_fee decimal(18,4);
    declare v_short_open_posi_fee decimal(18,4);
    declare v_long_close_posi_qty decimal(18,2);
    declare v_short_close_posi_qty decimal(18,2);
    declare v_long_close_posi_value decimal(18,4);
    declare v_short_close_posi_value decimal(18,4);
    declare v_long_close_posi_fee decimal(18,4);
    declare v_short_close_posi_fee decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_detail_posi_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_strike_no = " ";
    SET v_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_posi_status = "0";
    SET v_total_realize_pandl = 0;
    SET v_total_long_curr_qty = 0;
    SET v_total_short_curr_qty = 0;
    SET v_total_long_open_posi_value = 0;
    SET v_total_short_open_posi_value = 0;
    SET v_total_long_open_posi_fee = 0;
    SET v_total_short_open_posi_fee = 0;
    SET v_total_long_close_posi_value = 0;
    SET v_total_short_close_posi_value = 0;
    SET v_total_long_close_posi_qty = 0;
    SET v_total_short_close_posi_qty = 0;
    SET v_total_long_close_posi_fee = 0;
    SET v_total_short_close_posi_fee = 0;
    SET v_long_curr_qty = 0;
    SET v_short_curr_qty = 0;
    SET v_long_open_posi_value = 0;
    SET v_short_open_posi_value = 0;
    SET v_long_open_posi_fee = 0;
    SET v_short_open_posi_fee = 0;
    SET v_long_close_posi_qty = 0;
    SET v_short_close_posi_qty = 0;
    SET v_long_close_posi_value = 0;
    SET v_short_close_posi_value = 0;
    SET v_long_close_posi_fee = 0;
    SET v_short_close_posi_fee = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~交易证券_T0_历史证券持仓明细表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdset0_stock_posi_detail_his";
    #增强交易相关归档

    /* [不分日期数据归历史][交易证券_T0_证券持仓明细表][字段][1251][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_stock_posi_detail_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, lngsht_type, 
        curr_qty, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
        close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
        realize_pandl, over_night_pandl, posi_status, remark_info) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, lngsht_type, 
        curr_qty, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
        close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
        realize_pandl, over_night_pandl, posi_status, remark_info 
        from db_tdsecu.tb_tdset0_stock_posi_detail;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1251";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;

    #持仓状态新增 已作废，当前表一起删除 modify by wjp 20181012

    /* [删除表记录][交易证券_T0_证券持仓明细表][{持仓状态}=《持仓状态-已平仓》or {持仓状态}=《持仓状态-已作废》 ][1252][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_stock_posi_detail 
        where posi_status="2"or posi_status="3" ;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1252";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_证券持仓明细表][{隔夜盈亏}={隔夜盈亏}+{实现盈亏}][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, over_night_pandl=over_night_pandl+realize_pandl where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_证券持仓明细表][{实现盈亏}=0][1=1][2][@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, realize_pandl=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_T0_历史证券持仓汇总表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdset0_stock_posi_sum_his";

    /* [不分日期数据归历史][交易证券_T0_证券持仓汇总表][字段][1261][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_stock_posi_sum_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
        total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
        total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
        total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
        long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
        long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
        long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
        realize_pandl, over_night_pandl, open_posi_date, open_posi_time) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
        total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
        total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
        total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
        long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
        long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
        long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
        realize_pandl, over_night_pandl, open_posi_date, open_posi_time 
        from db_tdsecu.tb_tdset0_stock_posi_sum;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1261";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_T0_操作员券源设置表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_opor_stock_source";

    /* [不分日期数据归历史][交易证券_T0_操作员券源设置表][字段][1301][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_opor_stock_source_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, begin_qty, 
        source_stock_qty, single_limit_qty, assigned_qty, trade_releas_qty, 
        trade_capt_qty, strike_releas_qty, strike_capt_qty, total_realize_pandl, 
        over_night_pandl, sum_realize_pandl, total_open_posi_fee, total_close_posi_fee, 
        out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, out_strike_capt_qty, 
        over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, diff_qty, 
        t0_buy_type, remark_info) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, begin_qty, 
        source_stock_qty, single_limit_qty, assigned_qty, trade_releas_qty, 
        trade_capt_qty, strike_releas_qty, strike_capt_qty, total_realize_pandl, 
        over_night_pandl, sum_realize_pandl, total_open_posi_fee, total_close_posi_fee, 
        out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, out_strike_capt_qty, 
        over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, diff_qty, 
        t0_buy_type, remark_info 
        from db_tdsecu.tb_tdset0_opor_stock_source;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1301";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* update ~交易证券_T0_操作员券源设置表^ set {隔夜盈亏} = ({隔夜盈亏}+{总实现盈亏}) where {成交占用数量} <>  {成交释放数量}; */
    update db_tdsecu.tb_tdset0_opor_stock_source set over_night_pandl = (over_night_pandl+total_realize_pandl) where strike_capt_qty <>  strike_releas_qty;

    /* [更新表记录][交易证券_T0_操作员券源设置表][{数量差额} = {数量差额} + {成交释放数量} - {成交占用数量}][1=1][1302][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, diff_qty = diff_qty + strike_releas_qty - strike_capt_qty where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_操作员券源设置表][{隔夜仓强平交易买入数量}= 0,{隔夜仓强平交易卖出数量}=0,{隔夜仓强平成交卖出数量}=0,{交易释放数量} = 0,{交易占用数量} = 0,{成交释放数量} = 0,{成交占用数量} = 0,{总实现盈亏} = 0,{总开仓费用} = 0,{总平仓费用} = 0,{外部交易释放数量} = 0,{外部交易占用数量} = 0,{外部成交释放数量} = 0,{外部成交占用数量} = 0][1=1][1302][@初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, over_night_trade_buy_qty= 0,over_night_trade_sell_qty=0,over_night_strike_sell_qty=0,trade_releas_qty = 0,trade_capt_qty = 0,strike_releas_qty = 0,strike_capt_qty = 0,total_realize_pandl = 0,total_open_posi_fee = 0,total_close_posi_fee = 0,out_order_releas_qty = 0,out_order_capt_qty = 0,out_strike_releas_qty = 0,out_strike_capt_qty = 0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #增加券源流水表的归档。Modify by wjp20180929

    /* set @数据表名称# = "~交易证券_T0_操作员券源设置流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_opor_stock_source_jour";

    /* [数据归历史][交易证券_T0_操作员券源设置流水表][字段][{初始化日期}<=@初始化日期#][1303][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_opor_stock_source_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info 
        from db_tdsecu.tb_tdset0_opor_stock_source_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1303";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_操作员券源设置流水表][{初始化日期}<=@初始化日期#][1304][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_opor_stock_source_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1304";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #汇总表先删除所有记录，再根据剩下的明细表再次进行汇总

    /* set @数据表名称# = "~交易证券_T0_证券持仓汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_stock_posi_sum";

    /* [删除表记录][交易证券_T0_证券持仓汇总表][1=1][1262][@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_stock_posi_sum 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1262";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    loop_label:loop

        /* 调用【原子_交易证券_T0_锁定获取持仓明细记录】*/
        call db_tdsecu.pra_tdset0_LockGetPosiDetail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info,
            v_detail_posi_id,
            v_busi_opor_no,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_stock_code,
            v_stock_acco_no,
            v_stock_code_no,
            v_lngsht_type,
            v_curr_qty,
            v_open_posi_date,
            v_open_posi_time,
            v_open_posi_price,
            v_open_posi_value,
            v_open_posi_fee,
            v_close_posi_qty,
            v_close_posi_date,
            v_close_posi_time,
            v_close_posi_market_value,
            v_close_posi_fee,
            v_strike_no,
            v_realize_pandl,
            v_over_night_pandl,
            v_posi_status);

        /* set @操作员编号# = @业务操作员编号#; */
        set v_opor_no = v_busi_opor_no;

        /* set @总实现盈亏#=0; */
        set v_total_realize_pandl=0;

        /* set @总多头当前数量#=0; */
        set v_total_long_curr_qty=0;

        /* set @总空头当前数量#=0; */
        set v_total_short_curr_qty=0;

        /* set @总多头开仓市值#=0; */
        set v_total_long_open_posi_value=0;

        /* set @总空头开仓市值#=0; */
        set v_total_short_open_posi_value=0;

        /* set @总多头开仓费用#=0; */
        set v_total_long_open_posi_fee=0;

        /* set @总空头开仓费用#=0; */
        set v_total_short_open_posi_fee=0;

        /* set @总多头平仓市值#=0; */
        set v_total_long_close_posi_value=0;

        /* set @总空头平仓市值#=0; */
        set v_total_short_close_posi_value=0;

        /* set @总多头平仓数量#=0; */
        set v_total_long_close_posi_qty=0;

        /* set @总空头平仓数量#=0; */
        set v_total_short_close_posi_qty=0;

        /* set @总多头平仓费用#=0; */
        set v_total_long_close_posi_fee=0;

        /* set @总空头平仓费用#=0; */
        set v_total_short_close_posi_fee=0;

        /* set @多头当前数量#=0; */
        set v_long_curr_qty=0;

        /* set @空头当前数量#=0; */
        set v_short_curr_qty=0;

        /* set @多头开仓市值#=0; */
        set v_long_open_posi_value=0;

        /* set @空头开仓市值#=0; */
        set v_short_open_posi_value=0;

        /* set @多头开仓费用#=0; */
        set v_long_open_posi_fee=0;

        /* set @空头开仓费用#=0; */
        set v_short_open_posi_fee=0;

        /* set @多头平仓数量#=0; */
        set v_long_close_posi_qty=0;

        /* set @空头平仓数量#=0; */
        set v_short_close_posi_qty=0;

        /* set @多头平仓市值#=0; */
        set v_long_close_posi_value=0;

        /* set @空头平仓市值#=0; */
        set v_short_close_posi_value=0;

        /* set @多头平仓费用#=0; */
        set v_long_close_posi_fee=0;

        /* set @空头平仓费用#=0; */
        set v_short_close_posi_fee=0;

        /* set @实现盈亏#=0; */
        set v_realize_pandl=0;

        /* set @记录序号# = @明细持仓序号#; */
        set v_row_id = v_detail_posi_id;

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* if @多空类型#= 《多空类型-多头》 then */
            if v_lngsht_type= 1 then

                /* set @总多头当前数量# = @当前数量#; */
                set v_total_long_curr_qty = v_curr_qty;

                /* set @多头当前数量# = @当前数量#; */
                set v_long_curr_qty = v_curr_qty;

                /* set @总多头开仓市值# = @开仓市值#; */
                set v_total_long_open_posi_value = v_open_posi_value;

                /* set @多头开仓市值# = @开仓市值#; */
                set v_long_open_posi_value = v_open_posi_value;

                /* set @总多头开仓费用# = @开仓费用#; */
                set v_total_long_open_posi_fee = v_open_posi_fee;

                /* set @多头开仓费用# = @开仓费用#; */
                set v_long_open_posi_fee = v_open_posi_fee;

                /* set @总多头平仓市值# = @平仓市值#; */
                set v_total_long_close_posi_value = v_close_posi_market_value;

                /* set @多头平仓市值# = @平仓市值#; */
                set v_long_close_posi_value = v_close_posi_market_value;

                /* set @总多头平仓数量# = @平仓数量#; */
                set v_total_long_close_posi_qty = v_close_posi_qty;

                /* set @多头平仓数量# = @平仓数量#; */
                set v_long_close_posi_qty = v_close_posi_qty;

                /* set @总多头平仓费用# = @平仓费用#; */
                set v_total_long_close_posi_fee = v_close_posi_fee;

                /* set @多头平仓费用# = @平仓费用#; */
                set v_long_close_posi_fee = v_close_posi_fee;

                /* [插入重复更新][交易证券_T0_证券持仓汇总表][字段][字段变量][{总多头当前数量}={总多头当前数量} + @当前数量#,{多头当前数量}={多头当前数量}+@当前数量#,{总多头开仓市值}={总多头开仓市值} + @开仓市值#,{多头开仓市值}={多头开仓市值}+@开仓市值#,{总多头开仓费用}={总多头开仓费用} + @开仓费用#,{多头开仓费用}={多头开仓费用}+@开仓费用#,{总多头平仓市值}={总多头平仓市值} + @平仓市值#,{多头平仓市值}={多头平仓市值}+@平仓市值#,{总多头平仓数量}={总多头平仓数量} + @平仓数量#,{多头平仓数量}={多头平仓数量}+@平仓数量#,{总多头平仓费用}={总多头平仓费用} + @平仓费用#,{多头平仓费用}={多头平仓费用}+@平仓费用#,{隔夜盈亏}={隔夜盈亏} + @隔夜盈亏#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_tdsecu.tb_tdset0_stock_posi_sum (
                    create_date, create_time, update_date, 
                    update_time, update_times, opor_no, co_no, 
                    pd_no, exch_group_no, asset_acco_no, exch_no, 
                    stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
                    total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
                    total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
                    total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
                    long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
                    long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
                    long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
                    realize_pandl, over_night_pandl, open_posi_date, open_posi_time) 
                values(
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_opor_no, v_co_no, 
                    v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                    v_stock_code, v_stock_acco_no, v_stock_code_no, v_total_long_curr_qty, 
                    v_total_short_curr_qty, v_total_long_open_posi_value, v_total_short_open_posi_value, v_total_long_open_posi_fee, 
                    v_total_short_open_posi_fee, v_total_long_close_posi_value, v_total_short_close_posi_value, v_total_long_close_posi_qty, 
                    v_total_short_close_posi_qty, v_total_long_close_posi_fee, v_total_short_close_posi_fee, v_total_realize_pandl, 
                    v_long_curr_qty, v_short_curr_qty, v_long_open_posi_value, v_short_open_posi_value, 
                    v_long_open_posi_fee, v_short_open_posi_fee, v_long_close_posi_qty, v_short_close_posi_qty, 
                    v_long_close_posi_value, v_short_close_posi_value, v_long_close_posi_fee, v_short_close_posi_fee, 
                    v_realize_pandl, v_over_night_pandl, v_open_posi_date, v_open_posi_time) 
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_long_curr_qty=total_long_curr_qty + v_curr_qty,long_curr_qty=long_curr_qty+v_curr_qty,total_long_open_posi_value=total_long_open_posi_value + v_open_posi_value,long_open_posi_value=long_open_posi_value+v_open_posi_value,total_long_open_posi_fee=total_long_open_posi_fee + v_open_posi_fee,long_open_posi_fee=long_open_posi_fee+v_open_posi_fee,total_long_close_posi_value=total_long_close_posi_value + v_close_posi_market_value,long_close_posi_value=long_close_posi_value+v_close_posi_market_value,total_long_close_posi_qty=total_long_close_posi_qty + v_close_posi_qty,long_close_posi_qty=long_close_posi_qty+v_close_posi_qty,total_long_close_posi_fee=total_long_close_posi_fee + v_close_posi_fee,long_close_posi_fee=long_close_posi_fee+v_close_posi_fee,over_night_pandl=over_night_pandl + v_over_night_pandl;
                if v_error_code = "1" then
                            
                    SET v_error_code = "tdsecuA.1.59.1";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
                    end if;
                    leave label_pro;
                end if;

            else

                /* set @总空头当前数量# = @当前数量#; */
                set v_total_short_curr_qty = v_curr_qty;

                /* set @空头当前数量# = @当前数量#; */
                set v_short_curr_qty = v_curr_qty;

                /* set @总空头开仓市值# = @开仓市值#; */
                set v_total_short_open_posi_value = v_open_posi_value;

                /* set @空头开仓市值# = @开仓市值#; */
                set v_short_open_posi_value = v_open_posi_value;

                /* set @总空头开仓费用# = @开仓费用#; */
                set v_total_short_open_posi_fee = v_open_posi_fee;

                /* set @空头开仓费用# = @开仓费用#; */
                set v_short_open_posi_fee = v_open_posi_fee;

                /* set @总空头平仓市值# = @平仓市值#; */
                set v_total_short_close_posi_value = v_close_posi_market_value;

                /* set @空头平仓市值# = @平仓市值#; */
                set v_short_close_posi_value = v_close_posi_market_value;

                /* set @总空头平仓数量# = @平仓数量#; */
                set v_total_short_close_posi_qty = v_close_posi_qty;

                /* set @空头平仓数量# = @平仓数量#; */
                set v_short_close_posi_qty = v_close_posi_qty;

                /* set @总空头平仓费用# = @平仓费用#; */
                set v_total_short_close_posi_fee = v_close_posi_fee;

                /* set @空头平仓费用# = @平仓费用#; */
                set v_short_close_posi_fee = v_close_posi_fee;

                /* [插入重复更新][交易证券_T0_证券持仓汇总表][字段][字段变量][{总空头当前数量}={总空头当前数量} + @当前数量#,{空头当前数量} ={空头当前数量}+@当前数量#,{总空头开仓市值}={总空头开仓市值} + @开仓市值#,{空头开仓市值}={空头开仓市值} + @开仓市值#,{总空头开仓费用}={总空头开仓费用} + @开仓费用#,{空头开仓费用}={空头开仓费用} + @开仓费用#,{总空头平仓市值}={总空头平仓市值} + @平仓市值#,{空头平仓市值}={空头平仓市值} + @平仓市值#,{总空头平仓数量}={总空头平仓数量} + @平仓数量#,{空头平仓数量}={空头平仓数量} + @平仓数量#,{总空头平仓费用}={总空头平仓费用} + @平仓费用#,{空头平仓费用}={空头平仓费用} + @平仓费用#,{隔夜盈亏}={隔夜盈亏} + @隔夜盈亏#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#] */
                set v_create_date = date_format(curdate(),'%Y%m%d');
                set v_create_time = date_format(curtime(),'%H%i%s');
                set v_update_date = v_create_date;
                set v_update_time = v_create_time;
                set v_update_times = 1;
                insert into db_tdsecu.tb_tdset0_stock_posi_sum (
                    create_date, create_time, update_date, 
                    update_time, update_times, opor_no, co_no, 
                    pd_no, exch_group_no, asset_acco_no, exch_no, 
                    stock_code, stock_acco_no, stock_code_no, total_long_curr_qty, 
                    total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, total_long_open_posi_fee, 
                    total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, total_long_close_posi_qty, 
                    total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, total_realize_pandl, 
                    long_curr_qty, short_curr_qty, long_open_posi_value, short_open_posi_value, 
                    long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, short_close_posi_qty, 
                    long_close_posi_value, short_close_posi_value, long_close_posi_fee, short_close_posi_fee, 
                    realize_pandl, over_night_pandl, open_posi_date, open_posi_time) 
                values(
                    v_create_date, v_create_time, v_update_date, 
                    v_update_time, v_update_times, v_opor_no, v_co_no, 
                    v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
                    v_stock_code, v_stock_acco_no, v_stock_code_no, v_total_long_curr_qty, 
                    v_total_short_curr_qty, v_total_long_open_posi_value, v_total_short_open_posi_value, v_total_long_open_posi_fee, 
                    v_total_short_open_posi_fee, v_total_long_close_posi_value, v_total_short_close_posi_value, v_total_long_close_posi_qty, 
                    v_total_short_close_posi_qty, v_total_long_close_posi_fee, v_total_short_close_posi_fee, v_total_realize_pandl, 
                    v_long_curr_qty, v_short_curr_qty, v_long_open_posi_value, v_short_open_posi_value, 
                    v_long_open_posi_fee, v_short_open_posi_fee, v_long_close_posi_qty, v_short_close_posi_qty, 
                    v_long_close_posi_value, v_short_close_posi_value, v_long_close_posi_fee, v_short_close_posi_fee, 
                    v_realize_pandl, v_over_night_pandl, v_open_posi_date, v_open_posi_time) 
                ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_short_curr_qty=total_short_curr_qty + v_curr_qty,short_curr_qty =short_curr_qty+v_curr_qty,total_short_open_posi_value=total_short_open_posi_value + v_open_posi_value,short_open_posi_value=short_open_posi_value + v_open_posi_value,total_short_open_posi_fee=total_short_open_posi_fee + v_open_posi_fee,short_open_posi_fee=short_open_posi_fee + v_open_posi_fee,total_short_close_posi_value=total_short_close_posi_value + v_close_posi_market_value,short_close_posi_value=short_close_posi_value + v_close_posi_market_value,total_short_close_posi_qty=total_short_close_posi_qty + v_close_posi_qty,short_close_posi_qty=short_close_posi_qty + v_close_posi_qty,total_short_close_posi_fee=total_short_close_posi_fee + v_close_posi_fee,short_close_posi_fee=short_close_posi_fee + v_close_posi_fee,over_night_pandl=over_night_pandl + v_over_night_pandl;
                if v_error_code = "1" then
                            
                    SET v_error_code = "tdsecuA.1.59.1";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
                    end if;
                    leave label_pro;
                end if;

            end if;
        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;
    end loop;

    /* set @数据表名称# = "~交易证券_T0_证券平仓成交明细表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_close_posi_strike_detail";

    /* [数据归历史][交易证券_T0_证券平仓成交明细表][字段][{初始化日期}<=@初始化日期#][1240][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_close_posi_strike_detail_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        lngsht_type, detail_posi_id, strike_no, close_posi_date, 
        close_posi_time, close_posi_price, close_posi_qty, close_posi_market_value, 
        close_posi_fee, realize_pandl) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        lngsht_type, detail_posi_id, strike_no, close_posi_date, 
        close_posi_time, close_posi_price, close_posi_qty, close_posi_market_value, 
        close_posi_fee, realize_pandl 
        from db_tdsecu.tb_tdset0_close_posi_strike_detail 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1240";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_证券平仓成交明细表][{初始化日期}<=@初始化日期#][1241][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_close_posi_strike_detail 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1241";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_T0_证券平仓成交明细表][{初始化日期}=@下日初始化日期#][1=1][1253][@下日初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_close_posi_strike_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_T0_持仓作废流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdset0_posi_cancel_jour";

    /* [数据归历史][交易证券_T0_持仓作废流水表][字段][{初始化日期}<=@初始化日期#][1242][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdset0_posi_cancel_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, stock_acco_no, exch_no, stock_code, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        waste_qty, busi_opor_no, waste_date, waste_time, 
        detail_posi_id) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, stock_acco_no, exch_no, stock_code, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        waste_qty, busi_opor_no, waste_date, waste_time, 
        detail_posi_id 
        from db_tdsecu.tb_tdset0_posi_cancel_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1242";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_持仓作废流水表][{初始化日期}<=@初始化日期#][1243][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdset0_posi_cancel_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1243";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_资金持仓归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CapitPosiArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CapitPosiArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_table_name varchar(64);
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~交易证券_账户_历史交易组业务资金表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_exgp_busi_capit_his";

    /* [删除表记录][交易证券_账户_历史交易组业务资金表][{初始化日期}=@初始化日期#][1160][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_busi_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1160";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组业务资金表][字段][1161][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, comm_frozen_amt, 
        comm_unfroz_amt, comm_capt_amt, comm_releas_amt, trade_frozen_amt, 
        trade_unfroz_amt, trade_capt_amt, trade_releas_amt, strike_capt_amt, 
        strike_releas_amt 
        from db_tdsecu.tb_tdseac_exgp_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1161";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金表][1=1][1162][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1162";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史交易组业务持仓表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_exgp_busi_posi_his";

    /* [删除表记录][交易证券_账户_历史交易组业务持仓表][{初始化日期}=@初始化日期#][1170][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_busi_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1170";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组业务持仓表][字段][1171][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, stock_type, asset_type, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, comm_frozen_qty, 
        comm_unfroz_qty, comm_capt_qty, comm_releas_qty, trade_frozen_qty, 
        trade_unfroz_qty, trade_capt_qty, trade_releas_qty, strike_capt_qty, 
        strike_releas_qty, strike_frozen_qty, strike_unfroz_qty, realize_pandl, 
        cost_amt, intrst_cost_amt, intrst_pandl 
        from db_tdsecu.tb_tdseac_exgp_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1171";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务持仓表][1=1][1172][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1172";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_交易组业务资金持仓变动流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour";

    /* [数据归历史][交易证券_账户_交易组业务资金持仓变动流水表][字段][{初始化日期}<=@初始化日期#][1180][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_busi_capit_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info 
        from db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1180";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组业务资金持仓变动流水表][{初始化日期}<=@初始化日期#][1181][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1181";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史资产账户业务资金表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_asac_busi_capit_his";

    /* [删除表记录][交易证券_账户_历史资产账户业务资金表][{初始化日期}=@初始化日期#][1190][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_asac_busi_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1190";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户业务资金表][字段][1191][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_frozen_amt, trade_unfroz_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, comm_frozen_amt, comm_unfroz_amt, 
        comm_capt_amt, comm_releas_amt, trade_frozen_amt, trade_unfroz_amt, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt 
        from db_tdsecu.tb_tdseac_asac_busi_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1191";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金表][1=1][1192][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1192";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史资产账户业务持仓表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_asac_busi_posi_his";

    /* [删除表记录][交易证券_账户_历史资产账户业务持仓表][{初始化日期}=@初始化日期#][1200][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_asac_busi_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1200";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户业务持仓表][字段][1201][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
        strike_frozen_qty, strike_unfroz_qty, realize_pandl, cost_amt, 
        intrst_cost_amt, intrst_pandl) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        stock_type, asset_type, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, comm_frozen_qty, comm_unfroz_qty, 
        comm_capt_qty, comm_releas_qty, trade_frozen_qty, trade_unfroz_qty, 
        trade_capt_qty, trade_releas_qty, strike_capt_qty, strike_releas_qty, 
        strike_frozen_qty, strike_unfroz_qty, realize_pandl, cost_amt, 
        intrst_cost_amt, intrst_pandl 
        from db_tdsecu.tb_tdseac_asac_busi_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1201";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务持仓表][1=1][1202][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1202";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_资产账户业务资金持仓变动流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour";

    /* [数据归历史][交易证券_账户_资产账户业务资金持仓变动流水表][字段][{初始化日期}<=@初始化日期#][1210][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_busi_capit_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_crncy_type, exch_no, stock_acco_no, stock_code_no, 
        stock_type, comm_id, order_strike_id, order_dir, 
        comm_occur_amt, comm_occur_qty, trade_occur_amt, trade_occur_qty, 
        strike_occur_amt, strike_occur_qty, remark_info 
        from db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1210";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户业务资金持仓变动流水表][{初始化日期}<=@初始化日期#][1211][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_busi_capit_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1211";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史交易组债券质押表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his";
    #质押记录也统一到账户那边处理

    /* [删除表记录][交易证券_账户_历史交易组债券质押表][{初始化日期}=@初始化日期#][1220][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1220";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_交易组债券质押表][字段][1221][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_exgp_bond_impawn_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty, target_code_no) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, exch_no, stock_acco_no, 
        stock_code_no, begin_qty, curr_qty, put_impawn_qty, 
        get_impawn_qty, target_code_no 
        from db_tdsecu.tb_tdseac_exgp_bond_impawn;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1221";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_交易组债券质押表][1=1][1222][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_exgp_bond_impawn 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1222";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_历史资产账户债券质押表^"; */
    set v_table_name = "db_tdsecu_his.tb_tdseac_asac_bond_impawn_his";

    /* [删除表记录][交易证券_账户_历史资产账户债券质押表][{初始化日期}=@初始化日期#][1230][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu_his.tb_tdseac_asac_bond_impawn_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1230";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][交易证券_账户_资产账户债券质押表][字段][1231][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_asac_bond_impawn_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty, 
        target_code_no) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, stock_acco_no, stock_code_no, 
        begin_qty, curr_qty, put_impawn_qty, get_impawn_qty, 
        target_code_no 
        from db_tdsecu.tb_tdseac_asac_bond_impawn;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1231";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_资产账户债券质押表][1=1][1232][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_asac_bond_impawn 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1232";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_账户_债券回购表^"; */
    set v_table_name = "db_tdsecu.tb_tdseac_bond_repo";

    /* [数据归历史][交易证券_账户_债券回购表][字段][{初始化日期}<=@初始化日期#][1240][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseac_bond_repo_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, comm_id, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, exch_rate, exch_no, 
        stock_acco_no, stock_code_no, target_code_no, comm_id, 
        order_dir, repo_qty, repo_amt, repo_rate, 
        repo_trade_date, repo_order_id, repo_strike_id, repo_days, 
        repo_cale_days, repo_back_date, repo_back_amt, repo_back_intrst, 
        repo_back_trade_date, repo_status 
        from db_tdsecu.tb_tdseac_bond_repo 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1240";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_账户_债券回购表][{初始化日期}<=@初始化日期#][1241][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseac_bond_repo 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.59.1241";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_账户_债券回购表][{初始化日期}=@下日初始化日期#][1=1][1253][@下日初始化日期#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseac_bond_repo set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.59.1253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_成交归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_StrikeArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_StrikeArchive(
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
    

    /* set @数据表名称# = "~交易证券_报盘_成交回报表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_strikersp";

    /* [数据归历史][交易证券_报盘_成交回报表][字段][{初始化日期}<=@初始化日期#][1130][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_strikersp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_no, strike_date, 
        strike_time, strike_no, order_dir, strike_price, 
        strike_qty, strike_amt, strike_deal_type, rsp_info, 
        deal_status, sett_flag, record_valid_flag, asset_acco_type 
        from db_tdsecu.tb_tdserp_strikersp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.60.1130";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交回报表][{初始化日期}<=@初始化日期#][1131][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_strikersp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.60.1131";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_成交表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_strike";

    /* [数据归历史][交易证券_报盘_成交表][字段][{订单日期}<=@初始化日期#][1140][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_strike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        init_date, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code, stock_code_no, stock_type, 
        asset_type, comm_id, comm_batch_no, strike_date, 
        strike_time, strike_no, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_price, strike_amt, all_fee, stamp_tax, 
        trans_fee, brkage_fee, SEC_charges, other_fee, 
        trade_commis, other_commis, trade_tax, trade_cost_fee, 
        trade_system_use_fee, stock_settle_fee, net_price_flag, intrst_days, 
        par_value, bond_accr_intrst, bond_rate_type, impawn_ratio, 
        strike_bond_accr_intrst, trade_code_no, target_code_no, order_oper_way, 
        exter_comm_flag, record_valid_flag, external_no, combo_code, 
        asset_acco_type 
        from db_tdsecu.tb_tdserp_strike 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.60.1140";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交表][{订单日期}<=@初始化日期#][1141][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_strike 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.60.1141";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_成交汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_sumstrike";

    /* [数据归历史][交易证券_报盘_成交汇总表][字段][{订单日期}<=@初始化日期#][1150][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_sumstrike_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, pass_no, out_acco, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_id, strike_date, report_date, report_no, 
        order_date, order_time, order_batch_no, order_id, 
        order_dir, order_price, order_qty, strike_qty, 
        strike_amt, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, trade_code_no, 
        target_code_no, strike_bond_accr_intrst, order_oper_way, exter_comm_flag, 
        record_valid_flag 
        from db_tdsecu.tb_tdserp_sumstrike 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.60.1150";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_成交汇总表][{订单日期}<=@初始化日期#][1151][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_sumstrike 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.60.1151";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_订单归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_OrderArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_OrderArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
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
    declare v_next_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_table_name varchar(64);
    declare v_order_date int;
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
    SET v_next_init_date = p_next_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_table_name = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~交易证券_交易_订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_order";

    /* [数据归历史][交易证券_交易_订单表][字段][{订单日期}<=@初始化日期#][1050][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_order_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, trade_code_no, 
        target_code_no, stock_type, asset_type, external_no, 
        comm_id, comm_batch_no, comm_opor, report_date, 
        report_time, report_no, order_date, order_time, 
        order_batch_no, order_dir, price_type, order_price, 
        order_qty, order_status, wtdraw_qty, strike_amt, 
        strike_qty, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, strike_bond_accr_intrst, impawn_ratio, 
        order_frozen_amt, order_frozen_qty, rsp_info, compli_trig_id, 
        remark_info, cost_calc_type, order_oper_way, exter_comm_flag, 
        record_valid_flag, combo_code, combo_posi_id, strategy_id, 
        sett_flag, target_stock_code, target_stock_code_no, registration_agency, 
        trade_acco, contra_no, asset_acco_type, exist_debt_flag 
        from db_tdsecu.tb_tdsetd_order 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1050";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_订单表][{订单日期}<=@初始化日期#][1051][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_order 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1051";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_订单汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_sumorder";

    /* [数据归历史][交易证券_交易_订单汇总表][字段][{订单日期}<=@初始化日期#][1060][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_sumorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_crncy_type, exch_no, stock_code_no, stock_code, 
        trade_code_no, target_code_no, stock_type, asset_type, 
        external_no, order_date, order_batch_no, order_dir, 
        price_type, order_price, order_qty, order_sum_status, 
        wtdraw_qty, waste_qty, strike_amt, strike_qty, 
        strike_aver_price, all_fee, stamp_tax, trans_fee, 
        brkage_fee, SEC_charges, other_fee, trade_commis, 
        other_commis, trade_tax, trade_cost_fee, trade_system_use_fee, 
        stock_settle_fee, net_price_flag, intrst_days, par_value, 
        bond_accr_intrst, bond_rate_type, impawn_ratio, strike_bond_accr_intrst, 
        order_oper_way, exter_comm_flag, record_valid_flag 
        from db_tdsecu.tb_tdsetd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1060";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_订单汇总表][{订单日期}<=@初始化日期#][1061][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_sumorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1061";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_新股申购表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_purchaseorder";

    /* [数据归历史][交易证券_交易_新股申购表][字段][{订单日期}<=@初始化日期#][1070][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_purchaseorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_type, 
        report_date, report_time, report_no, order_date, 
        order_time, order_id, order_dir, order_price, 
        order_qty, all_fee, other_fee, trade_commis, 
        other_commis, order_frozen_amt, nav_asset, rsp_info, 
        compli_trig_id, trade_code_no, target_code_no, sett_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, stock_type, 
        report_date, report_time, report_no, order_date, 
        order_time, order_id, order_dir, order_price, 
        order_qty, all_fee, other_fee, trade_commis, 
        other_commis, order_frozen_amt, nav_asset, rsp_info, 
        compli_trig_id, trade_code_no, target_code_no, sett_flag 
        from db_tdsecu.tb_tdsetd_purchaseorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1070";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_新股申购表][{订单日期}<=@订单日期#][1071][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_purchaseorder 
        where order_date<=v_order_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1071";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_撤单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_cancel";

    /* [数据归历史][交易证券_交易_撤单表][字段][{撤单日期}<=@初始化日期#][1080][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_cancel_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_acco, stock_code_no, stock_code, external_no, 
        wtdraw_batch_no, wtdraw_date, wtdraw_time, order_date, 
        order_id, report_date, report_time, report_no, 
        wtdraw_status, wtdraw_qty, wtdraw_remark, order_price, 
        trade_acco 
        from db_tdsecu.tb_tdsetd_cancel 
        where wtdraw_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1080";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_撤单表][{撤单日期}<=@初始化日期#][1081][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_cancel 
        where wtdraw_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1081";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_预埋订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_preorder";

    /* [数据归历史][交易证券_交易_预埋订单表][字段][{预埋订单状态}=《预埋订单状态-已执行》][1090][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_preorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace 
        from db_tdsecu.tb_tdsetd_preorder 
        where pre_order_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1090";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_预埋订单表][{预埋订单状态}=《预埋订单状态-已执行》][1091][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_preorder 
        where pre_order_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1091";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_预埋订单表][字段][{触发日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-时间触发》][1090][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_preorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace 
        from db_tdsecu.tb_tdsetd_preorder 
        where trig_date<=v_init_date and pre_order_type= 3;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1090";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_预埋订单表][{触发日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-时间触发》][1091][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_preorder 
        where trig_date<=v_init_date and pre_order_type= 3;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1091";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][交易证券_交易_预埋订单表][字段][{预埋结束日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-价格触发》][1090][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_preorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_crncy_type, 
        exch_no, stock_acco_no, stock_acco, stock_code_no, 
        stock_code, stock_type, pre_order_date, pre_order_time, 
        pre_order_dir, pre_order_type, pre_order_price, pre_order_qty, 
        pre_order_status, pre_price_type, price_offset, pre_begin_date, 
        pre_end_date, pre_begin_time, pre_end_time, trig_type, 
        trig_price, trig_date, trig_time, order_date, 
        order_time, order_id, is_trace, price_up, 
        order_no_str, keep_trace 
        from db_tdsecu.tb_tdsetd_preorder 
        where pre_end_date<=v_init_date and pre_order_type= 2;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1090";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_预埋订单表][{预埋结束日期}<=@初始化日期# and {预埋订单方式}= 《预埋订单方式-价格触发》][1091][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_preorder 
        where pre_end_date<=v_init_date and pre_order_type= 2;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1091";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_交易_预埋订单表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdsetd_preorder set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_篮子订单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_basketorder";

    /* [数据归历史][交易证券_交易_篮子订单表][字段][{订单日期}<=@初始化日期#][1100][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_basketorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, basket_id, 
        order_date, order_time, order_batch_no, order_dir, 
        basket_trade_type, basket_trade_amt 
        from db_tdsecu.tb_tdsetd_basketorder 
        where order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1100";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_篮子订单表][{订单日期}<=@初始化日期#][1101][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_basketorder 
        where order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_交易_改单表^"; */
    set v_table_name = "db_tdsecu.tb_tdsetd_modifyorder";

    /* [数据归历史][交易证券_交易_改单表][字段][{改单日期}<=@初始化日期#][1110][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsetd_modifyorder_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, modi_order_date, modi_order_time, 
        modi_batch_no, order_id, comm_id, order_price, 
        order_qty, order_dir, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        exch_no, stock_acco_no, stock_code_no, stock_code, 
        stock_type, asset_type, modi_order_date, modi_order_time, 
        modi_batch_no, order_id, comm_id, order_price, 
        order_qty, order_dir, order_date, order_time, 
        price_type, modi_order_price, modi_order_qty, modi_order_status, 
        modi_price_type, crncy_type, exch_crncy_type, new_order_id, 
        remark_info, order_oper_way 
        from db_tdsecu.tb_tdsetd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1110";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易_改单表][{改单日期}<=@初始化日期#][1111][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdsetd_modifyorder 
        where modi_order_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1111";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_订单回报表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_orderrsp";

    /* [数据归历史][交易证券_报盘_订单回报表][字段][{初始化日期}<=@初始化日期#][1120][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_orderrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, stock_acco, 
        stock_code, report_date, report_time, report_no, 
        order_date, order_id, order_dir, order_price, 
        order_qty, price_type, order_rsp_status, rsp_info, 
        deal_status, record_valid_flag, contra_no 
        from db_tdsecu.tb_tdserp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1120";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_订单回报表][{初始化日期}<=@初始化日期#][1121][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_orderrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_报盘_撤单回报表^"; */
    set v_table_name = "db_tdsecu.tb_tdserp_cancelrsp";

    /* [数据归历史][交易证券_报盘_撤单回报表][字段][{初始化日期}<=@初始化日期#][1120][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdserp_cancelrsp_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, out_acco, exch_no, stock_code, 
        report_date, report_time, report_no, wtdraw_qty, 
        rsp_status, rsp_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, out_acco, exch_no, stock_code, 
        report_date, report_time, report_no, wtdraw_qty, 
        rsp_status, rsp_info 
        from db_tdsecu.tb_tdserp_cancelrsp 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.61.1120";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_报盘_撤单回报表][{初始化日期}<=@初始化日期#][1121][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdserp_cancelrsp 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.61.1121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_公用_指令归档
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdsepb_CommArchive;;
DELIMITER ;;
CREATE PROCEDURE pra_tdsepb_CommArchive(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_next_init_date int,
    IN p_buy_ref_rate decimal(18,12),
    IN p_sell_ref_rate decimal(18,12),
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
    declare v_next_init_date int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_table_name varchar(64);
    declare v_update_date int;
    declare v_update_time int;
    declare v_remark_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_comm_id bigint;
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_trade_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_comm_date int;
    declare v_comm_time int;
    declare v_comm_batch_no int;
    declare v_comm_status varchar(2);
    declare v_comm_opor int;
    declare v_comm_executor int;
    declare v_comm_dir int;
    declare v_comm_limit_price decimal(16,9);
    declare v_limit_actual_price decimal(16,9);
    declare v_comm_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_comm_cancel_qty decimal(18,2);
    declare v_strike_qty decimal(18,2);
    declare v_net_price_flag int;
    declare v_par_value decimal(16,9);
    declare v_impawn_ratio decimal(18,12);
    declare v_intrst_days int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_bond_rate_type int;
    declare v_comm_begin_date int;
    declare v_comm_end_date int;
    declare v_comm_begin_time int;
    declare v_comm_end_time int;
    declare v_comm_comple_flag int;
    declare v_basket_id bigint;
    declare v_comm_amt decimal(18,4);
    declare v_strike_amt decimal(18,4);
    declare v_comm_oper_way varchar(2);
    declare v_strike_status varchar(2);
    declare v_comm_appr_status varchar(2);
    declare v_exter_comm_flag int;
    declare v_oper_func_code varchar(16);
    declare v_combo_code varchar(32);
    declare v_comm_remark_info varchar(1024);
    declare v_comm_appr_qty decimal(18,2);
    declare v_acco_concat_info varchar(4096);

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
    SET v_next_init_date = p_next_init_date;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_sell_ref_rate = p_sell_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_table_name = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_remark_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_comm_id = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_target_code_no = 0;
    SET v_trade_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_comm_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_time = date_format(curtime(),'%H%i%s');
    SET v_comm_batch_no = 0;
    SET v_comm_status = "0";
    SET v_comm_opor = 0;
    SET v_comm_executor = 0;
    SET v_comm_dir = 0;
    SET v_comm_limit_price = 0;
    SET v_limit_actual_price = 0;
    SET v_comm_qty = 0;
    SET v_order_qty = 0;
    SET v_comm_cancel_qty = 0;
    SET v_strike_qty = 0;
    SET v_net_price_flag = 0;
    SET v_par_value = 0;
    SET v_impawn_ratio = 0;
    SET v_intrst_days = 0;
    SET v_bond_accr_intrst = 0;
    SET v_bond_rate_type = 0;
    SET v_comm_begin_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_end_date = date_format(curdate(),'%Y%m%d');
    SET v_comm_begin_time = date_format(curtime(),'%H%i%s');
    SET v_comm_end_time = date_format(curtime(),'%H%i%s');
    SET v_comm_comple_flag = 0;
    SET v_basket_id = 0;
    SET v_comm_amt = 0;
    SET v_strike_amt = 0;
    SET v_comm_oper_way = " ";
    SET v_strike_status = "0";
    SET v_comm_appr_status = " ";
    SET v_exter_comm_flag = 0;
    SET v_oper_func_code = " ";
    SET v_combo_code = " ";
    SET v_comm_remark_info = " ";
    SET v_comm_appr_qty = 0;
    SET v_acco_concat_info = " ";

    
    label_pro:BEGIN
    

    /* set @数据表名称# = "~交易证券_指令_指令表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command";

    /* [数据归历史][交易证券_指令_指令表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1000][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_acco_no, 
        stock_code_no, stock_code, target_code_no, trade_code_no, 
        stock_type, asset_type, comm_date, comm_time, 
        comm_batch_no, comm_opor, comm_executor, comm_dir, 
        comm_limit_price, limit_actual_price, comm_qty, comm_amt, 
        order_qty, comm_cancel_qty, strike_amt, strike_qty, 
        comm_frozen_amt, comm_frozen_qty, net_price_flag, par_value, 
        impawn_ratio, intrst_days, bond_accr_intrst, bond_rate_type, 
        capit_reback_days, posi_reback_days, strike_status, comm_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, comm_appr_date, comm_appr_time, 
        comm_appr_status, comm_appr_oper_no, comm_appr_oper, comm_appr_remark, 
        basket_id, comm_oper_way, exter_comm_flag, comm_comple_flag, 
        strategy_order_qty, strategy_capt_qty, combo_code, target_stock_code, 
        target_stock_code_no, comm_remark_info, workflow_type, contra_no, 
        asset_acco_type, exist_debt_flag, disp_opor, disp_status, 
        read_flag 
        from db_tdsecu.tb_tdseap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1000";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令表][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1001][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.62.1001";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][交易证券_指令_指令表][{初始化日期}=@下日初始化日期#][1=1][1002][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_command set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1002";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @备注信息#= " "; */
    set v_remark_info= " ";
    #汇总表先删除所有记录，再根据剩下的明细表再次进行汇总

    /* set @数据表名称# = "~交易证券_指令_指令汇总表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_sumcommand";

    /* [数据归历史][交易证券_指令_指令汇总表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1010][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_sumcommand_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, comm_remark_info, read_flag, acco_concat_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, comm_remark_info, read_flag, acco_concat_info 
        from db_tdsecu.tb_tdseap_sumcommand 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1010";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令汇总表][1=1][1262][@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_sumcommand 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.62.1262";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    #指令汇总新表，归档，清空当前表 不重新生成。

    /* set @数据表名称# = "~交易证券_交易运维_指令汇总考核表^"; */
    set v_table_name = "db_tdsecu.tb_tdsebk_sumcommand_check";

    /* [数据归历史][交易证券_交易运维_指令汇总考核表][字段][(({指令结束日期}<>0 and {指令结束日期}<=@初始化日期#) or ({指令结束日期}=0 and {指令日期}<=@初始化日期#)) or ({指令数量} - {指令撤销数量} - {成交数量}=0)][1013][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdsebk_sumcommand_check_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
        exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
        valid_qty_allday, comm_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_crncy_type, exch_no, stock_code_no, 
        stock_code, target_code_no, trade_code_no, stock_type, 
        asset_type, comm_date, comm_time, comm_batch_no, 
        comm_opor, comm_executor, comm_dir, comm_limit_price, 
        limit_actual_price, comm_qty, comm_amt, order_qty, 
        comm_cancel_qty, comm_await_cancel_qty, strike_amt, strike_qty, 
        net_price_flag, par_value, impawn_ratio, intrst_days, 
        bond_accr_intrst, bond_rate_type, strike_status, comm_sum_status, 
        comm_begin_date, comm_end_date, comm_begin_time, comm_end_time, 
        comm_comple_date, comm_comple_time, max_comm_comple_date, max_comm_comple_time, 
        comm_appr_date, comm_appr_time, comm_appr_qty, comm_sum_approve_status, 
        basket_id, buy_order_qty, sell_order_qty, buy_comm_qty, 
        sell_comm_qty, buy_strike_qty, sell_strike_qty, buy_strike_amt, 
        sell_strike_amt, buy_comm_amt, sell_comm_amt, comm_oper_way, 
        exter_comm_flag, valid_aver_price, valid_aver_price_allday, exec_price_diff, 
        exec_price_diff_allday, valid_ratio, valid_ratio_allday, valid_qty, 
        valid_qty_allday, comm_remark_info 
        from db_tdsecu.tb_tdsebk_sumcommand_check 
        where ((comm_end_date<>0 and comm_end_date<=v_init_date) or (comm_end_date=0 and comm_date<=v_init_date)) or (comm_qty - comm_cancel_qty - strike_qty=0);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1013";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_交易运维_指令汇总考核表][1=1][1263][@数据表名称#] */
    delete from db_tdsecu.tb_tdsebk_sumcommand_check 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.62.1263";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @记录序号# = 0 ; */
    set v_row_id = 0 ;
    loop_label:loop

        /* 调用【原子_交易证券_指令_循环锁定获取指令】*/
        call db_tdsecu.pra_tdseap_LoopLockGetComm(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_comm_id,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_target_code_no,
            v_trade_code_no,
            v_stock_type,
            v_asset_type,
            v_comm_date,
            v_comm_time,
            v_comm_batch_no,
            v_comm_status,
            v_comm_opor,
            v_comm_executor,
            v_comm_dir,
            v_comm_limit_price,
            v_limit_actual_price,
            v_comm_qty,
            v_order_qty,
            v_comm_cancel_qty,
            v_strike_qty,
            v_net_price_flag,
            v_par_value,
            v_impawn_ratio,
            v_intrst_days,
            v_bond_accr_intrst,
            v_bond_rate_type,
            v_comm_begin_date,
            v_comm_end_date,
            v_comm_begin_time,
            v_comm_end_time,
            v_comm_comple_flag,
            v_basket_id,
            v_comm_amt,
            v_strike_amt,
            v_comm_oper_way,
            v_strike_status,
            v_comm_appr_status,
            v_exter_comm_flag,
            v_oper_func_code,
            v_combo_code,
            v_comm_remark_info);

        /* set @记录序号# = @指令序号#; */
        set v_row_id = v_comm_id;

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* if @指令审批状态# = 《指令审批状态-审批通过》 or @指令审批状态# = 《指令审批状态-不审批》 then */
            if v_comm_appr_status = "2" or v_comm_appr_status = "4" then

                /* set @指令审批数量# = @指令数量#; */
                set v_comm_appr_qty = v_comm_qty;
            else

                /* set @指令审批数量# = 0; */
                set v_comm_appr_qty = 0;
            end if;

            /* set @账户拼接信息# = ""; */
            set v_acco_concat_info = "";

            /* 调用【原子_交易证券_指令_指令更新汇总指令】*/
            call db_tdsecu.pra_tdseap_CommUpdateSumComm(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_oper_func_code,
                v_init_date,
                v_comm_date,
                v_comm_time,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_pass_no,
                v_out_acco,
                v_exch_crncy_type,
                v_exch_no,
                v_stock_code_no,
                v_stock_code,
                v_target_code_no,
                v_trade_code_no,
                v_stock_type,
                v_asset_type,
                v_comm_opor,
                v_comm_executor,
                v_comm_batch_no,
                v_comm_dir,
                v_comm_limit_price,
                v_limit_actual_price,
                v_comm_qty,
                v_comm_amt,
                v_order_qty,
                v_comm_cancel_qty,
                v_strike_amt,
                v_strike_qty,
                v_comm_appr_qty,
                v_comm_begin_date,
                v_comm_end_date,
                v_comm_begin_time,
                v_comm_end_time,
                v_net_price_flag,
                v_par_value,
                v_impawn_ratio,
                v_intrst_days,
                v_bond_accr_intrst,
                v_bond_rate_type,
                v_strike_status,
                v_comm_status,
                v_comm_appr_status,
                v_basket_id,
                v_comm_oper_way,
                v_exter_comm_flag,
                v_buy_ref_rate,
                v_sell_ref_rate,
                v_comm_remark_info,
                v_acco_concat_info,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "tdsecuA.1.62.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_指令_指令更新汇总指令出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;
    end loop;

    /* [更新表记录][交易证券_指令_指令汇总表][{初始化日期}=@下日初始化日期#][1=1][1012][@下日初始化日期#,@数据表名称#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdseap_sumcommand set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, init_date=v_next_init_date where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1012";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("下日初始化日期=",v_next_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_指令_指令流水表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_jour";

    /* [数据归历史][交易证券_指令_指令流水表][字段][{初始化日期}<=@初始化日期#][1020][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info, 
        exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, comm_date, comm_id, 
        jour_occur_field, jour_occur_info, jour_after_occur_info, remark_info, 
        exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1020";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令流水表][{初始化日期}<=@初始化日期#][1021][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.62.1021";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_指令_指令分发表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_dispense";

    /* [数据归历史][交易证券_指令_指令分发表][字段][{初始化日期}<=@初始化日期#][1030][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_dispense_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, disp_date, disp_time, 
        before_comm_executor, comm_executor, is_withdraw, disp_flag, 
        disp_remark, exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, disp_date, disp_time, 
        before_comm_executor, comm_executor, is_withdraw, disp_flag, 
        disp_remark, exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_dispense 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1030";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令分发表][{初始化日期}<=@初始化日期#][1031][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_dispense 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.62.1031";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_指令_指令审批表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_approve";

    /* [数据归历史][交易证券_指令_指令审批表][字段][{初始化日期}<=@初始化日期#][1040][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_approve_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_opor, comm_dir, 
        comm_qty, comm_limit_price, limit_actual_price, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_appr_status, 
        comm_appr_remark, exter_comm_flag) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, comm_appr_date, 
        comm_appr_time, comm_appr_oper_no, comm_appr_oper, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_opor, comm_dir, 
        comm_qty, comm_limit_price, limit_actual_price, comm_begin_date, 
        comm_end_date, comm_begin_time, comm_end_time, comm_appr_status, 
        comm_appr_remark, exter_comm_flag 
        from db_tdsecu.tb_tdseap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1040";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令审批表][{初始化日期}<=@初始化日期#][1041][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_approve 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.62.1041";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* set @数据表名称# = "~交易证券_指令_指令转发审批表^"; */
    set v_table_name = "db_tdsecu.tb_tdseap_command_dispense_approve";

    /* [数据归历史][交易证券_指令_指令转发审批表][字段][{初始化日期}<=@初始化日期#][1042][@初始化日期#,@数据表名称#] */
    insert into db_tdsecu_his.tb_tdseap_command_dispense_approve_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, comm_executor, disp_flag, 
        disp_remark, before_comm_executor, is_withdraw, exter_comm_flag, 
        comm_dispense_appr_status, comm_dispense_appr_opor, comm_dispense_appr_date, comm_dispense_appr_time, 
        comm_dispense_appr_remark) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_func_code, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_acco_no, stock_code_no, stock_type, asset_type, 
        comm_date, comm_id, comm_batch_no, comm_dir, 
        comm_status, comm_opor, comm_executor, disp_flag, 
        disp_remark, before_comm_executor, is_withdraw, exter_comm_flag, 
        comm_dispense_appr_status, comm_dispense_appr_opor, comm_dispense_appr_date, comm_dispense_appr_time, 
        comm_dispense_appr_remark 
        from db_tdsecu.tb_tdseap_command_dispense_approve 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.1.62.1042";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_指令_指令转发审批表][{初始化日期}<=@初始化日期#][1043][@初始化日期#,@数据表名称#] */
    delete from db_tdsecu.tb_tdseap_command_dispense_approve 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.1.62.1043";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","数据表名称=",v_table_name);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


