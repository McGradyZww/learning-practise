DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_成交证券持仓明细变化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_StikePosiDetailChange;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_StikePosiDetailChange(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_busi_opor_no int,
    IN p_order_oper_way varchar(2),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_stock_acco_no int,
    IN p_asset_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_stock_code_no int,
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_strike_no varchar(64),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_fee decimal(18,4),
    IN p_trade_occur_qty decimal(18,2),
    IN p_strike_occur_qty decimal(18,2),
    IN p_trade_occur_amt decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_order_oper_way varchar(2);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_acco_no int;
    declare v_asset_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_stock_code_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_strike_no varchar(64);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_occur_qty decimal(18,2);
    declare v_trade_occur_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_lngsht_type int;
    declare v_pandl_dir_multi int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_remain_strike_qty decimal(18,2);
    declare v_remain_strike_amt decimal(18,4);
    declare v_remain_strike_fee decimal(18,4);
    declare v_close_posi_date int;
    declare v_close_posi_time int;
    declare v_close_posi_price decimal(16,9);
    declare v_detail_posi_id bigint;
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
    declare v_total_realize_pandl decimal(18,4);
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
    declare v_realize_pandl decimal(18,4);
    declare v_tmp_realize_pandl decimal(18,4);
    declare v_total_open_posi_fee decimal(18,4);
    declare v_total_close_posi_fee decimal(18,4);
    declare v_row_id bigint;
    declare v_posi_status varchar(2);
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_valid_posi_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_drop_type int;
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_type int;

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_order_oper_way = p_order_oper_way;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_stock_code_no = p_stock_code_no;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_strike_no = p_strike_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_fee = p_strike_fee;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_strike_occur_qty = p_strike_occur_qty;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_lngsht_type = 0;
    SET v_pandl_dir_multi = 0;
    SET v_strike_occur_amt = 0;
    SET v_remain_strike_qty = 0;
    SET v_remain_strike_amt = 0;
    SET v_remain_strike_fee = 0;
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_price = 0;
    SET v_detail_posi_id = 0;
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
    SET v_total_realize_pandl = 0;
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
    SET v_realize_pandl = 0;
    SET v_tmp_realize_pandl = 0;
    SET v_total_open_posi_fee = 0;
    SET v_total_close_posi_fee = 0;
    SET v_row_id = 0;
    SET v_posi_status = "0";
    SET v_curr_qty = 0;
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_over_night_pandl = 0;
    SET v_valid_posi_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_drop_type = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_type = 0;

    
    label_pro:BEGIN
    

    /* if @订单方向# = 《订单方向-买入》 or  @订单方向# = 《订单方向-融资买入》  then */
    if v_order_dir = 1 or  v_order_dir = 5  then

      /* SET @多空类型# = 1; */
      SET v_lngsht_type = 1;

      /* SET @盈亏方向乘数# = -1; */
      SET v_pandl_dir_multi = -1;

      /* set @成交变动金额# = @成交金额# +@成交费用#; */
      set v_strike_occur_amt = v_strike_amt +v_strike_fee;
    #elseif @订单方向# = 《订单方向-融资买入》 then
    #  SET @多空类型# = 1;
    #  SET @盈亏方向乘数# = -1;
    #  set @交易变动金额# = 0;
    #  set @成交变动金额# = 0;

    /* elseif @订单方向# = 《订单方向-卖出》 then */
    elseif v_order_dir = 2 then

      /* SET @多空类型# = 2; */
      SET v_lngsht_type = 2;

      /* SET @盈亏方向乘数# = 1; */
      SET v_pandl_dir_multi = 1;

      /* set @成交变动金额# = @成交金额# - @成交费用#; */
      set v_strike_occur_amt = v_strike_amt - v_strike_fee;
    end if;

    /* SET @剩余成交数量# = @成交数量#; */
    SET v_remain_strike_qty = v_strike_qty;

    /* SET @剩余成交金额# = @成交金额#; */
    SET v_remain_strike_amt = v_strike_amt;

    /* SET @剩余成交费用# = @成交费用#; */
    SET v_remain_strike_fee = v_strike_fee;

    /* set @平仓日期# = @成交日期#; */
    set v_close_posi_date = v_strike_date;

    /* set @平仓时间# = @成交时间#; */
    set v_close_posi_time = v_strike_time;

    /* set @平仓价格# = @成交价格#; */
    set v_close_posi_price = v_strike_price;

    /* set @明细持仓序号# = 0; */
    set v_detail_posi_id = 0;

    /* set @总多头当前数量# = 0; */
    set v_total_long_curr_qty = 0;

    /* set @总空头当前数量# = 0; */
    set v_total_short_curr_qty = 0;

    /* set @总多头开仓市值# = 0; */
    set v_total_long_open_posi_value = 0;

    /* set @总空头开仓市值# = 0; */
    set v_total_short_open_posi_value = 0;

    /* set @总多头开仓费用# = 0; */
    set v_total_long_open_posi_fee = 0;

    /* set @总空头开仓费用# = 0; */
    set v_total_short_open_posi_fee = 0;

    /* set @总多头平仓市值# = 0; */
    set v_total_long_close_posi_value = 0;

    /* set @总空头平仓市值# = 0; */
    set v_total_short_close_posi_value = 0;

    /* set @总多头平仓数量# = 0; */
    set v_total_long_close_posi_qty = 0;

    /* set @总空头平仓数量# = 0; */
    set v_total_short_close_posi_qty = 0;

    /* set @总多头平仓费用# = 0; */
    set v_total_long_close_posi_fee = 0;

    /* set @总空头平仓费用# = 0; */
    set v_total_short_close_posi_fee = 0;

    /* set @总实现盈亏# = 0; */
    set v_total_realize_pandl = 0;

    /* set @多头当前数量# = 0; */
    set v_long_curr_qty = 0;

    /* set @空头当前数量# = 0; */
    set v_short_curr_qty = 0;

    /* set @多头开仓市值# = 0; */
    set v_long_open_posi_value = 0;

    /* set @空头开仓市值# = 0; */
    set v_short_open_posi_value = 0;

    /* set @多头开仓费用# = 0; */
    set v_long_open_posi_fee = 0;

    /* set @空头开仓费用# = 0; */
    set v_short_open_posi_fee = 0;

    /* set @多头平仓数量# = 0; */
    set v_long_close_posi_qty = 0;

    /* set @空头平仓数量# = 0; */
    set v_short_close_posi_qty = 0;

    /* set @多头平仓市值# = 0; */
    set v_long_close_posi_value = 0;

    /* set @空头平仓市值# = 0; */
    set v_short_close_posi_value = 0;

    /* set @多头平仓费用# = 0; */
    set v_long_close_posi_fee = 0;

    /* set @空头平仓费用# = 0; */
    set v_short_close_posi_fee = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @临时_实现盈亏# = 0; */
    set v_tmp_realize_pandl = 0;

    /* set @总开仓费用# = 0; */
    set v_total_open_posi_fee = 0;

    /* set @总平仓费用# = 0; */
    set v_total_close_posi_fee = 0;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @记录序号# = 0; */
    set v_row_id = 0;

    /* set @持仓状态# = 《持仓状态-未平仓》; */
    set v_posi_status = "1";
    #增加日志。
      # insert into db_tdsecu.tb_tdset0_stock_posi_detail_update_log(create_date, create_time, update_date, update_time, update_times, co_no, opor_no, pd_no, exch_group_no, asset_acco_no, exch_no, stock_code, stock_acco_no, stock_code_no, lngsht_type, strike_date, strike_time, strike_no,strike_qty, remark_info) value( date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1, v_co_no, v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, v_lngsht_type, v_strike_date, v_strike_time, v_strike_no,v_strike_qty, concat("每笔成交处理入口"));
    loop_label:loop

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_锁定获取证券持仓明细记录】*/
        call db_tdsecu.pra_tdset0_LockGetStockPosiDetail(
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
            v_busi_opor_no,
            v_stock_code_no,
            v_exch_no,
            v_stock_acco_no,
            v_lngsht_type,
            v_posi_status,
            v_row_id,
            v_error_code,
            v_error_info,
            v_detail_posi_id,
            v_curr_qty,
            v_open_posi_price,
            v_open_posi_value,
            v_open_posi_fee,
            v_close_posi_qty,
            v_close_posi_market_value,
            v_close_posi_fee,
            v_realize_pandl,
            v_over_night_pandl);
            #if v_error_code<>"0" then
              # insert into db_tdsecu.tb_tdset0_stock_posi_detail_update_log(create_date, create_time, update_date, update_time, update_times, co_no, opor_no, pd_no, exch_group_no, asset_acco_no, exch_no, stock_code, stock_acco_no, stock_code_no, lngsht_type, strike_date, strike_time, strike_no, remark_info) value( date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1, v_co_no, v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, v_lngsht_type, v_strike_date, v_strike_time, v_strike_no, concat("持仓序号:",v_row_id));
            #end if;

        /* set @记录序号# = @明细持仓序号#; */
        set v_row_id = v_detail_posi_id;

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* SET @有效持仓数量# = @当前数量# - @平仓数量#; */
            SET v_valid_posi_qty = v_curr_qty - v_close_posi_qty;

            /* SET @平仓日期# = @成交日期#; */
            SET v_close_posi_date = v_strike_date;

            /* SET @平仓时间# = @成交时间#; */
            SET v_close_posi_time = v_strike_time;

            /* if @有效持仓数量# > @剩余成交数量# then */
            if v_valid_posi_qty > v_remain_strike_qty then

              /* SET @平仓数量# = @平仓数量# + @剩余成交数量#; */
              SET v_close_posi_qty = v_close_posi_qty + v_remain_strike_qty;

              /* SET @平仓市值# = @平仓市值# + @剩余成交金额#; */
              SET v_close_posi_market_value = v_close_posi_market_value + v_remain_strike_amt;

              /* SET @平仓费用# = round(@平仓费用# + @剩余成交费用#,2); */
              SET v_close_posi_fee = round(v_close_posi_fee + v_remain_strike_fee,2);

              /* SET @实现盈亏# = @实现盈亏# + (@剩余成交金额#-@开仓市值#*@剩余成交数量#/@当前数量#)*@盈亏方向乘数#-@剩余成交费用# - @开仓费用#*@剩余成交数量#/@当前数量# ; */
              SET v_realize_pandl = v_realize_pandl + (v_remain_strike_amt-v_open_posi_value*v_remain_strike_qty/v_curr_qty)*v_pandl_dir_multi-v_remain_strike_fee - v_open_posi_fee*v_remain_strike_qty/v_curr_qty ;

              /* set @总实现盈亏# = @总实现盈亏# + (@剩余成交金额#-@开仓市值#*@剩余成交数量#/@当前数量#)*@盈亏方向乘数#-@剩余成交费用# - @开仓费用#*@剩余成交数量#/@当前数量# ; */
              set v_total_realize_pandl = v_total_realize_pandl + (v_remain_strike_amt-v_open_posi_value*v_remain_strike_qty/v_curr_qty)*v_pandl_dir_multi-v_remain_strike_fee - v_open_posi_fee*v_remain_strike_qty/v_curr_qty ;

              /* set @总平仓费用# = round(@总平仓费用# +@剩余成交费用#,2); */
              set v_total_close_posi_fee = round(v_total_close_posi_fee +v_remain_strike_fee,2);

              /* set @临时_实现盈亏# = @临时_实现盈亏# + (@剩余成交金额#-@开仓市值#*@剩余成交数量#/@当前数量#)*@盈亏方向乘数#-@剩余成交费用# - @开仓费用#*@剩余成交数量#/@当前数量# ; */
              set v_tmp_realize_pandl = v_tmp_realize_pandl + (v_remain_strike_amt-v_open_posi_value*v_remain_strike_qty/v_curr_qty)*v_pandl_dir_multi-v_remain_strike_fee - v_open_posi_fee*v_remain_strike_qty/v_curr_qty ;
              #本笔是多，那平掉的是空仓的

              /* if @多空类型# = 1 then */
              if v_lngsht_type = 1 then

                  /* set @总空头平仓市值# = @总空头平仓市值# + @剩余成交金额#; */
                  set v_total_short_close_posi_value = v_total_short_close_posi_value + v_remain_strike_amt;

                  /* set @总空头平仓数量# = @总空头平仓数量# + @剩余成交数量#; */
                  set v_total_short_close_posi_qty = v_total_short_close_posi_qty + v_remain_strike_qty;

                  /* set @总空头平仓费用# = round(@总空头平仓费用# + @剩余成交费用#,2); */
                  set v_total_short_close_posi_fee = round(v_total_short_close_posi_fee + v_remain_strike_fee,2);

                  /* set @空头平仓市值# = @空头平仓市值# + @剩余成交金额#; */
                  set v_short_close_posi_value = v_short_close_posi_value + v_remain_strike_amt;

                  /* set @空头平仓数量# = @空头平仓数量# + @剩余成交数量#; */
                  set v_short_close_posi_qty = v_short_close_posi_qty + v_remain_strike_qty;

                  /* set @空头平仓费用# = round(@空头平仓费用# + @剩余成交费用#,2); */
                  set v_short_close_posi_fee = round(v_short_close_posi_fee + v_remain_strike_fee,2);

              /* elseif @多空类型# = 2 then */
              elseif v_lngsht_type = 2 then

                  /* set @总多头平仓市值# = @总多头平仓市值# + @剩余成交金额#; */
                  set v_total_long_close_posi_value = v_total_long_close_posi_value + v_remain_strike_amt;

                  /* set @总多头平仓数量# = @总多头平仓数量# + @剩余成交数量#; */
                  set v_total_long_close_posi_qty = v_total_long_close_posi_qty + v_remain_strike_qty;

                  /* set @总多头平仓费用# = round(@总多头平仓费用# + @剩余成交费用#,2); */
                  set v_total_long_close_posi_fee = round(v_total_long_close_posi_fee + v_remain_strike_fee,2);

                  /* set @多头平仓市值# = @多头平仓市值# + @剩余成交金额#; */
                  set v_long_close_posi_value = v_long_close_posi_value + v_remain_strike_amt;

                  /* set @多头平仓数量# = @多头平仓数量# + @剩余成交数量#; */
                  set v_long_close_posi_qty = v_long_close_posi_qty + v_remain_strike_qty;

                  /* set @多头平仓费用# = round(@多头平仓费用# + @剩余成交费用#,2); */
                  set v_long_close_posi_fee = round(v_long_close_posi_fee + v_remain_strike_fee,2);
              end if;

              /* [更新表记录][交易证券_T0_证券持仓明细表][{平仓数量}=@平仓数量#,{平仓市值}=@平仓市值#,{平仓费用}=@平仓费用#,{实现盈亏}=@实现盈亏#,{平仓日期}=@平仓日期#,{平仓时间}=@平仓时间#][{记录序号}=@明细持仓序号#][1][@明细持仓序号#] */
              set v_update_date = date_format(curdate(),'%Y%m%d');
              set v_update_time = date_format(curtime(),'%H%i%s');
              update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=v_close_posi_qty,close_posi_market_value=v_close_posi_market_value,close_posi_fee=v_close_posi_fee,realize_pandl=v_realize_pandl,close_posi_date=v_close_posi_date,close_posi_time=v_close_posi_time where row_id=v_detail_posi_id;
              if v_error_code = "1" then
                  ROLLBACK;        
                  SET v_error_code = "tdsecuA.6.51.1";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                  end if;
                  leave label_pro;
              end if;


              /* [插入表记录][交易证券_T0_证券平仓成交明细表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期}, {明细持仓序号}, {成交编号}, {机构编号}, {产品编号}, {交易组编号}, {证券代码编号}, {市场编号}, {股东代码编号}, {资产账户编号}, {多空类型}, {平仓日期}, {平仓时间}, {平仓价格}, {平仓数量}, {平仓市值}, {平仓费用}, {实现盈亏}, {操作员编号}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@初始化日期#, @明细持仓序号#, @成交编号#, @机构编号#, @产品编号#, @交易组编号#, @证券代码编号#, @市场编号#, @股东代码编号#, @资产账户编号#, @多空类型#, @成交日期#, @成交时间#, @成交价格#, @剩余成交数量#, @剩余成交金额#, @剩余成交费用#,  (@剩余成交金额#-@开仓市值#*@剩余成交数量#/@当前数量#)*@盈亏方向乘数#-@剩余成交费用# - @开仓费用#*@剩余成交数量#/@当前数量# , @操作员编号#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#,@多空类型#,@成交编号#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdsecu.tb_tdset0_close_posi_strike_detail(
                  create_date,create_time,update_date,update_time,update_times,init_date, detail_posi_id, strike_no, co_no, pd_no, exch_group_no, stock_code_no, exch_no, stock_acco_no, asset_acco_no, lngsht_type, close_posi_date, close_posi_time, close_posi_price, close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, opor_no) 
              value( 
                  v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_init_date, v_detail_posi_id, v_strike_no, v_co_no, v_pd_no, v_exch_group_no, v_stock_code_no, v_exch_no, v_stock_acco_no, v_asset_acco_no, v_lngsht_type, v_strike_date, v_strike_time, v_strike_price, v_remain_strike_qty, v_remain_strike_amt, v_remain_strike_fee,  (v_remain_strike_amt-v_open_posi_value*v_remain_strike_qty/v_curr_qty)*v_pandl_dir_multi-v_remain_strike_fee - v_open_posi_fee*v_remain_strike_qty/v_curr_qty , v_opor_no);
              if v_error_code = "1" then
                  ROLLBACK;        
                  SET v_error_code = "tdsecuA.6.51.1";
                  SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no,",","多空类型=",v_lngsht_type,",","成交编号=",v_strike_no),"#",v_mysql_message);
                  leave label_pro;
              end if;


              /* SET @剩余成交数量# = 0; */
              SET v_remain_strike_qty = 0;
            else

              /* set @平仓标志# = 1; */
              set v_drop_type = 1;

              /* SET @平仓数量# = @当前数量#; */
              SET v_close_posi_qty = v_curr_qty;

              /* SET @平仓市值# = @平仓市值# + @剩余成交金额#*@有效持仓数量#/@剩余成交数量#; */
              SET v_close_posi_market_value = v_close_posi_market_value + v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty;

              /* SET @平仓费用# = round(@平仓费用# + @剩余成交费用#*@有效持仓数量#/@剩余成交数量#,2); */
              SET v_close_posi_fee = round(v_close_posi_fee + v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty,2);

              /* SET @实现盈亏# = @实现盈亏# + (@剩余成交金额#*@有效持仓数量#/@剩余成交数量#-@开仓市值#*@有效持仓数量#/@当前数量#)*@盈亏方向乘数# - (@剩余成交费用#*@有效持仓数量#/@剩余成交数量#+@开仓费用#*@有效持仓数量#/@当前数量#); */
              SET v_realize_pandl = v_realize_pandl + (v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty-v_open_posi_value*v_valid_posi_qty/v_curr_qty)*v_pandl_dir_multi - (v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty+v_open_posi_fee*v_valid_posi_qty/v_curr_qty);

              /* set @总实现盈亏# = @总实现盈亏# + (@剩余成交金额#*@有效持仓数量#/@剩余成交数量#-@开仓市值#*@有效持仓数量#/@当前数量#)*@盈亏方向乘数# - (@剩余成交费用#*@有效持仓数量#/@剩余成交数量#+@开仓费用#*@有效持仓数量#/@当前数量#); */
              set v_total_realize_pandl = v_total_realize_pandl + (v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty-v_open_posi_value*v_valid_posi_qty/v_curr_qty)*v_pandl_dir_multi - (v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty+v_open_posi_fee*v_valid_posi_qty/v_curr_qty);

              /* set @总平仓费用# = round(@总平仓费用# +@剩余成交费用#*@有效持仓数量#/@剩余成交数量#,2); */
              set v_total_close_posi_fee = round(v_total_close_posi_fee +v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty,2);

              /* set @临时_实现盈亏# = @临时_实现盈亏# +  (@剩余成交金额#*@有效持仓数量#/@剩余成交数量#-@开仓市值#*@有效持仓数量#/@当前数量#)*@盈亏方向乘数# - (@剩余成交费用#*@有效持仓数量#/@剩余成交数量#+@开仓费用#*@有效持仓数量#/@当前数量#) - @实现盈亏#; */
              set v_tmp_realize_pandl = v_tmp_realize_pandl +  (v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty-v_open_posi_value*v_valid_posi_qty/v_curr_qty)*v_pandl_dir_multi - (v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty+v_open_posi_fee*v_valid_posi_qty/v_curr_qty) - v_realize_pandl;
              #全部平仓，用于记录剩余的需要减去本笔

              /* if @多空类型# = 1 then */
              if v_lngsht_type = 1 then

                  /* set @总空头平仓市值# = @总空头平仓市值# + @剩余成交金额#*@有效持仓数量#/@剩余成交数量#; */
                  set v_total_short_close_posi_value = v_total_short_close_posi_value + v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty;

                  /* set @总空头平仓数量# = @总空头平仓数量# + @有效持仓数量#; */
                  set v_total_short_close_posi_qty = v_total_short_close_posi_qty + v_valid_posi_qty;

                  /* set @总空头平仓费用# = round(@总空头平仓费用# + @剩余成交费用#*@有效持仓数量#/@剩余成交数量#,2); */
                  set v_total_short_close_posi_fee = round(v_total_short_close_posi_fee + v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty,2);

                  /* set @空头开仓市值# = @空头开仓市值# - @开仓市值#; */
                  set v_short_open_posi_value = v_short_open_posi_value - v_open_posi_value;

                  /* set @空头当前数量# = @空头当前数量# - @当前数量#; */
                  set v_short_curr_qty = v_short_curr_qty - v_curr_qty;

                  /* set @空头开仓费用# = round(@空头开仓费用# - @开仓费用#,2); */
                  set v_short_open_posi_fee = round(v_short_open_posi_fee - v_open_posi_fee,2);

                  /* set @空头平仓市值# = @空头平仓市值# + @剩余成交金额#*@有效持仓数量#/@剩余成交数量# - @平仓市值#; */
                  set v_short_close_posi_value = v_short_close_posi_value + v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty - v_close_posi_market_value;

                  /* set @空头平仓数量# = @空头平仓数量# + @有效持仓数量# - @当前数量#; */
                  set v_short_close_posi_qty = v_short_close_posi_qty + v_valid_posi_qty - v_curr_qty;

                  /* set @空头平仓费用# = round(@空头平仓费用# + @剩余成交费用#*@有效持仓数量#/@剩余成交数量# - @平仓费用#,2); */
                  set v_short_close_posi_fee = round(v_short_close_posi_fee + v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty - v_close_posi_fee,2);

              /* elseif @多空类型# = 2 then */
              elseif v_lngsht_type = 2 then

                  /* set @总多头平仓市值# = @总多头平仓市值# + @剩余成交金额#*@有效持仓数量#/@剩余成交数量#; */
                  set v_total_long_close_posi_value = v_total_long_close_posi_value + v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty;

                  /* set @总多头平仓数量# = @总多头平仓数量# + @有效持仓数量#; */
                  set v_total_long_close_posi_qty = v_total_long_close_posi_qty + v_valid_posi_qty;

                  /* set @总多头平仓费用# = round(@总多头平仓费用# + @剩余成交费用#*@有效持仓数量#/@剩余成交数量#,2); */
                  set v_total_long_close_posi_fee = round(v_total_long_close_posi_fee + v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty,2);

                  /* set @多头开仓市值# = @多头开仓市值# - @开仓市值#; */
                  set v_long_open_posi_value = v_long_open_posi_value - v_open_posi_value;

                  /* set @多头当前数量# = @多头当前数量# - @当前数量#; */
                  set v_long_curr_qty = v_long_curr_qty - v_curr_qty;

                  /* set @多头开仓费用# = round(@多头开仓费用# - @开仓费用#,2); */
                  set v_long_open_posi_fee = round(v_long_open_posi_fee - v_open_posi_fee,2);

                  /* set @多头平仓市值# = @多头平仓市值# + @剩余成交金额#*@有效持仓数量#/@剩余成交数量# - @平仓市值#; */
                  set v_long_close_posi_value = v_long_close_posi_value + v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty - v_close_posi_market_value;

                  /* set @多头平仓数量# = @多头平仓数量# + @有效持仓数量# - @当前数量#; */
                  set v_long_close_posi_qty = v_long_close_posi_qty + v_valid_posi_qty - v_curr_qty;

                  /* set @多头平仓费用# = round(@多头平仓费用# + @剩余成交费用#*@有效持仓数量#/@剩余成交数量# - @平仓费用#,2); */
                  set v_long_close_posi_fee = round(v_long_close_posi_fee + v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty - v_close_posi_fee,2);
              end if;

              /* [更新表记录][交易证券_T0_证券持仓明细表][{平仓数量}=@平仓数量#,{平仓市值}=@平仓市值#,{平仓费用}=@平仓费用#,{实现盈亏}=@实现盈亏#,{持仓状态}=《持仓状态-已平仓》,{平仓日期}=@平仓日期#,{平仓时间}=@平仓时间#][{记录序号}=@明细持仓序号#][2][@明细持仓序号#] */
              set v_update_date = date_format(curdate(),'%Y%m%d');
              set v_update_time = date_format(curtime(),'%H%i%s');
              update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=v_close_posi_qty,close_posi_market_value=v_close_posi_market_value,close_posi_fee=v_close_posi_fee,realize_pandl=v_realize_pandl,posi_status="2",close_posi_date=v_close_posi_date,close_posi_time=v_close_posi_time where row_id=v_detail_posi_id;
              if v_error_code = "1" then
                  ROLLBACK;        
                  SET v_error_code = "tdsecuA.6.51.2";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("明细持仓序号=",v_detail_posi_id),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("明细持仓序号=",v_detail_posi_id);
                  end if;
                  leave label_pro;
              end if;


              /* [插入表记录][交易证券_T0_证券平仓成交明细表][{创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期}, {明细持仓序号}, {成交编号}, {机构编号}, {产品编号}, {交易组编号}, {证券代码编号}, {市场编号}, {股东代码编号}, {资产账户编号}, {多空类型}, {平仓日期}, {平仓时间}, {平仓价格}, {平仓数量}, {平仓市值}, {平仓费用}, {实现盈亏}, {操作员编号}][@创建日期#,@创建时间#,@更新日期#,@更新时间#,@更新次数#,@初始化日期#, @明细持仓序号#, @成交编号#, @机构编号#, @产品编号#, @交易组编号#, @证券代码编号#, @市场编号#, @股东代码编号#, @资产账户编号#, @多空类型#, @成交日期#, @成交时间#, @成交价格#, @有效持仓数量#, @剩余成交金额#*@有效持仓数量#/@剩余成交数量#, @剩余成交费用#*@有效持仓数量#/@剩余成交数量#, (@剩余成交金额#*@有效持仓数量#/@剩余成交数量#-@开仓市值#*@有效持仓数量#/@当前数量#)*@盈亏方向乘数# - (@剩余成交费用#*@有效持仓数量#/@剩余成交数量#+@开仓费用#*@有效持仓数量#/@当前数量#), @操作员编号#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#,@多空类型#,@成交编号#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_tdsecu.tb_tdset0_close_posi_strike_detail(
                  create_date,create_time,update_date,update_time,update_times,init_date, detail_posi_id, strike_no, co_no, pd_no, exch_group_no, stock_code_no, exch_no, stock_acco_no, asset_acco_no, lngsht_type, close_posi_date, close_posi_time, close_posi_price, close_posi_qty, close_posi_market_value, close_posi_fee, realize_pandl, opor_no) 
              value( 
                  v_create_date,v_create_time,v_update_date,v_update_time,v_update_times,v_init_date, v_detail_posi_id, v_strike_no, v_co_no, v_pd_no, v_exch_group_no, v_stock_code_no, v_exch_no, v_stock_acco_no, v_asset_acco_no, v_lngsht_type, v_strike_date, v_strike_time, v_strike_price, v_valid_posi_qty, v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty, v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty, (v_remain_strike_amt*v_valid_posi_qty/v_remain_strike_qty-v_open_posi_value*v_valid_posi_qty/v_curr_qty)*v_pandl_dir_multi - (v_remain_strike_fee*v_valid_posi_qty/v_remain_strike_qty+v_open_posi_fee*v_valid_posi_qty/v_curr_qty), v_opor_no);
              if v_error_code = "1" then
                  ROLLBACK;        
                  SET v_error_code = "tdsecuA.6.51.1";
                  SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no,",","多空类型=",v_lngsht_type,",","成交编号=",v_strike_no),"#",v_mysql_message);
                  leave label_pro;
              end if;


              /* SET @剩余成交金额# = @剩余成交金额#*(1-@有效持仓数量#/@剩余成交数量#); */
              SET v_remain_strike_amt = v_remain_strike_amt*(1-v_valid_posi_qty/v_remain_strike_qty);

              /* SET @剩余成交费用# = @剩余成交费用#*(1-@有效持仓数量#/@剩余成交数量#); */
              SET v_remain_strike_fee = v_remain_strike_fee*(1-v_valid_posi_qty/v_remain_strike_qty);

              /* SET @剩余成交数量# = @剩余成交数量# - @有效持仓数量#; */
              SET v_remain_strike_qty = v_remain_strike_qty - v_valid_posi_qty;
            end if;

            /* if @剩余成交数量# <= 0 then */
            if v_remain_strike_qty <= 0 then
                  leave loop_label;
            end if;
        else

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
            leave loop_label;
        end if;

    /* [事务结束] */
    COMMIT;

    end loop;

    /* if @剩余成交数量# > 0 then */
    if v_remain_strike_qty > 0 then

        /* SET @开仓日期# = @成交日期#; */
        SET v_open_posi_date = v_strike_date;

        /* SET @开仓时间# = @成交时间#; */
        SET v_open_posi_time = v_strike_time;

        /* SET @开仓价格# = @成交价格#; */
        SET v_open_posi_price = v_strike_price;

        /* SET @当前数量# = @剩余成交数量#; */
        SET v_curr_qty = v_remain_strike_qty;

        /* SET @开仓市值# = @剩余成交金额#; */
        SET v_open_posi_value = v_remain_strike_amt;

        /* SET @开仓费用# = round(@剩余成交费用#,2); */
        SET v_open_posi_fee = round(v_remain_strike_fee,2);

        /* SET @持仓状态# = 《持仓状态-未平仓》; */
        SET v_posi_status = "1";

        /* SET @开仓标志# = 1; */
        SET v_open_type = 1;

        /* set @总开仓费用# = @总开仓费用# + @开仓费用#; */
        set v_total_open_posi_fee = v_total_open_posi_fee + v_open_posi_fee;

        /* if @多空类型# = 1 then */
        if v_lngsht_type = 1 then

            /* set @总多头当前数量# = @总多头当前数量# + @当前数量#; */
            set v_total_long_curr_qty = v_total_long_curr_qty + v_curr_qty;

            /* set @总多头开仓市值# = @总多头开仓市值# + @开仓市值#; */
            set v_total_long_open_posi_value = v_total_long_open_posi_value + v_open_posi_value;

            /* set @总多头开仓费用# = round(@总多头开仓费用# + @开仓费用#,2); */
            set v_total_long_open_posi_fee = round(v_total_long_open_posi_fee + v_open_posi_fee,2);

            /* set @多头当前数量# = @多头当前数量# + @当前数量#; */
            set v_long_curr_qty = v_long_curr_qty + v_curr_qty;

            /* set @多头开仓市值# = @多头开仓市值# + @开仓市值#; */
            set v_long_open_posi_value = v_long_open_posi_value + v_open_posi_value;

            /* set @多头开仓费用# = round(@多头开仓费用# + @开仓费用#,2); */
            set v_long_open_posi_fee = round(v_long_open_posi_fee + v_open_posi_fee,2);
        else

            /* set @总空头当前数量# = @总空头当前数量# + @当前数量#; */
            set v_total_short_curr_qty = v_total_short_curr_qty + v_curr_qty;

            /* set @总空头开仓市值# = @总空头开仓市值# + @开仓市值#; */
            set v_total_short_open_posi_value = v_total_short_open_posi_value + v_open_posi_value;

            /* set @总空头开仓费用# = round(@总空头开仓费用# + @开仓费用#,2); */
            set v_total_short_open_posi_fee = round(v_total_short_open_posi_fee + v_open_posi_fee,2);

            /* set @空头当前数量# = @空头当前数量# + @当前数量#; */
            set v_short_curr_qty = v_short_curr_qty + v_curr_qty;

            /* set @空头开仓市值# = @空头开仓市值# + @开仓市值#; */
            set v_short_open_posi_value = v_short_open_posi_value + v_open_posi_value;

            /* set @空头开仓费用# = round(@空头开仓费用# + @开仓费用#,2); */
            set v_short_open_posi_fee = round(v_short_open_posi_fee + v_open_posi_fee,2);
        end if;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_交易证券_T0_新增证券持仓明细记录】*/
        call db_tdsecu.pra_tdset0_AddStockPosiDetail(
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
            v_stock_code_no,
            v_stock_code,
            v_exch_no,
            v_stock_acco_no,
            v_asset_acco_no,
            v_lngsht_type,
            v_curr_qty,
            v_open_posi_date,
            v_open_posi_time,
            v_strike_no,
            v_open_posi_price,
            v_open_posi_value,
            v_open_posi_fee,
            v_posi_status,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "tdsecuA.6.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_新增证券持仓明细记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* [事务结束] */
    COMMIT;

    end if;

    /* set @实现盈亏# = @临时_实现盈亏#; */
    set v_realize_pandl = v_tmp_realize_pandl;
    #更新到券源限额设置表

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_交易证券_T0_操作员券源限额设置持仓资金变化】*/
    call db_tdsecu.pra_tdset0_OporStockLimitPosiCapitalChange(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_acco_no,
        v_stock_code,
        v_exch_no,
        v_stock_type,
        v_order_dir,
        v_stock_code_no,
        v_trade_occur_qty,
        v_strike_occur_qty,
        v_total_realize_pandl,
        v_total_open_posi_fee,
        v_total_close_posi_fee,
        v_busi_opor_no,
        v_trade_occur_amt,
        v_strike_occur_amt,
        v_order_oper_way,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.6.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_操作员券源限额设置持仓资金变化出现错误！',v_mysql_message);
        end if;
        ROLLBACK;
        leave label_pro;
    elseif v_error_code <> "0" then
        ROLLBACK;
        leave label_pro;
    end if;

    #更新到持仓汇总表

    /* 调用【原子_交易证券_T0_新增证券持仓汇总记录】*/
    call db_tdsecu.pra_tdset0_AddStockPosiSum(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_busi_opor_no,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_stock_code,
        v_exch_no,
        v_stock_acco_no,
        v_stock_code_no,
        v_total_long_curr_qty,
        v_total_short_curr_qty,
        v_total_long_open_posi_value,
        v_total_short_open_posi_value,
        v_total_long_open_posi_fee,
        v_total_short_open_posi_fee,
        v_total_long_close_posi_value,
        v_total_short_close_posi_value,
        v_total_long_close_posi_qty,
        v_total_short_close_posi_qty,
        v_total_long_close_posi_fee,
        v_total_short_close_posi_fee,
        v_total_realize_pandl,
        v_long_curr_qty,
        v_short_curr_qty,
        v_long_open_posi_value,
        v_short_open_posi_value,
        v_long_open_posi_fee,
        v_short_open_posi_fee,
        v_long_close_posi_qty,
        v_short_close_posi_qty,
        v_long_close_posi_value,
        v_short_close_posi_value,
        v_long_close_posi_fee,
        v_short_close_posi_fee,
        v_realize_pandl,
        v_drop_type,
        v_open_type,
        v_lngsht_type,
        v_open_posi_date,
        v_open_posi_time,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "tdsecuA.6.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_交易证券_T0_新增证券持仓汇总记录出现错误！',v_mysql_message);
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

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_新增证券持仓明细记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_AddStockPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_AddStockPosiDetail(
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
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_asset_acco_no int,
    IN p_lngsht_type int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_date int,
    IN p_open_posi_time int,
    IN p_strike_no varchar(64),
    IN p_open_posi_price decimal(16,9),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_posi_status varchar(2),
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
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_asset_acco_no int;
    declare v_lngsht_type int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_strike_no varchar(64);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_over_night_pandl decimal(18,4);
    declare v_close_posi_date int;
    declare v_close_posi_time int;
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
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_date = p_open_posi_date;
    SET v_open_posi_time = p_open_posi_time;
    SET v_strike_no = p_strike_no;
    SET v_open_posi_price = p_open_posi_price;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_posi_status = p_posi_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_realize_pandl = 0;
    SET v_remark_info = " ";
    SET v_over_night_pandl = 0;
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @平仓数量# = 0; */
    set v_close_posi_qty = 0;

    /* set @平仓市值# = 0; */
    set v_close_posi_market_value = 0;

    /* set @平仓费用# = 0; */
    set v_close_posi_fee = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @备注信息# = " "; */
    set v_remark_info = " ";

    /* set @隔夜盈亏#=0; */
    set v_over_night_pandl=0;

    /* set @平仓日期#=0; */
    set v_close_posi_date=0;

    /* set @平仓时间#=0; */
    set v_close_posi_time=0;

    /* [插入表记录][交易证券_T0_证券持仓明细表][字段][字段变量][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#,@多空类型#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_stock_posi_detail(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        stock_code, stock_acco_no, stock_code_no, lngsht_type, 
        curr_qty, open_posi_date, open_posi_time, open_posi_price, 
        open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
        close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
        realize_pandl, over_night_pandl, posi_status, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_stock_code, v_stock_acco_no, v_stock_code_no, v_lngsht_type, 
        v_curr_qty, v_open_posi_date, v_open_posi_time, v_open_posi_price, 
        v_open_posi_value, v_open_posi_fee, v_close_posi_qty, v_close_posi_date, 
        v_close_posi_time, v_close_posi_market_value, v_close_posi_fee, v_strike_no, 
        v_realize_pandl, v_over_night_pandl, v_posi_status, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.52.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no,",","多空类型=",v_lngsht_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_锁定获取证券持仓明细记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_LockGetStockPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_LockGetStockPosiDetail(
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
    IN p_busi_opor_no int,
    IN p_stock_code_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_lngsht_type int,
    IN p_posi_status varchar(2),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_detail_posi_id bigint,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_over_night_pandl decimal(18,4)
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
    declare v_busi_opor_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_lngsht_type int;
    declare v_posi_status varchar(2);
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_detail_posi_id bigint;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_close_posi_date int;
    declare v_close_posi_time int;
    declare v_strike_no varchar(64);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_posi_status = p_posi_status;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_detail_posi_id = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    
    #[获取表记录变量语句][交易证券_T0_证券持仓明细表][IFNULL(SUM({当前数量}-{平仓数量}),0)][@临时_持仓数量#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {持仓状态}=《持仓状态-未平仓》]
    #insert into db_tdsecu.tb_tdset0_stock_posi_detail_update_log(create_date, create_time, update_date, update_time, update_times, co_no, opor_no, pd_no, exch_group_no, asset_acco_no, exch_no, stock_code, stock_acco_no, stock_code_no, lngsht_type, strike_date, strike_time, strike_no,strike_qty, remark_info) value( date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), date_format(curdate(),'%Y%m%d'), date_format(curtime(),'%H%i%s'), 1, v_co_no, v_busi_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 0, v_stock_acco_no, v_stock_code_no, v_lngsht_type, 1, 1, 0,0, concat("获取未平明细:",v_tmp_posi_qty));

    /* [锁定获取表记录变量][交易证券_T0_证券持仓明细表][字段][字段变量][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {多空类型}<>@多空类型# and {持仓状态}= @持仓状态#  order by {记录序号}][4][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@市场编号#,@多空类型#,@机构编号#,@产品编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, 
        v_lngsht_type, v_curr_qty, v_open_posi_date, v_open_posi_time, 
        v_open_posi_price, v_open_posi_value, v_open_posi_fee, v_close_posi_qty, 
        v_close_posi_date, v_close_posi_time, v_close_posi_market_value, v_close_posi_fee, 
        v_strike_no, v_realize_pandl, v_over_night_pandl, v_posi_status, 
        v_remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and lngsht_type<>v_lngsht_type and posi_status= v_posi_status  order by row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","多空类型=",v_lngsht_type,",","机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no,",","多空类型=",v_lngsht_type,",","机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;
    SET p_over_night_pandl = v_over_night_pandl;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_新增证券持仓汇总记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_AddStockPosiSum;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_AddStockPosiSum(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_total_long_curr_qty decimal(18,2),
    IN p_total_short_curr_qty decimal(18,2),
    IN p_total_long_open_posi_value decimal(18,4),
    IN p_total_short_open_posi_value decimal(18,4),
    IN p_total_long_open_posi_fee decimal(18,4),
    IN p_total_short_open_posi_fee decimal(18,4),
    IN p_total_long_close_posi_value decimal(18,4),
    IN p_total_short_close_posi_value decimal(18,4),
    IN p_total_long_close_posi_qty decimal(18,2),
    IN p_total_short_close_posi_qty decimal(18,2),
    IN p_total_long_close_posi_fee decimal(18,4),
    IN p_total_short_close_posi_fee decimal(18,4),
    IN p_total_realize_pandl decimal(18,4),
    IN p_long_curr_qty decimal(18,2),
    IN p_short_curr_qty decimal(18,2),
    IN p_long_open_posi_value decimal(18,4),
    IN p_short_open_posi_value decimal(18,4),
    IN p_long_open_posi_fee decimal(18,4),
    IN p_short_open_posi_fee decimal(18,4),
    IN p_long_close_posi_qty decimal(18,2),
    IN p_short_close_posi_qty decimal(18,2),
    IN p_long_close_posi_value decimal(18,4),
    IN p_short_close_posi_value decimal(18,4),
    IN p_long_close_posi_fee decimal(18,4),
    IN p_short_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_drop_type int,
    IN p_open_type int,
    IN p_lngsht_type int,
    IN p_open_posi_date int,
    IN p_open_posi_time int,
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    declare v_total_realize_pandl decimal(18,4);
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
    declare v_realize_pandl decimal(18,4);
    declare v_drop_type int;
    declare v_open_type int;
    declare v_lngsht_type int;
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_over_night_pandl decimal(18,4);
    declare v_posi_status varchar(2);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_total_long_curr_qty = p_total_long_curr_qty;
    SET v_total_short_curr_qty = p_total_short_curr_qty;
    SET v_total_long_open_posi_value = p_total_long_open_posi_value;
    SET v_total_short_open_posi_value = p_total_short_open_posi_value;
    SET v_total_long_open_posi_fee = p_total_long_open_posi_fee;
    SET v_total_short_open_posi_fee = p_total_short_open_posi_fee;
    SET v_total_long_close_posi_value = p_total_long_close_posi_value;
    SET v_total_short_close_posi_value = p_total_short_close_posi_value;
    SET v_total_long_close_posi_qty = p_total_long_close_posi_qty;
    SET v_total_short_close_posi_qty = p_total_short_close_posi_qty;
    SET v_total_long_close_posi_fee = p_total_long_close_posi_fee;
    SET v_total_short_close_posi_fee = p_total_short_close_posi_fee;
    SET v_total_realize_pandl = p_total_realize_pandl;
    SET v_long_curr_qty = p_long_curr_qty;
    SET v_short_curr_qty = p_short_curr_qty;
    SET v_long_open_posi_value = p_long_open_posi_value;
    SET v_short_open_posi_value = p_short_open_posi_value;
    SET v_long_open_posi_fee = p_long_open_posi_fee;
    SET v_short_open_posi_fee = p_short_open_posi_fee;
    SET v_long_close_posi_qty = p_long_close_posi_qty;
    SET v_short_close_posi_qty = p_short_close_posi_qty;
    SET v_long_close_posi_value = p_long_close_posi_value;
    SET v_short_close_posi_value = p_short_close_posi_value;
    SET v_long_close_posi_fee = p_long_close_posi_fee;
    SET v_short_close_posi_fee = p_short_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_drop_type = p_drop_type;
    SET v_open_type = p_open_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_open_posi_date = p_open_posi_date;
    SET v_open_posi_time = p_open_posi_time;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_over_night_pandl = 0;
    SET v_posi_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @隔夜盈亏#=0; */
    set v_over_night_pandl=0;

    /* set @持仓状态# = 《持仓状态-未平仓》; */
    set v_posi_status = "1";
    #平仓标志=1，平完一笔仓位，更新开仓日期和时间为最早未平仓的那笔持仓的开仓日期和时间；开仓标志=1，新开了一笔仓，更新成开仓的日期和时间；其他情况下，不更新开仓日期和时间

    /* if @平仓标志# =1 then */
    if v_drop_type =1 then

        /* [获取表记录变量语句][交易证券_T0_证券持仓明细表][{开仓日期},{开仓时间}][@开仓日期#,@开仓时间#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#  and {持仓状态}= @持仓状态#  order by {记录序号}] */
        select open_posi_date,open_posi_time into v_open_posi_date,v_open_posi_time from db_tdsecu.tb_tdset0_stock_posi_detail where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no  and posi_status= v_posi_status  order by row_id limit 1;


        /* [插入重复更新][交易证券_T0_证券持仓汇总表][字段][字段变量][{总多头当前数量}={总多头当前数量} + @总多头当前数量#,{总空头当前数量}={总空头当前数量} + @总空头当前数量#,{总多头开仓市值}={总多头开仓市值} + @总多头开仓市值#,{总空头开仓市值}={总空头开仓市值} + @总空头开仓市值#,{总多头开仓费用}={总多头开仓费用} + @总多头开仓费用#,{总空头开仓费用}={总空头开仓费用} + @总空头开仓费用#,{总多头平仓市值}={总多头平仓市值} + @总多头平仓市值#,{总空头平仓市值}={总空头平仓市值} + @总空头平仓市值#,{总多头平仓数量}={总多头平仓数量} + @总多头平仓数量#,{总空头平仓数量}={总空头平仓数量} + @总空头平仓数量#,{总多头平仓费用}={总多头平仓费用} + @总多头平仓费用#,{总空头平仓费用}={总空头平仓费用} + @总空头平仓费用#,{总实现盈亏}={总实现盈亏} + @总实现盈亏#,{多头当前数量}={多头当前数量} + @多头当前数量#,{空头当前数量}={空头当前数量} + @空头当前数量#,{多头开仓市值}={多头开仓市值} + @多头开仓市值#,{空头开仓市值}={空头开仓市值} + @空头开仓市值#,{多头开仓费用}={多头开仓费用} + @多头开仓费用#,{空头开仓费用}={空头开仓费用} + @空头开仓费用#,{多头平仓数量}={多头平仓数量} + @多头平仓数量#,{空头平仓数量}={空头平仓数量} + @空头平仓数量#,{多头平仓市值}={多头平仓市值} + @多头平仓市值#,{空头平仓市值}={空头平仓市值} + @空头平仓市值#,{多头平仓费用}={多头平仓费用} + @多头平仓费用#,{空头平仓费用}={空头平仓费用} + @空头平仓费用#,{实现盈亏}={实现盈亏} + @实现盈亏#,{开仓日期} = @开仓日期#,{开仓时间}=@开仓时间#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#] */
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
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_long_curr_qty=total_long_curr_qty + v_total_long_curr_qty,total_short_curr_qty=total_short_curr_qty + v_total_short_curr_qty,total_long_open_posi_value=total_long_open_posi_value + v_total_long_open_posi_value,total_short_open_posi_value=total_short_open_posi_value + v_total_short_open_posi_value,total_long_open_posi_fee=total_long_open_posi_fee + v_total_long_open_posi_fee,total_short_open_posi_fee=total_short_open_posi_fee + v_total_short_open_posi_fee,total_long_close_posi_value=total_long_close_posi_value + v_total_long_close_posi_value,total_short_close_posi_value=total_short_close_posi_value + v_total_short_close_posi_value,total_long_close_posi_qty=total_long_close_posi_qty + v_total_long_close_posi_qty,total_short_close_posi_qty=total_short_close_posi_qty + v_total_short_close_posi_qty,total_long_close_posi_fee=total_long_close_posi_fee + v_total_long_close_posi_fee,total_short_close_posi_fee=total_short_close_posi_fee + v_total_short_close_posi_fee,total_realize_pandl=total_realize_pandl + v_total_realize_pandl,long_curr_qty=long_curr_qty + v_long_curr_qty,short_curr_qty=short_curr_qty + v_short_curr_qty,long_open_posi_value=long_open_posi_value + v_long_open_posi_value,short_open_posi_value=short_open_posi_value + v_short_open_posi_value,long_open_posi_fee=long_open_posi_fee + v_long_open_posi_fee,short_open_posi_fee=short_open_posi_fee + v_short_open_posi_fee,long_close_posi_qty=long_close_posi_qty + v_long_close_posi_qty,short_close_posi_qty=short_close_posi_qty + v_short_close_posi_qty,long_close_posi_value=long_close_posi_value + v_long_close_posi_value,short_close_posi_value=short_close_posi_value + v_short_close_posi_value,long_close_posi_fee=long_close_posi_fee + v_long_close_posi_fee,short_close_posi_fee=short_close_posi_fee + v_short_close_posi_fee,realize_pandl=realize_pandl + v_realize_pandl,open_posi_date = v_open_posi_date,open_posi_time=v_open_posi_time;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.54.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;


    /* elseif @开仓标志# = 1 then */
    elseif v_open_type = 1 then

        /* [插入重复更新][交易证券_T0_证券持仓汇总表][字段][字段变量][{总多头当前数量}={总多头当前数量} + @总多头当前数量#,{总空头当前数量}={总空头当前数量} + @总空头当前数量#,{总多头开仓市值}={总多头开仓市值} + @总多头开仓市值#,{总空头开仓市值}={总空头开仓市值} + @总空头开仓市值#,{总多头开仓费用}={总多头开仓费用} + @总多头开仓费用#,{总空头开仓费用}={总空头开仓费用} + @总空头开仓费用#,{总多头平仓市值}={总多头平仓市值} + @总多头平仓市值#,{总空头平仓市值}={总空头平仓市值} + @总空头平仓市值#,{总多头平仓数量}={总多头平仓数量} + @总多头平仓数量#,{总空头平仓数量}={总空头平仓数量} + @总空头平仓数量#,{总多头平仓费用}={总多头平仓费用} + @总多头平仓费用#,{总空头平仓费用}={总空头平仓费用} + @总空头平仓费用#,{总实现盈亏}={总实现盈亏} + @总实现盈亏#,{多头当前数量}={多头当前数量} + @多头当前数量#,{空头当前数量}={空头当前数量} + @空头当前数量#,{多头开仓市值}={多头开仓市值} + @多头开仓市值#,{空头开仓市值}={空头开仓市值} + @空头开仓市值#,{多头开仓费用}={多头开仓费用} + @多头开仓费用#,{空头开仓费用}={空头开仓费用} + @空头开仓费用#,{多头平仓数量}={多头平仓数量} + @多头平仓数量#,{空头平仓数量}={空头平仓数量} + @空头平仓数量#,{多头平仓市值}={多头平仓市值} + @多头平仓市值#,{空头平仓市值}={空头平仓市值} + @空头平仓市值#,{多头平仓费用}={多头平仓费用} + @多头平仓费用#,{空头平仓费用}={空头平仓费用} + @空头平仓费用#,{实现盈亏}={实现盈亏} + @实现盈亏#,{开仓日期} = @开仓日期#,{开仓时间}=@开仓时间#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#]
 */
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
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_long_curr_qty=total_long_curr_qty + v_total_long_curr_qty,total_short_curr_qty=total_short_curr_qty + v_total_short_curr_qty,total_long_open_posi_value=total_long_open_posi_value + v_total_long_open_posi_value,total_short_open_posi_value=total_short_open_posi_value + v_total_short_open_posi_value,total_long_open_posi_fee=total_long_open_posi_fee + v_total_long_open_posi_fee,total_short_open_posi_fee=total_short_open_posi_fee + v_total_short_open_posi_fee,total_long_close_posi_value=total_long_close_posi_value + v_total_long_close_posi_value,total_short_close_posi_value=total_short_close_posi_value + v_total_short_close_posi_value,total_long_close_posi_qty=total_long_close_posi_qty + v_total_long_close_posi_qty,total_short_close_posi_qty=total_short_close_posi_qty + v_total_short_close_posi_qty,total_long_close_posi_fee=total_long_close_posi_fee + v_total_long_close_posi_fee,total_short_close_posi_fee=total_short_close_posi_fee + v_total_short_close_posi_fee,total_realize_pandl=total_realize_pandl + v_total_realize_pandl,long_curr_qty=long_curr_qty + v_long_curr_qty,short_curr_qty=short_curr_qty + v_short_curr_qty,long_open_posi_value=long_open_posi_value + v_long_open_posi_value,short_open_posi_value=short_open_posi_value + v_short_open_posi_value,long_open_posi_fee=long_open_posi_fee + v_long_open_posi_fee,short_open_posi_fee=short_open_posi_fee + v_short_open_posi_fee,long_close_posi_qty=long_close_posi_qty + v_long_close_posi_qty,short_close_posi_qty=short_close_posi_qty + v_short_close_posi_qty,long_close_posi_value=long_close_posi_value + v_long_close_posi_value,short_close_posi_value=short_close_posi_value + v_short_close_posi_value,long_close_posi_fee=long_close_posi_fee + v_long_close_posi_fee,short_close_posi_fee=short_close_posi_fee + v_short_close_posi_fee,realize_pandl=realize_pandl + v_realize_pandl,open_posi_date = v_open_posi_date,open_posi_time=v_open_posi_time;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.54.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    else

        /* [插入重复更新][交易证券_T0_证券持仓汇总表][字段][字段变量][{总多头当前数量}={总多头当前数量} + @总多头当前数量#,{总空头当前数量}={总空头当前数量} + @总空头当前数量#,{总多头开仓市值}={总多头开仓市值} + @总多头开仓市值#,{总空头开仓市值}={总空头开仓市值} + @总空头开仓市值#,{总多头开仓费用}={总多头开仓费用} + @总多头开仓费用#,{总空头开仓费用}={总空头开仓费用} + @总空头开仓费用#,{总多头平仓市值}={总多头平仓市值} + @总多头平仓市值#,{总空头平仓市值}={总空头平仓市值} + @总空头平仓市值#,{总多头平仓数量}={总多头平仓数量} + @总多头平仓数量#,{总空头平仓数量}={总空头平仓数量} + @总空头平仓数量#,{总多头平仓费用}={总多头平仓费用} + @总多头平仓费用#,{总空头平仓费用}={总空头平仓费用} + @总空头平仓费用#,{总实现盈亏}={总实现盈亏} + @总实现盈亏#,{多头当前数量}={多头当前数量} + @多头当前数量#,{空头当前数量}={空头当前数量} + @空头当前数量#,{多头开仓市值}={多头开仓市值} + @多头开仓市值#,{空头开仓市值}={空头开仓市值} + @空头开仓市值#,{多头开仓费用}={多头开仓费用} + @多头开仓费用#,{空头开仓费用}={空头开仓费用} + @空头开仓费用#,{多头平仓数量}={多头平仓数量} + @多头平仓数量#,{空头平仓数量}={空头平仓数量} + @空头平仓数量#,{多头平仓市值}={多头平仓市值} + @多头平仓市值#,{空头平仓市值}={空头平仓市值} + @空头平仓市值#,{多头平仓费用}={多头平仓费用} + @多头平仓费用#,{空头平仓费用}={空头平仓费用} + @空头平仓费用#,{实现盈亏}={实现盈亏} + @实现盈亏#][1][@机构编号#,@产品编号#,@交易组编号#,@股东代码编号#,@市场编号#,@证券代码编号#]
 */
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
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_long_curr_qty=total_long_curr_qty + v_total_long_curr_qty,total_short_curr_qty=total_short_curr_qty + v_total_short_curr_qty,total_long_open_posi_value=total_long_open_posi_value + v_total_long_open_posi_value,total_short_open_posi_value=total_short_open_posi_value + v_total_short_open_posi_value,total_long_open_posi_fee=total_long_open_posi_fee + v_total_long_open_posi_fee,total_short_open_posi_fee=total_short_open_posi_fee + v_total_short_open_posi_fee,total_long_close_posi_value=total_long_close_posi_value + v_total_long_close_posi_value,total_short_close_posi_value=total_short_close_posi_value + v_total_short_close_posi_value,total_long_close_posi_qty=total_long_close_posi_qty + v_total_long_close_posi_qty,total_short_close_posi_qty=total_short_close_posi_qty + v_total_short_close_posi_qty,total_long_close_posi_fee=total_long_close_posi_fee + v_total_long_close_posi_fee,total_short_close_posi_fee=total_short_close_posi_fee + v_total_short_close_posi_fee,total_realize_pandl=total_realize_pandl + v_total_realize_pandl,long_curr_qty=long_curr_qty + v_long_curr_qty,short_curr_qty=short_curr_qty + v_short_curr_qty,long_open_posi_value=long_open_posi_value + v_long_open_posi_value,short_open_posi_value=short_open_posi_value + v_short_open_posi_value,long_open_posi_fee=long_open_posi_fee + v_long_open_posi_fee,short_open_posi_fee=short_open_posi_fee + v_short_open_posi_fee,long_close_posi_qty=long_close_posi_qty + v_long_close_posi_qty,short_close_posi_qty=short_close_posi_qty + v_short_close_posi_qty,long_close_posi_value=long_close_posi_value + v_long_close_posi_value,short_close_posi_value=short_close_posi_value + v_short_close_posi_value,long_close_posi_fee=long_close_posi_fee + v_long_close_posi_fee,short_close_posi_fee=short_close_posi_fee + v_short_close_posi_fee,realize_pandl=realize_pandl + v_realize_pandl;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.54.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","股东代码编号=",v_stock_acco_no,",","市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
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

# 原子_交易证券_T0_券源持仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryT0SourceStockHoldingPosition;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryT0SourceStockHoldingPosition(
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
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_T0_limit_method int;

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
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_T0_limit_method = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then
    #[获取表记录][交易证券_T0_操作员券源设置表][{记录序号}, {机构编号}, {操作员编号}, {证券代码编号}, {证券代码}, {市场编号}, {券源数量}, {已分配数量}, {单笔限额数量}, {交易释放数量}, {交易占用数量}, {成交释放数量}, {成交占用数量}, {总实现盈亏} as {当日盈亏}, {产品编号}, {交易组编号}, {资产账户编号}, {股东代码编号}, {外部交易释放数量}, {外部交易占用数量}, {外部成交释放数量}, {外部成交占用数量}, {隔夜盈亏}, {累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息}, {券源数量} - {交易释放数量} - {成交释放数量}  as {买入可用数量}, {券源数量} - {交易占用数量} - {成交占用数量}  as {卖出可用数量}, {券源数量}+(IFNULL({成交释放数量},0) - IFNULL({成交占用数量},0))  as {持仓数量}, {总开仓费用} + {总平仓费用} as {当日交易费},{数量差额}, {隔夜仓强平买入数量}, {隔夜仓强平卖出数量}, {隔夜仓强平成交数量}, {更新次数}][{操作员编号} = @操作员编号# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#='' or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#="" "" or instr(@机构编号权限串#, concat("";"",{机构编号},"";""))>0) and (@产品编号权限串#="" "" or instr(@产品编号权限串#, concat("";"",{产品编号},"";""))>0) and (@交易组编号权限串#="" "" or instr(@交易组编号权限串#, concat("";"",{交易组编号},"";""))>0) and {券源数量} > 0][@指定行数#]

    /* SELECT 
t1.{记录序号},
t1.{机构编号},
t1.{操作员编号},
t1.{证券代码编号},
t1.{证券代码},
t1.{市场编号},
t1.{券源数量},
t1.{已分配数量},
t1.{单笔限额数量},
t1.{交易释放数量},
t1.{交易占用数量},
t1.{成交释放数量},
t1.{成交占用数量},
t1.{当日盈亏},
t1.{产品编号},
t1.{交易组编号},
t1.{资产账户编号},
t1.{股东代码编号},
t1.{外部交易释放数量},
t1.{外部交易占用数量},
t1.{外部成交释放数量},
t1.{外部成交占用数量},
t1.{隔夜盈亏},
t1.{累计实现盈亏},
t1.{总开仓费用},
t1.{总平仓费用},
t1.{备注信息},
t1.{买入可用数量},
t1.{卖出可用数量},
t1.{持仓数量},
t1.{当日交易费},
t1.{数量差额},
t1.{T0买入方式},
t1.{隔夜仓强平交易买入数量},
t1.{隔夜仓强平交易卖出数量},
t1.{隔夜仓强平成交卖出数量},
t1.{更新次数},
t2.{隔夜仓强平总交易卖出数量},
t2.{隔夜仓强平总成交卖出数量}
FROM
(SELECT 
{记录序号},
{机构编号},
{操作员编号},
{证券代码编号},
{证券代码},
{市场编号},
{券源数量},
{已分配数量},
{单笔限额数量},
{交易释放数量},
{交易占用数量},
{成交释放数量},
{成交占用数量},
{总实现盈亏} as {当日盈亏},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{外部交易释放数量},
{外部交易占用数量},
{外部成交释放数量},
{外部成交占用数量},
{隔夜盈亏},
{累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息},
{券源数量} - {交易释放数量} - {成交释放数量}  as {买入可用数量},
{券源数量} - {交易占用数量} - {成交占用数量}  as {卖出可用数量},
{券源数量}+(IFNULL({成交释放数量},0) - IFNULL({成交占用数量},0))  as {持仓数量},
{总开仓费用} + {总平仓费用} as {当日交易费},{数量差额},{T0买入方式},
{隔夜仓强平交易买入数量},
{隔夜仓强平交易卖出数量},
{隔夜仓强平成交卖出数量},
{更新次数} FROM ~交易证券_T0_操作员券源设置表^ WHERE {操作员编号} = @操作员编号# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#=" " or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {券源数量} > 0)t1 
INNER JOIN
(SELECT IFNULL(SUM({隔夜仓强平交易卖出数量}),0) as {隔夜仓强平总交易卖出数量},IFNULL(SUM({隔夜仓强平成交卖出数量}),0) as {隔夜仓强平总成交卖出数量},{机构编号},{产品编号},{股东代码编号},{交易组编号},{资产账户编号},{市场编号},{证券代码}  FROM ~交易证券_T0_操作员券源设置表^ WHERE (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#=" " or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {券源数量} > 0 GROUP BY {机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码})AS t2 ON t1.{机构编号} = t2.{机构编号} and t1.{股东代码编号}=t2.{股东代码编号} and t1.{产品编号}= t2.{产品编号} and t1.{交易组编号}= t2.{交易组编号} and t1.{资产账户编号}= t2.{资产账户编号} and t1.{市场编号}= t2.{市场编号} and t1.{证券代码}= t2.{证券代码};
 */
    SELECT 
    t1.row_id,
    t1.co_no,
    t1.opor_no,
    t1.stock_code_no,
    t1.stock_code,
    t1.exch_no,
    t1.source_stock_qty,
    t1.assigned_qty,
    t1.single_limit_qty,
    t1.trade_releas_qty,
    t1.trade_capt_qty,
    t1.strike_releas_qty,
    t1.strike_capt_qty,
    t1.today_pandl,
    t1.pd_no,
    t1.exch_group_no,
    t1.asset_acco_no,
    t1.stock_acco_no,
    t1.out_order_releas_qty,
    t1.out_order_capt_qty,
    t1.out_strike_releas_qty,
    t1.out_strike_capt_qty,
    t1.over_night_pandl,
    t1.sum_realize_pandl,
    t1.total_open_posi_fee,
    t1.total_close_posi_fee,
    t1.remark_info,
    t1.buy_avail_qty,
    t1.sell_avail_qty,
    t1.posi_qty,
    t1.today_trade_fee,
    t1.diff_qty,
    t1.t0_buy_type,
    t1.over_night_trade_buy_qty,
    t1.over_night_trade_sell_qty,
    t1.over_night_strike_sell_qty,
    t1.update_times,
    t2.over_night_sumtrd_sell_qty,
    t2.over_night_sumstk_sell_qty
    FROM
    (SELECT 
    row_id,
    co_no,
    opor_no,
    stock_code_no,
    stock_code,
    exch_no,
    source_stock_qty,
    assigned_qty,
    single_limit_qty,
    trade_releas_qty,
    trade_capt_qty,
    strike_releas_qty,
    strike_capt_qty,
    total_realize_pandl as today_pandl,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    out_order_releas_qty,
    out_order_capt_qty,
    out_strike_releas_qty,
    out_strike_capt_qty,
    over_night_pandl,
    sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
    source_stock_qty - trade_releas_qty - strike_releas_qty  as buy_avail_qty,
    source_stock_qty - trade_capt_qty - strike_capt_qty  as sell_avail_qty,
    source_stock_qty+(IFNULL(strike_releas_qty,0) - IFNULL(strike_capt_qty,0))  as posi_qty,
    total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
    over_night_trade_buy_qty,
    over_night_trade_sell_qty,
    over_night_strike_sell_qty,
    update_times FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE opor_no = v_opor_no and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code=" " or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and source_stock_qty > 0)t1 
    INNER JOIN
    (SELECT IFNULL(SUM(over_night_trade_sell_qty),0) as over_night_sumtrd_sell_qty,IFNULL(SUM(over_night_strike_sell_qty),0) as over_night_sumstk_sell_qty,co_no,pd_no,stock_acco_no,exch_group_no,asset_acco_no,exch_no,stock_code  FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code=" " or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and source_stock_qty > 0 GROUP BY co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code)AS t2 ON t1.co_no = t2.co_no and t1.stock_acco_no=t2.stock_acco_no and t1.pd_no= t2.pd_no and t1.exch_group_no= t2.exch_group_no and t1.asset_acco_no= t2.asset_acco_no and t1.exch_no= t2.exch_no and t1.stock_code= t2.stock_code;
    
    else
    #[获取表记录][交易证券_T0_操作员券源设置表][{记录序号}, {机构编号}, {操作员编号}, {证券代码编号}, {证券代码}, {市场编号}, {券源数量} +{数量差额} +{隔夜仓强平买入数量} -{隔夜仓强平卖出数量}  as {券源数量}, {已分配数量}, {单笔限额数量}, {交易释放数量}, {交易占用数量}, {成交释放数量}, {成交占用数量}, {总实现盈亏} as {当日盈亏}, {产品编号}, {交易组编号}, {资产账户编号}, {股东代码编号}, {外部交易释放数量}, {外部交易占用数量}, {外部成交释放数量}, {外部成交占用数量}, {隔夜盈亏}, {累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息},  {券源数量} +{数量差额}- {交易释放数量} - {成交释放数量}  - {隔夜仓强平卖出数量} as {买入可用数量},  {券源数量}+{数量差额} - {交易占用数量} - {成交占用数量} + {隔夜仓强平买入数量} as {卖出可用数量}, {券源数量}+(IFNULL({成交释放数量},0) - IFNULL({成交占用数量},0)) +{数量差额} as {持仓数量}, {总开仓费用} + {总平仓费用} as {当日交易费},{数量差额}, {隔夜仓强平买入数量}, {隔夜仓强平卖出数量}, {隔夜仓强平成交数量}, {更新次数}][{操作员编号} = @操作员编号# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#='' or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#="" "" or instr(@机构编号权限串#, concat("";"",{机构编号},"";""))>0) and (@产品编号权限串#="" "" or instr(@产品编号权限串#, concat("";"",{产品编号},"";""))>0) and (@交易组编号权限串#="" "" or instr(@交易组编号权限串#, concat("";"",{交易组编号},"";""))>0) and {券源数量} > 0][@指定行数#]

    /* SELECT 
t1.{记录序号},
t1.{机构编号},
t1.{操作员编号},
t1.{证券代码编号},
t1.{证券代码},
t1.{市场编号},
t1.{券源数量},
t1.{已分配数量},
t1.{单笔限额数量},
t1.{交易释放数量},
t1.{交易占用数量},
t1.{成交释放数量},
t1.{成交占用数量},
t1.{当日盈亏},
t1.{产品编号},
t1.{交易组编号},
t1.{资产账户编号},
t1.{股东代码编号},
t1.{外部交易释放数量},
t1.{外部交易占用数量},
t1.{外部成交释放数量},
t1.{外部成交占用数量},
t1.{隔夜盈亏},
t1.{累计实现盈亏},
t1.{总开仓费用},
t1.{总平仓费用},
t1.{备注信息},
t1.{买入可用数量},
t1.{卖出可用数量},
t1.{持仓数量},
t1.{当日交易费},
t1.{数量差额},
t1.{T0买入方式},
t1.{隔夜仓强平交易买入数量},
t1.{隔夜仓强平交易卖出数量},
t1.{隔夜仓强平成交卖出数量},
t1.{更新次数},
t2.{隔夜仓强平总交易卖出数量},
t2.{隔夜仓强平总成交卖出数量}
FROM
(SELECT 
{记录序号},
{机构编号},
{操作员编号},
{证券代码编号},
{证券代码},
{市场编号},
{券源数量}+{数量差额} -{隔夜仓强平交易卖出数量}  as {券源数量},
{已分配数量},
{单笔限额数量},
{交易释放数量},
{交易占用数量},
{成交释放数量},
{成交占用数量},
{总实现盈亏} as {当日盈亏},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{外部交易释放数量},
{外部交易占用数量},
{外部成交释放数量},
{外部成交占用数量},
{隔夜盈亏},
{累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息},
 {券源数量} +{数量差额}- {交易释放数量} - {成交释放数量}  - {隔夜仓强平交易卖出数量} as {买入可用数量},
 {券源数量}+{数量差额} - {交易占用数量} - {成交占用数量}  - {隔夜仓强平交易卖出数量} as {卖出可用数量},
{券源数量}+(IFNULL({成交释放数量},0) - IFNULL({成交占用数量},0)) +{数量差额} as {持仓数量},
{总开仓费用} + {总平仓费用} as {当日交易费},{数量差额},{T0买入方式},
{隔夜仓强平交易买入数量},
{隔夜仓强平交易卖出数量},
{隔夜仓强平成交卖出数量},
{更新次数} FROM ~交易证券_T0_操作员券源设置表^ WHERE {操作员编号} = @操作员编号# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#=" " or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {券源数量} > 0)t1 
INNER JOIN
(SELECT IFNULL(SUM({隔夜仓强平交易卖出数量}),0) as {隔夜仓强平总交易卖出数量},IFNULL(SUM({隔夜仓强平成交卖出数量}),0) as {隔夜仓强平总成交卖出数量},{机构编号},{产品编号},{股东代码编号},{交易组编号},{资产账户编号},{市场编号},{证券代码}  FROM ~交易证券_T0_操作员券源设置表^ WHERE (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#=" " or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {券源数量} > 0 GROUP BY {机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码})AS t2 ON t1.{机构编号} = t2.{机构编号} and t1.{股东代码编号}=t2.{股东代码编号} and t1.{产品编号}= t2.{产品编号} and t1.{交易组编号}= t2.{交易组编号} and t1.{资产账户编号}= t2.{资产账户编号} and t1.{市场编号}= t2.{市场编号} and t1.{证券代码}= t2.{证券代码};
 */
    SELECT 
    t1.row_id,
    t1.co_no,
    t1.opor_no,
    t1.stock_code_no,
    t1.stock_code,
    t1.exch_no,
    t1.source_stock_qty,
    t1.assigned_qty,
    t1.single_limit_qty,
    t1.trade_releas_qty,
    t1.trade_capt_qty,
    t1.strike_releas_qty,
    t1.strike_capt_qty,
    t1.today_pandl,
    t1.pd_no,
    t1.exch_group_no,
    t1.asset_acco_no,
    t1.stock_acco_no,
    t1.out_order_releas_qty,
    t1.out_order_capt_qty,
    t1.out_strike_releas_qty,
    t1.out_strike_capt_qty,
    t1.over_night_pandl,
    t1.sum_realize_pandl,
    t1.total_open_posi_fee,
    t1.total_close_posi_fee,
    t1.remark_info,
    t1.buy_avail_qty,
    t1.sell_avail_qty,
    t1.posi_qty,
    t1.today_trade_fee,
    t1.diff_qty,
    t1.t0_buy_type,
    t1.over_night_trade_buy_qty,
    t1.over_night_trade_sell_qty,
    t1.over_night_strike_sell_qty,
    t1.update_times,
    t2.over_night_sumtrd_sell_qty,
    t2.over_night_sumstk_sell_qty
    FROM
    (SELECT 
    row_id,
    co_no,
    opor_no,
    stock_code_no,
    stock_code,
    exch_no,
    source_stock_qty+diff_qty -over_night_trade_sell_qty  as source_stock_qty,
    assigned_qty,
    single_limit_qty,
    trade_releas_qty,
    trade_capt_qty,
    strike_releas_qty,
    strike_capt_qty,
    total_realize_pandl as today_pandl,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    out_order_releas_qty,
    out_order_capt_qty,
    out_strike_releas_qty,
    out_strike_capt_qty,
    over_night_pandl,
    sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
     source_stock_qty +diff_qty- trade_releas_qty - strike_releas_qty  - over_night_trade_sell_qty as buy_avail_qty,
     source_stock_qty+diff_qty - trade_capt_qty - strike_capt_qty  - over_night_trade_sell_qty as sell_avail_qty,
    source_stock_qty+(IFNULL(strike_releas_qty,0) - IFNULL(strike_capt_qty,0)) +diff_qty as posi_qty,
    total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
    over_night_trade_buy_qty,
    over_night_trade_sell_qty,
    over_night_strike_sell_qty,
    update_times FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE opor_no = v_opor_no and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code=" " or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and source_stock_qty > 0)t1 
    INNER JOIN
    (SELECT IFNULL(SUM(over_night_trade_sell_qty),0) as over_night_sumtrd_sell_qty,IFNULL(SUM(over_night_strike_sell_qty),0) as over_night_sumstk_sell_qty,co_no,pd_no,stock_acco_no,exch_group_no,asset_acco_no,exch_no,stock_code  FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code=" " or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and source_stock_qty > 0 GROUP BY co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code)AS t2 ON t1.co_no = t2.co_no and t1.stock_acco_no=t2.stock_acco_no and t1.pd_no= t2.pd_no and t1.exch_group_no= t2.exch_group_no and t1.asset_acco_no= t2.asset_acco_no and t1.exch_no= t2.exch_no and t1.stock_code= t2.stock_code;
    
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_券源持仓历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryHisT0SourceStockHoldingPosition;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryHisT0SourceStockHoldingPosition(
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
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_T0_limit_method int;

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
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_T0_limit_method = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then

        /* [获取表记录][交易证券_T0_历史操作员券源设置表][{记录序号},{机构编号},
{操作员编号},
{证券代码编号},
{证券代码},
{市场编号},
{券源数量},{已分配数量},
{单笔限额数量},
{交易释放数量},
{交易占用数量},
{成交释放数量},
{成交占用数量},{总实现盈亏} as {当日盈亏},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{外部交易释放数量},
{外部交易占用数量},
{外部成交释放数量},
{外部成交占用数量},
{隔夜盈亏},
{累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息},
{券源数量}- {交易释放数量} - {成交释放数量}  as {买入可用数量},
{券源数量} - {交易占用数量} - {成交占用数量}  as {卖出可用数量},
{券源数量}+(IFNULL({成交释放数量},0) - IFNULL({成交占用数量},0)) as {持仓数量},
{总开仓费用} + {总平仓费用} as {当日交易费},{数量差额},{T0买入方式},
{更新次数}][{操作员编号} = @操作员编号# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#='' or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and ({初始化日期} between @开始日期# and @结束日期#)][@指定行数#] */
        if v_row_count = -1 then
            select row_id,co_no,
        opor_no,
        stock_code_no,
        stock_code,
        exch_no,
        source_stock_qty,assigned_qty,
        single_limit_qty,
        trade_releas_qty,
        trade_capt_qty,
        strike_releas_qty,
        strike_capt_qty,total_realize_pandl as today_pandl,
        pd_no,
        exch_group_no,
        asset_acco_no,
        stock_acco_no,
        out_order_releas_qty,
        out_order_capt_qty,
        out_strike_releas_qty,
        out_strike_capt_qty,
        over_night_pandl,
        sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
        source_stock_qty- trade_releas_qty - strike_releas_qty  as buy_avail_qty,
        source_stock_qty - trade_capt_qty - strike_capt_qty  as sell_avail_qty,
        source_stock_qty+(IFNULL(strike_releas_qty,0) - IFNULL(strike_capt_qty,0)) as posi_qty,
        total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
        update_times from db_tdsecu_his.tb_tdset0_opor_stock_source_his where opor_no = v_opor_no and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code='' or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (init_date between v_begin_date and v_end_date);
        else
            select row_id,co_no,
        opor_no,
        stock_code_no,
        stock_code,
        exch_no,
        source_stock_qty,assigned_qty,
        single_limit_qty,
        trade_releas_qty,
        trade_capt_qty,
        strike_releas_qty,
        strike_capt_qty,total_realize_pandl as today_pandl,
        pd_no,
        exch_group_no,
        asset_acco_no,
        stock_acco_no,
        out_order_releas_qty,
        out_order_capt_qty,
        out_strike_releas_qty,
        out_strike_capt_qty,
        over_night_pandl,
        sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
        source_stock_qty- trade_releas_qty - strike_releas_qty  as buy_avail_qty,
        source_stock_qty - trade_capt_qty - strike_capt_qty  as sell_avail_qty,
        source_stock_qty+(IFNULL(strike_releas_qty,0) - IFNULL(strike_capt_qty,0)) as posi_qty,
        total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
        update_times from db_tdsecu_his.tb_tdset0_opor_stock_source_his where opor_no = v_opor_no and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code='' or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (init_date between v_begin_date and v_end_date) limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_T0_历史操作员券源设置表][{记录序号},{机构编号},
{操作员编号},
{证券代码编号},
{证券代码},
{市场编号},
{券源数量} +{数量差额} as {券源数量},{已分配数量},
{单笔限额数量},
{交易释放数量},
{交易占用数量},
{成交释放数量},
{成交占用数量},{总实现盈亏} as {当日盈亏},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{外部交易释放数量},
{外部交易占用数量},
{外部成交释放数量},
{外部成交占用数量},
{隔夜盈亏},
{累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息},
 {券源数量} +{数量差额}- {交易释放数量} - {成交释放数量}  as {买入可用数量},
 {券源数量}+{数量差额} - {交易占用数量} - {成交占用数量}  as {卖出可用数量},
{券源数量}+(IFNULL({成交释放数量},0) - IFNULL({成交占用数量},0)) +{数量差额} as {持仓数量},
{总开仓费用} + {总平仓费用} as {当日交易费},{数量差额},{T0买入方式},
{更新次数}][{操作员编号} = @操作员编号# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@证券代码#='' or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#)  and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and ({初始化日期} between @开始日期# and @结束日期#)][@指定行数#] */
        if v_row_count = -1 then
            select row_id,co_no,
        opor_no,
        stock_code_no,
        stock_code,
        exch_no,
        source_stock_qty +diff_qty as source_stock_qty,assigned_qty,
        single_limit_qty,
        trade_releas_qty,
        trade_capt_qty,
        strike_releas_qty,
        strike_capt_qty,total_realize_pandl as today_pandl,
        pd_no,
        exch_group_no,
        asset_acco_no,
        stock_acco_no,
        out_order_releas_qty,
        out_order_capt_qty,
        out_strike_releas_qty,
        out_strike_capt_qty,
        over_night_pandl,
        sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
         source_stock_qty +diff_qty- trade_releas_qty - strike_releas_qty  as buy_avail_qty,
         source_stock_qty+diff_qty - trade_capt_qty - strike_capt_qty  as sell_avail_qty,
        source_stock_qty+(IFNULL(strike_releas_qty,0) - IFNULL(strike_capt_qty,0)) +diff_qty as posi_qty,
        total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
        update_times from db_tdsecu_his.tb_tdset0_opor_stock_source_his where opor_no = v_opor_no and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code='' or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (init_date between v_begin_date and v_end_date);
        else
            select row_id,co_no,
        opor_no,
        stock_code_no,
        stock_code,
        exch_no,
        source_stock_qty +diff_qty as source_stock_qty,assigned_qty,
        single_limit_qty,
        trade_releas_qty,
        trade_capt_qty,
        strike_releas_qty,
        strike_capt_qty,total_realize_pandl as today_pandl,
        pd_no,
        exch_group_no,
        asset_acco_no,
        stock_acco_no,
        out_order_releas_qty,
        out_order_capt_qty,
        out_strike_releas_qty,
        out_strike_capt_qty,
        over_night_pandl,
        sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
         source_stock_qty +diff_qty- trade_releas_qty - strike_releas_qty  as buy_avail_qty,
         source_stock_qty+diff_qty - trade_capt_qty - strike_capt_qty  as sell_avail_qty,
        source_stock_qty+(IFNULL(strike_releas_qty,0) - IFNULL(strike_capt_qty,0)) +diff_qty as posi_qty,
        total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
        update_times from db_tdsecu_his.tb_tdset0_opor_stock_source_his where opor_no = v_opor_no and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no)  and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_stock_code='' or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no)  and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (init_date between v_begin_date and v_end_date) limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_持仓分笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_no_str varchar(2048),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_posi_status varchar(2),
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
    declare v_opor_no_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_posi_status varchar(2);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_opor_no_str = p_opor_no_str;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_posi_status = p_posi_status;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_T0_证券持仓明细表][字段][(@操作员编号串# = '; ;' or instr(@操作员编号串#, concat(";",{操作员编号},";"))>0) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@机构编号# = 0 or @机构编号#=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@持仓状态#=0 or {持仓状态}=@持仓状态#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where (v_opor_no_str = '; ;' or instr(v_opor_no_str, concat(";",opor_no,";"))>0) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no = 0 or v_co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_posi_status=0 or posi_status=v_posi_status) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where (v_opor_no_str = '; ;' or instr(v_opor_no_str, concat(";",opor_no,";"))>0) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no = 0 or v_co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_posi_status=0 or posi_status=v_posi_status) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_持仓分笔历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryPosiDetailHis;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryPosiDetailHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_opor_no_str varchar(2048),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_posi_status varchar(2),
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_begin_date int,
    IN p_end_date int,
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
    declare v_opor_no_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_posi_status varchar(2);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_begin_date int;
    declare v_end_date int;
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
    SET v_opor_no_str = p_opor_no_str;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_posi_status = p_posi_status;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][历史_交易证券_T0_证券持仓明细表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@操作员编号串# = '; ;' or instr(@操作员编号串#, concat(";",{操作员编号},";"))>0) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@机构编号# = 0 or @机构编号#=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@持仓状态#=0 or {持仓状态}=@持仓状态#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu_his.tb_tdset0_stock_posi_detail_his where (init_date between v_begin_date and v_end_date) and (v_opor_no_str = '; ;' or instr(v_opor_no_str, concat(";",opor_no,";"))>0) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no = 0 or v_co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_posi_status=0 or posi_status=v_posi_status) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu_his.tb_tdset0_stock_posi_detail_his where (init_date between v_begin_date and v_end_date) and (v_opor_no_str = '; ;' or instr(v_opor_no_str, concat(";",opor_no,";"))>0) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no = 0 or v_co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_posi_status=0 or posi_status=v_posi_status) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_持仓合笔查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryPosiCombi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryPosiCombi(
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
    IN p_asset_acco_no int,
    IN p_init_date int,
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
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_init_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_init_date = p_init_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #set @指定行数# = -1;
    #[获取表记录][交易证券_T0_证券持仓汇总表][{记录序号},{证券代码编号},{市场编号},({多头当前数量}- {多头平仓数量} + {空头平仓数量} - {空头当前数量}) as {持仓数量},({多头当前数量}+{空头当前数量}) as {当前数量},({多头开仓市值} + {空头开仓市值}) as {开仓市值},({多头开仓费用} + {空头开仓费用}) as {开仓费用},{产品编号},{交易组编号},{资产账户编号},{开仓日期},{开仓时间}][{操作员编号} = @操作员编号# and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and ({机构编号}=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0 ) and ({多头当前数量}- {多头平仓数量} + {空头平仓数量} - {空头当前数量}) <> 0][@指定行数#]
    #成本价从 明细表计算获得。 查询条件包含 {持仓数量}<>0，即不对除0保护。

    /* SELECT t1.{记录序号},t1.{证券代码编号},t1.{市场编号},t1.{持仓数量},t1.{当前数量},t1.{开仓市值},t1.{开仓费用},t1.{产品编号},t1.{交易组编号},t1.{资产账户编号},t1.{开仓日期},t1.{开仓时间},ABS(t2.open_value/t1.{持仓数量}) AS {成本价} FROM */
    SELECT t1.row_id,t1.stock_code_no,t1.exch_no,t1.posi_qty,t1.curr_qty,t1.open_posi_value,t1.open_posi_fee,t1.pd_no,t1.exch_group_no,t1.asset_acco_no,t1.open_posi_date,t1.open_posi_time,ABS(t2.open_value/t1.posi_qty) AS cost_price FROM

    /* (SELECT {记录序号},{证券代码编号},{市场编号},({多头当前数量}- {多头平仓数量} + {空头平仓数量} - {空头当前数量}) as {持仓数量},({多头当前数量}+{空头当前数量}) as {当前数量},({多头开仓市值} + {空头开仓市值}) as {开仓市值},({多头开仓费用} + {空头开仓费用}) as {开仓费用},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{开仓日期},{开仓时间} FROM ~交易证券_T0_证券持仓汇总表^ */
    (SELECT row_id,stock_code_no,exch_no,(long_curr_qty- long_close_posi_qty + short_close_posi_qty - short_curr_qty) as posi_qty,(long_curr_qty+short_curr_qty) as curr_qty,(long_open_posi_value + short_open_posi_value) as open_posi_value,(long_open_posi_fee + short_open_posi_fee) as open_posi_fee,pd_no,exch_group_no,asset_acco_no,stock_acco_no,open_posi_date,open_posi_time FROM db_tdsecu.tb_tdset0_stock_posi_sum

    /* WHERE {操作员编号} = @操作员编号# and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and ({机构编号}=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0 ) and ({多头当前数量}- {多头平仓数量} + {空头平仓数量} - {空头当前数量}) <> 0 */
    WHERE opor_no = v_opor_no and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0 ) and (long_curr_qty- long_close_posi_qty + short_close_posi_qty - short_curr_qty) <> 0
    )t1 INNER JOIN

    /* (SELECT  SUM(({当前数量}-{平仓数量})/{当前数量}*IF({多空类型}=《多空类型-多头》,({开仓市值}+{开仓费用}),({开仓市值}-{开仓费用}))) as open_value,{股东代码编号},{证券代码编号},{产品编号},{交易组编号},{资产账户编号} FROM ~交易证券_T0_证券持仓明细表^ WHERE {操作员编号} = @操作员编号# and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and ({机构编号}=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0 ) GROUP BY {股东代码编号},{证券代码编号},{产品编号},{交易组编号},{资产账户编号}) AS t2 ON t1.{证券代码编号} = t2.{证券代码编号} and t1.{股东代码编号}=t2.{股东代码编号} and t1.{产品编号}= t2.{产品编号} and t1.{交易组编号}= t2.{交易组编号} and t1.{资产账户编号}= t2.{资产账户编号}; */
    (SELECT  SUM((curr_qty-close_posi_qty)/curr_qty*IF(lngsht_type=1,(open_posi_value+open_posi_fee),(open_posi_value-open_posi_fee))) as open_value,stock_acco_no,stock_code_no,pd_no,exch_group_no,asset_acco_no FROM db_tdsecu.tb_tdset0_stock_posi_detail WHERE opor_no = v_opor_no and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0 ) GROUP BY stock_acco_no,stock_code_no,pd_no,exch_group_no,asset_acco_no) AS t2 ON t1.stock_code_no = t2.stock_code_no and t1.stock_acco_no=t2.stock_acco_no and t1.pd_no= t2.pd_no and t1.exch_group_no= t2.exch_group_no and t1.asset_acco_no= t2.asset_acco_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_账户汇总信息查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryAccTotalInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryAccTotalInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_co_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_amt decimal(18,4),
    OUT p_trade_qty decimal(18,2),
    OUT p_realize_pandl decimal(18,4),
    OUT p_yield_rate decimal(18,12),
    OUT p_all_fee decimal(18,4),
    OUT p_avail_amt decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_sum_realize_pandl decimal(18,4),
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
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_amt decimal(18,4);
    declare v_trade_qty decimal(18,2);
    declare v_realize_pandl decimal(18,4);
    declare v_yield_rate decimal(18,12);
    declare v_all_fee decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_update_times int;
    declare v_T0_limit_method int;
    declare v_open_posi_value decimal(18,4);
    declare v_close_posi_market_value decimal(18,4);

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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_amt = 0;
    SET v_trade_qty = 0;
    SET v_realize_pandl = 0;
    SET v_yield_rate = 0;
    SET v_all_fee = 0;
    SET v_avail_amt = 0;
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_update_times = 1;
    SET v_T0_limit_method = 0;
    SET v_open_posi_value = 0;
    SET v_close_posi_market_value = 0;

    
    label_pro:BEGIN
    

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* set @交易金额# = 0; */
    set v_trade_amt = 0;

    /* set @交易数量# = 0; */
    set v_trade_qty = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @收益率# = 0; */
    set v_yield_rate = 0;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @开仓市值# = 0; */
    set v_open_posi_value = 0;

    /* set @平仓市值# = 0; */
    set v_close_posi_market_value = 0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @隔夜盈亏# = 0; */
    set v_over_night_pandl = 0;

    /* set @可用金额# = 0; */
    set v_avail_amt = 0;

    /* [获取表记录变量语句][交易证券_T0_证券持仓汇总表][SUM({总多头开仓市值}+{总空头开仓市值}+{总多头平仓市值}+{总空头平仓市值}) AS {交易金额},SUM({总多头当前数量} + {总空头当前数量} + {总多头平仓数量} + {总空头平仓数量}) AS {交易数量}, SUM({总实现盈亏}) as {实现盈亏},SUM({总多头开仓市值}+{总空头开仓市值}) as {开仓市值},SUM({总多头平仓市值}+{总空头平仓市值}) as {平仓市值},SUM({总多头开仓费用} + {总空头开仓费用} + {总多头平仓费用} + {总空头平仓费用}) AS  {全部费用},SUM({隔夜盈亏}) as {隔夜盈亏}][@交易金额#, @交易数量#, @实现盈亏#, @开仓市值#,@平仓市值#, @全部费用#,@隔夜盈亏#][{操作员编号} = @操作员编号#] */
    select SUM(total_long_open_posi_value+total_short_open_posi_value+total_long_close_posi_value+total_short_close_posi_value) AS trade_amt,SUM(total_long_curr_qty + total_short_curr_qty + total_long_close_posi_qty + total_short_close_posi_qty) AS trade_qty, SUM(total_realize_pandl) as realize_pandl,SUM(total_long_open_posi_value+total_short_open_posi_value) as open_posi_value,SUM(total_long_close_posi_value+total_short_close_posi_value) as close_posi_market_value,SUM(total_long_open_posi_fee + total_short_open_posi_fee + total_long_close_posi_fee + total_short_close_posi_fee) AS  all_fee,SUM(over_night_pandl) as over_night_pandl into v_trade_amt, v_trade_qty, v_realize_pandl, v_open_posi_value,v_close_posi_market_value, v_all_fee,v_over_night_pandl from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no = v_opor_no limit 1;


    /* set @交易金额# = round(IFNULL(@交易金额#,0),2); */
    set v_trade_amt = round(IFNULL(v_trade_amt,0),2);

    /* set @交易数量# = IFNULL(@交易数量#,0); */
    set v_trade_qty = IFNULL(v_trade_qty,0);

    /* set @实现盈亏# = round(IFNULL(@实现盈亏#,0),2); */
    set v_realize_pandl = round(IFNULL(v_realize_pandl,0),2);

    /* set @全部费用# = round(IFNULL(@全部费用#,0),2); */
    set v_all_fee = round(IFNULL(v_all_fee,0),2);

    /* set @开仓市值# = round(IFNULL(@开仓市值#,0),2); */
    set v_open_posi_value = round(IFNULL(v_open_posi_value,0),2);

    /* set @平仓市值# = round(IFNULL(@平仓市值#,0),2); */
    set v_close_posi_market_value = round(IFNULL(v_close_posi_market_value,0),2);

    /* set @隔夜盈亏# = round(IFNULL(@隔夜盈亏#,0),2); */
    set v_over_night_pandl = round(IFNULL(v_over_night_pandl,0),2);

    /* if @平仓市值# > 0 then */
    if v_close_posi_market_value > 0 then

      /* SET @收益率# = Round(@实现盈亏#/@平仓市值#,6); */
      SET v_yield_rate = Round(v_realize_pandl/v_close_posi_market_value,6);
    end if;

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then

        /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{当前金额}-{冻结金额}-{交易占用金额}-{成交占用金额}+{成交释放金额},{累计实现盈亏},{更新次数}][@可用金额#,@累计实现盈亏#,@更新次数#][{操作员编号} = @操作员编号#] */
        select curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt,sum_realize_pandl,update_times into v_avail_amt,v_sum_realize_pandl,v_update_times from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no = v_opor_no limit 1;

    else

        /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{当前金额}-{冻结金额}-{交易占用金额}-{成交占用金额}+{成交释放金额},{累计实现盈亏},{更新次数}][@可用金额#,@累计实现盈亏#,@更新次数#][{操作员编号} = @操作员编号#] */
        select curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt,sum_realize_pandl,update_times into v_avail_amt,v_sum_realize_pandl,v_update_times from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no = v_opor_no limit 1;

    end if;

    /* set @可用金额# = round(ifnull(@可用金额#,0),2); */
    set v_avail_amt = round(ifnull(v_avail_amt,0),2);

    /* set @累计实现盈亏# = round(ifnull(@累计实现盈亏#,0),2); */
    set v_sum_realize_pandl = round(ifnull(v_sum_realize_pandl,0),2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_amt = v_trade_amt;
    SET p_trade_qty = v_trade_qty;
    SET p_realize_pandl = v_realize_pandl;
    SET p_yield_rate = v_yield_rate;
    SET p_all_fee = v_all_fee;
    SET p_avail_amt = v_avail_amt;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_sum_realize_pandl = v_sum_realize_pandl;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_持仓盈亏查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryPosiPandL;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryPosiPandL(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_init_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_init_date int;
    declare v_query_opor_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_init_date = p_init_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_co_no = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_T0_证券持仓汇总表][{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},({多头当前数量}- {多头平仓数量} + {空头平仓数量} - {空头当前数量}) as {持仓数量},({总多头当前数量} + {总空头当前数量} + {总多头平仓数量} + {总空头平仓数量}) AS {交易数量},({总多头开仓费用} + {总空头开仓费用} + {总多头平仓费用} + {总空头平仓费用}) AS  {全部费用},{总实现盈亏} as {实现盈亏},{操作员编号},ifnull(Round(ifnull({总实现盈亏},0)/({总多头平仓市值}+{总空头平仓市值}),5),0) as {收益率},{隔夜盈亏} as {隔夜盈亏}
][{操作员编号} = @操作员编号# and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@机构编号#=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0)][@指定行数#] */
    if v_row_count = -1 then
        select pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,(long_curr_qty- long_close_posi_qty + short_close_posi_qty - short_curr_qty) as posi_qty,(total_long_curr_qty + total_short_curr_qty + total_long_close_posi_qty + total_short_close_posi_qty) AS trade_qty,(total_long_open_posi_fee + total_short_open_posi_fee + total_long_close_posi_fee + total_short_close_posi_fee) AS  all_fee,total_realize_pandl as realize_pandl,opor_no,ifnull(Round(ifnull(total_realize_pandl,0)/(total_long_close_posi_value+total_short_close_posi_value),5),0) as yield_rate,over_night_pandl as over_night_pandl
     from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no = v_opor_no and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0);
    else
        select pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,(long_curr_qty- long_close_posi_qty + short_close_posi_qty - short_curr_qty) as posi_qty,(total_long_curr_qty + total_short_curr_qty + total_long_close_posi_qty + total_short_close_posi_qty) AS trade_qty,(total_long_open_posi_fee + total_short_open_posi_fee + total_long_close_posi_fee + total_short_close_posi_fee) AS  all_fee,total_realize_pandl as realize_pandl,opor_no,ifnull(Round(ifnull(total_realize_pandl,0)/(total_long_close_posi_value+total_short_close_posi_value),5),0) as yield_rate,over_night_pandl as over_night_pandl
     from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no = v_opor_no and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_持仓盈亏历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryHisPosiPandL;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryHisPosiPandL(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_query_opor_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_begin_date int;
    declare v_end_date int;
    declare v_query_opor_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_co_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_query_opor_no = p_query_opor_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_co_no = 0;
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][历史_交易证券_T0_证券持仓汇总表][{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码编号},({多头当前数量}- {多头平仓数量} + {空头平仓数量} - {空头当前数量}) as {持仓数量},({总多头当前数量} + {总空头当前数量} + {总多头平仓数量} + {总空头平仓数量}) AS {交易数量},({总多头开仓费用} + {总空头开仓费用} + {总多头平仓费用} + {总空头平仓费用}) AS  {全部费用},{总实现盈亏} as {实现盈亏},{操作员编号},ifnull(Round(ifnull({总实现盈亏},0)/({总多头平仓市值}+{总空头平仓市值}),5),0) as {收益率},{隔夜盈亏} as {隔夜盈亏}
][({初始化日期} between @开始日期# and @结束日期#) and {操作员编号} = @操作员编号# and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@机构编号#=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@证券代码编号# = 0 or {证券代码编号}=@证券代码编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0)][@指定行数#] */
    if v_row_count = -1 then
        select pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,(long_curr_qty- long_close_posi_qty + short_close_posi_qty - short_curr_qty) as posi_qty,(total_long_curr_qty + total_short_curr_qty + total_long_close_posi_qty + total_short_close_posi_qty) AS trade_qty,(total_long_open_posi_fee + total_short_open_posi_fee + total_long_close_posi_fee + total_short_close_posi_fee) AS  all_fee,total_realize_pandl as realize_pandl,opor_no,ifnull(Round(ifnull(total_realize_pandl,0)/(total_long_close_posi_value+total_short_close_posi_value),5),0) as yield_rate,over_night_pandl as over_night_pandl
     from db_tdsecu_his.tb_tdset0_stock_posi_sum_his where (init_date between v_begin_date and v_end_date) and opor_no = v_opor_no and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0);
    else
        select pd_no,exch_group_no,asset_acco_no,exch_no,stock_code_no,(long_curr_qty- long_close_posi_qty + short_close_posi_qty - short_curr_qty) as posi_qty,(total_long_curr_qty + total_short_curr_qty + total_long_close_posi_qty + total_short_close_posi_qty) AS trade_qty,(total_long_open_posi_fee + total_short_open_posi_fee + total_long_close_posi_fee + total_short_close_posi_fee) AS  all_fee,total_realize_pandl as realize_pandl,opor_no,ifnull(Round(ifnull(total_realize_pandl,0)/(total_long_close_posi_value+total_short_close_posi_value),5),0) as yield_rate,over_night_pandl as over_night_pandl
     from db_tdsecu_his.tb_tdset0_stock_posi_sum_his where (init_date between v_begin_date and v_end_date) and opor_no = v_opor_no and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_stock_code_no = 0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员阈值设置查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporTsholdSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_count int;
    declare v_T0_limit_method int;

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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;
    SET v_T0_limit_method = 0;

    
    label_pro:BEGIN
    

    /* SET @指定行数# = -1; */
    SET v_row_count = -1;

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then

        /* [获取表记录][交易证券_T0_操作员阈值设置表][{记录序号},
{机构编号},
{操作员编号},
{期初金额},
{当前金额},
{冻结金额},
{操作员预警阈值},
{操作员止损阈值},
{下单限制时间},
{单券持仓比例},
{持仓时限},
{单笔数量控制},
{单笔金额控制},
{单券预警比例},
{单券止损比例},
{单券预警金额},
{单券止损金额},
{触警操作方式},
{开平仓权限},
{风控监控员},
{费用计算方式},
{允许信用交易},
{买费率},
{卖费率},
{买最低费用},
{卖最低费用},
{交易占用金额},
{交易释放金额},
{成交占用金额},
{成交释放金额},
{累计实现盈亏},
{金额差额},
{备注信息},
{更新次数},
({当前金额}-{冻结金额}-{交易占用金额}-{成交占用金额}+{成交释放金额}) as {可用金额}][((@机构编号# = 0)  or  ({机构编号} = @机构编号#)) and ((@查询操作员编号# = 0) or ({操作员编号} = @查询操作员编号#)) ][@指定行数#] */
        if v_row_count = -1 then
            select row_id,
        co_no,
        opor_no,
        begin_amt,
        curr_amt,
        frozen_amt,
        opor_warn_tshold,
        opor_stop_tshold,
        order_limit_time,
        per_secu_posi_ratio,
        posi_limit_time,
        order_ctrl_qty,
        order_ctrl_amt,
        stock_warn_ratio,
        stock_stop_ratio,
        stock_warn_amt,
        stock_stop_amt,
        trig_oper_type,
        open_close_permission,
        risk_oper,
        fee_calc_type,
        permit_margin_trade,
        buy_fee_ratio,
        sell_fee_ratio,
        buy_min_fee,
        sell_min_fee,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        sum_realize_pandl,
        amt_diff,
        remark_info,
        update_times,
        (curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt) as avail_amt from db_tdsecu.tb_tdset0_opor_tshold_set where ((v_co_no = 0)  or  (co_no = v_co_no)) and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no)) ;
        else
            select row_id,
        co_no,
        opor_no,
        begin_amt,
        curr_amt,
        frozen_amt,
        opor_warn_tshold,
        opor_stop_tshold,
        order_limit_time,
        per_secu_posi_ratio,
        posi_limit_time,
        order_ctrl_qty,
        order_ctrl_amt,
        stock_warn_ratio,
        stock_stop_ratio,
        stock_warn_amt,
        stock_stop_amt,
        trig_oper_type,
        open_close_permission,
        risk_oper,
        fee_calc_type,
        permit_margin_trade,
        buy_fee_ratio,
        sell_fee_ratio,
        buy_min_fee,
        sell_min_fee,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        sum_realize_pandl,
        amt_diff,
        remark_info,
        update_times,
        (curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt) as avail_amt from db_tdsecu.tb_tdset0_opor_tshold_set where ((v_co_no = 0)  or  (co_no = v_co_no)) and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no))  limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_T0_操作员阈值设置表][{记录序号},
{机构编号},
{操作员编号},
{期初金额},
{当前金额},
{冻结金额},
{操作员预警阈值},
{操作员止损阈值},
{下单限制时间},
{单券持仓比例},
{持仓时限},
{单笔数量控制},
{单笔金额控制},
{单券预警比例},
{单券止损比例},
{单券预警金额},
{单券止损金额},
{触警操作方式},
{开平仓权限},
{风控监控员},
{费用计算方式},
{允许信用交易},
{买费率},
{卖费率},
{买最低费用},
{卖最低费用},
{交易占用金额},
{交易释放金额},
{成交占用金额},
{成交释放金额},
{累计实现盈亏},
{金额差额},
{备注信息},
{更新次数},
{当前金额}-{冻结金额}-{交易占用金额}-{成交占用金额}+{成交释放金额} as {可用金额}
][((@机构编号# = 0)  or  ({机构编号} = @机构编号#)) and ((@查询操作员编号# = 0) or ({操作员编号} = @查询操作员编号#)) ][@指定行数#] */
        if v_row_count = -1 then
            select row_id,
        co_no,
        opor_no,
        begin_amt,
        curr_amt,
        frozen_amt,
        opor_warn_tshold,
        opor_stop_tshold,
        order_limit_time,
        per_secu_posi_ratio,
        posi_limit_time,
        order_ctrl_qty,
        order_ctrl_amt,
        stock_warn_ratio,
        stock_stop_ratio,
        stock_warn_amt,
        stock_stop_amt,
        trig_oper_type,
        open_close_permission,
        risk_oper,
        fee_calc_type,
        permit_margin_trade,
        buy_fee_ratio,
        sell_fee_ratio,
        buy_min_fee,
        sell_min_fee,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        sum_realize_pandl,
        amt_diff,
        remark_info,
        update_times,
        curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt as avail_amt
         from db_tdsecu.tb_tdset0_opor_tshold_set where ((v_co_no = 0)  or  (co_no = v_co_no)) and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no)) ;
        else
            select row_id,
        co_no,
        opor_no,
        begin_amt,
        curr_amt,
        frozen_amt,
        opor_warn_tshold,
        opor_stop_tshold,
        order_limit_time,
        per_secu_posi_ratio,
        posi_limit_time,
        order_ctrl_qty,
        order_ctrl_amt,
        stock_warn_ratio,
        stock_stop_ratio,
        stock_warn_amt,
        stock_stop_amt,
        trig_oper_type,
        open_close_permission,
        risk_oper,
        fee_calc_type,
        permit_margin_trade,
        buy_fee_ratio,
        sell_fee_ratio,
        buy_min_fee,
        sell_min_fee,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        sum_realize_pandl,
        amt_diff,
        remark_info,
        update_times,
        curr_amt-frozen_amt-trade_capt_amt-strike_capt_amt+strike_releas_amt as avail_amt
         from db_tdsecu.tb_tdset0_opor_tshold_set where ((v_co_no = 0)  or  (co_no = v_co_no)) and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no))  limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员阈值设置更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_UpdateOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_UpdateOporTsholdSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_order_limit_time int,
    IN p_per_secu_posi_ratio decimal(18,12),
    IN p_posi_limit_time int,
    IN p_order_ctrl_qty decimal(18,2),
    IN p_order_ctrl_amt decimal(18,4),
    IN p_stock_warn_ratio decimal(18,12),
    IN p_stock_stop_ratio decimal(18,12),
    IN p_stock_warn_amt decimal(18,4),
    IN p_stock_stop_amt decimal(18,4),
    IN p_trig_oper_type int,
    IN p_open_close_permission int,
    IN p_risk_oper int,
    IN p_fee_calc_type int,
    IN p_permit_margin_trade int,
    IN p_buy_fee_ratio decimal(18,12),
    IN p_sell_fee_ratio decimal(18,12),
    IN p_buy_min_fee decimal(18,4),
    IN p_sell_min_fee decimal(18,4),
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
    declare v_co_no int;
    declare v_busi_opor_no int;
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_amt_diff decimal(18,4);
    declare v_tmp_begin_amt decimal(18,4);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_order_limit_time = p_order_limit_time;
    SET v_per_secu_posi_ratio = p_per_secu_posi_ratio;
    SET v_posi_limit_time = p_posi_limit_time;
    SET v_order_ctrl_qty = p_order_ctrl_qty;
    SET v_order_ctrl_amt = p_order_ctrl_amt;
    SET v_stock_warn_ratio = p_stock_warn_ratio;
    SET v_stock_stop_ratio = p_stock_stop_ratio;
    SET v_stock_warn_amt = p_stock_warn_amt;
    SET v_stock_stop_amt = p_stock_stop_amt;
    SET v_trig_oper_type = p_trig_oper_type;
    SET v_open_close_permission = p_open_close_permission;
    SET v_risk_oper = p_risk_oper;
    SET v_fee_calc_type = p_fee_calc_type;
    SET v_permit_margin_trade = p_permit_margin_trade;
    SET v_buy_fee_ratio = p_buy_fee_ratio;
    SET v_sell_fee_ratio = p_sell_fee_ratio;
    SET v_buy_min_fee = p_buy_min_fee;
    SET v_sell_min_fee = p_sell_min_fee;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_sum_realize_pandl = 0;
    SET v_begin_amt = 0;
    SET v_amt_diff = 0;
    SET v_tmp_begin_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @交易占用金额# = 0; */
    set v_trade_capt_amt = 0;

    /* set @交易释放金额# = 0; */
    set v_trade_releas_amt = 0;

    /* set @成交占用金额# = 0; */
    set v_strike_capt_amt = 0;

    /* set @成交释放金额# = 0; */
    set v_strike_releas_amt = 0;

    /* set @累计实现盈亏# = 0; */
    set v_sum_realize_pandl = 0;

    /* set @期初金额# = @当前金额#; */
    set v_begin_amt = v_curr_amt;

    /* set @金额差额# = 0; */
    set v_amt_diff = 0;

    /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{期初金额}][@临时_期初金额#][{操作员编号}=@操作员编号#] */
    select begin_amt into v_tmp_begin_amt from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no=v_opor_no limit 1;


    /* if @临时_期初金额#=0 then */
    if v_tmp_begin_amt=0 then

        /* [插入重复更新][交易证券_T0_操作员阈值设置表][字段][字段变量][{当前金额}=@当前金额#,{期初金额}=@期初金额#,{冻结金额}=@冻结金额#,{操作员预警阈值}=@操作员预警阈值# , {操作员止损阈值}=@操作员止损阈值#,{下单限制时间}=@下单限制时间# , {单券持仓比例}=@单券持仓比例#,{持仓时限}=@持仓时限#,{单笔数量控制}=@单笔数量控制#,{单笔金额控制}=@单笔金额控制#,{单券预警比例}=@单券预警比例#,{单券止损比例}=@单券止损比例#,{单券预警金额}=@单券预警金额#,{单券止损金额}=@单券止损金额#,{触警操作方式}=@触警操作方式#,{开平仓权限}=@开平仓权限#,{风控监控员}=@风控监控员#,{费用计算方式}=@费用计算方式#,{允许信用交易}=@允许信用交易#,{买费率}=@买费率#,{卖费率}=@卖费率#,{买最低费用}=@买最低费用#,{卖最低费用}=@卖最低费用#,{备注信息}=@备注信息#][1][@机构编号#,@业务操作员编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_opor_tshold_set (
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
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_begin_amt, v_curr_amt, v_frozen_amt, v_opor_warn_tshold, 
            v_opor_stop_tshold, v_order_limit_time, v_per_secu_posi_ratio, v_posi_limit_time, 
            v_order_ctrl_qty, v_order_ctrl_amt, v_stock_warn_ratio, v_stock_stop_ratio, 
            v_stock_warn_amt, v_stock_stop_amt, v_trig_oper_type, v_open_close_permission, 
            v_risk_oper, v_fee_calc_type, v_permit_margin_trade, v_buy_fee_ratio, 
            v_sell_fee_ratio, v_buy_min_fee, v_sell_min_fee, v_trade_capt_amt, 
            v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_sum_realize_pandl, 
            v_amt_diff, v_remark_info) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=v_curr_amt,begin_amt=v_begin_amt,frozen_amt=v_frozen_amt,opor_warn_tshold=v_opor_warn_tshold , opor_stop_tshold=v_opor_stop_tshold,order_limit_time=v_order_limit_time , per_secu_posi_ratio=v_per_secu_posi_ratio,posi_limit_time=v_posi_limit_time,order_ctrl_qty=v_order_ctrl_qty,order_ctrl_amt=v_order_ctrl_amt,stock_warn_ratio=v_stock_warn_ratio,stock_stop_ratio=v_stock_stop_ratio,stock_warn_amt=v_stock_warn_amt,stock_stop_amt=v_stock_stop_amt,trig_oper_type=v_trig_oper_type,open_close_permission=v_open_close_permission,risk_oper=v_risk_oper,fee_calc_type=v_fee_calc_type,permit_margin_trade=v_permit_margin_trade,buy_fee_ratio=v_buy_fee_ratio,sell_fee_ratio=v_sell_fee_ratio,buy_min_fee=v_buy_min_fee,sell_min_fee=v_sell_min_fee,remark_info=v_remark_info;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.10.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no);
            end if;
            leave label_pro;
        end if;

    else

        /* [插入重复更新][交易证券_T0_操作员阈值设置表][字段][字段变量][{当前金额}=@当前金额#,{冻结金额}=@冻结金额#,{操作员预警阈值}=@操作员预警阈值# , {操作员止损阈值}=@操作员止损阈值#,{下单限制时间}=@下单限制时间# , {单券持仓比例}=@单券持仓比例#,{持仓时限}=@持仓时限#,{单笔数量控制}=@单笔数量控制#,{单笔金额控制}=@单笔金额控制#,{单券预警比例}=@单券预警比例#,{单券止损比例}=@单券止损比例#,{单券预警金额}=@单券预警金额#,{单券止损金额}=@单券止损金额#,{触警操作方式}=@触警操作方式#,{开平仓权限}=@开平仓权限#,{风控监控员}=@风控监控员#,{费用计算方式}=@费用计算方式#,{允许信用交易}=@允许信用交易#,{买费率}=@买费率#,{卖费率}=@卖费率#,{买最低费用}=@买最低费用#,{卖最低费用}=@卖最低费用#,{备注信息}=@备注信息#][1][@机构编号#,@业务操作员编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_opor_tshold_set (
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
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_begin_amt, v_curr_amt, v_frozen_amt, v_opor_warn_tshold, 
            v_opor_stop_tshold, v_order_limit_time, v_per_secu_posi_ratio, v_posi_limit_time, 
            v_order_ctrl_qty, v_order_ctrl_amt, v_stock_warn_ratio, v_stock_stop_ratio, 
            v_stock_warn_amt, v_stock_stop_amt, v_trig_oper_type, v_open_close_permission, 
            v_risk_oper, v_fee_calc_type, v_permit_margin_trade, v_buy_fee_ratio, 
            v_sell_fee_ratio, v_buy_min_fee, v_sell_min_fee, v_trade_capt_amt, 
            v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_sum_realize_pandl, 
            v_amt_diff, v_remark_info) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=v_curr_amt,frozen_amt=v_frozen_amt,opor_warn_tshold=v_opor_warn_tshold , opor_stop_tshold=v_opor_stop_tshold,order_limit_time=v_order_limit_time , per_secu_posi_ratio=v_per_secu_posi_ratio,posi_limit_time=v_posi_limit_time,order_ctrl_qty=v_order_ctrl_qty,order_ctrl_amt=v_order_ctrl_amt,stock_warn_ratio=v_stock_warn_ratio,stock_stop_ratio=v_stock_stop_ratio,stock_warn_amt=v_stock_warn_amt,stock_stop_amt=v_stock_stop_amt,trig_oper_type=v_trig_oper_type,open_close_permission=v_open_close_permission,risk_oper=v_risk_oper,fee_calc_type=v_fee_calc_type,permit_margin_trade=v_permit_margin_trade,buy_fee_ratio=v_buy_fee_ratio,sell_fee_ratio=v_sell_fee_ratio,buy_min_fee=v_buy_min_fee,sell_min_fee=v_sell_min_fee,remark_info=v_remark_info;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.10.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no);
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

# 原子_交易证券_T0_交易员开平仓明细查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporOpenClosePosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporOpenClosePosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_query_opor_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_T0_证券持仓明细表][字段][((@查询操作员编号# = 0 and instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0 ) or {操作员编号} = @查询操作员编号#) and ({机构编号}=@操作员机构编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (co_no=v_opor_co_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (co_no=v_opor_co_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员阈值信息初始化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_InitOporTshold;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_InitOporTshold(
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
    
    #set @初始化日期# = 0;
    #[不分日期数据归历史][交易证券_T0_操作员阈值计算表][字段][1][@初始化日期#]
    #[删除表记录][交易证券_T0_操作员阈值计算表][1=1][3][@初始化日期#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_交易员开平仓明细历史查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryHisOporPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryHisOporPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_opor_no int,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_query_opor_no int;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_T0_历史证券持仓明细表][字段][({初始化日期} between @开始日期# and @结束日期#) and ((@查询操作员编号# = 0 and instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0 ) or {操作员编号} = @查询操作员编号#) and ({机构编号} =@操作员机构编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码编号#=0 or {证券代码编号}=@证券代码编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, stock_code, exch_no, stock_acco_no, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        close_posi_date, close_posi_time, close_posi_qty, close_posi_market_value, 
        close_posi_fee, strike_no, realize_pandl, over_night_pandl, 
        posi_status, remark_info from db_tdsecu_his.tb_tdset0_stock_posi_detail_his where (init_date between v_begin_date and v_end_date) and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (co_no =v_opor_co_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        opor_no, co_no, pd_no, exch_group_no, 
        asset_acco_no, stock_code, exch_no, stock_acco_no, 
        stock_code_no, lngsht_type, curr_qty, open_posi_date, 
        open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
        close_posi_date, close_posi_time, close_posi_qty, close_posi_market_value, 
        close_posi_fee, strike_no, realize_pandl, over_night_pandl, 
        posi_status, remark_info from db_tdsecu_his.tb_tdset0_stock_posi_detail_his where (init_date between v_begin_date and v_end_date) and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (co_no =v_opor_co_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code_no=0 or stock_code_no=v_stock_code_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员券源限额设置更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_UpdateOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_UpdateOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_source_stock_qty decimal(18,2),
    IN p_single_limit_qty decimal(18,2),
    IN p_t0_buy_type int,
    IN p_menu_no int,
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
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_t0_buy_type int;
    declare v_menu_no int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_opor_no int;
    declare v_assigned_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_total_realize_pandl decimal(18,4);
    declare v_total_open_posi_fee decimal(18,4);
    declare v_total_close_posi_fee decimal(18,4);
    declare v_out_order_releas_qty decimal(18,2);
    declare v_out_order_capt_qty decimal(18,2);
    declare v_out_strike_releas_qty decimal(18,2);
    declare v_out_strike_capt_qty decimal(18,2);
    declare v_over_night_trade_buy_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_over_night_strike_sell_qty decimal(18,2);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_begin_qty decimal(18,2);
    declare v_diff_qty decimal(18,2);
    declare v_tmp_begin_qty decimal(18,2);
    declare v_tmp_source_stock_qty decimal(18,2);
    declare v_tmp_single_limit_qty decimal(18,2);
    declare v_source_stock_occur_qty decimal(18,2);
    declare v_single_limit_occur_qty decimal(18,2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_row_id bigint;
    declare v_assigned_occur_qty decimal(18,2);
    declare v_source_stock_occur_end_qty decimal(18,2);
    declare v_single_limit_occur_end_qty decimal(18,2);
    declare v_assigned_occur_end_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_source_stock_qty = p_source_stock_qty;
    SET v_single_limit_qty = p_single_limit_qty;
    SET v_t0_buy_type = p_t0_buy_type;
    SET v_menu_no = p_menu_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_opor_no = 0;
    SET v_assigned_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_total_realize_pandl = 0;
    SET v_total_open_posi_fee = 0;
    SET v_total_close_posi_fee = 0;
    SET v_out_order_releas_qty = 0;
    SET v_out_order_capt_qty = 0;
    SET v_out_strike_releas_qty = 0;
    SET v_out_strike_capt_qty = 0;
    SET v_over_night_trade_buy_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_over_night_strike_sell_qty = 0;
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_begin_qty = 0;
    SET v_diff_qty = 0;
    SET v_tmp_begin_qty = 0;
    SET v_tmp_source_stock_qty = 0;
    SET v_tmp_single_limit_qty = 0;
    SET v_source_stock_occur_qty = 0;
    SET v_single_limit_occur_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_assigned_occur_qty = 0;
    SET v_source_stock_occur_end_qty = 0;
    SET v_single_limit_occur_end_qty = 0;
    SET v_assigned_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @已分配数量# = 0; */
    set v_assigned_qty = 0;
    #set @初始化日期# = 0;

    /* set @交易释放数量# = 0; */
    set v_trade_releas_qty = 0;

    /* set @交易占用数量# = 0; */
    set v_trade_capt_qty = 0;

    /* set @成交释放数量# = 0; */
    set v_strike_releas_qty = 0;

    /* set @成交占用数量# = 0; */
    set v_strike_capt_qty = 0;

    /* set @总实现盈亏# = 0; */
    set v_total_realize_pandl = 0;

    /* set @总开仓费用# = 0; */
    set v_total_open_posi_fee = 0;

    /* set @总平仓费用# = 0; */
    set v_total_close_posi_fee = 0;

    /* set @外部交易释放数量# = 0; */
    set v_out_order_releas_qty = 0;

    /* set @外部交易占用数量# = 0; */
    set v_out_order_capt_qty = 0;

    /* set @外部成交释放数量# = 0; */
    set v_out_strike_releas_qty = 0;

    /* set @外部成交占用数量# = 0; */
    set v_out_strike_capt_qty = 0;

    /* set @隔夜仓强平交易买入数量# = 0; */
    set v_over_night_trade_buy_qty = 0;

    /* set @隔夜仓强平交易卖出数量# = 0; */
    set v_over_night_trade_sell_qty = 0;

    /* set @隔夜仓强平成交卖出数量# = 0; */
    set v_over_night_strike_sell_qty = 0;

    /* set @隔夜盈亏# = 0; */
    set v_over_night_pandl = 0;

    /* set @累计实现盈亏# = 0; */
    set v_sum_realize_pandl = 0;
    #先获取原先的券源数量，再做差值，得到券源的变化量
    #[不报错锁定获取表记录变量][交易证券_T0_操作员券源设置表][{券源数量}][@券源数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {操作员编号} = @操作员编号#]
    #set @券源数量# =@临时_券源数量# - @券源数量# ;

    /* set @期初数量# = @券源数量#; */
    set v_begin_qty = v_source_stock_qty;

    /* set @数量差额# = 0; */
    set v_diff_qty = 0;

    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][{期初数量},{券源数量},{单笔限额数量},{已分配数量}][@临时_期初数量#,@临时_券源数量#,@临时_单笔限额数量#,@已分配数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {操作员编号}=@操作员编号#] */
    select begin_qty,source_stock_qty,single_limit_qty,assigned_qty into v_tmp_begin_qty,v_tmp_source_stock_qty,v_tmp_single_limit_qty,v_assigned_qty from db_tdsecu.tb_tdset0_opor_stock_source where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and opor_no=v_opor_no limit 1;

    #先获取原先的券源数量、单笔限额数量，再做差值，得到券源、限额的变化量 记流水

    /* set @券源变动数量# = @券源数量# - @临时_券源数量#; */
    set v_source_stock_occur_qty = v_source_stock_qty - v_tmp_source_stock_qty;

    /* set @单笔限额变动数量# = @单笔限额数量# - @临时_单笔限额数量#; */
    set v_single_limit_occur_qty = v_single_limit_qty - v_tmp_single_limit_qty;

    /* if @临时_期初数量#=0 then */
    if v_tmp_begin_qty=0 then

        /* [插入重复更新][交易证券_T0_操作员券源设置表][字段][字段变量][{券源数量}= @券源数量#,{期初数量} = {券源数量} , {单笔限额数量} = @单笔限额数量#,{备注信息} = @备注信息#][1][@机构编号#,@业务操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@市场编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_opor_stock_source (
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
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_code, v_exch_no, v_begin_qty, 
            v_source_stock_qty, v_single_limit_qty, v_assigned_qty, v_trade_releas_qty, 
            v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, v_total_realize_pandl, 
            v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, v_total_close_posi_fee, 
            v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, v_out_strike_capt_qty, 
            v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, v_diff_qty, 
            v_t0_buy_type, v_remark_info) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, source_stock_qty= v_source_stock_qty,begin_qty = source_stock_qty , single_limit_qty = v_single_limit_qty,remark_info = v_remark_info;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.14.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;

    else

        /* [插入重复更新][交易证券_T0_操作员券源设置表][字段][字段变量][{券源数量}= @券源数量#,{单笔限额数量} = @单笔限额数量#,{备注信息} = @备注信息#][1][@机构编号#,@业务操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@市场编号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_opor_stock_source (
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
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
            v_stock_code_no, v_stock_code, v_exch_no, v_begin_qty, 
            v_source_stock_qty, v_single_limit_qty, v_assigned_qty, v_trade_releas_qty, 
            v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, v_total_realize_pandl, 
            v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, v_total_close_posi_fee, 
            v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, v_out_strike_capt_qty, 
            v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, v_diff_qty, 
            v_t0_buy_type, v_remark_info) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, source_stock_qty= v_source_stock_qty,single_limit_qty = v_single_limit_qty,remark_info = v_remark_info;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.14.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #对操作员 的券源变化，而不是所有

    /* set @临时_券源数量#=@券源数量#; */
    set v_tmp_source_stock_qty=v_source_stock_qty;

    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][sum({券源数量})][@券源数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][错误编码][错误信息] */
    select sum(source_stock_qty) into v_source_stock_qty from db_tdsecu.tb_tdset0_opor_stock_source where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;

    #非唯一索引锁更新，高并发会出现死锁。遍历去更新。
    #[更新表记录][交易证券_T0_操作员券源设置表][{已分配数量} =@券源数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#]

    /* [声明游标][交易证券_T0_操作员券源设置表][{记录序号}][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][cursor_stocksource] */
    cursor_stocksource:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_stocksource CURSOR FOR
        select row_id 
        from db_tdsecu.tb_tdset0_opor_stock_source 
        where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@记录序号#][cursor_stocksource][loop_stocksource] */
    open cursor_stocksource;
    loop_stocksource: LOOP
    fetch cursor_stocksource into v_row_id;
        IF v_cursor_done THEN
            LEAVE loop_stocksource;
        END IF;


        /* [更新表记录][交易证券_T0_操作员券源设置表][{已分配数量} =@券源数量#][{记录序号}=@记录序号#][1][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, assigned_qty =v_source_stock_qty where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.14.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            close cursor_stocksource;
            leave label_pro;
        end if;


    /* [关闭游标][cursor_stocksource] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_stocksource;
    end cursor_stocksource;

    #已分配的 变化数量=sum(券源数量) - 原来的已分配数量;

    /* set @已分配变动数量#=@券源数量#-@已分配数量#; */
    set v_assigned_occur_qty=v_source_stock_qty-v_assigned_qty;

    /* set @变动后券源数量#=@临时_券源数量#; */
    set v_source_stock_occur_end_qty=v_tmp_source_stock_qty;

    /* set @变动后单笔限额数量#=@单笔限额数量#; */
    set v_single_limit_occur_end_qty=v_single_limit_qty;

    /* set @变动后已分配数量#=@券源数量#; */
    set v_assigned_occur_end_qty=v_source_stock_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "更新操作员券源设置"; */
    set v_oper_remark_info = "更新操作员券源设置";

    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* [插入表记录][交易证券_T0_操作员券源设置流水表][字段][字段变量][5][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_opor_stock_source_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, oper_mac, 
        oper_ip_addr, oper_info, oper_way, oper_menu_no, 
        oper_func_code, init_date, co_no, busi_opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, source_stock_occur_qty, 
        source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, assigned_occur_qty, 
        assigned_occur_end_qty, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_oper_mac, 
        v_oper_ip_addr, v_oper_info, v_oper_way, v_oper_menu_no, 
        v_oper_func_code, v_init_date, v_co_no, v_busi_opor_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_source_stock_occur_qty, 
        v_source_stock_occur_end_qty, v_single_limit_occur_qty, v_single_limit_occur_end_qty, v_assigned_occur_qty, 
        v_assigned_occur_end_qty, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.14.5";
        SET v_error_info =  CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员券源限额设置查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_co_busi_config_str varchar(64),
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_T0_limit_method int;

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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_T0_limit_method = 0;

    
    label_pro:BEGIN
    

    /* SET @指定行数# = -1; */
    SET v_row_count = -1;

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then
    #[获取表记录][交易证券_T0_操作员券源设置表][{记录序号}, {机构编号}, {操作员编号}, {产品编号}, {交易组编号}, {资产账户编号}, {股东代码编号}, {证券代码编号}, {市场编号}, {期初数量}, {券源数量}, {单笔限额数量}, {已分配数量}, {交易释放数量}, {交易占用数量}, {成交释放数量}, {成交占用数量}, {总实现盈亏}, {隔夜盈亏}, {累计实现盈亏}, {总开仓费用}, {总平仓费用}, {外部交易释放数量}, {外部交易占用数量}, {外部成交释放数量}, {外部成交占用数量}, {备注信息}, {更新次数}, {券源数量}- {交易释放数量} - {成交释放数量}  as {买入可用数量}, {券源数量} - {交易占用数量} - {成交占用数量}  as {卖出可用数量}, {券源数量} + {成交释放数量} - {成交占用数量} as {持仓数量}, {总开仓费用}+{总平仓费用} as {当日交易费}, {累计实现盈亏} - {隔夜盈亏} as {当日盈亏}, {隔夜仓强平买入数量}, {隔夜仓强平卖出数量}, {隔夜仓强平成交数量}, {数量差额}][(@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=' ' or {证券代码}=@证券代码#) and (@机构编号串#="" "" or instr(@机构编号串#, concat("";"",{机构编号},"";""))>0) and (@产品编号串#="" "" or instr(@产品编号串#, concat("";"",{产品编号},"";""))>0) and (@交易组编号串#="" "" or instr(@交易组编号串#, concat("";"",{交易组编号},"";""))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* SELECT 
t1.{记录序号},
t1.{机构编号},
t1.{操作员编号},
t1.{证券代码编号},
t1.{证券代码},
t1.{市场编号},
t1.{期初数量},
t1.{券源数量},
t1.{已分配数量},
t1.{单笔限额数量},
t1.{交易释放数量},
t1.{交易占用数量},
t1.{成交释放数量},
t1.{成交占用数量},
t1.{总实现盈亏},
t1.{当日盈亏},
t1.{产品编号},
t1.{交易组编号},
t1.{资产账户编号},
t1.{股东代码编号},
t1.{外部交易释放数量},
t1.{外部交易占用数量},
t1.{外部成交释放数量},
t1.{外部成交占用数量},
t1.{隔夜盈亏},
t1.{累计实现盈亏},
t1.{总开仓费用},
t1.{总平仓费用},
t1.{备注信息},
t1.{买入可用数量},
t1.{卖出可用数量},
t1.{持仓数量},
t1.{当日交易费},
t1.{数量差额},
t1.{T0买入方式},
t1.{隔夜仓强平交易买入数量},
t1.{隔夜仓强平交易卖出数量},
t1.{隔夜仓强平成交卖出数量},
t1.{更新次数},
t2.{隔夜仓强平总交易卖出数量},
t2.{隔夜仓强平总成交卖出数量}
FROM
(SELECT 
{记录序号},
{机构编号},
{操作员编号},
{证券代码编号},
{证券代码},
{市场编号},
{期初数量},
{券源数量},
{已分配数量},
{单笔限额数量},
{交易释放数量},
{交易占用数量},
{成交释放数量},
{成交占用数量},
{总实现盈亏} as {当日盈亏},
{总实现盈亏},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{外部交易释放数量},
{外部交易占用数量},
{外部成交释放数量},
{外部成交占用数量},
{隔夜盈亏},
{累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息},
{券源数量} - {交易释放数量} - {成交释放数量}  as {买入可用数量},
{券源数量} - {交易占用数量} - {成交占用数量}  as {卖出可用数量},
{券源数量}+(IFNULL({成交释放数量},0) - IFNULL({成交占用数量},0))  as {持仓数量},
{总开仓费用} + {总平仓费用} as {当日交易费},{数量差额},{T0买入方式},
{隔夜仓强平交易买入数量},
{隔夜仓强平交易卖出数量},
{隔夜仓强平成交卖出数量},
{更新次数} FROM ~交易证券_T0_操作员券源设置表^ WHERE (@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@机构编号串#=" " or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and {记录序号} > @记录序号# order by {记录序号})t1 
INNER JOIN
(SELECT IFNULL(SUM({隔夜仓强平交易卖出数量}),0) as {隔夜仓强平总交易卖出数量},IFNULL(SUM({隔夜仓强平成交卖出数量}),0) as {隔夜仓强平总成交卖出数量},{机构编号},{产品编号},{股东代码编号},{交易组编号},{资产账户编号},{市场编号},{证券代码}  FROM ~交易证券_T0_操作员券源设置表^ WHERE ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=" " or {证券代码}=@证券代码#) and (@机构编号串#=" " or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0)  GROUP BY {机构编号},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{市场编号},{证券代码})AS t2 ON t1.{机构编号} = t2.{机构编号} and t1.{股东代码编号}=t2.{股东代码编号} and t1.{产品编号}= t2.{产品编号} and t1.{交易组编号}= t2.{交易组编号} and t1.{资产账户编号}= t2.{资产账户编号} and t1.{市场编号}= t2.{市场编号} and t1.{证券代码}= t2.{证券代码}; */
    SELECT 
    t1.row_id,
    t1.co_no,
    t1.opor_no,
    t1.stock_code_no,
    t1.stock_code,
    t1.exch_no,
    t1.begin_qty,
    t1.source_stock_qty,
    t1.assigned_qty,
    t1.single_limit_qty,
    t1.trade_releas_qty,
    t1.trade_capt_qty,
    t1.strike_releas_qty,
    t1.strike_capt_qty,
    t1.total_realize_pandl,
    t1.today_pandl,
    t1.pd_no,
    t1.exch_group_no,
    t1.asset_acco_no,
    t1.stock_acco_no,
    t1.out_order_releas_qty,
    t1.out_order_capt_qty,
    t1.out_strike_releas_qty,
    t1.out_strike_capt_qty,
    t1.over_night_pandl,
    t1.sum_realize_pandl,
    t1.total_open_posi_fee,
    t1.total_close_posi_fee,
    t1.remark_info,
    t1.buy_avail_qty,
    t1.sell_avail_qty,
    t1.posi_qty,
    t1.today_trade_fee,
    t1.diff_qty,
    t1.t0_buy_type,
    t1.over_night_trade_buy_qty,
    t1.over_night_trade_sell_qty,
    t1.over_night_strike_sell_qty,
    t1.update_times,
    t2.over_night_sumtrd_sell_qty,
    t2.over_night_sumstk_sell_qty
    FROM
    (SELECT 
    row_id,
    co_no,
    opor_no,
    stock_code_no,
    stock_code,
    exch_no,
    begin_qty,
    source_stock_qty,
    assigned_qty,
    single_limit_qty,
    trade_releas_qty,
    trade_capt_qty,
    strike_releas_qty,
    strike_capt_qty,
    total_realize_pandl as today_pandl,
    total_realize_pandl,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    out_order_releas_qty,
    out_order_capt_qty,
    out_strike_releas_qty,
    out_strike_capt_qty,
    over_night_pandl,
    sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
    source_stock_qty - trade_releas_qty - strike_releas_qty  as buy_avail_qty,
    source_stock_qty - trade_capt_qty - strike_capt_qty  as sell_avail_qty,
    source_stock_qty+(IFNULL(strike_releas_qty,0) - IFNULL(strike_capt_qty,0))  as posi_qty,
    total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
    over_night_trade_buy_qty,
    over_night_trade_sell_qty,
    over_night_strike_sell_qty,
    update_times FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and (v_co_no_str=" " or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and row_id > v_row_id order by row_id)t1 
    INNER JOIN
    (SELECT IFNULL(SUM(over_night_trade_sell_qty),0) as over_night_sumtrd_sell_qty,IFNULL(SUM(over_night_strike_sell_qty),0) as over_night_sumstk_sell_qty,co_no,pd_no,stock_acco_no,exch_group_no,asset_acco_no,exch_no,stock_code  FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=" " or stock_code=v_stock_code) and (v_co_no_str=" " or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0)  GROUP BY co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,exch_no,stock_code)AS t2 ON t1.co_no = t2.co_no and t1.stock_acco_no=t2.stock_acco_no and t1.pd_no= t2.pd_no and t1.exch_group_no= t2.exch_group_no and t1.asset_acco_no= t2.asset_acco_no and t1.exch_no= t2.exch_no and t1.stock_code= t2.stock_code;
    else
    #[获取表记录][交易证券_T0_操作员券源设置表][{记录序号}, {机构编号}, {操作员编号}, {产品编号}, {交易组编号}, {资产账户编号}, {股东代码编号}, {证券代码编号}, {市场编号}, {期初数量}, ({券源数量}+{数量差额}+{隔夜仓强平买入数量} -{隔夜仓强平卖出数量}) as {券源数量}, {单笔限额数量}, {已分配数量}, {交易释放数量}, {交易占用数量}, {成交释放数量}, {成交占用数量}, {总实现盈亏}, {隔夜盈亏}, {累计实现盈亏}, {总开仓费用}, {总平仓费用}, {外部交易释放数量}, {外部交易占用数量}, {外部成交释放数量}, {外部成交占用数量}, {备注信息}, {更新次数},  {券源数量} +{数量差额}- {交易释放数量} - {成交释放数量} -{隔夜仓强平卖出数量}  as {买入可用数量},  {券源数量}+{数量差额} - {交易占用数量} - {成交占用数量} +{隔夜仓强平买入数量}  as {卖出可用数量}, {券源数量}+{数量差额} + {成交释放数量} - {成交占用数量} as {持仓数量}, {总开仓费用}+{总平仓费用} as {当日交易费}, {累计实现盈亏} - {隔夜盈亏} as {当日盈亏}, {隔夜仓强平买入数量}, {隔夜仓强平卖出数量}, {隔夜仓强平成交数量}, {数量差额}][(@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=' ' or {证券代码}=@证券代码#) and (@机构编号串#="" "" or instr(@机构编号串#, concat("";"",{机构编号},"";""))>0) and (@产品编号串#="" "" or instr(@产品编号串#, concat("";"",{产品编号},"";""))>0) and (@交易组编号串#="" "" or instr(@交易组编号串#, concat("";"",{交易组编号},"";""))>0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]

    /* SELECT 
t1.{记录序号},
t1.{机构编号},
t1.{操作员编号},
t1.{证券代码编号},
t1.{证券代码},
t1.{市场编号},
t1.{期初数量},
t1.{券源数量},
t1.{已分配数量},
t1.{单笔限额数量},
t1.{交易释放数量},
t1.{交易占用数量},
t1.{成交释放数量},
t1.{成交占用数量},
t1.{总实现盈亏},
t1.{当日盈亏},
t1.{产品编号},
t1.{交易组编号},
t1.{资产账户编号},
t1.{股东代码编号},
t1.{外部交易释放数量},
t1.{外部交易占用数量},
t1.{外部成交释放数量},
t1.{外部成交占用数量},
t1.{隔夜盈亏},
t1.{累计实现盈亏},
t1.{总开仓费用},
t1.{总平仓费用},
t1.{备注信息},
t1.{买入可用数量},
t1.{卖出可用数量},
t1.{持仓数量},
t1.{当日交易费},
t1.{数量差额},
t1.{T0买入方式},
t1.{隔夜仓强平交易买入数量},
t1.{隔夜仓强平交易卖出数量},
t1.{隔夜仓强平成交卖出数量},
t1.{更新次数},
t2.{隔夜仓强平总交易卖出数量},
t2.{隔夜仓强平总成交卖出数量}
FROM
(SELECT 
{记录序号},
{机构编号},
{操作员编号},
{证券代码编号},
{证券代码},
{市场编号},
{期初数量},
({券源数量}+{数量差额} -{隔夜仓强平交易卖出数量}) as {券源数量},
{已分配数量},
{单笔限额数量},
{交易释放数量},
{交易占用数量},
{成交释放数量},
{成交占用数量},
{总实现盈亏} as {当日盈亏},
{总实现盈亏},
{产品编号},
{交易组编号},
{资产账户编号},
{股东代码编号},
{外部交易释放数量},
{外部交易占用数量},
{外部成交释放数量},
{外部成交占用数量},
{隔夜盈亏},
{累计实现盈亏},{总开仓费用},{总平仓费用},{备注信息},
 {券源数量} +{数量差额}- {交易释放数量} - {成交释放数量} -{隔夜仓强平交易卖出数量}  as {买入可用数量},
 {券源数量}+{数量差额} - {交易占用数量} - {成交占用数量} -{隔夜仓强平交易卖出数量}  as {卖出可用数量},
{券源数量}+{数量差额} + {成交释放数量} - {成交占用数量} as {持仓数量},
{总开仓费用} + {总平仓费用} as {当日交易费},{数量差额},{T0买入方式},
{隔夜仓强平交易买入数量},
{隔夜仓强平交易卖出数量},
{隔夜仓强平成交卖出数量},
{更新次数} FROM ~交易证券_T0_操作员券源设置表^ WHERE (@查询操作员编号# = 0 or {操作员编号} = @查询操作员编号#) and ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=' ' or {证券代码}=@证券代码#) and (@机构编号串#=" " or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0) and {记录序号} > @记录序号# order by {记录序号})t1 
INNER JOIN
(SELECT IFNULL(SUM({隔夜仓强平交易卖出数量}),0) as {隔夜仓强平总交易卖出数量},IFNULL(SUM({隔夜仓强平成交卖出数量}),0) as {隔夜仓强平总成交卖出数量},{机构编号},{产品编号},{股东代码编号},{交易组编号},{资产账户编号},{市场编号},{证券代码} FROM ~交易证券_T0_操作员券源设置表^ WHERE ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@股东代码编号#=0 or {股东代码编号}=@股东代码编号#)  and (@市场编号#=0 or {市场编号}=@市场编号#) and (@证券代码#=' ' or {证券代码}=@证券代码#) and (@机构编号串#=" " or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#=" " or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@交易组编号串#=" " or instr(@交易组编号串#, concat(";",{交易组编号},";"))>0)  GROUP BY {机构编号},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{市场编号},{证券代码})AS t2 ON t1.{机构编号} = t2.{机构编号} and t1.{股东代码编号}=t2.{股东代码编号} and t1.{产品编号}= t2.{产品编号} and t1.{交易组编号}= t2.{交易组编号} and t1.{资产账户编号}= t2.{资产账户编号} and t1.{市场编号}= t2.{市场编号} and t1.{证券代码}= t2.{证券代码};

 */
    SELECT 
    t1.row_id,
    t1.co_no,
    t1.opor_no,
    t1.stock_code_no,
    t1.stock_code,
    t1.exch_no,
    t1.begin_qty,
    t1.source_stock_qty,
    t1.assigned_qty,
    t1.single_limit_qty,
    t1.trade_releas_qty,
    t1.trade_capt_qty,
    t1.strike_releas_qty,
    t1.strike_capt_qty,
    t1.total_realize_pandl,
    t1.today_pandl,
    t1.pd_no,
    t1.exch_group_no,
    t1.asset_acco_no,
    t1.stock_acco_no,
    t1.out_order_releas_qty,
    t1.out_order_capt_qty,
    t1.out_strike_releas_qty,
    t1.out_strike_capt_qty,
    t1.over_night_pandl,
    t1.sum_realize_pandl,
    t1.total_open_posi_fee,
    t1.total_close_posi_fee,
    t1.remark_info,
    t1.buy_avail_qty,
    t1.sell_avail_qty,
    t1.posi_qty,
    t1.today_trade_fee,
    t1.diff_qty,
    t1.t0_buy_type,
    t1.over_night_trade_buy_qty,
    t1.over_night_trade_sell_qty,
    t1.over_night_strike_sell_qty,
    t1.update_times,
    t2.over_night_sumtrd_sell_qty,
    t2.over_night_sumstk_sell_qty
    FROM
    (SELECT 
    row_id,
    co_no,
    opor_no,
    stock_code_no,
    stock_code,
    exch_no,
    begin_qty,
    (source_stock_qty+diff_qty -over_night_trade_sell_qty) as source_stock_qty,
    assigned_qty,
    single_limit_qty,
    trade_releas_qty,
    trade_capt_qty,
    strike_releas_qty,
    strike_capt_qty,
    total_realize_pandl as today_pandl,
    total_realize_pandl,
    pd_no,
    exch_group_no,
    asset_acco_no,
    stock_acco_no,
    out_order_releas_qty,
    out_order_capt_qty,
    out_strike_releas_qty,
    out_strike_capt_qty,
    over_night_pandl,
    sum_realize_pandl,total_open_posi_fee,total_close_posi_fee,remark_info,
     source_stock_qty +diff_qty- trade_releas_qty - strike_releas_qty -over_night_trade_sell_qty  as buy_avail_qty,
     source_stock_qty+diff_qty - trade_capt_qty - strike_capt_qty -over_night_trade_sell_qty  as sell_avail_qty,
    source_stock_qty+diff_qty + strike_releas_qty - strike_capt_qty as posi_qty,
    total_open_posi_fee + total_close_posi_fee as today_trade_fee,diff_qty,t0_buy_type,
    over_night_trade_buy_qty,
    over_night_trade_sell_qty,
    over_night_strike_sell_qty,
    update_times FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE (v_query_opor_no = 0 or opor_no = v_query_opor_no) and (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=' ' or stock_code=v_stock_code) and (v_co_no_str=" " or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0) and row_id > v_row_id order by row_id)t1 
    INNER JOIN
    (SELECT IFNULL(SUM(over_night_trade_sell_qty),0) as over_night_sumtrd_sell_qty,IFNULL(SUM(over_night_strike_sell_qty),0) as over_night_sumstk_sell_qty,co_no,pd_no,stock_acco_no,exch_group_no,asset_acco_no,exch_no,stock_code FROM db_tdsecu.tb_tdset0_opor_stock_source WHERE (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_stock_acco_no=0 or stock_acco_no=v_stock_acco_no)  and (v_exch_no=0 or exch_no=v_exch_no) and (v_stock_code=' ' or stock_code=v_stock_code) and (v_co_no_str=" " or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str=" " or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_str=" " or instr(v_exch_group_no_str, concat(";",exch_group_no,";"))>0)  GROUP BY co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,exch_no,stock_code)AS t2 ON t1.co_no = t2.co_no and t1.stock_acco_no=t2.stock_acco_no and t1.pd_no= t2.pd_no and t1.exch_group_no= t2.exch_group_no and t1.asset_acco_no= t2.asset_acco_no and t1.exch_no= t2.exch_no and t1.stock_code= t2.stock_code;
    
    
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_删除操作员券源限额设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_DeleteOporStockLimit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_DeleteOporStockLimit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_row_id bigint,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_source_stock_occur_qty decimal(18,2),
    OUT p_row_id_str varchar(2048)
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
    declare v_row_id bigint;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_source_stock_occur_qty decimal(18,2);
    declare v_row_id_str varchar(2048);
    declare v_tmp_opor_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_begin_qty decimal(18,2);
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_assigned_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_total_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_total_open_posi_fee decimal(18,4);
    declare v_total_close_posi_fee decimal(18,4);
    declare v_out_order_releas_qty decimal(18,2);
    declare v_out_order_capt_qty decimal(18,2);
    declare v_out_strike_releas_qty decimal(18,2);
    declare v_out_strike_capt_qty decimal(18,2);
    declare v_over_night_trade_buy_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_over_night_strike_sell_qty decimal(18,2);
    declare v_diff_qty decimal(18,2);
    declare v_t0_buy_type int;
    declare v_remark_info varchar(255);
    declare v_single_limit_occur_qty decimal(18,2);
    declare v_assigned_occur_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_source_stock_occur_end_qty decimal(18,2);
    declare v_single_limit_occur_end_qty decimal(18,2);
    declare v_assigned_occur_end_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);

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
    SET v_row_id = p_row_id;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_source_stock_occur_qty = 0;
    SET v_row_id_str = " ";
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_begin_qty = 0;
    SET v_source_stock_qty = 0;
    SET v_single_limit_qty = 0;
    SET v_assigned_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_total_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_total_open_posi_fee = 0;
    SET v_total_close_posi_fee = 0;
    SET v_out_order_releas_qty = 0;
    SET v_out_order_capt_qty = 0;
    SET v_out_strike_releas_qty = 0;
    SET v_out_strike_capt_qty = 0;
    SET v_over_night_trade_buy_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_over_night_strike_sell_qty = 0;
    SET v_diff_qty = 0;
    SET v_t0_buy_type = 0;
    SET v_remark_info = " ";
    SET v_single_limit_occur_qty = 0;
    SET v_assigned_occur_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_source_stock_occur_end_qty = 0;
    SET v_single_limit_occur_end_qty = 0;
    SET v_assigned_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* set @临时_操作员编号#=@操作员编号#; */
    set v_tmp_opor_no=v_opor_no;

    /* [获取表记录变量][交易证券_T0_操作员券源设置表][字段][字段变量][{记录序号} = @记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        begin_qty, source_stock_qty, single_limit_qty, assigned_qty, 
        trade_releas_qty, trade_capt_qty, strike_releas_qty, strike_capt_qty, 
        total_realize_pandl, over_night_pandl, sum_realize_pandl, total_open_posi_fee, 
        total_close_posi_fee, out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, 
        out_strike_capt_qty, over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, 
        diff_qty, t0_buy_type, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_exch_no, 
        v_begin_qty, v_source_stock_qty, v_single_limit_qty, v_assigned_qty, 
        v_trade_releas_qty, v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, 
        v_total_realize_pandl, v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, 
        v_total_close_posi_fee, v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, 
        v_out_strike_capt_qty, v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, 
        v_diff_qty, v_t0_buy_type, v_remark_info from db_tdsecu.tb_tdset0_opor_stock_source where row_id = v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.16.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @券源变动数量#=0-@券源数量#; */
    set v_source_stock_occur_qty=0-v_source_stock_qty;

    /* set @单笔限额变动数量#=0-@券源数量#; */
    set v_single_limit_occur_qty=0-v_source_stock_qty;

    /* set @已分配变动数量#=@券源变动数量#; */
    set v_assigned_occur_qty=v_source_stock_occur_qty;

    /* set @业务操作员编号#=@操作员编号#; */
    set v_busi_opor_no=v_opor_no;
    #[删除表记录][交易证券_T0_操作员券源设置表][{记录序号}=@记录序号#][3][concat("删除操作员券源设置失败,记录序号=",@记录序号#)]
    #不删除券源，将相应字段置0。Modify by wjp 20190409

    /* [更新表记录][交易证券_T0_操作员券源设置表][{期初数量} = 0,{券源数量} = 0,{单笔限额数量} = 0,{隔夜盈亏} = 0,{累计实现盈亏}=0 ][{记录序号}=@记录序号#][1][concat("删除操作员券源设置失败,记录序号=",@记录序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty = 0,source_stock_qty = 0,single_limit_qty = 0,over_night_pandl = 0,sum_realize_pandl=0  where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.16.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("删除操作员券源设置失败,记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("删除操作员券源设置失败,记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #非唯一索引锁更新，高并发会出现死锁。另外一个事务去更新。
    #[更新表记录][交易证券_T0_操作员券源设置表][{已分配数量} ={已分配数量} - @券源数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][1][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#]
    #[声明游标][交易证券_T0_操作员券源设置表][{记录序号}][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][cursor_stocksource]
    #[打开游标][@记录序号#][cursor_stocksource][loop_stocksource]
     #   [更新表记录][交易证券_T0_操作员券源设置表][{已分配数量} ={已分配数量} - @券源数量#][{记录序号}=@记录序号#][1][@记录序号#]
    #[关闭游标][cursor_stocksource]
    #[获取表记录变量][交易证券_T0_操作员券源设置表][{已分配数量}][@已分配数量#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][4][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#]

    /* set @变动后券源数量#=0; */
    set v_source_stock_occur_end_qty=0;

    /* set @变动后单笔限额数量#=0; */
    set v_single_limit_occur_end_qty=0;

    /* set @变动后已分配数量#=@已分配数量#-@券源数量#; */
    set v_assigned_occur_end_qty=v_assigned_qty-v_source_stock_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "删除操作员券源设置"; */
    set v_oper_remark_info = "删除操作员券源设置";

    /* set @操作员编号#=@临时_操作员编号#; */
    set v_opor_no=v_tmp_opor_no;

    /* [插入表记录][交易证券_T0_操作员券源设置流水表][字段][字段变量][5][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_opor_stock_source_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, oper_mac, 
        oper_ip_addr, oper_info, oper_way, oper_menu_no, 
        oper_func_code, init_date, co_no, busi_opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, source_stock_occur_qty, 
        source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, assigned_occur_qty, 
        assigned_occur_end_qty, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_oper_mac, 
        v_oper_ip_addr, v_oper_info, v_oper_way, v_oper_menu_no, 
        v_oper_func_code, v_init_date, v_co_no, v_busi_opor_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_source_stock_occur_qty, 
        v_source_stock_occur_end_qty, v_single_limit_occur_qty, v_single_limit_occur_end_qty, v_assigned_occur_qty, 
        v_assigned_occur_end_qty, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.16.5";
        SET v_error_info =  CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #返回供另外一个事务批量更新已分配数量

    /* set @券源变动数量#=@券源数量#; */
    set v_source_stock_occur_qty=v_source_stock_qty;

    /* [获取表记录变量][交易证券_T0_操作员券源设置表][GROUP_CONCAT({记录序号} SEPARATOR ";")][@记录序号串#][{交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][4][@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
    select GROUP_CONCAT(row_id SEPARATOR ";") into v_row_id_str from db_tdsecu.tb_tdset0_opor_stock_source where exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.16.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;


    /* set @记录序号串#=IFNULL(@记录序号串#," "); */
    set v_row_id_str=IFNULL(v_row_id_str," ");

    /* set @记录序号串#=concat(@记录序号串#,";"); */
    set v_row_id_str=concat(v_row_id_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_source_stock_occur_qty = v_source_stock_occur_qty;
    SET p_row_id_str = v_row_id_str;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_更新操作员券源限额设置状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_UpdateOporStockLimitStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_UpdateOporStockLimitStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_row_id bigint,
    IN p_limit_set_status varchar(2),
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
    declare v_row_id bigint;
    declare v_limit_set_status varchar(2);
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
    SET v_row_id = p_row_id;
    SET v_limit_set_status = p_limit_set_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_T0_操作员券源设置表][{限额设置状态} = @限额设置状态#][{记录序号}=@记录序号#][1][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, limit_set_status = v_limit_set_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.17.1";
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

# 原子_交易证券_T0_操作员券源限额设置持仓资金变化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_OporStockLimitPosiCapitalChange;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_OporStockLimitPosiCapitalChange(
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
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_stock_code_no int,
    IN p_trade_occur_qty decimal(18,2),
    IN p_strike_occur_qty decimal(18,2),
    IN p_total_realize_pandl decimal(18,4),
    IN p_total_open_posi_fee decimal(18,4),
    IN p_total_close_posi_fee decimal(18,4),
    IN p_busi_opor_no int,
    IN p_trade_occur_amt decimal(18,4),
    IN p_strike_occur_amt decimal(18,4),
    IN p_order_oper_way varchar(2),
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
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_stock_code_no int;
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_occur_qty decimal(18,2);
    declare v_total_realize_pandl decimal(18,4);
    declare v_total_open_posi_fee decimal(18,4);
    declare v_total_close_posi_fee decimal(18,4);
    declare v_busi_opor_no int;
    declare v_trade_occur_amt decimal(18,4);
    declare v_strike_occur_amt decimal(18,4);
    declare v_order_oper_way varchar(2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_assigned_qty decimal(18,2);
    declare v_trade_limit_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_out_order_releas_qty decimal(18,2);
    declare v_out_order_capt_qty decimal(18,2);
    declare v_out_strike_releas_qty decimal(18,2);
    declare v_out_strike_capt_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_begin_qty decimal(18,2);
    declare v_diff_qty decimal(18,2);
    declare v_t0_buy_type int;
    declare v_over_night_trade_buy_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_over_night_strike_sell_qty decimal(18,2);
    declare v_record_count int;
    declare v_lngsht_type int;
    declare v_posi_qty decimal(18,2);
    declare v_tmp_record_count int;
    declare v_tmp_posi_qty decimal(18,2);
    declare v_tmp_strike_occur_qty decimal(18,2);
    declare v_avail_closed_posi_qty decimal(18,2);
    declare v_tmp_trade_occur_qty decimal(18,2);
    declare v_tmp_trade_releas_qty decimal(18,2);
    declare v_tmp_trade_capt_qty decimal(18,2);
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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_strike_occur_qty = p_strike_occur_qty;
    SET v_total_realize_pandl = p_total_realize_pandl;
    SET v_total_open_posi_fee = p_total_open_posi_fee;
    SET v_total_close_posi_fee = p_total_close_posi_fee;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_trade_occur_amt = p_trade_occur_amt;
    SET v_strike_occur_amt = p_strike_occur_amt;
    SET v_order_oper_way = p_order_oper_way;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_source_stock_qty = 0;
    SET v_single_limit_qty = 0;
    SET v_assigned_qty = 0;
    SET v_trade_limit_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_out_order_releas_qty = 0;
    SET v_out_order_capt_qty = 0;
    SET v_out_strike_releas_qty = 0;
    SET v_out_strike_capt_qty = 0;
    SET v_remark_info = " ";
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_begin_qty = 0;
    SET v_diff_qty = 0;
    SET v_t0_buy_type = 0;
    SET v_over_night_trade_buy_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_over_night_strike_sell_qty = 0;
    SET v_record_count = 0;
    SET v_lngsht_type = 0;
    SET v_posi_qty = 0;
    SET v_tmp_record_count = 0;
    SET v_tmp_posi_qty = 0;
    SET v_tmp_strike_occur_qty = 0;
    SET v_avail_closed_posi_qty = 0;
    SET v_tmp_trade_occur_qty = 0;
    SET v_tmp_trade_releas_qty = 0;
    SET v_tmp_trade_capt_qty = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @券源数量# = 0; */
    set v_source_stock_qty = 0;

    /* set @单笔限额数量# = 0; */
    set v_single_limit_qty = 0;

    /* set @已分配数量# = 0; */
    set v_assigned_qty = 0;

    /* set @交易限额数量# = 0; */
    set v_trade_limit_qty = 0;

    /* set @交易释放数量# = 0; */
    set v_trade_releas_qty = 0;

    /* set @交易占用数量# = 0; */
    set v_trade_capt_qty = 0;

    /* set @成交释放数量# = 0; */
    set v_strike_releas_qty = 0;

    /* set @成交占用数量# = 0; */
    set v_strike_capt_qty = 0;

    /* set @外部交易释放数量# = 0; */
    set v_out_order_releas_qty = 0;

    /* set @外部交易占用数量# = 0; */
    set v_out_order_capt_qty = 0;

    /* set @外部成交释放数量# = 0; */
    set v_out_strike_releas_qty = 0;

    /* set @外部成交占用数量# = 0; */
    set v_out_strike_capt_qty = 0;

    /* set @备注信息# = " "; */
    set v_remark_info = " ";

    /* set @隔夜盈亏# = 0; */
    set v_over_night_pandl = 0;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @累计实现盈亏# = 0; */
    set v_sum_realize_pandl = 0;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @数量差额# = 0; */
    set v_diff_qty = 0;

    /* set @T0买入方式# = 《T0买入方式-普通买入》; */
    set v_t0_buy_type = 0;

    /* set @隔夜仓强平交易买入数量# = 0; */
    set v_over_night_trade_buy_qty = 0;

    /* set @隔夜仓强平交易卖出数量# = 0; */
    set v_over_night_trade_sell_qty = 0;

    /* set @隔夜仓强平成交卖出数量# = 0; */
    set v_over_night_strike_sell_qty = 0;

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #强平先取老仓的未平数量  Modify by wjp20190122

    /* if  @订单操作方式# = 《订单操作方式-增强交易平仓》 then */
    if  v_order_oper_way = "51" then

         /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
         if v_order_dir = 1  or v_order_dir = 5 then

               /* set @多空类型# = 《多空类型-空头》; */
               set v_lngsht_type = 2;

         /* elseif @订单方向# = 《订单方向-卖出》 then */
         elseif v_order_dir = 2 then

               /* set @多空类型# = 《多空类型-多头》; */
               set v_lngsht_type = 1;
         end if;

         /* [获取表记录变量语句][交易证券_T0_证券持仓明细表][COUNT(1),IFNULL(SUM({当前数量}-{平仓数量}),0)][@记录个数#,@持仓数量#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {多空类型}=@多空类型# and {持仓状态}=《持仓状态-未平仓》 and  {开仓日期}<@初始化日期#] */
         select COUNT(1),IFNULL(SUM(curr_qty-close_posi_qty),0) into v_record_count,v_posi_qty from db_tdsecu.tb_tdset0_stock_posi_detail where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and lngsht_type=v_lngsht_type and posi_status="1" and  open_posi_date<v_init_date limit 1;


         /* [获取表记录变量语句][交易证券_T0_证券持仓明细表][COUNT(1),IFNULL(SUM({当前数量}-{平仓数量}),0)][@临时_记录个数#,@临时_持仓数量#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号# and {多空类型}=@多空类型# and {持仓状态}=《持仓状态-未平仓》] */
         select COUNT(1),IFNULL(SUM(curr_qty-close_posi_qty),0) into v_tmp_record_count,v_tmp_posi_qty from db_tdsecu.tb_tdset0_stock_posi_detail where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no and lngsht_type=v_lngsht_type and posi_status="1" limit 1;

         #判断是下单接口 、处理成交回报、撤单接口 3种。

         /* if  @功能编码# ="tdsecuL.4.11"  and @成交变动数量# = 0 and @交易变动数量# > 0 then */
         if  v_func_code ="tdsecuL.4.11"  and v_strike_occur_qty = 0 and v_trade_occur_qty > 0 then

              /* [检查报错返回][@临时_记录个数#=0 or @临时_持仓数量#<@交易变动数量#][641]["增加交易强平不允许超过持仓数量！"] */
              if v_tmp_record_count=0 or v_tmp_posi_qty<v_trade_occur_qty then
                  
                  SET v_error_code = "tdsecuA.6.18.641";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT("增加交易强平不允许超过持仓数量！","#",v_mysql_message);
                  else
                      SET v_error_info = "增加交易强平不允许超过持仓数量！";
                  end if;
                  leave label_pro;
              end if;

              #强平分三种情景：1、强平有老仓有今仓，2、强平都是老仓，3、强平都是今仓。  @持仓数量#——老仓，@临时_持仓数量#——包含今仓、老仓

              /* set @临时_成交变动数量# = 0; */
              set v_tmp_strike_occur_qty = 0;

             /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
             if v_order_dir = 1  or v_order_dir = 5 then

                   /* [不报错锁定获取表记录变量][交易证券_T0_操作员券源设置表][IFNULL({隔夜仓强平交易买入数量},0)][@隔夜仓强平交易买入数量#][{操作员编号}=@操作员编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
                   select IFNULL(over_night_trade_buy_qty,0) into v_over_night_trade_buy_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_opor_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;

                   #可平数量 指 可平的老仓数量

                   /* set @可平数量# = @持仓数量# - @隔夜仓强平交易买入数量#; */
                   set v_avail_closed_posi_qty = v_posi_qty - v_over_night_trade_buy_qty;

             /* elseif @订单方向# = 《订单方向-卖出》 then */
             elseif v_order_dir = 2 then

                   /* [不报错锁定获取表记录变量][交易证券_T0_操作员券源设置表][IFNULL({隔夜仓强平交易卖出数量},0)][@隔夜仓强平交易卖出数量#][{操作员编号}=@操作员编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
                   select IFNULL(over_night_trade_sell_qty,0) into v_over_night_trade_sell_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_opor_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;


                   /* set @可平数量# = @持仓数量# - @隔夜仓强平交易卖出数量#; */
                   set v_avail_closed_posi_qty = v_posi_qty - v_over_night_trade_sell_qty;
             end if;

                   /* if @交易变动数量# > @可平数量# and @可平数量#>0  then */
                   if v_trade_occur_qty > v_avail_closed_posi_qty and v_avail_closed_posi_qty>0  then

                        /* set @临时_交易变动数量# = @可平数量#; */
                        set v_tmp_trade_occur_qty = v_avail_closed_posi_qty;

                        /* set @交易变动数量# = @交易变动数量# - @可平数量#; */
                        set v_trade_occur_qty = v_trade_occur_qty - v_avail_closed_posi_qty;

                  /* elseif (@交易变动数量#<@可平数量# or @交易变动数量#=@可平数量#) and @可平数量#>0  then */
                  elseif (v_trade_occur_qty<v_avail_closed_posi_qty or v_trade_occur_qty=v_avail_closed_posi_qty) and v_avail_closed_posi_qty>0  then

                        /* set @临时_交易变动数量# = @交易变动数量#; */
                        set v_tmp_trade_occur_qty = v_trade_occur_qty;

                        /* set @交易变动数量# = 0; */
                        set v_trade_occur_qty = 0;

                  /* elseif @临时_持仓数量#>0 and @可平数量#=0  then */
                  elseif v_tmp_posi_qty>0 and v_avail_closed_posi_qty=0  then

                        /* set @临时_交易变动数量# = 0; */
                        set v_tmp_trade_occur_qty = 0;
                  end if;
         #成交时，交易变动数量 小于 0

         /* elseif (@功能编码# ="tdsecuL.5.21" or @功能编码# ="tdsecuL.5.41")  and @成交变动数量# >0 then */
         elseif (v_func_code ="tdsecuL.5.21" or v_func_code ="tdsecuL.5.41")  and v_strike_occur_qty >0 then
              #根据强平挂单，判断成交变动数量 冲回 diff 的值。

             /* set @临时_交易变动数量# = 0; */
             set v_tmp_trade_occur_qty = 0;

             /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
             if v_order_dir = 1  or v_order_dir = 5 then

                   /* [不报错锁定获取表记录变量][交易证券_T0_操作员券源设置表][IFNULL({隔夜仓强平交易买入数量},0)][@隔夜仓强平交易买入数量#][{操作员编号}=@操作员编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
                   select IFNULL(over_night_trade_buy_qty,0) into v_over_night_trade_buy_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_opor_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;


                   /* if @隔夜仓强平交易买入数量# = 0 then */
                   if v_over_night_trade_buy_qty = 0 then

                        /* set @临时_成交变动数量# = 0; */
                        set v_tmp_strike_occur_qty = 0;

                   /* elseif @隔夜仓强平交易买入数量#>0 and (@隔夜仓强平交易买入数量#>@成交变动数量# or @隔夜仓强平交易买入数量#=@成交变动数量#)  then */
                   elseif v_over_night_trade_buy_qty>0 and (v_over_night_trade_buy_qty>v_strike_occur_qty or v_over_night_trade_buy_qty=v_strike_occur_qty)  then

                        /* set @临时_成交变动数量# = @成交变动数量#; */
                        set v_tmp_strike_occur_qty = v_strike_occur_qty;
                        #强平只有单边。set @隔夜仓强平成交卖出数量# = @临时_成交变动数量#;

                        /* set @交易变动数量# = 0; */
                        set v_trade_occur_qty = 0;

                        /* set @成交变动数量# = 0; */
                        set v_strike_occur_qty = 0;

                   /* elseif @隔夜仓强平交易买入数量#>0 and @隔夜仓强平交易买入数量#<@成交变动数量# then */
                   elseif v_over_night_trade_buy_qty>0 and v_over_night_trade_buy_qty<v_strike_occur_qty then

                        /* set @临时_成交变动数量# = @隔夜仓强平交易买入数量#; */
                        set v_tmp_strike_occur_qty = v_over_night_trade_buy_qty;
                        #set @隔夜仓强平成交卖出数量# = @临时_成交变动数量#;

                        /* set @成交变动数量# = @成交变动数量#- @隔夜仓强平交易买入数量#; */
                        set v_strike_occur_qty = v_strike_occur_qty- v_over_night_trade_buy_qty;

                        /* set @交易变动数量# = -@成交变动数量#; */
                        set v_trade_occur_qty = -v_strike_occur_qty;
                   end if;

             /* elseif @订单方向# = 《订单方向-卖出》 then */
             elseif v_order_dir = 2 then

                   /* [不报错锁定获取表记录变量][交易证券_T0_操作员券源设置表][IFNULL({隔夜仓强平交易卖出数量},0)][@隔夜仓强平交易卖出数量#][{操作员编号}=@操作员编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
                   select IFNULL(over_night_trade_sell_qty,0) into v_over_night_trade_sell_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_opor_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;


                   /* if @隔夜仓强平交易卖出数量# = 0 then */
                   if v_over_night_trade_sell_qty = 0 then

                        /* set @临时_成交变动数量# = 0; */
                        set v_tmp_strike_occur_qty = 0;

                   /* elseif @隔夜仓强平交易卖出数量#>0 and (@隔夜仓强平交易卖出数量#>@成交变动数量# or @隔夜仓强平交易卖出数量#=@成交变动数量#)  then */
                   elseif v_over_night_trade_sell_qty>0 and (v_over_night_trade_sell_qty>v_strike_occur_qty or v_over_night_trade_sell_qty=v_strike_occur_qty)  then

                        /* set @临时_成交变动数量# = @成交变动数量#; */
                        set v_tmp_strike_occur_qty = v_strike_occur_qty;

                        /* set @隔夜仓强平成交卖出数量# = @临时_成交变动数量#; */
                        set v_over_night_strike_sell_qty = v_tmp_strike_occur_qty;

                        /* set @交易变动数量# = 0; */
                        set v_trade_occur_qty = 0;

                        /* set @成交变动数量# = 0; */
                        set v_strike_occur_qty = 0;

                   /* elseif @隔夜仓强平交易卖出数量#>0 and @隔夜仓强平交易卖出数量#<@成交变动数量# then */
                   elseif v_over_night_trade_sell_qty>0 and v_over_night_trade_sell_qty<v_strike_occur_qty then

                        /* set @临时_成交变动数量# = @隔夜仓强平交易卖出数量#; */
                        set v_tmp_strike_occur_qty = v_over_night_trade_sell_qty;

                        /* set @隔夜仓强平成交卖出数量# = @临时_成交变动数量#; */
                        set v_over_night_strike_sell_qty = v_tmp_strike_occur_qty;

                        /* set @成交变动数量# = @成交变动数量#- @隔夜仓强平交易卖出数量#; */
                        set v_strike_occur_qty = v_strike_occur_qty- v_over_night_trade_sell_qty;

                        /* set @交易变动数量# = -@成交变动数量#; */
                        set v_trade_occur_qty = -v_strike_occur_qty;
                   end if;
             end if;
         end if;
    end if;

    /* if  @订单操作方式# = 《订单操作方式-增强交易平仓》 or @订单操作方式# = 《订单操作方式-增强交易》  then */
    if  v_order_oper_way = "51" or v_order_oper_way = "14"  then
         #撤单时，交易变动数量 小于0  正常下单和强平撤单一样处理。

         /* if (@功能编码#="tdsecuL.4.12" or @功能编码#="tdsecuL.5.11") and @交易变动数量#<0 then */
         if (v_func_code="tdsecuL.4.12" or v_func_code="tdsecuL.5.11") and v_trade_occur_qty<0 then

             /* set @临时_成交变动数量# = 0; */
             set v_tmp_strike_occur_qty = 0;

             /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
             if v_order_dir = 1  or v_order_dir = 5 then

                   /* [不报错锁定获取表记录变量][交易证券_T0_操作员券源设置表][IFNULL({隔夜仓强平交易买入数量},0),IFNULL({交易释放数量},0)][@隔夜仓强平交易买入数量#,@临时_交易释放数量#][{操作员编号}=@操作员编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
                   select IFNULL(over_night_trade_buy_qty,0),IFNULL(trade_releas_qty,0) into v_over_night_trade_buy_qty,v_tmp_trade_releas_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_opor_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;


                   /* if ABS(@交易变动数量#) <@临时_交易释放数量# or ABS(@交易变动数量#) =@临时_交易释放数量# then */
                   if ABS(v_trade_occur_qty) <v_tmp_trade_releas_qty or ABS(v_trade_occur_qty) =v_tmp_trade_releas_qty then

                        /* set @临时_交易变动数量# = 0; */
                        set v_tmp_trade_occur_qty = 0;

                   /* elseif ABS(@交易变动数量#) > @临时_交易释放数量# and @临时_交易释放数量#>0  and @隔夜仓强平交易买入数量#>0 then */
                   elseif ABS(v_trade_occur_qty) > v_tmp_trade_releas_qty and v_tmp_trade_releas_qty>0  and v_over_night_trade_buy_qty>0 then

                        /* set @临时_交易变动数量# = -(ABS(@交易变动数量#) - @临时_交易释放数量#); */
                        set v_tmp_trade_occur_qty = -(ABS(v_trade_occur_qty) - v_tmp_trade_releas_qty);

                        /* set @交易变动数量# = -@临时_交易释放数量#; */
                        set v_trade_occur_qty = -v_tmp_trade_releas_qty;

                   /* elseif  @临时_交易释放数量#=0 and @隔夜仓强平交易买入数量#>0 then */
                   elseif  v_tmp_trade_releas_qty=0 and v_over_night_trade_buy_qty>0 then

                        /* set @临时_交易变动数量# = @交易变动数量#; */
                        set v_tmp_trade_occur_qty = v_trade_occur_qty;

                        /* set @交易变动数量# = 0; */
                        set v_trade_occur_qty = 0;
                   end if;

             /* elseif @订单方向# = 《订单方向-卖出》 then */
             elseif v_order_dir = 2 then

                   /* [不报错锁定获取表记录变量][交易证券_T0_操作员券源设置表][IFNULL({隔夜仓强平交易卖出数量},0),IFNULL({交易占用数量},0)][@隔夜仓强平交易卖出数量#,@临时_交易占用数量#][{操作员编号}=@操作员编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#] */
                   select IFNULL(over_night_trade_sell_qty,0),IFNULL(trade_capt_qty,0) into v_over_night_trade_sell_qty,v_tmp_trade_capt_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_opor_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;


                   /* if ABS(@交易变动数量#) <@临时_交易占用数量# or ABS(@交易变动数量#) =@临时_交易占用数量# then */
                   if ABS(v_trade_occur_qty) <v_tmp_trade_capt_qty or ABS(v_trade_occur_qty) =v_tmp_trade_capt_qty then

                        /* set @临时_交易变动数量# = 0; */
                        set v_tmp_trade_occur_qty = 0;

                   /* elseif ABS(@交易变动数量#) > @临时_交易占用数量# and @临时_交易占用数量#>0  and @隔夜仓强平交易卖出数量#>0 then */
                   elseif ABS(v_trade_occur_qty) > v_tmp_trade_capt_qty and v_tmp_trade_capt_qty>0  and v_over_night_trade_sell_qty>0 then

                        /* set @临时_交易变动数量# = -(ABS(@交易变动数量#) - @临时_交易占用数量#); */
                        set v_tmp_trade_occur_qty = -(ABS(v_trade_occur_qty) - v_tmp_trade_capt_qty);

                        /* set @交易变动数量# = -@临时_交易占用数量#; */
                        set v_trade_occur_qty = -v_tmp_trade_capt_qty;

                   /* elseif  @临时_交易占用数量#=0 and @隔夜仓强平交易卖出数量#>0 then */
                   elseif  v_tmp_trade_capt_qty=0 and v_over_night_trade_sell_qty>0 then

                        /* set @临时_交易变动数量# = @交易变动数量#; */
                        set v_tmp_trade_occur_qty = v_trade_occur_qty;

                        /* set @交易变动数量# = 0; */
                        set v_trade_occur_qty = 0;
                   end if;
             end if;
         end if;
    end if;

    /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
    if v_order_dir = 1  or v_order_dir = 5 then
       #强平分三种情景：1、强平都是老仓，2、强平都是今仓，3、强平有老仓有今仓。  平今仓和正常交易一致。

       /* if @订单操作方式# = 《订单操作方式-增强交易平仓》or (@订单操作方式# = 《订单操作方式-增强交易》and  (@功能编码#="tdsecuL.4.12" or @功能编码#="tdsecuL.5.11") )  then */
       if v_order_oper_way = "51"or (v_order_oper_way = "14"and  (v_func_code="tdsecuL.4.12" or v_func_code="tdsecuL.5.11") )  then

           /* [插入重复更新][交易证券_T0_操作员券源设置表][字段][字段变量][{隔夜仓强平交易买入数量}={隔夜仓强平交易买入数量}+@临时_交易变动数量#-@临时_成交变动数量#,{隔夜仓强平成交卖出数量}={隔夜仓强平成交卖出数量}+@隔夜仓强平成交卖出数量#,{数量差额}={数量差额}+ @临时_成交变动数量#,{交易释放数量}={交易释放数量}+@交易变动数量#,{成交释放数量}={成交释放数量}+@成交变动数量#,{总实现盈亏}={总实现盈亏}+@总实现盈亏#,{总开仓费用}={总开仓费用}+@总开仓费用#,{总平仓费用}={总平仓费用}+@总平仓费用#,{累计实现盈亏}={累计实现盈亏}+@总实现盈亏#][1][@机构编号#,@操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_tdsecu.tb_tdset0_opor_stock_source (
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
           values(
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_co_no, v_opor_no, 
               v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
               v_stock_code_no, v_stock_code, v_exch_no, v_begin_qty, 
               v_source_stock_qty, v_single_limit_qty, v_assigned_qty, v_trade_releas_qty, 
               v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, v_total_realize_pandl, 
               v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, v_total_close_posi_fee, 
               v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, v_out_strike_capt_qty, 
               v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, v_diff_qty, 
               v_t0_buy_type, v_remark_info) 
           ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, over_night_trade_buy_qty=over_night_trade_buy_qty+v_tmp_trade_occur_qty-v_tmp_strike_occur_qty,over_night_strike_sell_qty=over_night_strike_sell_qty+v_over_night_strike_sell_qty,diff_qty=diff_qty+ v_tmp_strike_occur_qty,trade_releas_qty=trade_releas_qty+v_trade_occur_qty,strike_releas_qty=strike_releas_qty+v_strike_occur_qty,total_realize_pandl=total_realize_pandl+v_total_realize_pandl,total_open_posi_fee=total_open_posi_fee+v_total_open_posi_fee,total_close_posi_fee=total_close_posi_fee+v_total_close_posi_fee,sum_realize_pandl=sum_realize_pandl+v_total_realize_pandl;
           if v_error_code = "1" then
                       
               SET v_error_code = "tdsecuA.6.18.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
               end if;
               leave label_pro;
           end if;

       else

           /* [插入重复更新][交易证券_T0_操作员券源设置表][字段][字段变量][{交易释放数量}={交易释放数量}+@交易变动数量#,{成交释放数量}={成交释放数量}+@成交变动数量#,{总实现盈亏}={总实现盈亏}+@总实现盈亏#,{总开仓费用}={总开仓费用}+@总开仓费用#,{总平仓费用}={总平仓费用}+@总平仓费用#,{累计实现盈亏}={累计实现盈亏}+@总实现盈亏#][1][@机构编号#,@操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
           set v_create_date = date_format(curdate(),'%Y%m%d');
           set v_create_time = date_format(curtime(),'%H%i%s');
           set v_update_date = v_create_date;
           set v_update_time = v_create_time;
           set v_update_times = 1;
           insert into db_tdsecu.tb_tdset0_opor_stock_source (
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
           values(
               v_create_date, v_create_time, v_update_date, 
               v_update_time, v_update_times, v_co_no, v_opor_no, 
               v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
               v_stock_code_no, v_stock_code, v_exch_no, v_begin_qty, 
               v_source_stock_qty, v_single_limit_qty, v_assigned_qty, v_trade_releas_qty, 
               v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, v_total_realize_pandl, 
               v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, v_total_close_posi_fee, 
               v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, v_out_strike_capt_qty, 
               v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, v_diff_qty, 
               v_t0_buy_type, v_remark_info) 
           ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_releas_qty=trade_releas_qty+v_trade_occur_qty,strike_releas_qty=strike_releas_qty+v_strike_occur_qty,total_realize_pandl=total_realize_pandl+v_total_realize_pandl,total_open_posi_fee=total_open_posi_fee+v_total_open_posi_fee,total_close_posi_fee=total_close_posi_fee+v_total_close_posi_fee,sum_realize_pandl=sum_realize_pandl+v_total_realize_pandl;
           if v_error_code = "1" then
                       
               SET v_error_code = "tdsecuA.6.18.1";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
               end if;
               leave label_pro;
           end if;

      end if;

      /* [更新表记录][交易证券_T0_操作员阈值设置表][{交易占用金额}={交易占用金额}+@交易变动金额#,{成交占用金额}={成交占用金额}+@成交变动金额#,{累计实现盈亏}={累计实现盈亏}+@总实现盈亏#][{操作员编号}=@操作员编号#][1][@操作员编号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_capt_amt=trade_capt_amt+v_trade_occur_amt,strike_capt_amt=strike_capt_amt+v_strike_occur_amt,sum_realize_pandl=sum_realize_pandl+v_total_realize_pandl where opor_no=v_opor_no;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdsecuA.6.18.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("操作员编号=",v_opor_no);
          end if;
          leave label_pro;
      end if;


      /* [获取表记录数量][交易证券_T0_交易组业务资金表][@记录个数#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}="CNY"] */
      select count(1) into v_record_count from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type="CNY";


      /* if @记录个数# > 0 then */
      if v_record_count > 0 then

          /* [更新表记录][交易证券_T0_交易组业务资金表][{交易占用金额}={交易占用金额}+@交易变动金额#,{成交占用金额}={成交占用金额}+@成交变动金额#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}="CNY"][1][@操作员编号#,@交易组编号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_capt_amt=trade_capt_amt+v_trade_occur_amt,strike_capt_amt=strike_capt_amt+v_strike_occur_amt where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type="CNY";
          if v_error_code = "1" then
                      
              SET v_error_code = "tdsecuA.6.18.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no);
              end if;
              leave label_pro;
          end if;

      end if;

    /* elseif @订单方向# = 《订单方向-卖出》 or @订单方向# = 《订单方向-卖券还款》 then */
    elseif v_order_dir = 2 or v_order_dir = 7 then

       /* if @订单操作方式# = 《订单操作方式-增强交易平仓》or (@订单操作方式# = 《订单操作方式-增强交易》and  (@功能编码#="tdsecuL.4.12" or @功能编码#="tdsecuL.5.11") )  then */
       if v_order_oper_way = "51"or (v_order_oper_way = "14"and  (v_func_code="tdsecuL.4.12" or v_func_code="tdsecuL.5.11") )  then

            /* [插入重复更新][交易证券_T0_操作员券源设置表][字段][字段变量][{隔夜仓强平交易卖出数量}={隔夜仓强平交易卖出数量}+@临时_交易变动数量#-@临时_成交变动数量#,{隔夜仓强平成交卖出数量}={隔夜仓强平成交卖出数量}+@隔夜仓强平成交卖出数量#,{数量差额}={数量差额}- @临时_成交变动数量#,{交易占用数量}={交易占用数量}+@交易变动数量#,{成交占用数量}={成交占用数量}+@成交变动数量#,{总实现盈亏}={总实现盈亏}+@总实现盈亏#,{总开仓费用}={总开仓费用}+@总开仓费用#,{总平仓费用}={总平仓费用}+@总平仓费用#,{累计实现盈亏}={累计实现盈亏}+@总实现盈亏#][1][@机构编号#,@操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_tdsecu.tb_tdset0_opor_stock_source (
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
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_opor_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
                v_stock_code_no, v_stock_code, v_exch_no, v_begin_qty, 
                v_source_stock_qty, v_single_limit_qty, v_assigned_qty, v_trade_releas_qty, 
                v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, v_total_realize_pandl, 
                v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, v_total_close_posi_fee, 
                v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, v_out_strike_capt_qty, 
                v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, v_diff_qty, 
                v_t0_buy_type, v_remark_info) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, over_night_trade_sell_qty=over_night_trade_sell_qty+v_tmp_trade_occur_qty-v_tmp_strike_occur_qty,over_night_strike_sell_qty=over_night_strike_sell_qty+v_over_night_strike_sell_qty,diff_qty=diff_qty- v_tmp_strike_occur_qty,trade_capt_qty=trade_capt_qty+v_trade_occur_qty,strike_capt_qty=strike_capt_qty+v_strike_occur_qty,total_realize_pandl=total_realize_pandl+v_total_realize_pandl,total_open_posi_fee=total_open_posi_fee+v_total_open_posi_fee,total_close_posi_fee=total_close_posi_fee+v_total_close_posi_fee,sum_realize_pandl=sum_realize_pandl+v_total_realize_pandl;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.18.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

       else

            /* [插入重复更新][交易证券_T0_操作员券源设置表][字段][字段变量][{交易占用数量}={交易占用数量}+@交易变动数量#,{成交占用数量}={成交占用数量}+@成交变动数量#,{总实现盈亏}={总实现盈亏}+@总实现盈亏#,{总开仓费用}={总开仓费用}+@总开仓费用#,{总平仓费用}={总平仓费用}+@总平仓费用#,{累计实现盈亏}={累计实现盈亏}+@总实现盈亏#][1][@机构编号#,@操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_tdsecu.tb_tdset0_opor_stock_source (
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
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_opor_no, 
                v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
                v_stock_code_no, v_stock_code, v_exch_no, v_begin_qty, 
                v_source_stock_qty, v_single_limit_qty, v_assigned_qty, v_trade_releas_qty, 
                v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, v_total_realize_pandl, 
                v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, v_total_close_posi_fee, 
                v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, v_out_strike_capt_qty, 
                v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, v_diff_qty, 
                v_t0_buy_type, v_remark_info) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, trade_capt_qty=trade_capt_qty+v_trade_occur_qty,strike_capt_qty=strike_capt_qty+v_strike_occur_qty,total_realize_pandl=total_realize_pandl+v_total_realize_pandl,total_open_posi_fee=total_open_posi_fee+v_total_open_posi_fee,total_close_posi_fee=total_close_posi_fee+v_total_close_posi_fee,sum_realize_pandl=sum_realize_pandl+v_total_realize_pandl;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.18.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;

      end if;

      /* [更新表记录][交易证券_T0_操作员阈值设置表][{交易释放金额}={交易释放金额}+@交易变动金额#,{成交释放金额}={成交释放金额}+@成交变动金额#,{累计实现盈亏}={累计实现盈亏}+@总实现盈亏#][{操作员编号}=@操作员编号#][1][@操作员编号#] */
      set v_update_date = date_format(curdate(),'%Y%m%d');
      set v_update_time = date_format(curtime(),'%H%i%s');
      update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_releas_amt=trade_releas_amt+v_trade_occur_amt,strike_releas_amt=strike_releas_amt+v_strike_occur_amt,sum_realize_pandl=sum_realize_pandl+v_total_realize_pandl where opor_no=v_opor_no;
      if v_error_code = "1" then
                  
          SET v_error_code = "tdsecuA.6.18.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
          else
              SET v_error_info = concat("操作员编号=",v_opor_no);
          end if;
          leave label_pro;
      end if;

    #modify by wjp 20181026

      /* [获取表记录数量][交易证券_T0_交易组业务资金表][@记录个数#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}="CNY"] */
      select count(1) into v_record_count from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type="CNY";


      /* if @记录个数# > 0 then */
      if v_record_count > 0 then

          /* [更新表记录][交易证券_T0_交易组业务资金表][{交易释放金额}={交易释放金额}+@交易变动金额#,{成交释放金额}={成交释放金额}+@成交变动金额#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}="CNY" ][1][@操作员编号#,@交易组编号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, trade_releas_amt=trade_releas_amt+v_trade_occur_amt,strike_releas_amt=strike_releas_amt+v_strike_occur_amt where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type="CNY" ;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdsecuA.6.18.1";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no);
              end if;
              leave label_pro;
          end if;

      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_体外交易操作员券源限额设置持仓变化
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_OutOporStockLimitPosiChange;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_OutOporStockLimitPosiChange(
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
    IN p_stock_acco_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_type int,
    IN p_order_dir int,
    IN p_stock_code varchar(6),
    IN p_stock_code_no int,
    IN p_trade_occur_qty decimal(18,2),
    IN p_strike_occur_qty decimal(18,2),
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
    declare v_stock_acco_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_type int;
    declare v_order_dir int;
    declare v_stock_code varchar(6);
    declare v_stock_code_no int;
    declare v_trade_occur_qty decimal(18,2);
    declare v_strike_occur_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_limit_set_status varchar(2);
    declare v_limit_set_type int;
    declare v_record_count int;
    declare v_trade_releas_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_type = p_stock_type;
    SET v_order_dir = p_order_dir;
    SET v_stock_code = p_stock_code;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_strike_occur_qty = p_strike_occur_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_limit_set_status = " ";
    SET v_limit_set_type = 0;
    SET v_record_count = 0;
    SET v_trade_releas_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_trade_capt_qty = 0;
    SET v_strike_capt_qty = 0;

    
    label_pro:BEGIN
    

    /* set @限额设置状态# = 《限额设置状态-启用》; */
    set v_limit_set_status = "1";

    /* set @限额设置类型# = 《限额设置类型-内部》; */
    set v_limit_set_type = 2;

    /* [获取表记录数量][交易证券_T0_操作员券源设置表][@记录个数#][{机构编号}=@机构编号# and {操作员编号}=@操作员编号# and {产品编号} = @产品编号# and {交易组编号}=@交易组编号# and {证券代码编号}=@证券代码编号# and {股东代码编号}=@股东代码编号# and {市场编号}=@市场编号# and {资产账户编号}=@资产账户编号#] */
    select count(1) into v_record_count from db_tdsecu.tb_tdset0_opor_stock_source where co_no=v_co_no and opor_no=v_opor_no and pd_no = v_pd_no and exch_group_no=v_exch_group_no and stock_code_no=v_stock_code_no and stock_acco_no=v_stock_acco_no and exch_no=v_exch_no and asset_acco_no=v_asset_acco_no;


    /* if @记录个数# = 1 then */
    if v_record_count = 1 then

      /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
      if v_order_dir = 1  or v_order_dir = 5 then

          /* set @交易释放数量# = @交易变动数量#; */
          set v_trade_releas_qty = v_trade_occur_qty;

          /* set @成交释放数量# = @成交变动数量#; */
          set v_strike_releas_qty = v_strike_occur_qty;

          /* [更新表记录][交易证券_T0_操作员券源设置表][{外部交易释放数量}={外部交易释放数量}+@交易变动数量#,{外部成交释放数量}={外部成交释放数量}+@成交变动数量#][{机构编号}=@机构编号# and {操作员编号}=@操作员编号# and {产品编号} = @产品编号#  and {证券代码编号}=@证券代码编号# and {股东代码编号}=@股东代码编号# and {市场编号}=@市场编号# and {资产账户编号}=@资产账户编号#][23][@机构编号#,@操作员编号#,@产品编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@市场编号#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, out_order_releas_qty=out_order_releas_qty+v_trade_occur_qty,out_strike_releas_qty=out_strike_releas_qty+v_strike_occur_qty where co_no=v_co_no and opor_no=v_opor_no and pd_no = v_pd_no  and stock_code_no=v_stock_code_no and stock_acco_no=v_stock_acco_no and exch_no=v_exch_no and asset_acco_no=v_asset_acco_no;
          if v_error_code = "1" then
                      
              SET v_error_code = "tdsecuA.6.19.23";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no);
              end if;
              leave label_pro;
          end if;


      /* elseif @订单方向# = 《订单方向-卖出》 then */
      elseif v_order_dir = 2 then

          /* set @交易占用数量# = @交易变动数量#; */
          set v_trade_capt_qty = v_trade_occur_qty;

          /* set @成交占用数量# = @成交变动数量#; */
          set v_strike_capt_qty = v_strike_occur_qty;

         /* [更新表记录][交易证券_T0_操作员券源设置表][{外部交易占用数量}={外部交易占用数量}+@交易变动数量#,{外部成交占用数量}={外部成交占用数量}+@成交变动数量#][{机构编号}=@机构编号# and {操作员编号}=@操作员编号# and {产品编号} = @产品编号#  and {证券代码编号}=@证券代码编号# and {股东代码编号}=@股东代码编号# and {市场编号}=@市场编号# and {资产账户编号}=@资产账户编号#][23][@机构编号#,@操作员编号#,@产品编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@市场编号#] */
         set v_update_date = date_format(curdate(),'%Y%m%d');
         set v_update_time = date_format(curtime(),'%H%i%s');
         update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, out_order_capt_qty=out_order_capt_qty+v_trade_occur_qty,out_strike_capt_qty=out_strike_capt_qty+v_strike_occur_qty where co_no=v_co_no and opor_no=v_opor_no and pd_no = v_pd_no  and stock_code_no=v_stock_code_no and stock_acco_no=v_stock_acco_no and exch_no=v_exch_no and asset_acco_no=v_asset_acco_no;
         if v_error_code = "1" then
                     
             SET v_error_code = "tdsecuA.6.19.23";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
             else
                 SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no);
             end if;
             leave label_pro;
         end if;

      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员参数设置查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporParamSet;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporParamSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_config_no bigint,
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
    declare v_config_no bigint;
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
    SET v_co_no = p_co_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* SET @指定行数# = -1; */
    SET v_row_count = -1;

    /* [获取表记录][交易证券_T0_操作员参数设置表][字段][{机构编号} = @机构编号# and ((@查询操作员编号# = 0) or ({操作员编号} = @查询操作员编号#))  and (@配置编号# = 0 or  {配置编号} = @配置编号#)][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, config_no, config_value, config_name, 
        config_memo from db_tdsecu.tb_tdset0_opor_param_set where co_no = v_co_no and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no))  and (v_config_no = 0 or  config_no = v_config_no);
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, config_no, config_value, config_name, 
        config_memo from db_tdsecu.tb_tdset0_opor_param_set where co_no = v_co_no and ((v_query_opor_no = 0) or (opor_no = v_query_opor_no))  and (v_config_no = 0 or  config_no = v_config_no) limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员参数设置更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_UpdateOporParamSet;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_UpdateOporParamSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_config_no bigint,
    IN p_config_value varchar(2048),
    IN p_config_name varchar(64),
    IN p_config_memo varchar(255),
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
    declare v_busi_opor_no int;
    declare v_config_no bigint;
    declare v_config_value varchar(2048);
    declare v_config_name varchar(64);
    declare v_config_memo varchar(255);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_config_no = p_config_no;
    SET v_config_value = p_config_value;
    SET v_config_name = p_config_name;
    SET v_config_memo = p_config_memo;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][交易证券_T0_操作员参数设置表][字段][字段变量][{配置值}=@配置值# , {配置名称}=@配置名称#,{配置说明}=@配置说明#][1][@机构编号#,@业务操作员编号#,@配置编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_opor_param_set (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        config_no, config_value, config_name, config_memo) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_config_no, v_config_value, v_config_name, v_config_memo) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, config_value=v_config_value , config_name=v_config_name,config_memo=v_config_memo;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.21.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","配置编号=",v_config_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","配置编号=",v_config_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_删除操作员参数设置
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_DeleteOporParamSet;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_DeleteOporParamSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_config_no bigint,
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
    declare v_busi_opor_no int;
    declare v_config_no bigint;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_config_no = p_config_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [删除表记录][交易证券_T0_操作员参数设置表][{机构编号}=@机构编号# and {操作员编号}=@业务操作员编号# and {配置编号}=@配置编号#][1][@机构编号#,@业务操作员编号#,@配置编号#] */
    delete from db_tdsecu.tb_tdset0_opor_param_set 
        where co_no=v_co_no and opor_no=v_busi_opor_no and config_no=v_config_no;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.6.22.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","配置编号=",v_config_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","业务操作员编号=",v_busi_opor_no,",","配置编号=",v_config_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_获取操作员阈值信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_GetOporTsholdSet;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_GetOporTsholdSet(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_curr_amt decimal(18,4),
    OUT p_frozen_amt decimal(18,4),
    OUT p_opor_warn_tshold decimal(18,4),
    OUT p_opor_stop_tshold decimal(18,4),
    OUT p_order_limit_time int,
    OUT p_per_secu_posi_ratio decimal(18,12),
    OUT p_posi_limit_time int,
    OUT p_order_ctrl_qty decimal(18,2),
    OUT p_order_ctrl_amt decimal(18,4),
    OUT p_stock_warn_ratio decimal(18,12),
    OUT p_stock_stop_ratio decimal(18,12),
    OUT p_stock_warn_amt decimal(18,4),
    OUT p_stock_stop_amt decimal(18,4),
    OUT p_trig_oper_type int,
    OUT p_open_close_permission int,
    OUT p_risk_oper int,
    OUT p_fee_calc_type int,
    OUT p_permit_margin_trade int,
    OUT p_buy_fee_ratio decimal(18,12),
    OUT p_sell_fee_ratio decimal(18,12),
    OUT p_buy_min_fee decimal(18,4),
    OUT p_sell_min_fee decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_update_times int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_begin_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_amt_diff decimal(18,4);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_order_limit_time = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_posi_limit_time = 5;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_trig_oper_type = 0;
    SET v_open_close_permission = 0;
    SET v_risk_oper = 0;
    SET v_fee_calc_type = 0;
    SET v_permit_margin_trade = 0;
    SET v_buy_fee_ratio = 0;
    SET v_sell_fee_ratio = 0;
    SET v_buy_min_fee = 0;
    SET v_sell_min_fee = 0;
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_begin_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_sum_realize_pandl = 0;
    SET v_amt_diff = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][字段][字段变量][{操作员编号}=@业务操作员编号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, begin_amt, curr_amt, frozen_amt, 
        opor_warn_tshold, opor_stop_tshold, order_limit_time, per_secu_posi_ratio, 
        posi_limit_time, order_ctrl_qty, order_ctrl_amt, stock_warn_ratio, 
        stock_stop_ratio, stock_warn_amt, stock_stop_amt, trig_oper_type, 
        open_close_permission, risk_oper, fee_calc_type, permit_margin_trade, 
        buy_fee_ratio, sell_fee_ratio, buy_min_fee, sell_min_fee, 
        trade_capt_amt, trade_releas_amt, strike_capt_amt, strike_releas_amt, 
        sum_realize_pandl, amt_diff, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_begin_amt, v_curr_amt, v_frozen_amt, 
        v_opor_warn_tshold, v_opor_stop_tshold, v_order_limit_time, v_per_secu_posi_ratio, 
        v_posi_limit_time, v_order_ctrl_qty, v_order_ctrl_amt, v_stock_warn_ratio, 
        v_stock_stop_ratio, v_stock_warn_amt, v_stock_stop_amt, v_trig_oper_type, 
        v_open_close_permission, v_risk_oper, v_fee_calc_type, v_permit_margin_trade, 
        v_buy_fee_ratio, v_sell_fee_ratio, v_buy_min_fee, v_sell_min_fee, 
        v_trade_capt_amt, v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, 
        v_sum_realize_pandl, v_amt_diff, v_remark_info from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no=v_busi_opor_no limit 1;


    /* set @当前金额# = IFNULL(@当前金额#,0); */
    set v_curr_amt = IFNULL(v_curr_amt,0);

    /* set @冻结金额# = IFNULL(@冻结金额#,0); */
    set v_frozen_amt = IFNULL(v_frozen_amt,0);

    /* set @操作员预警阈值# = IFNULL(@操作员预警阈值#,0); */
    set v_opor_warn_tshold = IFNULL(v_opor_warn_tshold,0);

    /* set @操作员止损阈值# = IFNULL(@操作员止损阈值#,0); */
    set v_opor_stop_tshold = IFNULL(v_opor_stop_tshold,0);

    /* set @下单限制时间# = IFNULL(@下单限制时间#,0); */
    set v_order_limit_time = IFNULL(v_order_limit_time,0);

    /* set @单券持仓比例# = IFNULL(@单券持仓比例#,0); */
    set v_per_secu_posi_ratio = IFNULL(v_per_secu_posi_ratio,0);

    /* set @持仓时限# = IFNULL(@持仓时限#,5); */
    set v_posi_limit_time = IFNULL(v_posi_limit_time,5);

    /* set @单笔数量控制# = IFNULL(@单笔数量控制#,0); */
    set v_order_ctrl_qty = IFNULL(v_order_ctrl_qty,0);

    /* set @单笔金额控制# = IFNULL(@单笔金额控制#,0); */
    set v_order_ctrl_amt = IFNULL(v_order_ctrl_amt,0);

    /* set @单券预警比例# = IFNULL(@单券预警比例#,0); */
    set v_stock_warn_ratio = IFNULL(v_stock_warn_ratio,0);

    /* set @单券止损比例# = IFNULL(@单券止损比例#,0); */
    set v_stock_stop_ratio = IFNULL(v_stock_stop_ratio,0);

    /* set @单券预警金额# = IFNULL(@单券预警金额#,0); */
    set v_stock_warn_amt = IFNULL(v_stock_warn_amt,0);

    /* set @单券止损金额# = IFNULL(@单券止损金额#,0); */
    set v_stock_stop_amt = IFNULL(v_stock_stop_amt,0);

    /* set @触警操作方式# = IFNULL(@触警操作方式#,《触警操作方式-不操作》); */
    set v_trig_oper_type = IFNULL(v_trig_oper_type,0);

    /* set @开平仓权限# = IFNULL(@开平仓权限#,《开平仓权限-不限制》); */
    set v_open_close_permission = IFNULL(v_open_close_permission,0);

    /* set @允许信用交易# = IFNULL(@允许信用交易#,《允许信用交易-允许》); */
    set v_permit_margin_trade = IFNULL(v_permit_margin_trade,1);

    /* set @风控监控员# = IFNULL(@风控监控员#,0); */
    set v_risk_oper = IFNULL(v_risk_oper,0);

    /* set @买费率# = IFNULL(@买费率#,0); */
    set v_buy_fee_ratio = IFNULL(v_buy_fee_ratio,0);

    /* set @卖费率# = IFNULL(@卖费率#,0); */
    set v_sell_fee_ratio = IFNULL(v_sell_fee_ratio,0);

    /* set @买最低费用# = IFNULL(@买最低费用#,0); */
    set v_buy_min_fee = IFNULL(v_buy_min_fee,0);

    /* set @卖最低费用# = IFNULL(@卖最低费用#,0); */
    set v_sell_min_fee = IFNULL(v_sell_min_fee,0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_curr_amt = v_curr_amt;
    SET p_frozen_amt = v_frozen_amt;
    SET p_opor_warn_tshold = v_opor_warn_tshold;
    SET p_opor_stop_tshold = v_opor_stop_tshold;
    SET p_order_limit_time = v_order_limit_time;
    SET p_per_secu_posi_ratio = v_per_secu_posi_ratio;
    SET p_posi_limit_time = v_posi_limit_time;
    SET p_order_ctrl_qty = v_order_ctrl_qty;
    SET p_order_ctrl_amt = v_order_ctrl_amt;
    SET p_stock_warn_ratio = v_stock_warn_ratio;
    SET p_stock_stop_ratio = v_stock_stop_ratio;
    SET p_stock_warn_amt = v_stock_warn_amt;
    SET p_stock_stop_amt = v_stock_stop_amt;
    SET p_trig_oper_type = v_trig_oper_type;
    SET p_open_close_permission = v_open_close_permission;
    SET p_risk_oper = v_risk_oper;
    SET p_fee_calc_type = v_fee_calc_type;
    SET p_permit_margin_trade = v_permit_margin_trade;
    SET p_buy_fee_ratio = v_buy_fee_ratio;
    SET p_sell_fee_ratio = v_sell_fee_ratio;
    SET p_buy_min_fee = v_buy_min_fee;
    SET p_sell_min_fee = v_sell_min_fee;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员阈值信息计算更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_CalcuOporTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_CalcuOporTsholdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_detail_posi_id bigint,
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_lngsht_type int,
    IN p_curr_qty decimal(18,2),
    IN p_open_posi_date int,
    IN p_open_posi_time int,
    IN p_open_posi_price decimal(16,9),
    IN p_open_posi_value decimal(18,4),
    IN p_open_posi_fee decimal(18,4),
    IN p_close_posi_qty decimal(18,2),
    IN p_close_posi_market_value decimal(18,4),
    IN p_close_posi_fee decimal(18,4),
    IN p_strike_no varchar(64),
    IN p_realize_pandl decimal(18,4),
    IN p_posi_status varchar(2),
    IN p_last_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_posi_limit_time int,
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_stock_warn_ratio decimal(18,12),
    IN p_stock_stop_ratio decimal(18,12),
    IN p_buy_fee_ratio decimal(18,12),
    IN p_sell_fee_ratio decimal(18,12),
    IN p_buy_min_fee decimal(18,4),
    IN p_sell_min_fee decimal(18,4),
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
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_strike_no varchar(64);
    declare v_realize_pandl decimal(18,4);
    declare v_posi_status varchar(2);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_posi_limit_time int;
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
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
    SET v_detail_posi_id = p_detail_posi_id;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_curr_qty = p_curr_qty;
    SET v_open_posi_date = p_open_posi_date;
    SET v_open_posi_time = p_open_posi_time;
    SET v_open_posi_price = p_open_posi_price;
    SET v_open_posi_value = p_open_posi_value;
    SET v_open_posi_fee = p_open_posi_fee;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_close_posi_market_value = p_close_posi_market_value;
    SET v_close_posi_fee = p_close_posi_fee;
    SET v_strike_no = p_strike_no;
    SET v_realize_pandl = p_realize_pandl;
    SET v_posi_status = p_posi_status;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_posi_limit_time = p_posi_limit_time;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_stock_warn_ratio = p_stock_warn_ratio;
    SET v_stock_stop_ratio = p_stock_stop_ratio;
    SET v_buy_fee_ratio = p_buy_fee_ratio;
    SET v_sell_fee_ratio = p_sell_fee_ratio;
    SET v_buy_min_fee = p_buy_min_fee;
    SET v_sell_min_fee = p_sell_min_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    ##已平仓的不需要监控，直接删除
    #if @持仓状态# = 《持仓状态-已平仓》 then
    #    [删除表记录][交易证券_T0_操作员阈值计算表][{明细持仓序号} = @明细持仓序号#][3][@明细持仓序号#,@机构编号#]
    #    [检查正常返回][1=1];
    #end if;
    #
    #set @未平仓数量# = @当前数量# - @平仓数量#;
    #set @未平仓市值# = @未平仓数量# * @最新价#;
    #if @多空类型# = 《多空类型-多头》 then
    #    set @最新阈值# = (@当前数量# - @平仓数量#) * (@最新价# - @开仓市值#/@当前数量# - @开仓费用#/@当前数量#) - greatest(@未平仓数量# * @最新价# * @卖费率#,@卖最低费用#) + @实现盈亏#;
    #else
    #    set @最新阈值# = -1* (@当前数量# - @平仓数量#) * (@最新价# - @开仓市值#/@当前数量# + @开仓费用#/@当前数量#) - greatest(@未平仓数量# * @最新价# * @买费率#,@买最低费用#) + @实现盈亏#;
    #end if;
    #set @盈亏比例# = Round(@最新阈值# /(@开仓市值# + @开仓费用#),4);
    #
    #[获取机器时间][@最后更新时间#]
    #set @持仓时限状态# = 《持仓时限状态-正常》;
    #if time_to_sec(timediff(@最后更新时间#,@开仓时间#))> @持仓时限# * 60 then
    #    set @持仓时限状态# = 《持仓时限状态-超时》;
    #end if;
    #
    #set @监控结果状态# = 《监控结果状态-正常》;
    #if @盈亏比例# < @单券止损比例# and @单券止损比例# <> 0 then
    #    set @监控结果状态# = 《监控结果状态-止损》;
    #elseif @盈亏比例# < @单券预警比例# and @单券预警比例# <> 0 then
    #    set @监控结果状态# = 《监控结果状态-预警》;
    #end if;
    #set @操作员编号# = @业务操作员编号#;
    #set @浮动盈亏# = 0;
    #set @单券预警金额# = 0;
    #set @单券止损金额# = 0;
    #set @开平仓权限# = 0;
    #
    #
    #[插入重复更新][交易证券_T0_操作员阈值计算表][字段][字段变量][{平仓数量} = @平仓数量#,{平仓市值} = @平仓市值#,{平仓费用} = @平仓费用#,{成交编号} = @成交编号#,{实现盈亏} = @实现盈亏#,{持仓状态} = @持仓状态#,{最新价} = @最新价#,{涨停价} = @涨停价#,{跌停价} = @跌停价#,{持仓时限} = @持仓时限#,{单券预警比例} = @单券预警比例#,{单券止损比例} = @单券止损比例#,{平仓方式} = @平仓方式#,{操作员冻结方式} = @操作员冻结方式#, {未平仓数量} = @未平仓数量#, {未平仓市值} = @未平仓市值#, {最新阈值} = @最新阈值#, {盈亏比例}=@盈亏比例#, {持仓时限状态} = @持仓时限状态#,{监控结果状态}=@监控结果状态#][1][@明细持仓序号#,@机构编号#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_获取证券持仓明细
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_GetPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_GetPosiDetail(
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
    OUT p_row_id bigint,
    OUT p_detail_posi_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_lngsht_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_date int,
    OUT p_close_posi_time int,
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_strike_no varchar(64),
    OUT p_realize_pandl decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_posi_status varchar(2),
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_remark_info = " ";
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_T0_证券持仓明细表][字段][字段变量][{记录序号} = @查询记录序号# order by {记录序号} asc][4][@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, 
        v_lngsht_type, v_curr_qty, v_open_posi_date, v_open_posi_time, 
        v_open_posi_price, v_open_posi_value, v_open_posi_fee, v_close_posi_qty, 
        v_close_posi_date, v_close_posi_time, v_close_posi_market_value, v_close_posi_fee, 
        v_strike_no, v_realize_pandl, v_over_night_pandl, v_posi_status, 
        v_remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where row_id = v_query_row_id order by row_id asc limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.91.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;

    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_date = v_close_posi_date;
    SET p_close_posi_time = v_close_posi_time;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_strike_no = v_strike_no;
    SET p_realize_pandl = v_realize_pandl;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_posi_status = v_posi_status;
    SET p_remark_info = v_remark_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员阈值汇总信息计算更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_CalcuOporSumTsholdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_CalcuOporSumTsholdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_total_long_curr_qty decimal(18,2),
    IN p_total_short_curr_qty decimal(18,2),
    IN p_total_long_open_posi_value decimal(18,4),
    IN p_total_short_open_posi_value decimal(18,4),
    IN p_total_long_open_posi_fee decimal(18,4),
    IN p_total_short_open_posi_fee decimal(18,4),
    IN p_total_long_close_posi_value decimal(18,4),
    IN p_total_short_close_posi_value decimal(18,4),
    IN p_total_long_close_posi_qty decimal(18,2),
    IN p_total_short_close_posi_qty decimal(18,2),
    IN p_total_long_close_posi_fee decimal(18,4),
    IN p_total_short_close_posi_fee decimal(18,4),
    IN p_total_realize_pandl decimal(18,4),
    IN p_open_posi_date int,
    IN p_open_posi_time int,
    IN p_long_curr_qty decimal(18,2),
    IN p_short_curr_qty decimal(18,2),
    IN p_long_open_posi_value decimal(18,4),
    IN p_short_open_posi_value decimal(18,4),
    IN p_long_open_posi_fee decimal(18,4),
    IN p_short_open_posi_fee decimal(18,4),
    IN p_long_close_posi_qty decimal(18,2),
    IN p_short_close_posi_qty decimal(18,2),
    IN p_long_close_posi_value decimal(18,4),
    IN p_short_close_posi_value decimal(18,4),
    IN p_long_close_posi_fee decimal(18,4),
    IN p_short_close_posi_fee decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_last_price decimal(16,9),
    IN p_up_limit_price decimal(16,9),
    IN p_down_limit_price decimal(16,9),
    IN p_posi_limit_time int,
    IN p_opor_warn_tshold decimal(18,4),
    IN p_opor_stop_tshold decimal(18,4),
    IN p_stock_warn_ratio decimal(18,12),
    IN p_stock_stop_ratio decimal(18,12),
    IN p_buy_fee_ratio decimal(18,12),
    IN p_sell_fee_ratio decimal(18,12),
    IN p_buy_min_fee decimal(18,4),
    IN p_sell_min_fee decimal(18,4),
    IN p_last_update_time int,
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    declare v_total_realize_pandl decimal(18,4);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
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
    declare v_realize_pandl decimal(18,4);
    declare v_last_price decimal(16,9);
    declare v_up_limit_price decimal(16,9);
    declare v_down_limit_price decimal(16,9);
    declare v_posi_limit_time int;
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_last_update_time int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_total_long_curr_qty = p_total_long_curr_qty;
    SET v_total_short_curr_qty = p_total_short_curr_qty;
    SET v_total_long_open_posi_value = p_total_long_open_posi_value;
    SET v_total_short_open_posi_value = p_total_short_open_posi_value;
    SET v_total_long_open_posi_fee = p_total_long_open_posi_fee;
    SET v_total_short_open_posi_fee = p_total_short_open_posi_fee;
    SET v_total_long_close_posi_value = p_total_long_close_posi_value;
    SET v_total_short_close_posi_value = p_total_short_close_posi_value;
    SET v_total_long_close_posi_qty = p_total_long_close_posi_qty;
    SET v_total_short_close_posi_qty = p_total_short_close_posi_qty;
    SET v_total_long_close_posi_fee = p_total_long_close_posi_fee;
    SET v_total_short_close_posi_fee = p_total_short_close_posi_fee;
    SET v_total_realize_pandl = p_total_realize_pandl;
    SET v_open_posi_date = p_open_posi_date;
    SET v_open_posi_time = p_open_posi_time;
    SET v_long_curr_qty = p_long_curr_qty;
    SET v_short_curr_qty = p_short_curr_qty;
    SET v_long_open_posi_value = p_long_open_posi_value;
    SET v_short_open_posi_value = p_short_open_posi_value;
    SET v_long_open_posi_fee = p_long_open_posi_fee;
    SET v_short_open_posi_fee = p_short_open_posi_fee;
    SET v_long_close_posi_qty = p_long_close_posi_qty;
    SET v_short_close_posi_qty = p_short_close_posi_qty;
    SET v_long_close_posi_value = p_long_close_posi_value;
    SET v_short_close_posi_value = p_short_close_posi_value;
    SET v_long_close_posi_fee = p_long_close_posi_fee;
    SET v_short_close_posi_fee = p_short_close_posi_fee;
    SET v_realize_pandl = p_realize_pandl;
    SET v_last_price = p_last_price;
    SET v_up_limit_price = p_up_limit_price;
    SET v_down_limit_price = p_down_limit_price;
    SET v_posi_limit_time = p_posi_limit_time;
    SET v_opor_warn_tshold = p_opor_warn_tshold;
    SET v_opor_stop_tshold = p_opor_stop_tshold;
    SET v_stock_warn_ratio = p_stock_warn_ratio;
    SET v_stock_stop_ratio = p_stock_stop_ratio;
    SET v_buy_fee_ratio = p_buy_fee_ratio;
    SET v_sell_fee_ratio = p_sell_fee_ratio;
    SET v_buy_min_fee = p_buy_min_fee;
    SET v_sell_min_fee = p_sell_min_fee;
    SET v_last_update_time = p_last_update_time;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    
    #set @临时_最后更新时间# = @最后更新时间#;
    #set @临时_实现盈亏# = @实现盈亏#;
    #
    #set @当前数量# = @总多头当前数量# + @总空头当前数量#;
    #set @开仓市值# = @总多头开仓市值# + @总空头开仓市值#;
    #set @开仓费用# = @总多头开仓费用# + @总空头开仓费用#;
    #set @平仓数量# = @总多头平仓数量# + @总空头平仓数量#;
    #set @平仓市值# = @总多头平仓市值# + @总空头平仓市值#;
    #set @平仓费用# = @总多头平仓费用# + @总空头平仓费用#;
    #set @实现盈亏# = @总实现盈亏#;
    #set @浮动盈亏# = 0;
    #set @开平仓权限# = 0;
    #
    #set @未平仓数量# = @当前数量# - @平仓数量#;
    #set @未平仓市值# = @未平仓数量# * @最新价#;
    #if @多空类型# = 《多空类型-多头》 then
    #    set @最新阈值# = (@当前数量# - @平仓数量#) * (@最新价# - @开仓市值#/@当前数量# - @开仓费用#/@当前数量#) - greatest(@未平仓数量# * @最新价# * @卖费率#,@卖最低费用#) + @实现盈亏#;
    #else
    #    set @最新阈值# = -1* (@当前数量# - @平仓数量#) * (@最新价# - @开仓市值#/@当前数量# + @开仓费用#/@当前数量#) - greatest(@未平仓数量# * @最新价# * @买费率#,@买最低费用#) + @实现盈亏#;
    #end if;
    #set @盈亏比例# = Round(@最新阈值# /(@开仓市值# + @开仓费用#),4);
    #set @监控结果状态# = 《监控结果状态-正常》;
    #if @最新阈值# < @操作员止损阈值# and @操作员止损阈值# <> 0 then
    #    set @监控结果状态# = 《监控结果状态-止损》;
    #elseif @最新阈值# < @操作员预警阈值# and @操作员预警阈值# <> 0 then
    #    set @监控结果状态# = 《监控结果状态-预警》;
    #end if;
    #
    #[记录不存在插入表记录][交易证券_T0_操作员阈值汇总计算表][字段][字段变量][{操作员编号}=@业务操作员编号#][1][@业务操作员编号#,@机构编号#]
    #
    #set @临时_当前数量# = @当前数量#;
    #set @临时_开仓市值# = @开仓市值#;
    #set @临时_开仓费用# = @开仓费用#;
    #set @临时_平仓数量# = @平仓数量#;
    #set @临时_平仓市值# = @平仓市值#;
    #set @临时_平仓费用# = @平仓费用#;
    #set @临时_实现盈亏# = @实现盈亏#;
    #set @临时_最新阈值# = @最新阈值#;
    #set @临时_未平仓数量# = @未平仓数量#;
    #set @临时_未平仓市值# = @未平仓市值#;
    #
    #[锁定获取表记录变量][交易证券_T0_操作员阈值汇总计算表][{最后更新时间},{当前数量},{开仓市值},{开仓费用},{平仓数量},{平仓市值},{平仓费用},{实现盈亏},{未平仓数量},{未平仓市值},{最新阈值}][@最#后更新时间#,@当前数量#,@开仓市值#,@开仓费用#,@平仓数量#,@平仓市值#,@平仓费用#,@实现盈亏#,@未平仓数量#,@未平仓市值#,@最新阈值#][{操作员编号}=@业务操作员编号#][4][@业务操作员编号#,@机构编号#]
    #
    #if @临时_最后更新时间# > @最后更新时间# then
    #    [更新表记录][交易证券_T0_操作员阈值汇总计算表][{最后更新时间}=@最后更新时间#,{当前数量}=@当前数量#,{开仓市值}=@开仓市值#,{开仓费用}=@开仓费用#,{平仓数量}=@平仓数量#,{平仓市值}=@平仓市值##,{平仓费用}=@平仓费用#,{实现盈亏}=@实现盈亏#,{未平仓数量}=@未平仓数量#,{未平仓市值}=@未平仓市值#,{最新阈值}=@最新阈值#,{盈亏比例}=@盈亏比例#,{监控结果状态}=@监控结果状态#][{操作员编号}#=@业务操作员编号#][2][@业务操作员编号#,@机构编号#]
    #else
    #    set @当前数量# = @当前数量# + @临时_当前数量#;
    #    set @开仓市值# = @开仓市值# + @临时_开仓市值#;
    #    set @开仓费用# = @开仓费用# + @临时_开仓费用#;
    #    set @平仓数量# = @平仓数量# + @临时_平仓数量#;
    #    set @平仓市值# = @平仓市值# + @临时_平仓市值#;
    #    set @平仓费用# = @平仓费用# + @临时_平仓费用#;
    #    set @实现盈亏# = @实现盈亏# + @临时_实现盈亏#;
    #    set @未平仓数量# = @未平仓数量# + @临时_未平仓数量#;
    #    set @未平仓市值# = @未平仓市值# + @临时_未平仓市值#;
    #    set @最新阈值# = @最新阈值# + @临时_最新阈值#;
    #
    #    set @盈亏比例# = Round(@最新阈值# /(@开仓市值# + @开仓费用#),4);
    #    set @监控结果状态# = 《监控结果状态-正常》;
    #    if @最新阈值# < @操作员止损阈值# and @操作员止损阈值# <> 0 then
    #        set @监控结果状态# = 《监控结果状态-止损》;
    #    elseif @最新阈值# < @操作员预警阈值# and @操作员预警阈值# <> 0 then
    #        set @监控结果状态# = 《监控结果状态-预警》;
    #    end if;
    #
    #    [更新表记录][交易证券_T0_操作员阈值汇总计算表][{当前数量}=@当前数量#,{开仓市值}=@开仓市值#,{开仓费用}=@开仓费用#,{平仓数量}=@平仓数量#,{平仓市值}=@平仓市值#,{平仓费用}=@平仓费用#,{实现#盈亏}=@实现盈亏#,{未平仓数量}=@未平仓数量#,{未平仓市值}=@未平仓市值#,{最新阈值}=@最新阈值#,{盈亏比例}=@盈亏比例#,{监控结果状态}=@监控结果状态#][{操作员编号}=@业务操作员编号#][2][@业务操#作员编号#,@机构编号#]
    #
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_获取证券持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_GetSingleSumPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_GetSingleSumPosi(
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
    OUT p_row_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_total_long_curr_qty decimal(18,2),
    OUT p_total_short_curr_qty decimal(18,2),
    OUT p_total_long_open_posi_value decimal(18,4),
    OUT p_total_short_open_posi_value decimal(18,4),
    OUT p_total_long_open_posi_fee decimal(18,4),
    OUT p_total_short_open_posi_fee decimal(18,4),
    OUT p_total_long_close_posi_value decimal(18,4),
    OUT p_total_short_close_posi_value decimal(18,4),
    OUT p_total_long_close_posi_qty decimal(18,2),
    OUT p_total_short_close_posi_qty decimal(18,2),
    OUT p_total_long_close_posi_fee decimal(18,4),
    OUT p_total_short_close_posi_fee decimal(18,4),
    OUT p_total_realize_pandl decimal(18,4),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_long_curr_qty decimal(18,2),
    OUT p_short_curr_qty decimal(18,2),
    OUT p_long_open_posi_value decimal(18,4),
    OUT p_short_open_posi_value decimal(18,4),
    OUT p_long_open_posi_fee decimal(18,4),
    OUT p_short_open_posi_fee decimal(18,4),
    OUT p_long_close_posi_qty decimal(18,2),
    OUT p_short_close_posi_qty decimal(18,2),
    OUT p_long_close_posi_value decimal(18,4),
    OUT p_short_close_posi_value decimal(18,4),
    OUT p_long_close_posi_fee decimal(18,4),
    OUT p_short_close_posi_fee decimal(18,4),
    OUT p_realize_pandl decimal(18,4)
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
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
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
    declare v_total_realize_pandl decimal(18,4);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
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
    declare v_realize_pandl decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_code varchar(6);
    declare v_over_night_pandl decimal(18,4);

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
    SET v_row_id = 0;
    SET v_busi_opor_no = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
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
    SET v_total_realize_pandl = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
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
    SET v_realize_pandl = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code = " ";
    SET v_over_night_pandl = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_T0_证券持仓汇总表][字段][字段变量][{记录序号} > @查询记录序号# order by {记录序号} asc][4][@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        total_long_curr_qty, total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, 
        total_long_open_posi_fee, total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, 
        total_long_close_posi_qty, total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, 
        total_realize_pandl, long_curr_qty, short_curr_qty, long_open_posi_value, 
        short_open_posi_value, long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, 
        short_close_posi_qty, long_close_posi_value, short_close_posi_value, long_close_posi_fee, 
        short_close_posi_fee, realize_pandl, over_night_pandl, open_posi_date, 
        open_posi_time into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, 
        v_total_long_curr_qty, v_total_short_curr_qty, v_total_long_open_posi_value, v_total_short_open_posi_value, 
        v_total_long_open_posi_fee, v_total_short_open_posi_fee, v_total_long_close_posi_value, v_total_short_close_posi_value, 
        v_total_long_close_posi_qty, v_total_short_close_posi_qty, v_total_long_close_posi_fee, v_total_short_close_posi_fee, 
        v_total_realize_pandl, v_long_curr_qty, v_short_curr_qty, v_long_open_posi_value, 
        v_short_open_posi_value, v_long_open_posi_fee, v_short_open_posi_fee, v_long_close_posi_qty, 
        v_short_close_posi_qty, v_long_close_posi_value, v_short_close_posi_value, v_long_close_posi_fee, 
        v_short_close_posi_fee, v_realize_pandl, v_over_night_pandl, v_open_posi_date, 
        v_open_posi_time from db_tdsecu.tb_tdset0_stock_posi_sum where row_id > v_query_row_id order by row_id asc limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.93.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_total_long_curr_qty = v_total_long_curr_qty;
    SET p_total_short_curr_qty = v_total_short_curr_qty;
    SET p_total_long_open_posi_value = v_total_long_open_posi_value;
    SET p_total_short_open_posi_value = v_total_short_open_posi_value;
    SET p_total_long_open_posi_fee = v_total_long_open_posi_fee;
    SET p_total_short_open_posi_fee = v_total_short_open_posi_fee;
    SET p_total_long_close_posi_value = v_total_long_close_posi_value;
    SET p_total_short_close_posi_value = v_total_short_close_posi_value;
    SET p_total_long_close_posi_qty = v_total_long_close_posi_qty;
    SET p_total_short_close_posi_qty = v_total_short_close_posi_qty;
    SET p_total_long_close_posi_fee = v_total_long_close_posi_fee;
    SET p_total_short_close_posi_fee = v_total_short_close_posi_fee;
    SET p_total_realize_pandl = v_total_realize_pandl;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_long_curr_qty = v_long_curr_qty;
    SET p_short_curr_qty = v_short_curr_qty;
    SET p_long_open_posi_value = v_long_open_posi_value;
    SET p_short_open_posi_value = v_short_open_posi_value;
    SET p_long_open_posi_fee = v_long_open_posi_fee;
    SET p_short_open_posi_fee = v_short_open_posi_fee;
    SET p_long_close_posi_qty = v_long_close_posi_qty;
    SET p_short_close_posi_qty = v_short_close_posi_qty;
    SET p_long_close_posi_value = v_long_close_posi_value;
    SET p_short_close_posi_value = v_short_close_posi_value;
    SET p_long_close_posi_fee = v_long_close_posi_fee;
    SET p_short_close_posi_fee = v_short_close_posi_fee;
    SET p_realize_pandl = v_realize_pandl;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_操作员阈值设置调整资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_OporTsholdSetAdjustCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_OporTsholdSetAdjustCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_opor_warn_tshold decimal(18,4);
    declare v_opor_stop_tshold decimal(18,4);
    declare v_order_limit_time int;
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_posi_limit_time int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_stock_warn_ratio decimal(18,12);
    declare v_stock_stop_ratio decimal(18,12);
    declare v_stock_warn_amt decimal(18,4);
    declare v_stock_stop_amt decimal(18,4);
    declare v_trig_oper_type int;
    declare v_open_close_permission int;
    declare v_risk_oper int;
    declare v_fee_calc_type int;
    declare v_permit_margin_trade int;
    declare v_buy_fee_ratio decimal(18,12);
    declare v_sell_fee_ratio decimal(18,12);
    declare v_buy_min_fee decimal(18,4);
    declare v_sell_min_fee decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_amt_diff decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_tmp_begin_amt decimal(18,4);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_opor_warn_tshold = 0;
    SET v_opor_stop_tshold = 0;
    SET v_order_limit_time = 0;
    SET v_per_secu_posi_ratio = 0;
    SET v_posi_limit_time = 5;
    SET v_order_ctrl_qty = 0;
    SET v_order_ctrl_amt = 0;
    SET v_stock_warn_ratio = 0;
    SET v_stock_stop_ratio = 0;
    SET v_stock_warn_amt = 0;
    SET v_stock_stop_amt = 0;
    SET v_trig_oper_type = 0;
    SET v_open_close_permission = 0;
    SET v_risk_oper = 0;
    SET v_fee_calc_type = 0;
    SET v_permit_margin_trade = 0;
    SET v_buy_fee_ratio = 0;
    SET v_sell_fee_ratio = 0;
    SET v_buy_min_fee = 0;
    SET v_sell_min_fee = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_sum_realize_pandl = 0;
    SET v_begin_amt = 0;
    SET v_amt_diff = 0;
    SET v_remark_info = " ";
    SET v_tmp_begin_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @机构编号# = @操作员机构编号#; */
    set v_co_no = v_opor_co_no;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @操作员预警阈值# = 0; */
    set v_opor_warn_tshold = 0;

    /* set @操作员预警阈值# = 0; */
    set v_opor_warn_tshold = 0;

    /* set @操作员止损阈值# = 0; */
    set v_opor_stop_tshold = 0;

    /* set @下单限制时间# = 0; */
    set v_order_limit_time = 0;

    /* set @单券持仓比例# = 0; */
    set v_per_secu_posi_ratio = 0;

    /* set @持仓时限# = 0; */
    set v_posi_limit_time = 0;

    /* set @单笔数量控制# = 0; */
    set v_order_ctrl_qty = 0;

    /* set @单笔金额控制# = 0; */
    set v_order_ctrl_amt = 0;

    /* set @单券预警比例# = 0; */
    set v_stock_warn_ratio = 0;

    /* set @单券止损比例# = 0; */
    set v_stock_stop_ratio = 0;

    /* set @单券预警金额# = 0; */
    set v_stock_warn_amt = 0;

    /* set @单券止损金额# = 0; */
    set v_stock_stop_amt = 0;

    /* set @触警操作方式# = 0; */
    set v_trig_oper_type = 0;

    /* set @开平仓权限# = 0; */
    set v_open_close_permission = 0;

    /* set @风控监控员# = 0; */
    set v_risk_oper = 0;

    /* set @费用计算方式# = 0; */
    set v_fee_calc_type = 0;

    /* set @允许信用交易# = 0; */
    set v_permit_margin_trade = 0;

    /* set @买费率# = 0; */
    set v_buy_fee_ratio = 0;

    /* set @卖费率# = 0; */
    set v_sell_fee_ratio = 0;

    /* set @买最低费用# = 0; */
    set v_buy_min_fee = 0;

    /* set @卖最低费用# = 0; */
    set v_sell_min_fee = 0;

    /* set @交易占用金额# = 0; */
    set v_trade_capt_amt = 0;

    /* set @交易释放金额# = 0; */
    set v_trade_releas_amt = 0;

    /* set @成交占用金额# = 0; */
    set v_strike_capt_amt = 0;

    /* set @成交释放金额# = 0; */
    set v_strike_releas_amt = 0;

    /* set @累计实现盈亏# = 0; */
    set v_sum_realize_pandl = 0;

    /* set @期初金额# = @当前金额#; */
    set v_begin_amt = v_curr_amt;

    /* set @金额差额# = 0; */
    set v_amt_diff = 0;
    #增加字段 modify by wjp 20181017

    /* set @备注信息# = " "; */
    set v_remark_info = " ";

    /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{期初金额}][@临时_期初金额#][{操作员编号}=@操作员编号#] */
    select begin_amt into v_tmp_begin_amt from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no=v_opor_no limit 1;


    /* if @临时_期初金额#=0 then */
    if v_tmp_begin_amt=0 then

        /* [插入重复更新][交易证券_T0_操作员阈值设置表][字段][字段变量][{当前金额}={当前金额}+@当前金额#,{期初金额}={当前金额},{冻结金额}={冻结金额}+@冻结金额#][1][@业务操作员编号#,@当前金额#,@冻结金额#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_opor_tshold_set (
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
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_opor_no, 
            v_begin_amt, v_curr_amt, v_frozen_amt, v_opor_warn_tshold, 
            v_opor_stop_tshold, v_order_limit_time, v_per_secu_posi_ratio, v_posi_limit_time, 
            v_order_ctrl_qty, v_order_ctrl_amt, v_stock_warn_ratio, v_stock_stop_ratio, 
            v_stock_warn_amt, v_stock_stop_amt, v_trig_oper_type, v_open_close_permission, 
            v_risk_oper, v_fee_calc_type, v_permit_margin_trade, v_buy_fee_ratio, 
            v_sell_fee_ratio, v_buy_min_fee, v_sell_min_fee, v_trade_capt_amt, 
            v_trade_releas_amt, v_strike_capt_amt, v_strike_releas_amt, v_sum_realize_pandl, 
            v_amt_diff, v_remark_info) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt,begin_amt=curr_amt,frozen_amt=frozen_amt+v_frozen_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.94.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","当前金额=",v_curr_amt,",","冻结金额=",v_frozen_amt),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","当前金额=",v_curr_amt,",","冻结金额=",v_frozen_amt);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][交易证券_T0_操作员阈值设置表][{当前金额}={当前金额}+@当前金额#,{冻结金额}={冻结金额}+@冻结金额#][{操作员编号}=@操作员编号#][2][@操作员编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_curr_amt,frozen_amt=frozen_amt+v_frozen_amt where opor_no=v_opor_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.94.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #[插入重复更新][交易证券_T0_操作员阈值设置表][字段][字段变量][{当前金额}={当前金额}+@当前金额#,{冻结金额}={冻结金额}+@冻结金额#][1][@业务操作员编号#,@当前金额#,@冻结金额#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_隔夜仓查询
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOvernightStockPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOvernightStockPosi(
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
    IN p_busi_opor_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_busi_opor_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;
    #[获取表记录][交易证券_T0_证券持仓明细表][{记录序号},{证券代码},{市场编号},{证券代码编号},{多空类型},case when {多空类型}=1 then {当前数量}- {平仓数量} when {多空类型}=2 then -1*({当前数量}- {平仓数量}) end as  {持仓数量},{当前数量},{开仓市值}, {开仓费用},{开仓日期},{开仓时间},{产品编号},{交易组编号},{资产账户编号},{操作员编号}, case when {多空类型}=1 then ({开仓市值} + {开仓费用})/ {当前数量} when {多空类型}=2 then ({开仓市值} - {开仓费用})/ {当前数量} end as {成本价}][((@业务操作员编号# = 0 and instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0 ) or {操作员编号} = @业务操作员编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@机构编号#=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@证券代码#='' or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {持仓状态} = 《持仓状态-未平仓》][@指定行数#]
    #后台不做可设置操作员过滤

    /* [获取表记录][交易证券_T0_证券持仓明细表][{记录序号},{证券代码},{市场编号},{证券代码编号},{多空类型},case when {多空类型}=1 then {当前数量}- {平仓数量} when {多空类型}=2 then -1*({当前数量}- {平仓数量}) end as  {持仓数量}, {当前数量},{开仓市值}, {开仓费用},{开仓日期},{开仓时间},{产品编号},{交易组编号},{资产账户编号},{操作员编号}, case when {多空类型}=1 then ({开仓市值} + {开仓费用})/ {当前数量} when {多空类型}=2 then ({开仓市值} - {开仓费用})/ {当前数量} end as {成本价}][(@业务操作员编号# = 0 or {操作员编号} = @业务操作员编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@机构编号#=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#)  and (@证券代码#='' or {证券代码}=@证券代码#) and (@市场编号#=0 or {市场编号}=@市场编号#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and {持仓状态} = 《持仓状态-未平仓》][@指定行数#] */
    if v_row_count = -1 then
        select row_id,stock_code,exch_no,stock_code_no,lngsht_type,case when lngsht_type=1 then curr_qty- close_posi_qty when lngsht_type=2 then -1*(curr_qty- close_posi_qty) end as  posi_qty, curr_qty,open_posi_value, open_posi_fee,open_posi_date,open_posi_time,pd_no,exch_group_no,asset_acco_no,opor_no, case when lngsht_type=1 then (open_posi_value + open_posi_fee)/ curr_qty when lngsht_type=2 then (open_posi_value - open_posi_fee)/ curr_qty end as cost_price from db_tdsecu.tb_tdset0_stock_posi_detail where (v_busi_opor_no = 0 or opor_no = v_busi_opor_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no)  and (v_stock_code='' or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and posi_status = "1";
    else
        select row_id,stock_code,exch_no,stock_code_no,lngsht_type,case when lngsht_type=1 then curr_qty- close_posi_qty when lngsht_type=2 then -1*(curr_qty- close_posi_qty) end as  posi_qty, curr_qty,open_posi_value, open_posi_fee,open_posi_date,open_posi_time,pd_no,exch_group_no,asset_acco_no,opor_no, case when lngsht_type=1 then (open_posi_value + open_posi_fee)/ curr_qty when lngsht_type=2 then (open_posi_value - open_posi_fee)/ curr_qty end as cost_price from db_tdsecu.tb_tdset0_stock_posi_detail where (v_busi_opor_no = 0 or opor_no = v_busi_opor_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no)  and (v_stock_code='' or stock_code=v_stock_code) and (v_exch_no=0 or exch_no=v_exch_no) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and posi_status = "1" limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_持仓明细作废
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_WasteT0UnitEquitiesPositionDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_WasteT0UnitEquitiesPositionDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_init_date int;
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_remark_info varchar(255);
    declare v_last_update_time int;
    declare v_T0_limit_method int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_open_posi_date int;
    declare v_open_posi_time int;
    declare v_open_posi_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_close_posi_qty decimal(18,2);
    declare v_busi_opor_no int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_close_posi_date int;
    declare v_close_posi_time int;
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_tmp_curr_qty decimal(18,2);
    declare v_tmp_open_posi_value decimal(18,4);
    declare v_tmp_open_posi_fee decimal(18,4);
    declare v_tmp_close_posi_qty decimal(18,2);
    declare v_tmp_realize_pandl decimal(18,4);
    declare v_over_night_trade_buy_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_detail_posi_id bigint;
    declare v_strike_no varchar(64);
    declare v_posi_status varchar(2);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_record_count int;
    declare v_waste_time int;
    declare v_waste_date int;
    declare v_waste_qty decimal(18,2);

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
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_remark_info = " ";
    SET v_last_update_time = date_format(curtime(),'%H%i%s');
    SET v_T0_limit_method = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_open_posi_time = date_format(curtime(),'%H%i%s');
    SET v_open_posi_price = 0;
    SET v_lngsht_type = 0;
    SET v_close_posi_qty = 0;
    SET v_busi_opor_no = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_tmp_curr_qty = 0;
    SET v_tmp_open_posi_value = 0;
    SET v_tmp_open_posi_fee = 0;
    SET v_tmp_close_posi_qty = 0;
    SET v_tmp_realize_pandl = 0;
    SET v_over_night_trade_buy_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_detail_posi_id = 0;
    SET v_strike_no = " ";
    SET v_posi_status = "0";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_record_count = 0;
    SET v_waste_time = date_format(curtime(),'%H%i%s');
    SET v_waste_date = date_format(curdate(),'%Y%m%d');
    SET v_waste_qty = 0;

    
    label_pro:BEGIN
    

    /* set @备注信息# = concat('手工作废，操作员编号：', @操作员编号#,'，更新时间：',@最后更新时间#); */
    set v_remark_info = concat('手工作废，操作员编号：', v_opor_no,'，更新时间：',v_last_update_time);

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* [获取表记录变量][交易证券_T0_证券持仓明细表][{机构编号},{产品编号},{交易组编号},{资产账户编号},{市场编号},{证券代码},{股东代码编号},{证券代码编号},{实现盈亏},{隔夜盈亏},{开仓日期},{开仓时间},{开仓价格},{多空类型},{平仓数量},{操作员编号},{当前数量},{开仓市值},{开仓费用},{平仓日期},{平仓时间},{平仓市值},{平仓费用}][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@市场编号#,@证券代码#,@股东代码编号#,@证券代码编号#,@实现盈亏#,@隔夜盈亏#,@开仓日期#,@开仓时间#,@开仓价格#,@多空类型#,@平仓数量#,@业务操作员编号#,@当前数量#,@开仓市值#,@开仓费用#,@平仓日期#,@平仓时间#,@平仓市值#,@平仓费用#][{记录序号}=@记录序号#][4][@记录序号#] */
    select co_no,pd_no,exch_group_no,asset_acco_no,exch_no,stock_code,stock_acco_no,stock_code_no,realize_pandl,over_night_pandl,open_posi_date,open_posi_time,open_posi_price,lngsht_type,close_posi_qty,opor_no,curr_qty,open_posi_value,open_posi_fee,close_posi_date,close_posi_time,close_posi_market_value,close_posi_fee into v_co_no,v_pd_no,v_exch_group_no,v_asset_acco_no,v_exch_no,v_stock_code,v_stock_acco_no,v_stock_code_no,v_realize_pandl,v_over_night_pandl,v_open_posi_date,v_open_posi_time,v_open_posi_price,v_lngsht_type,v_close_posi_qty,v_busi_opor_no,v_curr_qty,v_open_posi_value,v_open_posi_fee,v_close_posi_date,v_close_posi_time,v_close_posi_market_value,v_close_posi_fee from db_tdsecu.tb_tdset0_stock_posi_detail where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.96.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @临时_当前数量#= @当前数量#; */
    set v_tmp_curr_qty= v_curr_qty;

    /* set @临时_开仓市值#= @开仓市值#; */
    set v_tmp_open_posi_value= v_open_posi_value;

    /* set @临时_开仓费用#= @开仓费用#; */
    set v_tmp_open_posi_fee= v_open_posi_fee;

    /* set @临时_平仓数量#= @平仓数量#; */
    set v_tmp_close_posi_qty= v_close_posi_qty;

    /* set @临时_实现盈亏#= @实现盈亏#; */
    set v_tmp_realize_pandl= v_realize_pandl;
    #老仓判断是否有强平挂单数量，有则报错。

    /* if @初始化日期# > @开仓日期# then */
    if v_init_date > v_open_posi_date then

        /* [获取表记录变量][交易证券_T0_操作员券源设置表][{隔夜仓强平交易买入数量},{隔夜仓强平交易卖出数量}][@隔夜仓强平交易买入数量#,@隔夜仓强平交易卖出数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][4][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
        select over_night_trade_buy_qty,over_night_trade_sell_qty into v_over_night_trade_buy_qty,v_over_night_trade_sell_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.6.96.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@隔夜仓强平交易买入数量#>0 or @隔夜仓强平交易卖出数量#>0][807][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
        if v_over_night_trade_buy_qty>0 or v_over_night_trade_sell_qty>0 then
            
            SET v_error_code = "tdsecuA.6.96.807";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #有平过仓的作废，拆成2条明细

    /* if @平仓数量# = 0 then */
    if v_close_posi_qty = 0 then

        /* [更新表记录][交易证券_T0_证券持仓明细表][{平仓数量}={当前数量},{实现盈亏}=0,{持仓状态}=《持仓状态-已作废》,{备注信息}=@备注信息#][{记录序号}=@记录序号# and {持仓状态} = 《持仓状态-未平仓》][1][concat("更新T+0持仓明细表出错, 明细持仓序号=", @明细持仓序号#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=curr_qty,realize_pandl=0,posi_status="3",remark_info=v_remark_info where row_id=v_row_id and posi_status = "1";
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.96.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id);
            end if;
            leave label_pro;
        end if;

    else

        /* [更新表记录][交易证券_T0_证券持仓明细表][{当前数量}={平仓数量},{开仓市值}={开仓市值}*{平仓数量}/@临时_当前数量#,{开仓费用}={开仓费用}*{平仓数量}/@临时_当前数量#,{持仓状态}=《持仓状态-已平仓》,{备注信息}=@备注信息#][{记录序号}=@记录序号# and {持仓状态} = 《持仓状态-未平仓》][1][concat("更新T+0持仓明细表出错, 明细持仓序号=", @明细持仓序号#)] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty=close_posi_qty,open_posi_value=open_posi_value*close_posi_qty/v_tmp_curr_qty,open_posi_fee=open_posi_fee*close_posi_qty/v_tmp_curr_qty,posi_status="2",remark_info=v_remark_info where row_id=v_row_id and posi_status = "1";
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.96.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id);
            end if;
            leave label_pro;
        end if;


        /* set @操作员编号# = @业务操作员编号#; */
        set v_opor_no = v_busi_opor_no;

        /* set @当前数量# = @临时_当前数量# - @平仓数量#; */
        set v_curr_qty = v_tmp_curr_qty - v_close_posi_qty;

        /* set @开仓费用# = @当前数量#*@开仓费用#/@临时_当前数量#; */
        set v_open_posi_fee = v_curr_qty*v_open_posi_fee/v_tmp_curr_qty;

        /* set @开仓市值# = @当前数量#*@开仓市值#/@临时_当前数量#; */
        set v_open_posi_value = v_curr_qty*v_open_posi_value/v_tmp_curr_qty;

        /* set @平仓数量# = @当前数量#; */
        set v_close_posi_qty = v_curr_qty;

        /* set @平仓日期# = 0; */
        set v_close_posi_date = 0;

        /* set @平仓时间# = 0; */
        set v_close_posi_time = 0;

        /* set @平仓市值# = 0; */
        set v_close_posi_market_value = 0;

        /* set @平仓费用# = 0; */
        set v_close_posi_fee = 0;

        /* set @成交编号# = 0; */
        set v_strike_no = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @隔夜盈亏# = 0; */
        set v_over_night_pandl = 0;

        /* set @持仓状态# = 《持仓状态-已作废》; */
        set v_posi_status = "3";

        /* [插入表记录][交易证券_T0_证券持仓明细表][字段][字段变量][1][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@记录序号#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_stock_posi_detail(
            create_date, create_time, update_date, 
            update_time, update_times, opor_no, co_no, 
            pd_no, exch_group_no, asset_acco_no, exch_no, 
            stock_code, stock_acco_no, stock_code_no, lngsht_type, 
            curr_qty, open_posi_date, open_posi_time, open_posi_price, 
            open_posi_value, open_posi_fee, close_posi_qty, close_posi_date, 
            close_posi_time, close_posi_market_value, close_posi_fee, strike_no, 
            realize_pandl, over_night_pandl, posi_status, remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_no, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
            v_stock_code, v_stock_acco_no, v_stock_code_no, v_lngsht_type, 
            v_curr_qty, v_open_posi_date, v_open_posi_time, v_open_posi_price, 
            v_open_posi_value, v_open_posi_fee, v_close_posi_qty, v_close_posi_date, 
            v_close_posi_time, v_close_posi_market_value, v_close_posi_fee, v_strike_no, 
            v_realize_pandl, v_over_night_pandl, v_posi_status, v_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.96.1";
            SET v_error_info =  CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","记录序号=",v_row_id),"#",v_mysql_message);
            leave label_pro;
        end if;

    end if;

    /* set @当前数量#= @临时_当前数量#; */
    set v_curr_qty= v_tmp_curr_qty;

    /* set @开仓市值#= @临时_开仓市值#; */
    set v_open_posi_value= v_tmp_open_posi_value;

    /* set @开仓费用#= @临时_开仓费用#; */
    set v_open_posi_fee= v_tmp_open_posi_fee;

    /* set @平仓数量#= @临时_平仓数量#; */
    set v_close_posi_qty= v_tmp_close_posi_qty;

    /* set @实现盈亏#= @临时_实现盈亏#; */
    set v_realize_pandl= v_tmp_realize_pandl;

    /* [获取表记录数量][交易证券_T0_交易组业务资金表][@记录个数#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}="CNY"] */
    select count(1) into v_record_count from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type="CNY";

    #实现效果，当天做废：平完这笔仓；隔天做废：没有开过这笔仓

    /* if @多空类型# = 《多空类型-多头》 then */
    if v_lngsht_type = 1 then

        /* if @初始化日期# = @开仓日期# then */
        if v_init_date = v_open_posi_date then

            /* [更新表记录][交易证券_T0_证券持仓汇总表][{总多头平仓数量} = {总多头平仓数量} + (@当前数量#-@平仓数量#) , {多头平仓数量}={多头平仓数量} - @平仓数量#,{多头当前数量}={多头当前数量}-@当前数量#,{多头开仓市值} = {多头开仓市值}  - @开仓市值#,{多头开仓费用} = {多头开仓费用} - @开仓费用#,{多头平仓市值} = {多头平仓市值}-@平仓市值#,{多头平仓费用} = {多头平仓费用} - @平仓费用#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {开仓日期} = @开仓日期#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_long_close_posi_qty = total_long_close_posi_qty + (v_curr_qty-v_close_posi_qty) , long_close_posi_qty=long_close_posi_qty - v_close_posi_qty,long_curr_qty=long_curr_qty-v_curr_qty,long_open_posi_value = long_open_posi_value  - v_open_posi_value,long_open_posi_fee = long_open_posi_fee - v_open_posi_fee,long_close_posi_value = long_close_posi_value-v_close_posi_market_value,long_close_posi_fee = long_close_posi_fee - v_close_posi_fee where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and open_posi_date = v_open_posi_date;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_T0_操作员券源设置表][{成交占用数量} = {成交占用数量}+@当前数量#-@平仓数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_qty = strike_capt_qty+v_curr_qty-v_close_posi_qty where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                end if;
                leave label_pro;
            end if;

    #平今仓，反向回退钱

            /* [更新表记录][交易证券_T0_操作员阈值设置表][{成交释放金额} = {成交释放金额}+@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# + @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# ][1302][@业务操作员编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_releas_amt = strike_releas_amt+v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty + v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no ;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
                end if;
                leave label_pro;
            end if;


            /* if @记录个数# > 0 then */
            if v_record_count > 0 then

                 /* [更新表记录][交易证券_T0_交易组业务资金表][{成交释放金额} = {成交释放金额}+@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# + @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}="CNY"][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#] */
                 set v_update_date = date_format(curdate(),'%Y%m%d');
                 set v_update_time = date_format(curtime(),'%H%i%s');
                 update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_releas_amt = strike_releas_amt+v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty + v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type="CNY";
                 if v_error_code = "1" then
                             
                     SET v_error_code = "tdsecuA.6.96.1302";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no);
                     end if;
                     leave label_pro;
                 end if;

           end if;
        else

           /* [更新表记录][交易证券_T0_证券持仓汇总表][{多头当前数量}={多头当前数量}-@当前数量#+@平仓数量#,{总多头当前数量}={总多头当前数量}-@当前数量#+@平仓数量#,{多头开仓市值} = {多头开仓市值}  - @开仓市值#*(@当前数量#-@平仓数量#)/@当前数量#,{多头开仓费用} = {多头开仓费用} - @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#,{总多头开仓市值} = {总多头开仓市值}  - @开仓市值#*(@当前数量#-@平仓数量#)/@当前数量#,{总多头开仓费用} = {总多头开仓费用} - @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, long_curr_qty=long_curr_qty-v_curr_qty+v_close_posi_qty,total_long_curr_qty=total_long_curr_qty-v_curr_qty+v_close_posi_qty,long_open_posi_value = long_open_posi_value  - v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty,long_open_posi_fee = long_open_posi_fee - v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty,total_long_open_posi_value = total_long_open_posi_value  - v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty,total_long_open_posi_fee = total_long_open_posi_fee - v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no;
           if v_error_code = "1" then
                       
               SET v_error_code = "tdsecuA.6.96.1302";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
               end if;
               leave label_pro;
           end if;


           /* [更新表记录][交易证券_T0_操作员券源设置表][{数量差额} = {数量差额} - @当前数量# +@平仓数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, diff_qty = diff_qty - v_curr_qty +v_close_posi_qty where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
           if v_error_code = "1" then
                       
               SET v_error_code = "tdsecuA.6.96.1302";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
               end if;
               leave label_pro;
           end if;


           /* [更新表记录][交易证券_T0_操作员阈值设置表][{金额差额} = {金额差额}+@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# + @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# ][1302][@业务操作员编号#] */
           set v_update_date = date_format(curdate(),'%Y%m%d');
           set v_update_time = date_format(curtime(),'%H%i%s');
           update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_diff = amt_diff+v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty + v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no ;
           if v_error_code = "1" then
                       
               SET v_error_code = "tdsecuA.6.96.1302";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
               else
                   SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
               end if;
               leave label_pro;
           end if;


           /* if @T0限额方式# = 《T0限额方式-不限额》 then */
           if v_T0_limit_method = 0 then

                   /* [更新表记录][交易证券_T0_操作员阈值设置表][{当前金额} = {当前金额}+@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# + @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# ][1302][@业务操作员编号#] */
                   set v_update_date = date_format(curdate(),'%Y%m%d');
                   set v_update_time = date_format(curtime(),'%H%i%s');
                   update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = curr_amt+v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty + v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no ;
                   if v_error_code = "1" then
                               
                       SET v_error_code = "tdsecuA.6.96.1302";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
                       end if;
                       leave label_pro;
                   end if;


                   /* if @记录个数# > 0 then */
                   if v_record_count > 0 then

                       /* [更新表记录][交易证券_T0_交易组业务资金表][{当前金额} = {当前金额}+@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# + @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}="CNY"][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#] */
                       set v_update_date = date_format(curdate(),'%Y%m%d');
                       set v_update_time = date_format(curtime(),'%H%i%s');
                       update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = curr_amt+v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty + v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type="CNY";
                       if v_error_code = "1" then
                                   
                           SET v_error_code = "tdsecuA.6.96.1302";
                           if v_mysql_message <> "" then
                               SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
                           else
                               SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no);
                           end if;
                           leave label_pro;
                       end if;

                   end if;
           end if;
        end if;
    else

        /* if @初始化日期# = @开仓日期# then */
        if v_init_date = v_open_posi_date then

            /* [更新表记录][交易证券_T0_证券持仓汇总表][{总空头平仓数量} = {总空头平仓数量} + (@当前数量#-@平仓数量#), {空头平仓数量}={空头平仓数量}-@平仓数量#,{空头当前数量} = {空头当前数量} - @当前数量#,{空头开仓市值} = {空头开仓市值}  - @开仓市值#,{空头开仓费用} = {空头开仓费用} - @开仓费用#,{空头平仓市值} = {空头平仓市值}-@平仓市值#,{空头平仓费用} = {空头平仓费用} - @平仓费用#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {开仓日期} = @开仓日期#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_short_close_posi_qty = total_short_close_posi_qty + (v_curr_qty-v_close_posi_qty), short_close_posi_qty=short_close_posi_qty-v_close_posi_qty,short_curr_qty = short_curr_qty - v_curr_qty,short_open_posi_value = short_open_posi_value  - v_open_posi_value,short_open_posi_fee = short_open_posi_fee - v_open_posi_fee,short_close_posi_value = short_close_posi_value-v_close_posi_market_value,short_close_posi_fee = short_close_posi_fee - v_close_posi_fee where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and open_posi_date = v_open_posi_date;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_T0_操作员券源设置表][{成交释放数量} = {成交释放数量}+(@当前数量#-@平仓数量#)][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_releas_qty = strike_releas_qty+(v_curr_qty-v_close_posi_qty) where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_T0_操作员阈值设置表][{成交占用金额} = {成交占用金额}+@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# + @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# ][1302][@业务操作员编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_amt = strike_capt_amt+v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty + v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no ;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
                end if;
                leave label_pro;
            end if;


            /* if @记录个数# > 0 then */
            if v_record_count > 0 then

                   /* [更新表记录][交易证券_T0_交易组业务资金表][{成交占用金额} = {成交占用金额}+@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# + @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}="CNY"][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#] */
                   set v_update_date = date_format(curdate(),'%Y%m%d');
                   set v_update_time = date_format(curtime(),'%H%i%s');
                   update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_amt = strike_capt_amt+v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty + v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type="CNY";
                   if v_error_code = "1" then
                               
                       SET v_error_code = "tdsecuA.6.96.1302";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no);
                       end if;
                       leave label_pro;
                   end if;

           end if;
        else

            /* [更新表记录][交易证券_T0_证券持仓汇总表][{空头当前数量} = {空头当前数量} - @当前数量#+@平仓数量#,{总空头当前数量} = {总空头当前数量} - @当前数量#+@平仓数量#,{空头开仓市值} = {空头开仓市值}  - @开仓市值#*(@当前数量#-@平仓数量#)/@当前数量#,{空头开仓费用} = {空头开仓费用} - @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#,{总空头开仓市值} = {总空头开仓市值}  - @开仓市值#*(@当前数量#-@平仓数量#)/@当前数量#,{总空头开仓费用} = {总空头开仓费用} - @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, short_curr_qty = short_curr_qty - v_curr_qty+v_close_posi_qty,total_short_curr_qty = total_short_curr_qty - v_curr_qty+v_close_posi_qty,short_open_posi_value = short_open_posi_value  - v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty,short_open_posi_fee = short_open_posi_fee - v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty,total_short_open_posi_value = total_short_open_posi_value  - v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty,total_short_open_posi_fee = total_short_open_posi_fee - v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_T0_操作员券源设置表][{数量差额} = {数量差额} + @当前数量# -@平仓数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, diff_qty = diff_qty + v_curr_qty -v_close_posi_qty where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                end if;
                leave label_pro;
            end if;


            /* [更新表记录][交易证券_T0_操作员阈值设置表][{金额差额} = {金额差额}-@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# - @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# ][1302][@业务操作员编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, amt_diff = amt_diff-v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty - v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no ;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.96.1302";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
                end if;
                leave label_pro;
            end if;


           /* if @T0限额方式# = 《T0限额方式-不限额》 then */
           if v_T0_limit_method = 0 then

                   /* [更新表记录][交易证券_T0_操作员阈值设置表][{当前金额} = {当前金额}-@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# - @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# ][1302][@业务操作员编号#] */
                   set v_update_date = date_format(curdate(),'%Y%m%d');
                   set v_update_time = date_format(curtime(),'%H%i%s');
                   update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = curr_amt-v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty - v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no ;
                   if v_error_code = "1" then
                               
                       SET v_error_code = "tdsecuA.6.96.1302";
                       if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
                       else
                           SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
                       end if;
                       leave label_pro;
                   end if;


                   /* if @记录个数# > 0 then */
                   if v_record_count > 0 then

                         /* [更新表记录][交易证券_T0_交易组业务资金表][{当前金额} = {当前金额}-@开仓市值#*(@当前数量#-@平仓数量#)/@当前数量# - @开仓费用#*(@当前数量#-@平仓数量#)/@当前数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}="CNY"][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#] */
                         set v_update_date = date_format(curdate(),'%Y%m%d');
                         set v_update_time = date_format(curtime(),'%H%i%s');
                         update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = curr_amt-v_open_posi_value*(v_curr_qty-v_close_posi_qty)/v_curr_qty - v_open_posi_fee*(v_curr_qty-v_close_posi_qty)/v_curr_qty where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type="CNY";
                         if v_error_code = "1" then
                                     
                             SET v_error_code = "tdsecuA.6.96.1302";
                             if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
                             else
                                 SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no);
                             end if;
                             leave label_pro;
                         end if;

                   end if;
           end if;
        end if;
    end if;
    #插入持仓明细作废流水

    /* [获取机器时间][@作废时间#] */
    select date_format(curtime(),'%H%i%s') into v_waste_time;


    /* [获取机器日期][@作废日期#] */
    select date_format(curdate(),'%Y%m%d') into v_waste_date;


    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;

    /* set @废单数量# = @临时_当前数量# - @平仓数量#; */
    set v_waste_qty = v_tmp_curr_qty - v_close_posi_qty;

     /* [插入表记录][交易证券_T0_持仓作废流水表][字段][字段变量][1][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@记录序号#] */
     set v_create_date = date_format(curdate(),'%Y%m%d');
     set v_create_time = date_format(curtime(),'%H%i%s');
     set v_update_date = v_create_date;
     set v_update_time = v_create_time;
     set v_update_times = 1;
     insert into db_tdsecu.tb_tdset0_posi_cancel_jour(
         create_date, create_time, update_date, 
         update_time, update_times, init_date, opor_no, 
         co_no, pd_no, exch_group_no, asset_acco_no, 
         stock_acco_no, exch_no, stock_code, stock_code_no, 
         lngsht_type, curr_qty, open_posi_date, open_posi_time, 
         open_posi_price, open_posi_value, open_posi_fee, waste_qty, 
         busi_opor_no, waste_date, waste_time, detail_posi_id) 
     value( 
         v_create_date, v_create_time, v_update_date, 
         v_update_time, v_update_times, v_init_date, v_opor_no, 
         v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
         v_stock_acco_no, v_exch_no, v_stock_code, v_stock_code_no, 
         v_lngsht_type, v_curr_qty, v_open_posi_date, v_open_posi_time, 
         v_open_posi_price, v_open_posi_value, v_open_posi_fee, v_waste_qty, 
         v_busi_opor_no, v_waste_date, v_waste_time, v_detail_posi_id);
     if v_error_code = "1" then
                 
         SET v_error_code = "tdsecuA.6.96.1";
         SET v_error_info =  CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","记录序号=",v_row_id),"#",v_mysql_message);
         leave label_pro;
     end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_设置开平仓权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_SetOpenClosePermission;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_SetOpenClosePermission(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
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
    declare v_busi_opor_no int;
    declare v_open_close_permission int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_open_close_permission int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_open_close_permission = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @临时_开平仓权限# = @开平仓权限#; */
    set v_tmp_open_close_permission = v_open_close_permission;

    /* [获取表记录变量][交易证券_T0_操作员阈值设置表][{开平仓权限}][@开平仓权限#][{操作员编号}=@业务操作员编号# and {机构编号} = @机构编号#][4][@业务操作员编号#] */
    select open_close_permission into v_open_close_permission from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no=v_busi_opor_no and co_no = v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.97.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
        end if;
        leave label_pro;
    end if;


    /* if @临时_开平仓权限# <> @开平仓权限#  then */
    if v_tmp_open_close_permission <> v_open_close_permission  then

        /* [更新表记录][交易证券_T0_操作员阈值设置表][{开平仓权限}=@临时_开平仓权限#][{操作员编号}=@业务操作员编号# and {机构编号} = @机构编号#][1][@业务操作员编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, open_close_permission=v_tmp_open_close_permission where opor_no=v_busi_opor_no and co_no = v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.97.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
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

# 原子_交易证券_T0_操作员开平仓权限判断
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_OpenClosePermissionCheck;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_OpenClosePermissionCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_exch_no int,
    IN p_trade_occur_qty decimal(18,2),
    IN p_order_dir int,
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
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_exch_no int;
    declare v_trade_occur_qty decimal(18,2);
    declare v_order_dir int;
    declare v_open_close_permission int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_deal_flag int;
    declare v_lngsht_type int;
    declare v_valid_posi_qty decimal(18,2);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_trade_occur_qty = p_trade_occur_qty;
    SET v_order_dir = p_order_dir;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_deal_flag = 0;
    SET v_lngsht_type = 0;
    SET v_valid_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @处理标志# = 0; */
    set v_deal_flag = 0;
    #订单方向为买，要查之前有没有卖的T0持仓记录；反之查买的持仓记录

    /* if @订单方向# = 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》 then */
    if v_order_dir = 1  or v_order_dir = 5 then

        /* SET @多空类型# = 《多空类型-多头》; */
        SET v_lngsht_type = 1;

    /* elseif @订单方向# = 《订单方向-卖出》 then */
    elseif v_order_dir = 2 then

        /* SET @多空类型# = 《多空类型-空头》; */
        SET v_lngsht_type = 2;
    end if;
    #限制开仓(判断条件，再是否报错)，限制开平仓(报错返回)，不限制或者没有设置(不报错)

    /* if @开平仓权限# = 《开平仓权限-不限制》 then */
    if v_open_close_permission = 0 then

        /* set @处理标志# = 0; */
        set v_deal_flag = 0;

    /* elseif @开平仓权限# = 《开平仓权限-限制开平仓》 then */
    elseif v_open_close_permission = 2 then

        /* set @处理标志# = 1; */
        set v_deal_flag = 1;
    else

        /* 调用【原子_交易证券_T0_获取操作员有效持仓数量】*/
        call db_tdsecu.pra_tdset0_GetOperatorVaildQty(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_busi_opor_no,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_stock_code_no,
            v_stock_acco_no,
            v_exch_no,
            v_lngsht_type,
            v_error_code,
            v_error_info,
            v_valid_posi_qty);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* if @交易变动数量# > @有效持仓数量# then */
            if v_trade_occur_qty > v_valid_posi_qty then

                /* set @处理标志# = 1; */
                set v_deal_flag = 1;
            else

                /* set @处理标志# = 0; */
                set v_deal_flag = 0;
            end if;
        else

            /* set @处理标志# = 1; */
            set v_deal_flag = 1;

            /* set @错误编码#="0"; */
            set v_error_code="0";

            /* set @错误信息#=' '; */
            set v_error_info=' ';
        end if;
    end if;
    #处理标志为1时，会被权限拦截

    /* [检查报错返回][@处理标志# = 1][216][concat("操作员无开仓或开平仓操作权限，开平仓权限=", @开平仓权限#,", 操作员编号=", @操作员编号#)] */
    if v_deal_flag = 1 then
        
        SET v_error_code = "tdsecuA.6.98.216";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员无开仓或开平仓操作权限，开平仓权限=", v_open_close_permission,", 操作员编号=", v_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员无开仓或开平仓操作权限，开平仓权限=", v_open_close_permission,", 操作员编号=", v_opor_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_获取操作员有效持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_GetOperatorVaildQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_GetOperatorVaildQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_exch_no int,
    IN p_lngsht_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_valid_posi_qty decimal(18,2)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_busi_opor_no int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_exch_no int;
    declare v_lngsht_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_valid_posi_qty decimal(18,2);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_valid_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* if @多空类型# = 《多空类型-多头》 then */
    if v_lngsht_type = 1 then

        /* [锁定获取表记录变量][交易证券_T0_证券持仓汇总表][{总空头当前数量}-{总空头平仓数量}][@有效持仓数量#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][4][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
        select total_short_curr_qty-total_short_close_posi_qty into v_valid_posi_qty from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.6.99.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    else

        /* [锁定获取表记录变量][交易证券_T0_证券持仓汇总表][{总多头当前数量}-{总多头平仓数量}][@有效持仓数量#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {股东代码编号}=@股东代码编号# and {证券代码编号}=@证券代码编号#][4][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
        select total_long_curr_qty-total_long_close_posi_qty into v_valid_posi_qty from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_acco_no=v_stock_acco_no and stock_code_no=v_stock_code_no limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.6.99.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_valid_posi_qty = v_valid_posi_qty;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_单笔资金和数量限额校验
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_SingleAmtQtyCheck;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_SingleAmtQtyCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_co_no int,
    IN p_order_qty decimal(18,2),
    IN p_order_frozen_amt decimal(18,4),
    IN p_order_dir int,
    IN p_order_ctrl_qty decimal(18,2),
    IN p_order_ctrl_amt decimal(18,4),
    IN p_per_secu_posi_ratio decimal(18,12),
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
    declare v_busi_opor_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_co_no int;
    declare v_order_qty decimal(18,2);
    declare v_order_frozen_amt decimal(18,4);
    declare v_order_dir int;
    declare v_order_ctrl_qty decimal(18,2);
    declare v_order_ctrl_amt decimal(18,4);
    declare v_per_secu_posi_ratio decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_co_no = p_co_no;
    SET v_order_qty = p_order_qty;
    SET v_order_frozen_amt = p_order_frozen_amt;
    SET v_order_dir = p_order_dir;
    SET v_order_ctrl_qty = p_order_ctrl_qty;
    SET v_order_ctrl_amt = p_order_ctrl_amt;
    SET v_per_secu_posi_ratio = p_per_secu_posi_ratio;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_source_stock_qty = 0;
    SET v_single_limit_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;

    
    label_pro:BEGIN
    
    #单笔数量和单笔金额控制为0，代表不控制

    /* [检查报错返回][@单笔数量控制# >0 and @订单数量# >@单笔数量控制#][774][concat("订单数量大于操作员阈值设置的单笔数量控制，操作员编号=", @业务操作员编号#,", 单笔数量控制=", @单笔数量控制#)] */
    if v_order_ctrl_qty >0 and v_order_qty >v_order_ctrl_qty then
        
        SET v_error_code = "tdsecuA.6.101.774";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单数量大于操作员阈值设置的单笔数量控制，操作员编号=", v_busi_opor_no,", 单笔数量控制=", v_order_ctrl_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单数量大于操作员阈值设置的单笔数量控制，操作员编号=", v_busi_opor_no,", 单笔数量控制=", v_order_ctrl_qty);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@单笔金额控制# >0 and @订单冻结金额# >@单笔金额控制#][774][concat("订单金额大于操作员阈值设置的单笔金额控制，操作员编号=", @业务操作员编号#,", 单笔金额控制=", @单笔金额控制#)] */
    if v_order_ctrl_amt >0 and v_order_frozen_amt >v_order_ctrl_amt then
        
        SET v_error_code = "tdsecuA.6.101.774";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单金额大于操作员阈值设置的单笔金额控制，操作员编号=", v_busi_opor_no,", 单笔金额控制=", v_order_ctrl_amt),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单金额大于操作员阈值设置的单笔金额控制，操作员编号=", v_busi_opor_no,", 单笔金额控制=", v_order_ctrl_amt);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][{券源数量},{单笔限额数量},{交易释放数量},{交易占用数量},{成交释放数量},{成交占用数量}][@券源数量#,@单笔限额数量#,@交易释放数量#,@交易占用数量#,@成交释放数量#,@成交占用数量#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#] */
    select source_stock_qty,single_limit_qty,trade_releas_qty,trade_capt_qty,strike_releas_qty,strike_capt_qty into v_source_stock_qty,v_single_limit_qty,v_trade_releas_qty,v_trade_capt_qty,v_strike_releas_qty,v_strike_capt_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;

    #单笔限额数量为0，代表不控制

    /* [检查报错返回][@券源数量#>0 and @单笔限额数量#>0 and @订单数量# >@单笔限额数量#][774][concat("订单数量大于操作员券源设置的单笔限额设置，操作员编号=", @业务操作员编号#,", 单笔限额数量=", @单笔限额数量#,", 交易组编号=", @交易组编号#)] */
    if v_source_stock_qty>0 and v_single_limit_qty>0 and v_order_qty >v_single_limit_qty then
        
        SET v_error_code = "tdsecuA.6.101.774";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("订单数量大于操作员券源设置的单笔限额设置，操作员编号=", v_busi_opor_no,", 单笔限额数量=", v_single_limit_qty,", 交易组编号=", v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("订单数量大于操作员券源设置的单笔限额设置，操作员编号=", v_busi_opor_no,", 单笔限额数量=", v_single_limit_qty,", 交易组编号=", v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    #单笔持仓比例判断

    /* [检查报错返回][@券源数量#>0 and @单券持仓比例#>0 and (@订单数量#+@交易释放数量#-@交易占用数量#+@成交释放数量#-@成交占用数量#)/@券源数量# >@单券持仓比例#][774][concat("持仓比例大于操作员券源设置的单券持仓比例，操作员编号=", @业务操作员编号#,", 单券持仓比例=", @单券持仓比例#,", 交易组编号=", @交易组编号#)] */
    if v_source_stock_qty>0 and v_per_secu_posi_ratio>0 and (v_order_qty+v_trade_releas_qty-v_trade_capt_qty+v_strike_releas_qty-v_strike_capt_qty)/v_source_stock_qty >v_per_secu_posi_ratio then
        
        SET v_error_code = "tdsecuA.6.101.774";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("持仓比例大于操作员券源设置的单券持仓比例，操作员编号=", v_busi_opor_no,", 单券持仓比例=", v_per_secu_posi_ratio,", 交易组编号=", v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("持仓比例大于操作员券源设置的单券持仓比例，操作员编号=", v_busi_opor_no,", 单券持仓比例=", v_per_secu_posi_ratio,", 交易组编号=", v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_计算T0券源持仓资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_CalcT0SourcePosiCapitalAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_CalcT0SourcePosiCapitalAvail(
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
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_order_dir int,
    IN p_co_busi_config_str varchar(64),
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
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_order_dir int;
    declare v_co_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_T0_limit_method int;
    declare v_row_id bigint;
    declare v_source_stock_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_diff_qty decimal(18,2);
    declare v_buy_avail_qty decimal(18,2);
    declare v_sell_avail_qty decimal(18,2);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_tmp_curr_amt decimal(18,4);
    declare v_tmp_frozen_amt decimal(18,4);
    declare v_tmp_trade_capt_amt decimal(18,4);
    declare v_tmp_trade_releas_amt decimal(18,4);
    declare v_tmp_strike_capt_amt decimal(18,4);
    declare v_tmp_strike_releas_amt decimal(18,4);
    declare v_tmp_avail_amt decimal(18,4);

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
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_T0_limit_method = 0;
    SET v_row_id = 0;
    SET v_source_stock_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_diff_qty = 0;
    SET v_buy_avail_qty = 0;
    SET v_sell_avail_qty = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_avail_amt = 0;
    SET v_tmp_curr_amt = 0;
    SET v_tmp_frozen_amt = 0;
    SET v_tmp_trade_capt_amt = 0;
    SET v_tmp_trade_releas_amt = 0;
    SET v_tmp_strike_capt_amt = 0;
    SET v_tmp_strike_releas_amt = 0;
    SET v_tmp_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][{记录序号},{券源数量},{交易释放数量},{交易占用数量},{成交释放数量},{成交占用数量},{隔夜仓强平交易卖出数量},{数量差额}][@记录序号#, @券源数量#,@交易释放数量#,@交易占用数量#,@成交释放数量#,@成交占用数量#,@隔夜仓强平交易卖出数量#,@数量差额#][{操作员编号} = @操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号}=@股东代码编号# ] */
    select row_id,source_stock_qty,trade_releas_qty,trade_capt_qty,strike_releas_qty,strike_capt_qty,over_night_trade_sell_qty,diff_qty into v_row_id, v_source_stock_qty,v_trade_releas_qty,v_trade_capt_qty,v_strike_releas_qty,v_strike_capt_qty,v_over_night_trade_sell_qty,v_diff_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no = v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no=v_stock_acco_no  limit 1;

    if FOUND_ROWS() <> 0 then

        /* if @T0限额方式# = 《T0限额方式-限额》 then */
        if v_T0_limit_method = 1 then

            /* set @买入可用数量# = IFNULL(@券源数量#,0) - IFNULL(@交易释放数量#,0) - IFNULL(@成交释放数量#,0); */
            set v_buy_avail_qty = IFNULL(v_source_stock_qty,0) - IFNULL(v_trade_releas_qty,0) - IFNULL(v_strike_releas_qty,0);

            /* set @卖出可用数量# = IFNULL(@券源数量#,0) - IFNULL(@交易占用数量#,0) - IFNULL(@成交占用数量#,0); */
            set v_sell_avail_qty = IFNULL(v_source_stock_qty,0) - IFNULL(v_trade_capt_qty,0) - IFNULL(v_strike_capt_qty,0);

        /* elseif @T0限额方式# = 《T0限额方式-不限额》 then */
        elseif v_T0_limit_method = 0 then

            /* set @买入可用数量# = IFNULL(@券源数量#,0) - IFNULL(@交易释放数量#,0) - IFNULL(@成交释放数量#,0) + IFNULL(@数量差额#,0) - IFNULL(@隔夜仓强平交易卖出数量#,0); */
            set v_buy_avail_qty = IFNULL(v_source_stock_qty,0) - IFNULL(v_trade_releas_qty,0) - IFNULL(v_strike_releas_qty,0) + IFNULL(v_diff_qty,0) - IFNULL(v_over_night_trade_sell_qty,0);

            /* set @卖出可用数量# = IFNULL(@券源数量#,0) - IFNULL(@交易占用数量#,0) - IFNULL(@成交占用数量#,0) + IFNULL(@数量差额#,0) - IFNULL(@隔夜仓强平交易卖出数量#,0); */
            set v_sell_avail_qty = IFNULL(v_source_stock_qty,0) - IFNULL(v_trade_capt_qty,0) - IFNULL(v_strike_capt_qty,0) + IFNULL(v_diff_qty,0) - IFNULL(v_over_night_trade_sell_qty,0);
        end if;
    end if;

    /* [检查报错返回][@券源数量#= 0][4][concat("该操作员未分配券源！操作员编号:",@操作员编号#,"|交易组编号:",@交易组编号#,"|资产账户编号:",@资产账户编号#,"|证券代码编号:",@证券代码编号#,"|股东代码编号:",@股东代码编号#)] */
    if v_source_stock_qty= 0 then
        
        SET v_error_code = "tdsecuA.6.102.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("该操作员未分配券源！操作员编号:",v_opor_no,"|交易组编号:",v_exch_group_no,"|资产账户编号:",v_asset_acco_no,"|证券代码编号:",v_stock_code_no,"|股东代码编号:",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("该操作员未分配券源！操作员编号:",v_opor_no,"|交易组编号:",v_exch_group_no,"|资产账户编号:",v_asset_acco_no,"|证券代码编号:",v_stock_code_no,"|股东代码编号:",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单方向#= 《订单方向-买入》 and  (@买入可用数量# < 0 or @券源数量# = 0)][765][@买入可用数量#,@券源数量#,@交易释放数量#,@成交释放数量#] */
    if v_order_dir= 1 and  (v_buy_avail_qty < 0 or v_source_stock_qty = 0) then
        
        SET v_error_code = "tdsecuA.6.102.765";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("买入可用数量=",v_buy_avail_qty,",","券源数量=",v_source_stock_qty,",","交易释放数量=",v_trade_releas_qty,",","成交释放数量=",v_strike_releas_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("买入可用数量=",v_buy_avail_qty,",","券源数量=",v_source_stock_qty,",","交易释放数量=",v_trade_releas_qty,",","成交释放数量=",v_strike_releas_qty);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@订单方向#= 《订单方向-卖出》 and  (@卖出可用数量# < 0 or @券源数量# = 0) ][766][@卖出可用数量#,@券源数量#,@交易占用数量#,@成交占用数量#] */
    if v_order_dir= 2 and  (v_sell_avail_qty < 0 or v_source_stock_qty = 0)  then
        
        SET v_error_code = "tdsecuA.6.102.766";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("卖出可用数量=",v_sell_avail_qty,",","券源数量=",v_source_stock_qty,",","交易占用数量=",v_trade_capt_qty,",","成交占用数量=",v_strike_capt_qty),"#",v_mysql_message);
        else
            SET v_error_info = concat("卖出可用数量=",v_sell_avail_qty,",","券源数量=",v_source_stock_qty,",","交易占用数量=",v_trade_capt_qty,",","成交占用数量=",v_strike_capt_qty);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][交易证券_T0_操作员阈值设置表][{当前金额},{冻结金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额}][@当前金额#,@冻结金额#, @交易占用金额#,@交易释放金额#,@成交占用金额#,@成交释放金额#][{操作员编号} = @操作员编号#] */
    select curr_amt,frozen_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt into v_curr_amt,v_frozen_amt, v_trade_capt_amt,v_trade_releas_amt,v_strike_capt_amt,v_strike_releas_amt from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no = v_opor_no limit 1;

    if FOUND_ROWS() <> 0 then

        /* set @可用金额# = IFNULL(@当前金额#,0) - IFNULL(@冻结金额#,0) - IFNULL(@交易占用金额#,0) - IFNULL(@成交占用金额#,0) + IFNULL(@成交释放金额#,0); */
        set v_avail_amt = IFNULL(v_curr_amt,0) - IFNULL(v_frozen_amt,0) - IFNULL(v_trade_capt_amt,0) - IFNULL(v_strike_capt_amt,0) + IFNULL(v_strike_releas_amt,0);
    end if;
    #当前金额为0 报错待注释掉。

    /* [检查报错返回][(@订单方向#= 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》) and  @可用金额# <= 0][711][@可用金额#,@当前金额#,@冻结金额#,@交易占用金额#,@成交占用金额#,@成交释放金额#] */
    if (v_order_dir= 1  or v_order_dir = 5) and  v_avail_amt <= 0 then
        
        SET v_error_code = "tdsecuA.6.102.711";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("可用金额=",v_avail_amt,",","当前金额=",v_curr_amt,",","冻结金额=",v_frozen_amt,",","交易占用金额=",v_trade_capt_amt,",","成交占用金额=",v_strike_capt_amt,",","成交释放金额=",v_strike_releas_amt),"#",v_mysql_message);
        else
            SET v_error_info = concat("可用金额=",v_avail_amt,",","当前金额=",v_curr_amt,",","冻结金额=",v_frozen_amt,",","交易占用金额=",v_trade_capt_amt,",","成交占用金额=",v_strike_capt_amt,",","成交释放金额=",v_strike_releas_amt);
        end if;
        leave label_pro;
    end if;

    #modify by wjp 20181026 T0增加交易组资金判断。

    /* [获取表记录变量语句][交易证券_T0_交易组业务资金表][{当前金额},{冻结金额},{交易占用金额},{交易释放金额},{成交占用金额},{成交释放金额}][@临时_当前金额#,@临时_冻结金额#, @临时_交易占用金额#,@临时_交易释放金额#,@临时_成交占用金额#,@临时_成交释放金额#][{操作员编号} = @操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}="CNY"] */
    select curr_amt,frozen_amt,trade_capt_amt,trade_releas_amt,strike_capt_amt,strike_releas_amt into v_tmp_curr_amt,v_tmp_frozen_amt, v_tmp_trade_capt_amt,v_tmp_trade_releas_amt,v_tmp_strike_capt_amt,v_tmp_strike_releas_amt from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no = v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type="CNY" limit 1;

    if FOUND_ROWS() <> 0 then

        /* set @临时_可用金额# = IFNULL(@临时_当前金额#,0) - IFNULL(@临时_冻结金额#,0) - IFNULL(@临时_交易占用金额#,0) - IFNULL(@临时_成交占用金额#,0) + IFNULL(@临时_成交释放金额#,0); */
        set v_tmp_avail_amt = IFNULL(v_tmp_curr_amt,0) - IFNULL(v_tmp_frozen_amt,0) - IFNULL(v_tmp_trade_capt_amt,0) - IFNULL(v_tmp_strike_capt_amt,0) + IFNULL(v_tmp_strike_releas_amt,0);

        /* [检查报错返回][(@订单方向#= 《订单方向-买入》  or @订单方向# = 《订单方向-融资买入》) and  @临时_可用金额# <= 0][711][@临时_可用金额#,@临时_当前金额#,@临时_冻结金额#,@临时_交易占用金额#,@临时_成交占用金额#,@临时_成交释放金额#] */
        if (v_order_dir= 1  or v_order_dir = 5) and  v_tmp_avail_amt <= 0 then
            
            SET v_error_code = "tdsecuA.6.102.711";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("临时_可用金额=",v_tmp_avail_amt,",","临时_当前金额=",v_tmp_curr_amt,",","临时_冻结金额=",v_tmp_frozen_amt,",","临时_交易占用金额=",v_tmp_trade_capt_amt,",","临时_成交占用金额=",v_tmp_strike_capt_amt,",","临时_成交释放金额=",v_tmp_strike_releas_amt),"#",v_mysql_message);
            else
                SET v_error_info = concat("临时_可用金额=",v_tmp_avail_amt,",","临时_当前金额=",v_tmp_curr_amt,",","临时_冻结金额=",v_tmp_frozen_amt,",","临时_交易占用金额=",v_tmp_trade_capt_amt,",","临时_成交占用金额=",v_tmp_strike_capt_amt,",","临时_成交释放金额=",v_tmp_strike_releas_amt);
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

# 原子_交易证券_T0_锁定获取持仓明细记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_LockGetPosiDetail;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_LockGetPosiDetail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_detail_posi_id bigint,
    OUT p_busi_opor_no int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_code varchar(6),
    OUT p_stock_acco_no int,
    OUT p_stock_code_no int,
    OUT p_lngsht_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_open_posi_date int,
    OUT p_open_posi_time int,
    OUT p_open_posi_price decimal(16,9),
    OUT p_open_posi_value decimal(18,4),
    OUT p_open_posi_fee decimal(18,4),
    OUT p_close_posi_qty decimal(18,2),
    OUT p_close_posi_date int,
    OUT p_close_posi_time int,
    OUT p_close_posi_market_value decimal(18,4),
    OUT p_close_posi_fee decimal(18,4),
    OUT p_strike_no varchar(64),
    OUT p_realize_pandl decimal(18,4),
    OUT p_over_night_pandl decimal(18,4),
    OUT p_posi_status varchar(2)
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][交易证券_T0_证券持仓明细表][字段][字段变量][{记录序号} > @记录序号# order by {记录序号}][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        lngsht_type, curr_qty, open_posi_date, open_posi_time, 
        open_posi_price, open_posi_value, open_posi_fee, close_posi_qty, 
        close_posi_date, close_posi_time, close_posi_market_value, close_posi_fee, 
        strike_no, realize_pandl, over_night_pandl, posi_status, 
        remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_no, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_code, v_stock_acco_no, v_stock_code_no, 
        v_lngsht_type, v_curr_qty, v_open_posi_date, v_open_posi_time, 
        v_open_posi_price, v_open_posi_value, v_open_posi_fee, v_close_posi_qty, 
        v_close_posi_date, v_close_posi_time, v_close_posi_market_value, v_close_posi_fee, 
        v_strike_no, v_realize_pandl, v_over_night_pandl, v_posi_status, 
        v_remark_info from db_tdsecu.tb_tdset0_stock_posi_detail where row_id > v_row_id order by row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.103.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;

    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_detail_posi_id = v_detail_posi_id;
    SET p_busi_opor_no = v_busi_opor_no;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_code = v_stock_code;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_curr_qty = v_curr_qty;
    SET p_open_posi_date = v_open_posi_date;
    SET p_open_posi_time = v_open_posi_time;
    SET p_open_posi_price = v_open_posi_price;
    SET p_open_posi_value = v_open_posi_value;
    SET p_open_posi_fee = v_open_posi_fee;
    SET p_close_posi_qty = v_close_posi_qty;
    SET p_close_posi_date = v_close_posi_date;
    SET p_close_posi_time = v_close_posi_time;
    SET p_close_posi_market_value = v_close_posi_market_value;
    SET p_close_posi_fee = v_close_posi_fee;
    SET p_strike_no = v_strike_no;
    SET p_realize_pandl = v_realize_pandl;
    SET p_over_night_pandl = v_over_night_pandl;
    SET p_posi_status = v_posi_status;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_查询所有持仓汇总
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryAllSumPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryAllSumPosi(
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][交易证券_T0_证券持仓汇总表][字段][(@操作员编号# = 0 or {操作员编号} = @操作员编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@操作员机构编号# = 0 or @机构编号#=@操作员机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) ][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        total_long_curr_qty, total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, 
        total_long_open_posi_fee, total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, 
        total_long_close_posi_qty, total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, 
        total_realize_pandl, long_curr_qty, short_curr_qty, long_open_posi_value, 
        short_open_posi_value, long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, 
        short_close_posi_qty, long_close_posi_value, short_close_posi_value, long_close_posi_fee, 
        short_close_posi_fee, realize_pandl, over_night_pandl, open_posi_date, 
        open_posi_time from db_tdsecu.tb_tdset0_stock_posi_sum where (v_opor_no = 0 or opor_no = v_opor_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_opor_co_no = 0 or v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) ;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_code, stock_acco_no, stock_code_no, 
        total_long_curr_qty, total_short_curr_qty, total_long_open_posi_value, total_short_open_posi_value, 
        total_long_open_posi_fee, total_short_open_posi_fee, total_long_close_posi_value, total_short_close_posi_value, 
        total_long_close_posi_qty, total_short_close_posi_qty, total_long_close_posi_fee, total_short_close_posi_fee, 
        total_realize_pandl, long_curr_qty, short_curr_qty, long_open_posi_value, 
        short_open_posi_value, long_open_posi_fee, short_open_posi_fee, long_close_posi_qty, 
        short_close_posi_qty, long_close_posi_value, short_close_posi_value, long_close_posi_fee, 
        short_close_posi_fee, realize_pandl, over_night_pandl, open_posi_date, 
        open_posi_time from db_tdsecu.tb_tdset0_stock_posi_sum where (v_opor_no = 0 or opor_no = v_opor_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_opor_co_no = 0 or v_co_no=v_opor_co_no)  and (v_pd_no=0 or pd_no=v_pd_no)  limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_增强交易平仓可用校验
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_ClosePosiAvailCheck;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_ClosePosiAvailCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_co_no int,
    IN p_order_qty decimal(18,2),
    IN p_order_dir int,
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
    declare v_busi_opor_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_co_no int;
    declare v_order_qty decimal(18,2);
    declare v_order_dir int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_avail_closed_posi_qty decimal(18,2);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_co_no = p_co_no;
    SET v_order_qty = p_order_qty;
    SET v_order_dir = p_order_dir;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_source_stock_qty = 0;
    SET v_single_limit_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_avail_closed_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][{券源数量},{单笔限额数量},{交易释放数量},{交易占用数量},{成交释放数量},{成交占用数量}][@券源数量#,@单笔限额数量#,@交易释放数量#,@交易占用数量#,@成交释放数量#,@成交占用数量#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号#] */
    select source_stock_qty,single_limit_qty,trade_releas_qty,trade_capt_qty,strike_releas_qty,strike_capt_qty into v_source_stock_qty,v_single_limit_qty,v_trade_releas_qty,v_trade_capt_qty,v_strike_releas_qty,v_strike_capt_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no limit 1;


    /* set @可平数量# = 0; */
    set v_avail_closed_posi_qty = 0;

    /* if @订单方向# = 《订单方向-买入》 then */
    if v_order_dir = 1 then

        /* set @可平数量# = @成交占用数量#-@成交释放数量#-@交易释放数量#; */
        set v_avail_closed_posi_qty = v_strike_capt_qty-v_strike_releas_qty-v_trade_releas_qty;

        /* [检查报错返回][@订单数量#>@可平数量#][641][concat("订单数量=", @订单数量#,", 可平数量=", @可平数量#,",证券代码编号=",@证券代码编号#,",操作员编号=",@业务操作员编号#)] */
        if v_order_qty>v_avail_closed_posi_qty then
            
            SET v_error_code = "tdsecuA.6.106.641";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=", v_order_qty,", 可平数量=", v_avail_closed_posi_qty,",证券代码编号=",v_stock_code_no,",操作员编号=",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=", v_order_qty,", 可平数量=", v_avail_closed_posi_qty,",证券代码编号=",v_stock_code_no,",操作员编号=",v_busi_opor_no);
            end if;
            leave label_pro;
        end if;

    else

        /* set @可平数量# = @成交释放数量#-@成交占用数量#-@交易占用数量#; */
        set v_avail_closed_posi_qty = v_strike_releas_qty-v_strike_capt_qty-v_trade_capt_qty;

        /* [检查报错返回][@订单数量#>@可平数量#][641][concat("订单数量=", @订单数量#,", 可平数量=", @可平数量#,",证券代码编号=",@证券代码编号#,",操作员编号=",@业务操作员编号#)] */
        if v_order_qty>v_avail_closed_posi_qty then
            
            SET v_error_code = "tdsecuA.6.106.641";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("订单数量=", v_order_qty,", 可平数量=", v_avail_closed_posi_qty,",证券代码编号=",v_stock_code_no,",操作员编号=",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("订单数量=", v_order_qty,", 可平数量=", v_avail_closed_posi_qty,",证券代码编号=",v_stock_code_no,",操作员编号=",v_busi_opor_no);
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

# 原子_交易证券_T0_计算设置开平仓权限
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_CalcSetOpenClosePermission;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_CalcSetOpenClosePermission(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
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
    declare v_busi_opor_no int;
    declare v_open_close_permission int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_open_close_permission int;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_open_close_permission = p_open_close_permission;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_open_close_permission = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @临时_开平仓权限# = @开平仓权限#; */
    set v_tmp_open_close_permission = v_open_close_permission;

    /* [获取表记录变量][交易证券_T0_操作员阈值设置表][{开平仓权限}][@开平仓权限#][{操作员编号}=@业务操作员编号# and {机构编号} = @机构编号#][4][@业务操作员编号#] */
    select open_close_permission into v_open_close_permission from db_tdsecu.tb_tdset0_opor_tshold_set where opor_no=v_busi_opor_no and co_no = v_co_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.107.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
        end if;
        leave label_pro;
    end if;


    /* if @临时_开平仓权限#  > @开平仓权限#  then */
    if v_tmp_open_close_permission  > v_open_close_permission  then

        /* [更新表记录][交易证券_T0_操作员阈值设置表][{开平仓权限}=@临时_开平仓权限#][{操作员编号}=@业务操作员编号# and {机构编号} = @机构编号#][1][@业务操作员编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, open_close_permission=v_tmp_open_close_permission where opor_no=v_busi_opor_no and co_no = v_co_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.107.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
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

# 原子_交易证券_T0_券源划转
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_StockSourceTransfer;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_StockSourceTransfer(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_target_opor_no int,
    IN p_occur_qty decimal(18,2),
    IN p_co_busi_config_str varchar(64),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_stock_code_no int,
    OUT p_stock_acco_no int,
    OUT p_busi_opor_no int
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
    declare v_target_opor_no int;
    declare v_occur_qty decimal(18,2);
    declare v_co_busi_config_str varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_busi_opor_no int;
    declare v_tmp_opor_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_begin_qty decimal(18,2);
    declare v_source_stock_qty decimal(18,2);
    declare v_single_limit_qty decimal(18,2);
    declare v_assigned_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_total_realize_pandl decimal(18,4);
    declare v_over_night_pandl decimal(18,4);
    declare v_sum_realize_pandl decimal(18,4);
    declare v_total_open_posi_fee decimal(18,4);
    declare v_total_close_posi_fee decimal(18,4);
    declare v_out_order_releas_qty decimal(18,2);
    declare v_out_order_capt_qty decimal(18,2);
    declare v_out_strike_releas_qty decimal(18,2);
    declare v_out_strike_capt_qty decimal(18,2);
    declare v_over_night_trade_buy_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_over_night_strike_sell_qty decimal(18,2);
    declare v_diff_qty decimal(18,2);
    declare v_t0_buy_type int;
    declare v_remark_info varchar(255);
    declare v_tmp_busi_opor_no int;
    declare v_source_stock_occur_qty decimal(18,2);
    declare v_single_limit_occur_qty decimal(18,2);
    declare v_single_limit_occur_end_qty decimal(18,2);
    declare v_assigned_occur_qty decimal(18,2);
    declare v_assigned_occur_end_qty decimal(18,2);
    declare v_T0_limit_method int;
    declare v_buy_avail_qty decimal(18,2);
    declare v_sell_avail_qty decimal(18,2);
    declare v_source_stock_occur_end_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_tmp_begin_qty decimal(18,2);

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
    SET v_target_opor_no = p_target_opor_no;
    SET v_occur_qty = p_occur_qty;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_acco_no = 0;
    SET v_busi_opor_no = 0;
    SET v_tmp_opor_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_stock_code = " ";
    SET v_exch_no = 0;
    SET v_begin_qty = 0;
    SET v_source_stock_qty = 0;
    SET v_single_limit_qty = 0;
    SET v_assigned_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_total_realize_pandl = 0;
    SET v_over_night_pandl = 0;
    SET v_sum_realize_pandl = 0;
    SET v_total_open_posi_fee = 0;
    SET v_total_close_posi_fee = 0;
    SET v_out_order_releas_qty = 0;
    SET v_out_order_capt_qty = 0;
    SET v_out_strike_releas_qty = 0;
    SET v_out_strike_capt_qty = 0;
    SET v_over_night_trade_buy_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_over_night_strike_sell_qty = 0;
    SET v_diff_qty = 0;
    SET v_t0_buy_type = 0;
    SET v_remark_info = " ";
    SET v_tmp_busi_opor_no = 0;
    SET v_source_stock_occur_qty = 0;
    SET v_single_limit_occur_qty = 0;
    SET v_single_limit_occur_end_qty = 0;
    SET v_assigned_occur_qty = 0;
    SET v_assigned_occur_end_qty = 0;
    SET v_T0_limit_method = 0;
    SET v_buy_avail_qty = 0;
    SET v_sell_avail_qty = 0;
    SET v_source_stock_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_tmp_begin_qty = 0;

    
    label_pro:BEGIN
    

    /* set @临时_操作员编号# = @操作员编号#; */
    set v_tmp_opor_no = v_opor_no;

    /* [锁定获取表记录变量][交易证券_T0_操作员券源设置表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        begin_qty, source_stock_qty, single_limit_qty, assigned_qty, 
        trade_releas_qty, trade_capt_qty, strike_releas_qty, strike_capt_qty, 
        total_realize_pandl, over_night_pandl, sum_realize_pandl, total_open_posi_fee, 
        total_close_posi_fee, out_order_releas_qty, out_order_capt_qty, out_strike_releas_qty, 
        out_strike_capt_qty, over_night_trade_buy_qty, over_night_trade_sell_qty, over_night_strike_sell_qty, 
        diff_qty, t0_buy_type, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_opor_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_stock_acco_no, v_stock_code_no, v_stock_code, v_exch_no, 
        v_begin_qty, v_source_stock_qty, v_single_limit_qty, v_assigned_qty, 
        v_trade_releas_qty, v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, 
        v_total_realize_pandl, v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, 
        v_total_close_posi_fee, v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, 
        v_out_strike_capt_qty, v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, 
        v_diff_qty, v_t0_buy_type, v_remark_info from db_tdsecu.tb_tdset0_opor_stock_source where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.108.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @业务操作员编号# = @操作员编号#; */
    set v_busi_opor_no = v_opor_no;

    /* set @临时_业务操作员编号# = @业务操作员编号#; */
    set v_tmp_busi_opor_no = v_busi_opor_no;
    #记录券源划出流水

    /* set @券源变动数量#= -@变动数量#; */
    set v_source_stock_occur_qty= -v_occur_qty;

    /* set @单笔限额变动数量#= 0; */
    set v_single_limit_occur_qty= 0;

    /* set @变动后单笔限额数量#= @单笔限额数量#; */
    set v_single_limit_occur_end_qty= v_single_limit_qty;

    /* set @已分配变动数量# = 0; */
    set v_assigned_occur_qty = 0;

    /* set @变动后已分配数量# =@已分配数量#; */
    set v_assigned_occur_end_qty =v_assigned_qty;

    /* set @T0限额方式# = substring(@机构业务控制配置串#, 23, 1); */
    set v_T0_limit_method = substring(v_co_busi_config_str, 23, 1);

    /* if @T0限额方式# = 《T0限额方式-限额》 then */
    if v_T0_limit_method = 1 then

        /* set @买入可用数量# =@券源数量# - @交易释放数量# - @成交释放数量#; */
        set v_buy_avail_qty =v_source_stock_qty - v_trade_releas_qty - v_strike_releas_qty;

        /* set @卖出可用数量# = @券源数量# - @交易占用数量# - @成交占用数量# ; */
        set v_sell_avail_qty = v_source_stock_qty - v_trade_capt_qty - v_strike_capt_qty ;
    else

        /* if @数量差额# >0 then */
        if v_diff_qty >0 then

            /* set @买入可用数量# =@券源数量# - @交易释放数量# - @成交释放数量#- @数量差额#; */
            set v_buy_avail_qty =v_source_stock_qty - v_trade_releas_qty - v_strike_releas_qty- v_diff_qty;

            /* set @卖出可用数量# = @券源数量# - @交易占用数量# - @成交占用数量# ; */
            set v_sell_avail_qty = v_source_stock_qty - v_trade_capt_qty - v_strike_capt_qty ;

        /* elseif  @数量差额# < 0 then */
        elseif  v_diff_qty < 0 then

            /* set @卖出可用数量# = @券源数量# - @交易占用数量# - @成交占用数量# +@数量差额# ; */
            set v_sell_avail_qty = v_source_stock_qty - v_trade_capt_qty - v_strike_capt_qty +v_diff_qty ;

            /* set @买入可用数量# =@券源数量# - @交易释放数量# - @成交释放数量#; */
            set v_buy_avail_qty =v_source_stock_qty - v_trade_releas_qty - v_strike_releas_qty;
        else

            /* set @买入可用数量# =@券源数量# - @交易释放数量# - @成交释放数量#; */
            set v_buy_avail_qty =v_source_stock_qty - v_trade_releas_qty - v_strike_releas_qty;

            /* set @卖出可用数量# = @券源数量# - @交易占用数量# - @成交占用数量# ; */
            set v_sell_avail_qty = v_source_stock_qty - v_trade_capt_qty - v_strike_capt_qty ;
        end if;
    end if;
    #暂时放开控制 Modify by wjp 20181018
    #[检查报错返回][@变动数量# > @买入可用数量# or @变动数量# > @卖出可用数量#][803][@记录序号#,@变动数量#]

    /* [更新表记录][交易证券_T0_操作员券源设置表][{券源数量} = {券源数量} - @变动数量#][{记录序号}=@记录序号#][1][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, source_stock_qty = source_stock_qty - v_occur_qty where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.108.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][交易证券_T0_操作员券源设置表][{券源数量}][@券源数量#][{记录序号}=@记录序号#][4][@记录序号#] */
    select source_stock_qty into v_source_stock_qty from db_tdsecu.tb_tdset0_opor_stock_source where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.108.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @变动后券源数量#=@券源数量#; */
    set v_source_stock_occur_end_qty=v_source_stock_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "操作员券源划出"; */
    set v_oper_remark_info = "操作员券源划出";

    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* [插入表记录][交易证券_T0_操作员券源设置流水表][字段][字段变量][5][@初始化日期#,@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_opor_stock_source_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, oper_mac, 
        oper_ip_addr, oper_info, oper_way, oper_menu_no, 
        oper_func_code, init_date, co_no, busi_opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, source_stock_occur_qty, 
        source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, assigned_occur_qty, 
        assigned_occur_end_qty, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_oper_mac, 
        v_oper_ip_addr, v_oper_info, v_oper_way, v_oper_menu_no, 
        v_oper_func_code, v_init_date, v_co_no, v_busi_opor_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_source_stock_occur_qty, 
        v_source_stock_occur_end_qty, v_single_limit_occur_qty, v_single_limit_occur_end_qty, v_assigned_occur_qty, 
        v_assigned_occur_end_qty, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.108.5";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #划入方操作

    /* set @操作员编号# = @目标操作员编号#; */
    set v_opor_no = v_target_opor_no;

    /* set @券源数量# = @变动数量#; */
    set v_source_stock_qty = v_occur_qty;
    #记录券源划入流水

    /* set @券源变动数量# = @变动数量#; */
    set v_source_stock_occur_qty = v_occur_qty;

    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @已分配数量# = 0; */
    set v_assigned_qty = 0;
    #set @初始化日期# = 0;

    /* set @交易释放数量# = 0; */
    set v_trade_releas_qty = 0;

    /* set @交易占用数量# = 0; */
    set v_trade_capt_qty = 0;

    /* set @成交释放数量# = 0; */
    set v_strike_releas_qty = 0;

    /* set @成交占用数量# = 0; */
    set v_strike_capt_qty = 0;

    /* set @总实现盈亏# = 0; */
    set v_total_realize_pandl = 0;

    /* set @总开仓费用# = 0; */
    set v_total_open_posi_fee = 0;

    /* set @总平仓费用# = 0; */
    set v_total_close_posi_fee = 0;

    /* set @外部交易释放数量# = 0; */
    set v_out_order_releas_qty = 0;

    /* set @外部交易占用数量# = 0; */
    set v_out_order_capt_qty = 0;

    /* set @外部成交释放数量# = 0; */
    set v_out_strike_releas_qty = 0;

    /* set @外部成交占用数量# = 0; */
    set v_out_strike_capt_qty = 0;

    /* set @隔夜仓强平交易买入数量# = 0; */
    set v_over_night_trade_buy_qty = 0;

    /* set @隔夜仓强平交易卖出数量# = 0; */
    set v_over_night_trade_sell_qty = 0;

    /* set @隔夜仓强平成交卖出数量# = 0; */
    set v_over_night_strike_sell_qty = 0;

    /* set @隔夜盈亏# = 0; */
    set v_over_night_pandl = 0;

    /* set @累计实现盈亏# = 0; */
    set v_sum_realize_pandl = 0;

    /* set @数量差额# = 0; */
    set v_diff_qty = 0;

    /* [插入重复更新][交易证券_T0_操作员券源设置表][字段][字段变量][{券源数量}= {券源数量} + @变动数量#][1][@机构编号#,@操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@市场编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_opor_stock_source (
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
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_begin_qty, 
        v_source_stock_qty, v_single_limit_qty, v_assigned_qty, v_trade_releas_qty, 
        v_trade_capt_qty, v_strike_releas_qty, v_strike_capt_qty, v_total_realize_pandl, 
        v_over_night_pandl, v_sum_realize_pandl, v_total_open_posi_fee, v_total_close_posi_fee, 
        v_out_order_releas_qty, v_out_order_capt_qty, v_out_strike_releas_qty, v_out_strike_capt_qty, 
        v_over_night_trade_buy_qty, v_over_night_trade_sell_qty, v_over_night_strike_sell_qty, v_diff_qty, 
        v_t0_buy_type, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, source_stock_qty= source_stock_qty + v_occur_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.108.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","操作员编号=",v_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no,",","市场编号=",v_exch_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][交易证券_T0_操作员券源设置表][{期初数量},{券源数量},{单笔限额数量},{已分配数量}][@临时_期初数量#,@券源数量#,@单笔限额数量#,@已分配数量#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {证券代码编号}=@证券代码编号# and {股东代码编号}=@股东代码编号#][4][@操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
    select begin_qty,source_stock_qty,single_limit_qty,assigned_qty into v_tmp_begin_qty,v_source_stock_qty,v_single_limit_qty,v_assigned_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_code_no=v_stock_code_no and stock_acco_no=v_stock_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.108.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
        end if;
        leave label_pro;
    end if;


    /* if @临时_期初数量#=0 then */
    if v_tmp_begin_qty=0 then

        /* [更新表记录][交易证券_T0_操作员券源设置表][{期初数量}=@变动数量#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {证券代码编号}=@证券代码编号# and {股东代码编号}=@股东代码编号#][2][@操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=v_occur_qty where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and stock_code_no=v_stock_code_no and stock_acco_no=v_stock_acco_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.108.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
            end if;
            leave label_pro;
        end if;

    end if;
    #券源划转，已分配数量 均不变。

    /* set @变动后券源数量# = @券源数量#; */
    set v_source_stock_occur_end_qty = v_source_stock_qty;

    /* set @变动后单笔限额数量#= @单笔限额数量#; */
    set v_single_limit_occur_end_qty= v_single_limit_qty;

    /* set @变动后已分配数量# =@已分配数量#; */
    set v_assigned_occur_end_qty =v_assigned_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "操作员券源划入"; */
    set v_oper_remark_info = "操作员券源划入";

    /* set @操作员编号# = @临时_操作员编号#; */
    set v_opor_no = v_tmp_opor_no;

    /* set @业务操作员编号# = @目标操作员编号#; */
    set v_busi_opor_no = v_target_opor_no;

    /* [插入表记录][交易证券_T0_操作员券源设置流水表][字段][字段变量][5][@初始化日期#,@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_opor_stock_source_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, oper_mac, 
        oper_ip_addr, oper_info, oper_way, oper_menu_no, 
        oper_func_code, init_date, co_no, busi_opor_no, 
        pd_no, exch_group_no, asset_acco_no, stock_acco_no, 
        stock_code_no, stock_code, exch_no, source_stock_occur_qty, 
        source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, assigned_occur_qty, 
        assigned_occur_end_qty, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_oper_mac, 
        v_oper_ip_addr, v_oper_info, v_oper_way, v_oper_menu_no, 
        v_oper_func_code, v_init_date, v_co_no, v_busi_opor_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_stock_acco_no, 
        v_stock_code_no, v_stock_code, v_exch_no, v_source_stock_occur_qty, 
        v_source_stock_occur_end_qty, v_single_limit_occur_qty, v_single_limit_occur_end_qty, v_assigned_occur_qty, 
        v_assigned_occur_end_qty, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.108.5";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #业务操作员恢复  被划出券源的操作员编号。

    /* set @业务操作员编号# = @临时_业务操作员编号#; */
    set v_busi_opor_no = v_tmp_busi_opor_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_stock_code_no = v_stock_code_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_busi_opor_no = v_busi_opor_no;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_查询操作员券源限额设置流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporStockLimitJour;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporStockLimitJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_query_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][交易证券_T0_操作员券源设置流水表][字段][{初始化日期}<= @初始化日期# and {机构编号} = @机构编号# and ((@查询操作员编号# = 0 and instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0 ) or {操作员编号} = @查询操作员编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0  and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号# = 0 or {市场编号} = @市场编号#) and (@证券代码# = " " or {证券代码} = @证券代码#)and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info from db_tdsecu.tb_tdset0_opor_stock_source_jour where init_date<= v_init_date and co_no = v_co_no and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0  and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code = " " or stock_code = v_stock_code)and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info from db_tdsecu.tb_tdset0_opor_stock_source_jour where init_date<= v_init_date and co_no = v_co_no and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0  and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code = " " or stock_code = v_stock_code)and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_查询操作员券源限额设置流水历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporStockLimitJourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporStockLimitJourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_query_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code varchar(6),
    IN p_exch_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code varchar(6);
    declare v_exch_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code = p_stock_code;
    SET v_exch_no = p_exch_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_交易证券_T0_操作员券源设置流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and ((@查询操作员编号# = 0 and instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0 ) or {操作员编号} = @查询操作员编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0  and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@股东代码编号# = 0 or {股东代码编号} = @股东代码编号#) and (@证券代码编号# = 0 or {证券代码编号} = @证券代码编号#) and (@市场编号# = 0 or {市场编号} = @市场编号#) and (@证券代码# = " " or {证券代码} = @证券代码#)and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info from db_tdsecu_his.tb_tdset0_opor_stock_source_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0  and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code = " " or stock_code = v_stock_code)and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        busi_opor_no, pd_no, exch_group_no, asset_acco_no, 
        stock_acco_no, stock_code_no, stock_code, exch_no, 
        source_stock_occur_qty, source_stock_occur_end_qty, single_limit_occur_qty, single_limit_occur_end_qty, 
        assigned_occur_qty, assigned_occur_end_qty, oper_remark_info from db_tdsecu_his.tb_tdset0_opor_stock_source_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and ((v_query_opor_no = 0 and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 ) or opor_no = v_query_opor_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0  and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_stock_acco_no = 0 or stock_acco_no = v_stock_acco_no) and (v_stock_code_no = 0 or stock_code_no = v_stock_code_no) and (v_exch_no = 0 or exch_no = v_exch_no) and (v_stock_code = " " or stock_code = v_stock_code)and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_持仓反向平仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_PosiReverseClose;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_PosiReverseClose(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_close_posi_price decimal(16,9),
    IN p_close_posi_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
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
    declare v_row_id bigint;
    declare v_close_posi_price decimal(16,9);
    declare v_close_posi_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_init_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_mach_time int;
    declare v_tmp_close_posi_qty decimal(18,2);
    declare v_remark_info varchar(255);
    declare v_last_update_time int;
    declare v_close_posi_date int;
    declare v_close_posi_time int;
    declare v_detail_posi_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_realize_pandl decimal(18,4);
    declare v_open_posi_date int;
    declare v_lngsht_type int;
    declare v_busi_opor_no int;
    declare v_curr_qty decimal(18,2);
    declare v_open_posi_price decimal(16,9);
    declare v_open_posi_value decimal(18,4);
    declare v_open_posi_fee decimal(18,4);
    declare v_tmp_close_posi_market_value decimal(18,4);
    declare v_tmp_close_posi_fee decimal(18,4);
    declare v_total_close_posi_qty decimal(18,2);
    declare v_strike_no varchar(64);
    declare v_over_night_trade_buy_qty decimal(18,2);
    declare v_over_night_trade_sell_qty decimal(18,2);
    declare v_valid_posi_qty decimal(18,2);
    declare v_close_posi_market_value decimal(18,4);
    declare v_close_posi_fee decimal(18,4);
    declare v_order_dir int;
    declare v_pandl_dir_multi int;
    declare v_strike_occur_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_posi_status varchar(2);
    declare v_record_count int;
    declare v_source_stock_qty decimal(18,2);

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
    SET v_close_posi_price = p_close_posi_price;
    SET v_close_posi_qty = p_close_posi_qty;
    SET v_all_fee = p_all_fee;
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_mach_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_close_posi_qty = 0;
    SET v_remark_info = " ";
    SET v_last_update_time = date_format(curtime(),'%H%i%s');
    SET v_close_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_close_posi_time = date_format(curtime(),'%H%i%s');
    SET v_detail_posi_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_exch_no = 0;
    SET v_stock_code = " ";
    SET v_realize_pandl = 0;
    SET v_open_posi_date = date_format(curdate(),'%Y%m%d');
    SET v_lngsht_type = 0;
    SET v_busi_opor_no = 0;
    SET v_curr_qty = 0;
    SET v_open_posi_price = 0;
    SET v_open_posi_value = 0;
    SET v_open_posi_fee = 0;
    SET v_tmp_close_posi_market_value = 0;
    SET v_tmp_close_posi_fee = 0;
    SET v_total_close_posi_qty = 0;
    SET v_strike_no = " ";
    SET v_over_night_trade_buy_qty = 0;
    SET v_over_night_trade_sell_qty = 0;
    SET v_valid_posi_qty = 0;
    SET v_close_posi_market_value = 0;
    SET v_close_posi_fee = 0;
    SET v_order_dir = 0;
    SET v_pandl_dir_multi = 0;
    SET v_strike_occur_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_posi_status = "0";
    SET v_record_count = 0;
    SET v_source_stock_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取机器时间][@机器时间#] */
    select date_format(curtime(),'%H%i%s') into v_mach_time;


    /* set @临时_平仓数量# = @平仓数量#; */
    set v_tmp_close_posi_qty = v_close_posi_qty;

    /* set @备注信息# = concat('反向平仓，操作员编号：', @操作员编号#,'，更新时间：',@最后更新时间#); */
    set v_remark_info = concat('反向平仓，操作员编号：', v_opor_no,'，更新时间：',v_last_update_time);

    /* set @平仓日期# = @初始化日期#; */
    set v_close_posi_date = v_init_date;

    /* set @平仓时间# = @机器时间#; */
    set v_close_posi_time = v_mach_time;

    /* set @明细持仓序号# = @记录序号#; */
    set v_detail_posi_id = v_row_id;

    /* [获取表记录变量][交易证券_T0_证券持仓明细表][{机构编号},{产品编号},{交易组编号},{资产账户编号},{股东代码编号},{证券代码编号},{市场编号},{证券代码},{实现盈亏},{开仓日期},{多空类型},{平仓数量},{操作员编号},{当前数量},{开仓价格},{开仓市值},{开仓费用},{平仓市值},{平仓费用},{平仓数量},{成交编号}][@机构编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#,@市场编号#,@证券代码#,@实现盈亏#,@开仓日期#,@多空类型#,@平仓数量#,@业务操作员编号#,@当前数量#,@开仓价格#,@开仓市值#,@开仓费用#,@临时_平仓市值#,@临时_平仓费用#,@总平仓数量#,@成交编号#][{记录序号}=@记录序号#][4][@记录序号#] */
    select co_no,pd_no,exch_group_no,asset_acco_no,stock_acco_no,stock_code_no,exch_no,stock_code,realize_pandl,open_posi_date,lngsht_type,close_posi_qty,opor_no,curr_qty,open_posi_price,open_posi_value,open_posi_fee,close_posi_market_value,close_posi_fee,close_posi_qty,strike_no into v_co_no,v_pd_no,v_exch_group_no,v_asset_acco_no,v_stock_acco_no,v_stock_code_no,v_exch_no,v_stock_code,v_realize_pandl,v_open_posi_date,v_lngsht_type,v_close_posi_qty,v_busi_opor_no,v_curr_qty,v_open_posi_price,v_open_posi_value,v_open_posi_fee,v_tmp_close_posi_market_value,v_tmp_close_posi_fee,v_total_close_posi_qty,v_strike_no from db_tdsecu.tb_tdset0_stock_posi_detail where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.30.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #老仓判断是否有强平挂单数量，有则报错。

    /* if @初始化日期# > @开仓日期# then */
    if v_init_date > v_open_posi_date then

        /* [获取表记录变量][交易证券_T0_操作员券源设置表][{隔夜仓强平交易买入数量},{隔夜仓强平交易卖出数量}][@隔夜仓强平交易买入数量#,@隔夜仓强平交易卖出数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][4][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
        select over_night_trade_buy_qty,over_night_trade_sell_qty into v_over_night_trade_buy_qty,v_over_night_trade_sell_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "tdsecuA.6.30.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
            end if;
            leave label_pro;
        end if;


        /* [检查报错返回][@隔夜仓强平交易买入数量#>0 or @隔夜仓强平交易卖出数量#>0][807][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
        if v_over_night_trade_buy_qty>0 or v_over_night_trade_sell_qty>0 then
            
            SET v_error_code = "tdsecuA.6.30.807";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @有效持仓数量# = @当前数量# - @平仓数量#; */
    set v_valid_posi_qty = v_curr_qty - v_close_posi_qty;

    /* [检查报错返回][@有效持仓数量# < @临时_平仓数量#][641][@记录序号#] */
    if v_valid_posi_qty < v_tmp_close_posi_qty then
        
        SET v_error_code = "tdsecuA.6.30.641";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #未平完仓  if @有效持仓数量# > @临时_平仓数量# then

    /* set @平仓市值#=@临时_平仓数量#*@平仓价格#; */
    set v_close_posi_market_value=v_tmp_close_posi_qty*v_close_posi_price;

    /* set @平仓费用#=@全部费用#; */
    set v_close_posi_fee=v_all_fee;
    #多头的持仓，反方向为卖。

    /* if @多空类型# = 《多空类型-空头》  then */
    if v_lngsht_type = 2  then

      /* set @订单方向#=《订单方向-买入》; */
      set v_order_dir=1;

      /* set @盈亏方向乘数# = -1; */
      set v_pandl_dir_multi = -1;

      /* set @成交变动金额# = @平仓市值# +@平仓费用#; */
      set v_strike_occur_amt = v_close_posi_market_value +v_close_posi_fee;

    /* elseif @多空类型# = 《多空类型-多头》 then */
    elseif v_lngsht_type = 1 then

      /* set @订单方向#=《订单方向-卖出》; */
      set v_order_dir=2;

      /* set @盈亏方向乘数# = 1; */
      set v_pandl_dir_multi = 1;

      /* set @成交变动金额# = @平仓市值# - @平仓费用#; */
      set v_strike_occur_amt = v_close_posi_market_value - v_close_posi_fee;
    end if;

    /* set @实现盈亏#=(@平仓价格#-@开仓价格#)*@临时_平仓数量#*@盈亏方向乘数#-@平仓费用#-@开仓费用#*@临时_平仓数量#/@当前数量#; */
    set v_realize_pandl=(v_close_posi_price-v_open_posi_price)*v_tmp_close_posi_qty*v_pandl_dir_multi-v_close_posi_fee-v_open_posi_fee*v_tmp_close_posi_qty/v_curr_qty;

    /* [更新表记录][交易证券_T0_证券持仓明细表][{平仓数量}={平仓数量}+@临时_平仓数量#,{平仓市值}={平仓市值}+@平仓市值#,{平仓费用}={平仓费用}+@平仓费用#,{实现盈亏}={实现盈亏}+@实现盈亏#,{平仓日期}=@平仓日期#,{平仓时间}=@平仓时间#,{备注信息}=@备注信息#][{记录序号}=@记录序号# and {持仓状态} <> 《持仓状态-已平仓》][1][concat("更新T+0持仓明细表出错, 明细持仓序号=", @明细持仓序号#)] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, close_posi_qty=close_posi_qty+v_tmp_close_posi_qty,close_posi_market_value=close_posi_market_value+v_close_posi_market_value,close_posi_fee=close_posi_fee+v_close_posi_fee,realize_pandl=realize_pandl+v_realize_pandl,close_posi_date=v_close_posi_date,close_posi_time=v_close_posi_time,remark_info=v_remark_info where row_id=v_row_id and posi_status <> "2";
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.30.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id);
        end if;
        leave label_pro;
    end if;


    /* set @平仓数量# = @临时_平仓数量#; */
    set v_close_posi_qty = v_tmp_close_posi_qty;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* [插入表记录][交易证券_T0_证券平仓成交明细表][字段][字段变量][1][@初始化日期#,@明细持仓序号#,@成交编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_close_posi_strike_detail(
        create_date, create_time, update_date, 
        update_time, update_times, opor_no, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, stock_acco_no, stock_code_no, lngsht_type, 
        detail_posi_id, strike_no, close_posi_date, close_posi_time, 
        close_posi_price, close_posi_qty, close_posi_market_value, close_posi_fee, 
        realize_pandl) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_no, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_stock_acco_no, v_stock_code_no, v_lngsht_type, 
        v_detail_posi_id, v_strike_no, v_close_posi_date, v_close_posi_time, 
        v_close_posi_price, v_close_posi_qty, v_close_posi_market_value, v_close_posi_fee, 
        v_realize_pandl);
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.30.1";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","明细持仓序号=",v_detail_posi_id,",","成交编号=",v_strike_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #全平的情况

    /* if @有效持仓数量#=@临时_平仓数量#  then */
    if v_valid_posi_qty=v_tmp_close_posi_qty  then

       /* set @持仓状态#=《持仓状态-已平仓》; */
       set v_posi_status="2";

       /* [更新表记录][交易证券_T0_证券持仓明细表][{持仓状态}=@持仓状态#][{记录序号}=@记录序号# and {持仓状态} <> 《持仓状态-已平仓》][1][concat("更新T+0持仓明细表出错, 明细持仓序号=", @明细持仓序号#)] */
       set v_update_date = date_format(curdate(),'%Y%m%d');
       set v_update_time = date_format(curtime(),'%H%i%s');
       update db_tdsecu.tb_tdset0_stock_posi_detail set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, posi_status=v_posi_status where row_id=v_row_id and posi_status <> "2";
       if v_error_code = "1" then
                   
           SET v_error_code = "tdsecuA.6.30.1";
           if v_mysql_message <> "" then
               SET v_error_info = CONCAT(concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id),"#",v_mysql_message);
           else
               SET v_error_info = concat("更新T+0持仓明细表出错, 明细持仓序号=", v_detail_posi_id);
           end if;
           leave label_pro;
       end if;

    end if;
    #[获取表记录变量][交易证券_T0_操作员券源设置表][{数量差额}][@数量差额#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][4][@业务操作员编号#]
    #[获取表记录变量][交易证券_T0_操作员阈值设置表][{金额差额}][@金额差额#][{操作员编号}=@业务操作员编号#][4][@业务操作员编号#]
    #多头类型，反向操作 卖出平仓

    /* set @平仓数量#=@临时_平仓数量#; */
    set v_close_posi_qty=v_tmp_close_posi_qty;

    /* if @多空类型# = 《多空类型-多头》 then */
    if v_lngsht_type = 1 then

            /* [获取表记录数量][交易证券_T0_交易组业务资金表][@记录个数#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}="CNY"] */
            select count(1) into v_record_count from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type="CNY";


            /* if @记录个数# > 0 then */
            if v_record_count > 0 then

               /* [更新表记录][交易证券_T0_交易组业务资金表][{成交释放金额}={成交释放金额}+@成交变动金额#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}="CNY" ][1][@操作员编号#,@交易组编号#] */
               set v_update_date = date_format(curdate(),'%Y%m%d');
               set v_update_time = date_format(curtime(),'%H%i%s');
               update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_releas_amt=strike_releas_amt+v_strike_occur_amt where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type="CNY" ;
               if v_error_code = "1" then
                           
                   SET v_error_code = "tdsecuA.6.30.1";
                   if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
                   else
                       SET v_error_info = concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no);
                   end if;
                   leave label_pro;
               end if;

            end if;
            #考虑删除券源后

            /* [获取表记录变量][交易证券_T0_操作员券源设置表][{券源数量}][@券源数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][4][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
            select source_stock_qty into v_source_stock_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "tdsecuA.6.30.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                end if;
                leave label_pro;
            end if;


            /* if @券源数量# = 0 then */
            if v_source_stock_qty = 0 then

                 /* [更新表记录][交易证券_T0_操作员券源设置表][{成交占用数量} = {成交占用数量}+@平仓数量#,{总平仓费用}=0,{累计实现盈亏}=0,{总实现盈亏}=0,{单笔限额数量} = 0,{隔夜盈亏} = 0][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
                 set v_update_date = date_format(curdate(),'%Y%m%d');
                 set v_update_time = date_format(curtime(),'%H%i%s');
                 update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_qty = strike_capt_qty+v_close_posi_qty,total_close_posi_fee=0,sum_realize_pandl=0,total_realize_pandl=0,single_limit_qty = 0,over_night_pandl = 0 where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "tdsecuA.6.30.1302";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                     end if;
                     leave label_pro;
                 end if;

            else

                 /* [更新表记录][交易证券_T0_操作员券源设置表][{成交占用数量} = {成交占用数量}+@平仓数量#,{总平仓费用}={总平仓费用}+@平仓费用#,{累计实现盈亏}={累计实现盈亏}+@实现盈亏#,{总实现盈亏}={总实现盈亏}+@实现盈亏#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
                 set v_update_date = date_format(curdate(),'%Y%m%d');
                 set v_update_time = date_format(curtime(),'%H%i%s');
                 update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_qty = strike_capt_qty+v_close_posi_qty,total_close_posi_fee=total_close_posi_fee+v_close_posi_fee,sum_realize_pandl=sum_realize_pandl+v_realize_pandl,total_realize_pandl=total_realize_pandl+v_realize_pandl where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "tdsecuA.6.30.1302";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                     end if;
                     leave label_pro;
                 end if;

            end if;

            /* [更新表记录][交易证券_T0_操作员阈值设置表][{成交释放金额}={成交释放金额}+@成交变动金额#,{累计实现盈亏}={累计实现盈亏}+@实现盈亏#][{操作员编号}=@业务操作员编号#][1][@业务操作员编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_releas_amt=strike_releas_amt+v_strike_occur_amt,sum_realize_pandl=sum_realize_pandl+v_realize_pandl where opor_no=v_busi_opor_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.30.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
                end if;
                leave label_pro;
            end if;


            /* if @有效持仓数量#>@临时_平仓数量#  then */
            if v_valid_posi_qty>v_tmp_close_posi_qty  then

                 /* [更新表记录][交易证券_T0_证券持仓汇总表][{总多头平仓数量} = {总多头平仓数量} + @平仓数量# ,{总多头平仓市值}={总多头平仓市值}+@平仓市值#,{总多头平仓费用} = {总多头平仓费用} + @平仓费用# , {多头平仓市值}={多头平仓市值} + @平仓市值#,{多头平仓费用}={多头平仓费用}+@平仓费用#,{多头平仓数量}={多头平仓数量}+@平仓数量#,{总实现盈亏} = {总实现盈亏}  + @实现盈亏#,{实现盈亏}={实现盈亏}+@实现盈亏#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {开仓日期} = @开仓日期#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
                 set v_update_date = date_format(curdate(),'%Y%m%d');
                 set v_update_time = date_format(curtime(),'%H%i%s');
                 update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_long_close_posi_qty = total_long_close_posi_qty + v_close_posi_qty ,total_long_close_posi_value=total_long_close_posi_value+v_close_posi_market_value,total_long_close_posi_fee = total_long_close_posi_fee + v_close_posi_fee , long_close_posi_value=long_close_posi_value + v_close_posi_market_value,long_close_posi_fee=long_close_posi_fee+v_close_posi_fee,long_close_posi_qty=long_close_posi_qty+v_close_posi_qty,total_realize_pandl = total_realize_pandl  + v_realize_pandl,realize_pandl=realize_pandl+v_realize_pandl where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and open_posi_date = v_open_posi_date;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "tdsecuA.6.30.1302";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                     end if;
                     leave label_pro;
                 end if;


            /* elseif @有效持仓数量#=@临时_平仓数量#  then */
            elseif v_valid_posi_qty=v_tmp_close_posi_qty  then
        #平完仓 要回退汇总表6个字段。

                 /* [更新表记录][交易证券_T0_证券持仓汇总表][{总多头平仓数量} = {总多头平仓数量} + @平仓数量# ,{总多头平仓市值}={总多头平仓市值}+@平仓市值#,{总多头平仓费用} = {总多头平仓费用} + @平仓费用# , {多头平仓市值}={多头平仓市值}-@临时_平仓市值#,{多头平仓费用}={多头平仓费用}-@临时_平仓费用#,{多头平仓数量}={多头平仓数量}-@总平仓数量#,{总实现盈亏} = {总实现盈亏}  + @实现盈亏#,{实现盈亏}={实现盈亏}+@实现盈亏#,{多头当前数量}={多头当前数量}-@当前数量#,{多头开仓费用}={多头开仓费用}-@开仓费用#,{多头开仓市值}={多头开仓市值}-@开仓市值#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {开仓日期} = @开仓日期#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
                 set v_update_date = date_format(curdate(),'%Y%m%d');
                 set v_update_time = date_format(curtime(),'%H%i%s');
                 update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_long_close_posi_qty = total_long_close_posi_qty + v_close_posi_qty ,total_long_close_posi_value=total_long_close_posi_value+v_close_posi_market_value,total_long_close_posi_fee = total_long_close_posi_fee + v_close_posi_fee , long_close_posi_value=long_close_posi_value-v_tmp_close_posi_market_value,long_close_posi_fee=long_close_posi_fee-v_tmp_close_posi_fee,long_close_posi_qty=long_close_posi_qty-v_total_close_posi_qty,total_realize_pandl = total_realize_pandl  + v_realize_pandl,realize_pandl=realize_pandl+v_realize_pandl,long_curr_qty=long_curr_qty-v_curr_qty,long_open_posi_fee=long_open_posi_fee-v_open_posi_fee,long_open_posi_value=long_open_posi_value-v_open_posi_value where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and open_posi_date = v_open_posi_date;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "tdsecuA.6.30.1302";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                     end if;
                     leave label_pro;
                 end if;

            end if;

    /* elseif @多空类型# = 《多空类型-空头》  then */
    elseif v_lngsht_type = 2  then

            /* [获取表记录数量][交易证券_T0_交易组业务资金表][@记录个数#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}="CNY"] */
            select count(1) into v_record_count from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type="CNY";


            /* if @记录个数# > 0 then */
            if v_record_count > 0 then

               /* [更新表记录][交易证券_T0_交易组业务资金表][{成交占用金额}={成交占用金额}+@成交变动金额#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {交易币种}="CNY" ][1][@操作员编号#,@交易组编号#] */
               set v_update_date = date_format(curdate(),'%Y%m%d');
               set v_update_time = date_format(curtime(),'%H%i%s');
               update db_tdsecu.tb_tdset0_exgp_busi_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_amt=strike_capt_amt+v_strike_occur_amt where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and exch_crncy_type="CNY" ;
               if v_error_code = "1" then
                           
                   SET v_error_code = "tdsecuA.6.30.1";
                   if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
                   else
                       SET v_error_info = concat("操作员编号=",v_opor_no,",","交易组编号=",v_exch_group_no);
                   end if;
                   leave label_pro;
               end if;

            end if;
            #考虑删除券源后

            /* [获取表记录变量][交易证券_T0_操作员券源设置表][{券源数量}][@券源数量#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][4][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
            select source_stock_qty into v_source_stock_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "tdsecuA.6.30.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                end if;
                leave label_pro;
            end if;


            /* if @券源数量# = 0 then */
            if v_source_stock_qty = 0 then

                 /* [更新表记录][交易证券_T0_操作员券源设置表][{成交释放数量} = {成交释放数量}+@平仓数量#,{总平仓费用}=0,{累计实现盈亏}=0,{总实现盈亏}=0,{单笔限额数量} = 0,{隔夜盈亏} = 0][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
                 set v_update_date = date_format(curdate(),'%Y%m%d');
                 set v_update_time = date_format(curtime(),'%H%i%s');
                 update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_releas_qty = strike_releas_qty+v_close_posi_qty,total_close_posi_fee=0,sum_realize_pandl=0,total_realize_pandl=0,single_limit_qty = 0,over_night_pandl = 0 where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "tdsecuA.6.30.1302";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                     end if;
                     leave label_pro;
                 end if;

            else

                 /* [更新表记录][交易证券_T0_操作员券源设置表][{成交释放数量} = {成交释放数量}+@平仓数量#,{总平仓费用}={总平仓费用}+@平仓费用#,{累计实现盈亏}={累计实现盈亏}+@实现盈亏#,{总实现盈亏}={总实现盈亏}+@实现盈亏#][{操作员编号} = @业务操作员编号# and {交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@证券代码编号#,@股东代码编号#] */
                 set v_update_date = date_format(curdate(),'%Y%m%d');
                 set v_update_time = date_format(curtime(),'%H%i%s');
                 update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_releas_qty = strike_releas_qty+v_close_posi_qty,total_close_posi_fee=total_close_posi_fee+v_close_posi_fee,sum_realize_pandl=sum_realize_pandl+v_realize_pandl,total_realize_pandl=total_realize_pandl+v_realize_pandl where opor_no = v_busi_opor_no and exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
                 if v_error_code = "1" then
                             
                     SET v_error_code = "tdsecuA.6.30.1302";
                     if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no),"#",v_mysql_message);
                     else
                         SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","证券代码编号=",v_stock_code_no,",","股东代码编号=",v_stock_acco_no);
                     end if;
                     leave label_pro;
                 end if;

            end if;

            /* [更新表记录][交易证券_T0_操作员阈值设置表][{成交占用金额}={成交占用金额}+@成交变动金额#,{累计实现盈亏}={累计实现盈亏}+@实现盈亏#][{操作员编号}=@业务操作员编号#][1][@业务操作员编号#] */
            set v_update_date = date_format(curdate(),'%Y%m%d');
            set v_update_time = date_format(curtime(),'%H%i%s');
            update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, strike_capt_amt=strike_capt_amt+v_strike_occur_amt,sum_realize_pandl=sum_realize_pandl+v_realize_pandl where opor_no=v_busi_opor_no;
            if v_error_code = "1" then
                        
                SET v_error_code = "tdsecuA.6.30.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
                end if;
                leave label_pro;
            end if;


            /* if @有效持仓数量#>@临时_平仓数量#  then */
            if v_valid_posi_qty>v_tmp_close_posi_qty  then

                /* [更新表记录][交易证券_T0_证券持仓汇总表][{总空头平仓数量} = {总空头平仓数量} + @平仓数量# ,{总空头平仓市值}={总空头平仓市值}+@平仓市值#,{总空头平仓费用} = {总空头平仓费用} + @平仓费用# , {空头平仓市值}={空头平仓市值} + @平仓市值#,{空头平仓费用}={空头平仓费用}+@平仓费用#,{空头平仓数量}={空头平仓数量}+@平仓数量#,{总实现盈亏} = {总实现盈亏}  + @实现盈亏#,{实现盈亏}={实现盈亏}+@实现盈亏#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {开仓日期} = @开仓日期#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_short_close_posi_qty = total_short_close_posi_qty + v_close_posi_qty ,total_short_close_posi_value=total_short_close_posi_value+v_close_posi_market_value,total_short_close_posi_fee = total_short_close_posi_fee + v_close_posi_fee , short_close_posi_value=short_close_posi_value + v_close_posi_market_value,short_close_posi_fee=short_close_posi_fee+v_close_posi_fee,short_close_posi_qty=short_close_posi_qty+v_close_posi_qty,total_realize_pandl = total_realize_pandl  + v_realize_pandl,realize_pandl=realize_pandl+v_realize_pandl where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and open_posi_date = v_open_posi_date;
                if v_error_code = "1" then
                            
                    SET v_error_code = "tdsecuA.6.30.1302";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                    end if;
                    leave label_pro;
                end if;


            /* elseif @有效持仓数量#=@临时_平仓数量#  then */
            elseif v_valid_posi_qty=v_tmp_close_posi_qty  then

                /* [更新表记录][交易证券_T0_证券持仓汇总表][{总空头平仓数量} = {总空头平仓数量} + @平仓数量# ,{总空头平仓市值}={总空头平仓市值}+@平仓市值#,{总空头平仓费用} = {总空头平仓费用} + @平仓费用# , {空头平仓市值}={空头平仓市值} - @临时_平仓市值#,{空头平仓费用}={空头平仓费用}-@临时_平仓费用#,{空头平仓数量}={空头平仓数量}-@总平仓数量#,{总实现盈亏} = {总实现盈亏}  + @实现盈亏#,{实现盈亏}={实现盈亏}+@实现盈亏#,{空头当前数量}={空头当前数量}-@当前数量#,{空头开仓费用}={空头开仓费用}-@开仓费用#,{空头开仓市值}={空头开仓市值}-@开仓市值#][{操作员编号} = @业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {股东代码编号} = @股东代码编号# and {证券代码编号} = @证券代码编号# and {开仓日期} = @开仓日期#][1302][@业务操作员编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
                set v_update_date = date_format(curdate(),'%Y%m%d');
                set v_update_time = date_format(curtime(),'%H%i%s');
                update db_tdsecu.tb_tdset0_stock_posi_sum set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_short_close_posi_qty = total_short_close_posi_qty + v_close_posi_qty ,total_short_close_posi_value=total_short_close_posi_value+v_close_posi_market_value,total_short_close_posi_fee = total_short_close_posi_fee + v_close_posi_fee , short_close_posi_value=short_close_posi_value - v_tmp_close_posi_market_value,short_close_posi_fee=short_close_posi_fee-v_tmp_close_posi_fee,short_close_posi_qty=short_close_posi_qty-v_total_close_posi_qty,total_realize_pandl = total_realize_pandl  + v_realize_pandl,realize_pandl=realize_pandl+v_realize_pandl,short_curr_qty=short_curr_qty-v_curr_qty,short_open_posi_fee=short_open_posi_fee-v_open_posi_fee,short_open_posi_value=short_open_posi_value-v_open_posi_value where opor_no = v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_acco_no = v_stock_acco_no and stock_code_no = v_stock_code_no and open_posi_date = v_open_posi_date;
                if v_error_code = "1" then
                            
                    SET v_error_code = "tdsecuA.6.30.1302";
                    if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
                    else
                        SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
                    end if;
                    leave label_pro;
                end if;

           end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_更新操作员可用交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_UpdateOporAllowExchGroupCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_UpdateOporAllowExchGroupCapit(
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
    IN p_busi_opor_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_unfroz_amt decimal(18,4);
    declare v_comm_frozen_amt decimal(18,4);
    declare v_comm_unfroz_amt decimal(18,4);
    declare v_comm_capt_amt decimal(18,4);
    declare v_comm_releas_amt decimal(18,4);
    declare v_trade_frozen_amt decimal(18,4);
    declare v_trade_unfroz_amt decimal(18,4);
    declare v_trade_capt_amt decimal(18,4);
    declare v_trade_releas_amt decimal(18,4);
    declare v_strike_capt_amt decimal(18,4);
    declare v_strike_releas_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_unfroz_amt = 0;
    SET v_comm_frozen_amt = 0;
    SET v_comm_unfroz_amt = 0;
    SET v_comm_capt_amt = 0;
    SET v_comm_releas_amt = 0;
    SET v_trade_frozen_amt = 0;
    SET v_trade_unfroz_amt = 0;
    SET v_trade_capt_amt = 0;
    SET v_trade_releas_amt = 0;
    SET v_strike_capt_amt = 0;
    SET v_strike_releas_amt = 0;
    SET v_begin_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @指令冻结金额# = 0; */
    set v_comm_frozen_amt = 0;

    /* set @指令解冻金额# = 0; */
    set v_comm_unfroz_amt = 0;

    /* set @指令占用金额# = 0; */
    set v_comm_capt_amt = 0;

    /* set @指令释放金额# = 0; */
    set v_comm_releas_amt = 0;

    /* set @交易冻结金额# = 0; */
    set v_trade_frozen_amt = 0;

    /* set @交易解冻金额# = 0; */
    set v_trade_unfroz_amt = 0;

    /* set @交易占用金额# = 0; */
    set v_trade_capt_amt = 0;

    /* set @交易释放金额# = 0; */
    set v_trade_releas_amt = 0;

    /* set @成交占用金额# = 0; */
    set v_strike_capt_amt = 0;

    /* set @成交释放金额# = 0; */
    set v_strike_releas_amt = 0;

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* set @期初金额# = @当前金额#; */
    set v_begin_amt = v_curr_amt;

    /* [获取表记录变量语句][交易证券_T0_交易组业务资金表][{期初金额}][@期初金额#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and  {资产账户编号}=@资产账户编号# and {交易币种}=@交易币种#] */
    select begin_amt into v_begin_amt from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_opor_no and exch_group_no=v_exch_group_no and  asset_acco_no=v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* if @期初金额#=0 then */
    if v_begin_amt=0 then

        /* [插入重复更新][交易证券_T0_交易组业务资金表][字段][字段变量][{当前金额}=@当前金额#,{期初金额}=@期初金额#,{冻结金额}=@冻结金额#][1][@资产账户编号#,@业务操作员编号#,@交易组编号#,@交易币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_exgp_busi_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, opor_no, exch_crncy_type, 
            begin_amt, curr_amt, frozen_amt, unfroz_amt, 
            comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
            trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, trade_releas_amt, 
            strike_capt_amt, strike_releas_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_opor_no, v_exch_crncy_type, 
            v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
            v_comm_frozen_amt, v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
            v_trade_frozen_amt, v_trade_unfroz_amt, v_trade_capt_amt, v_trade_releas_amt, 
            v_strike_capt_amt, v_strike_releas_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=v_curr_amt,begin_amt=v_begin_amt,frozen_amt=v_frozen_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.31.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type);
            end if;
            leave label_pro;
        end if;

    else

        /* [插入重复更新][交易证券_T0_交易组业务资金表][字段][字段变量][{当前金额}=@当前金额#,{冻结金额}=@冻结金额#][1][@资产账户编号#,@业务操作员编号#,@交易组编号#,@交易币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_tdsecu.tb_tdset0_exgp_busi_capit (
            create_date, create_time, update_date, 
            update_time, update_times, co_no, pd_no, 
            exch_group_no, asset_acco_no, opor_no, exch_crncy_type, 
            begin_amt, curr_amt, frozen_amt, unfroz_amt, 
            comm_frozen_amt, comm_unfroz_amt, comm_capt_amt, comm_releas_amt, 
            trade_frozen_amt, trade_unfroz_amt, trade_capt_amt, trade_releas_amt, 
            strike_capt_amt, strike_releas_amt) 
        values(
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_co_no, v_pd_no, 
            v_exch_group_no, v_asset_acco_no, v_opor_no, v_exch_crncy_type, 
            v_begin_amt, v_curr_amt, v_frozen_amt, v_unfroz_amt, 
            v_comm_frozen_amt, v_comm_unfroz_amt, v_comm_capt_amt, v_comm_releas_amt, 
            v_trade_frozen_amt, v_trade_unfroz_amt, v_trade_capt_amt, v_trade_releas_amt, 
            v_strike_capt_amt, v_strike_releas_amt) 
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=v_curr_amt,frozen_amt=v_frozen_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.31.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type);
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

# 原子_交易证券_T0_删除操作员可用交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_DeleteOporAllowExchGroupCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_DeleteOporAllowExchGroupCapit(
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
    IN p_busi_opor_no int,
    IN p_exch_crncy_type varchar(3),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
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
    declare v_asset_acco_no int;
    declare v_busi_opor_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* [获取表记录变量语句][交易证券_T0_交易组业务资金表][{记录序号},{更新次数}][@记录序号#,@更新次数#][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}= @资产账户编号# and {交易币种}=@交易币种#] */
    select row_id,update_times into v_row_id,v_update_times from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no= v_asset_acco_no and exch_crncy_type=v_exch_crncy_type limit 1;


    /* [删除表记录][交易证券_T0_交易组业务资金表][{操作员编号}=@操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {交易币种}=@交易币种#][3][@业务操作员编号#,@交易组编号#,@交易币种#] */
    delete from db_tdsecu.tb_tdset0_exgp_busi_capit 
        where opor_no=v_opor_no and exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and exch_crncy_type=v_exch_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.6.32.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","交易组编号=",v_exch_group_no,",","交易币种=",v_exch_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @更新次数#+1; */
    set v_update_times = v_update_times+1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_查询操作员可用交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporAllowExchGroupCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporAllowExchGroupCapit(
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
    IN p_busi_opor_no int,
    IN p_exch_crncy_type varchar(3),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* if @操作员编号# <> 0 then */
    if v_opor_no <> 0 then

        /* [检查报错返回][ instr(@可操作操作员编号串#, concat(";",@业务操作员编号#,";"))=0][4][concat("不具有该操作员的操作权限!",@业务操作员编号#)] */
        if  instr(v_allow_opor_no_str, concat(";",v_busi_opor_no,";"))=0 then
            
            SET v_error_code = "tdsecuA.6.33.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("不具有该操作员的操作权限!",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("不具有该操作员的操作权限!",v_busi_opor_no);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录][交易证券_T0_交易组业务资金表][{记录序号},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{操作员编号},
{交易币种},
{期初金额},
{当前金额},
{冻结金额},
{解冻金额},
{指令冻结金额},
{指令解冻金额},
{指令占用金额},
{指令释放金额},
{交易冻结金额},
{交易解冻金额},
{交易占用金额},
{交易释放金额},
{成交占用金额},
{成交释放金额},
{更新次数},
{当前金额}- {冻结金额} -{交易占用金额} - {成交占用金额} + {成交释放金额} + {解冻金额} - {指令占用金额} + {指令释放金额} + {指令解冻金额} - {指令冻结金额}  as {可用金额}][{操作员编号} = @操作员编号# and ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@交易币种#=" " or {交易币种}=@交易币种#)  and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
 */
        if v_row_count = -1 then
            select row_id,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        opor_no,
        exch_crncy_type,
        begin_amt,
        curr_amt,
        frozen_amt,
        unfroz_amt,
        comm_frozen_amt,
        comm_unfroz_amt,
        comm_capt_amt,
        comm_releas_amt,
        trade_frozen_amt,
        trade_unfroz_amt,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        update_times,
        curr_amt- frozen_amt -trade_capt_amt - strike_capt_amt + strike_releas_amt + unfroz_amt - comm_capt_amt + comm_releas_amt + comm_unfroz_amt - comm_frozen_amt  as avail_amt from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no = v_opor_no and (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_exch_crncy_type=" " or exch_crncy_type=v_exch_crncy_type)  and row_id > v_row_id order by row_id;
        else
            select row_id,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        opor_no,
        exch_crncy_type,
        begin_amt,
        curr_amt,
        frozen_amt,
        unfroz_amt,
        comm_frozen_amt,
        comm_unfroz_amt,
        comm_capt_amt,
        comm_releas_amt,
        trade_frozen_amt,
        trade_unfroz_amt,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        update_times,
        curr_amt- frozen_amt -trade_capt_amt - strike_capt_amt + strike_releas_amt + unfroz_amt - comm_capt_amt + comm_releas_amt + comm_unfroz_amt - comm_frozen_amt  as avail_amt from db_tdsecu.tb_tdset0_exgp_busi_capit where opor_no = v_opor_no and (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_exch_crncy_type=" " or exch_crncy_type=v_exch_crncy_type)  and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_T0_交易组业务资金表][{记录序号},
{机构编号},
{产品编号},
{交易组编号},
{资产账户编号},
{操作员编号},
{交易币种},
{期初金额},
{当前金额},
{冻结金额},
{解冻金额},
{指令冻结金额},
{指令解冻金额},
{指令占用金额},
{指令释放金额},
{交易冻结金额},
{交易解冻金额},
{交易占用金额},
{交易释放金额},
{成交占用金额},
{成交释放金额},
{更新次数},
{当前金额}- {冻结金额} -{交易占用金额} - {成交占用金额} + {成交释放金额} + {解冻金额} - {指令占用金额} + {指令释放金额} + {指令解冻金额} - {指令冻结金额}  as {可用金额}][instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0  and ({机构编号}=@机构编号#)  and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#)  and (@交易币种#=" " or {交易币种}=@交易币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#]
 */
        if v_row_count = -1 then
            select row_id,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        opor_no,
        exch_crncy_type,
        begin_amt,
        curr_amt,
        frozen_amt,
        unfroz_amt,
        comm_frozen_amt,
        comm_unfroz_amt,
        comm_capt_amt,
        comm_releas_amt,
        trade_frozen_amt,
        trade_unfroz_amt,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        update_times,
        curr_amt- frozen_amt -trade_capt_amt - strike_capt_amt + strike_releas_amt + unfroz_amt - comm_capt_amt + comm_releas_amt + comm_unfroz_amt - comm_frozen_amt  as avail_amt from db_tdsecu.tb_tdset0_exgp_busi_capit where instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0  and (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_exch_crncy_type=" " or exch_crncy_type=v_exch_crncy_type) and row_id > v_row_id order by row_id;
        else
            select row_id,
        co_no,
        pd_no,
        exch_group_no,
        asset_acco_no,
        opor_no,
        exch_crncy_type,
        begin_amt,
        curr_amt,
        frozen_amt,
        unfroz_amt,
        comm_frozen_amt,
        comm_unfroz_amt,
        comm_capt_amt,
        comm_releas_amt,
        trade_frozen_amt,
        trade_unfroz_amt,
        trade_capt_amt,
        trade_releas_amt,
        strike_capt_amt,
        strike_releas_amt,
        update_times,
        curr_amt- frozen_amt -trade_capt_amt - strike_capt_amt + strike_releas_amt + unfroz_amt - comm_capt_amt + comm_releas_amt + comm_unfroz_amt - comm_frozen_amt  as avail_amt from db_tdsecu.tb_tdset0_exgp_busi_capit where instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0  and (co_no=v_co_no)  and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no)  and (v_exch_crncy_type=" " or exch_crncy_type=v_exch_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_查询持仓作废流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryPosiCancelJour;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryPosiCancelJour(
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
    IN p_query_opor_no int,
    IN p_busi_opor_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_waste_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_query_opor_no int;
    declare v_busi_opor_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_waste_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_query_opor_no = p_query_opor_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_waste_date = p_waste_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][交易证券_T0_持仓作废流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@业务操作员编号# = 0 or {业务操作员编号}=@业务操作员编号#)  and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@作废日期# = 0 or {作废日期}=@作废日期#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu.tb_tdset0_posi_cancel_jour where init_date<=v_init_date and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no)  and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu.tb_tdset0_posi_cancel_jour where init_date<=v_init_date and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no)  and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][交易证券_T0_持仓作废流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@业务操作员编号# = 0 or {业务操作员编号}=@业务操作员编号#)  and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@作废日期# = 0 or {作废日期}=@作废日期#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu.tb_tdset0_posi_cancel_jour where init_date<=v_init_date and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no)  and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu.tb_tdset0_posi_cancel_jour where init_date<=v_init_date and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no)  and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_查询历史持仓作废流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryPosiCancelJourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryPosiCancelJourHis(
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
    IN p_query_opor_no int,
    IN p_busi_opor_no int,
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_waste_date int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_rights_str varchar(2048),
    IN p_pd_no_rights_str varchar(2048),
    IN p_exch_group_no_rights_str varchar(2048),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_query_opor_no int;
    declare v_busi_opor_no int;
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_waste_date int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_rights_str varchar(2048);
    declare v_pd_no_rights_str varchar(2048);
    declare v_exch_group_no_rights_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_sort_type int;
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
    SET v_query_opor_no = p_query_opor_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_waste_date = p_waste_date;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_sort_type = p_sort_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @排序方式#=1 then */
    if v_sort_type=1 then

        /* [获取表记录][历史_交易证券_T0_持仓作废流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@业务操作员编号# = 0 or {业务操作员编号}=@业务操作员编号#) and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@作废日期# = 0 or {作废日期}=@作废日期#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu_his.tb_tdset0_posi_cancel_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu_his.tb_tdset0_posi_cancel_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][历史_交易证券_T0_持仓作废流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号权限串#=" " or instr(@机构编号权限串#, concat(";",{机构编号},";"))>0) and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and (@交易组编号权限串#=" " or instr(@交易组编号权限串#, concat(";",{交易组编号},";"))>0) and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@业务操作员编号# = 0 or {业务操作员编号}=@业务操作员编号#) and (@查询操作员编号# = 0 or {操作员编号}=@查询操作员编号#) and (@市场编号# = 0 or {市场编号}=@市场编号#) and (@作废日期# = 0 or {作废日期}=@作废日期#) and (@证券代码# = " " or {证券代码}=@证券代码#) and {记录序号}>@记录序号# order by {记录序号} desc][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu_his.tb_tdset0_posi_cancel_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            opor_no, co_no, pd_no, exch_group_no, 
            asset_acco_no, stock_acco_no, exch_no, stock_code, 
            stock_code_no, lngsht_type, curr_qty, open_posi_date, 
            open_posi_time, open_posi_price, open_posi_value, open_posi_fee, 
            waste_qty, busi_opor_no, waste_date, waste_time, 
            detail_posi_id from db_tdsecu_his.tb_tdset0_posi_cancel_jour_his where (init_date between v_begin_date and v_end_date) and (v_co_no_rights_str=" " or instr(v_co_no_rights_str, concat(";",co_no,";"))>0) and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and (v_exch_group_no_rights_str=" " or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";"))>0) and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_busi_opor_no = 0 or busi_opor_no=v_busi_opor_no) and (v_query_opor_no = 0 or opor_no=v_query_opor_no) and (v_exch_no = 0 or exch_no=v_exch_no) and (v_waste_date = 0 or waste_date=v_waste_date) and (v_stock_code = " " or stock_code=v_stock_code) and row_id>v_row_id order by row_id desc limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_设置操作员持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_SetOporPosiMarketValue;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_SetOporPosiMarketValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_max_posi_market_value decimal(18,4),
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
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
    declare v_busi_opor_no int;
    declare v_max_posi_market_value decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    SET v_co_no = p_co_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_max_posi_market_value = p_max_posi_market_value;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_update_times = 1;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @操作员编号#=@业务操作员编号#; */
    set v_opor_no=v_busi_opor_no;

    /* [插入重复更新][交易证券_T0_操作员持仓市值设置表][字段][字段变量][{最大持仓市值}=@最大持仓市值#,{备注信息}=@备注信息#][1][@最大持仓市值#,@备注信息#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_tdsecu.tb_tdset0_opor_posi_market_value_set (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, opor_no, 
        max_posi_market_value, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_opor_no, 
        v_max_posi_market_value, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, max_posi_market_value=v_max_posi_market_value,remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.36.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("最大持仓市值=",v_max_posi_market_value,",","备注信息=",v_remark_info),"#",v_mysql_message);
        else
            SET v_error_info = concat("最大持仓市值=",v_max_posi_market_value,",","备注信息=",v_remark_info);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][交易证券_T0_操作员持仓市值设置表][{记录序号},{更新次数}][@记录序号#,@更新次数#][{操作员编号}=@操作员编号#] */
    select row_id,update_times into v_row_id,v_update_times from db_tdsecu.tb_tdset0_opor_posi_market_value_set where opor_no=v_opor_no limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_删除操作员持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_DelOporPosiMarketValue;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_DelOporPosiMarketValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_busi_opor_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_row_id bigint;
    declare v_busi_opor_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][交易证券_T0_操作员持仓市值设置表][{更新次数}][@更新次数#][{记录序号}=@记录序号# and {操作员编号}=@业务操作员编号#][4][@记录序号#,@业务操作员编号#] */
    select update_times into v_update_times from db_tdsecu.tb_tdset0_opor_posi_market_value_set where row_id=v_row_id and opor_no=v_busi_opor_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "tdsecuA.6.37.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","业务操作员编号=",v_busi_opor_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][交易证券_T0_操作员持仓市值设置表][{记录序号}=@记录序号#][3][@业务操作员编号#,@记录序号#] */
    delete from db_tdsecu.tb_tdset0_opor_posi_market_value_set 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "tdsecuA.6.37.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @更新次数#+1; */
    set v_update_times = v_update_times+1;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_查询操作员持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_QueryOporPosiMarketValue;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_QueryOporPosiMarketValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_allow_opor_no_str varchar(2048),
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
    declare v_busi_opor_no int;
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_allow_opor_no_str varchar(2048);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_allow_opor_no_str = p_allow_opor_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* set @操作员编号# = @业务操作员编号#; */
    set v_opor_no = v_busi_opor_no;

    /* [获取表记录][交易证券_T0_操作员持仓市值设置表][字段][({操作员编号} = @操作员编号# or @操作员编号#=0) and instr(@可操作操作员编号串#, concat(";",{操作员编号},";"))>0 and {机构编号}=@机构编号#  and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, max_posi_market_value, remark_info from db_tdsecu.tb_tdset0_opor_posi_market_value_set where (opor_no = v_opor_no or v_opor_no=0) and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 and co_no=v_co_no  and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        opor_no, max_posi_market_value, remark_info from db_tdsecu.tb_tdset0_opor_posi_market_value_set where (opor_no = v_opor_no or v_opor_no=0) and instr(v_allow_opor_no_str, concat(";",opor_no,";"))>0 and co_no=v_co_no  and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_增强交易持仓市值校验
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_PosiMarketValueCheck;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_PosiMarketValueCheck(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_acco_no int,
    IN p_co_no int,
    IN p_order_qty decimal(18,2),
    IN p_order_price decimal(16,9),
    IN p_order_dir int,
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
    declare v_busi_opor_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_acco_no int;
    declare v_co_no int;
    declare v_order_qty decimal(18,2);
    declare v_order_price decimal(16,9);
    declare v_order_dir int;
    declare v_last_price decimal(16,9);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_long_curr_qty decimal(18,2);
    declare v_short_curr_qty decimal(18,2);
    declare v_long_close_posi_qty decimal(18,2);
    declare v_short_close_posi_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_posi_qty decimal(18,2);
    declare v_record_count int;
    declare v_max_posi_market_value decimal(18,4);

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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_co_no = p_co_no;
    SET v_order_qty = p_order_qty;
    SET v_order_price = p_order_price;
    SET v_order_dir = p_order_dir;
    SET v_last_price = p_last_price;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_long_curr_qty = 0;
    SET v_short_curr_qty = 0;
    SET v_long_close_posi_qty = 0;
    SET v_short_close_posi_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_posi_qty = 0;
    SET v_record_count = 0;
    SET v_max_posi_market_value = 0;

    
    label_pro:BEGIN
    

    /* set @最新价# =0; */
    set v_last_price =0;
    #对持仓市值校验 只到操作员层级，账户层级不考虑。

    /* [获取表记录变量语句][交易证券_T0_证券持仓汇总表][ifnull(sum({多头当前数量}),0),ifnull(sum({空头当前数量}),0),ifnull(sum({多头平仓数量}),0),ifnull(sum({空头平仓数量}),0)][@多头当前数量#,@空头当前数量#,@多头平仓数量#,@空头平仓数量#][{操作员编号}=@业务操作员编号# and {证券代码编号}=@证券代码编号#] */
    select ifnull(sum(long_curr_qty),0),ifnull(sum(short_curr_qty),0),ifnull(sum(long_close_posi_qty),0),ifnull(sum(short_close_posi_qty),0) into v_long_curr_qty,v_short_curr_qty,v_long_close_posi_qty,v_short_close_posi_qty from db_tdsecu.tb_tdset0_stock_posi_sum where opor_no=v_busi_opor_no and stock_code_no=v_stock_code_no limit 1;

    #券源表计算挂单数量。

    /* [获取表记录变量语句][交易证券_T0_操作员券源设置表][ifnull(sum({交易释放数量}),0),ifnull(sum({交易占用数量}),0)][@交易释放数量#,@交易占用数量#][{操作员编号}=@业务操作员编号# and {证券代码编号} = @证券代码编号#] */
    select ifnull(sum(trade_releas_qty),0),ifnull(sum(trade_capt_qty),0) into v_trade_releas_qty,v_trade_capt_qty from db_tdsecu.tb_tdset0_opor_stock_source where opor_no=v_busi_opor_no and stock_code_no = v_stock_code_no limit 1;


    /* if @订单方向#= 《订单方向-卖出》  then */
    if v_order_dir= 2  then

        /* set @订单数量#= -1*@订单数量#; */
        set v_order_qty= -1*v_order_qty;
    end if;

    /* set  @持仓数量# = ABS(@多头当前数量# + @空头平仓数量# - @空头当前数量# - @多头平仓数量# + @交易释放数量# - @交易占用数量# + @订单数量#); */
    set  v_posi_qty = ABS(v_long_curr_qty + v_short_close_posi_qty - v_short_curr_qty - v_long_close_posi_qty + v_trade_releas_qty - v_trade_capt_qty + v_order_qty);

    /* set @记录个数#=0; */
    set v_record_count=0;

    /* [获取表记录变量语句][交易证券_T0_操作员持仓市值设置表][count(1),{最大持仓市值}][@记录个数#,@最大持仓市值#][{操作员编号}=@业务操作员编号# and {机构编号}=@机构编号#] */
    select count(1),max_posi_market_value into v_record_count,v_max_posi_market_value from db_tdsecu.tb_tdset0_opor_posi_market_value_set where opor_no=v_busi_opor_no and co_no=v_co_no limit 1;


    /* if  @记录个数# <> 0 then */
    if  v_record_count <> 0 then

           /* [检查报错返回][@持仓数量#*@最新价# > @最大持仓市值#][779][@业务操作员编号#, @最大持仓市值#] */
           if v_posi_qty*v_last_price > v_max_posi_market_value then
               
               SET v_error_code = "tdsecuA.6.39.779";
               if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,","," 最大持仓市值=", v_max_posi_market_value),"#",v_mysql_message);
               else
                   SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,","," 最大持仓市值=", v_max_posi_market_value);
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

# 原子_交易证券_T0_操作员券源变化更新已分配数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_OporStockOccurUpdateAssignedQty;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_OporStockOccurUpdateAssignedQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_source_stock_occur_qty decimal(18,2),
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
    declare v_source_stock_occur_qty decimal(18,2);
    declare v_row_id bigint;
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
    SET v_source_stock_occur_qty = p_source_stock_occur_qty;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][交易证券_T0_操作员券源设置表][{已分配数量} ={已分配数量} - @券源变动数量#][{记录序号}=@记录序号#][1][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, assigned_qty =assigned_qty - v_source_stock_occur_qty where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "tdsecuA.6.40.1";
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

# 原子_交易证券_T0_操作员阈值累计盈亏更新
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_UpdateOporTsholdSumPandl;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_UpdateOporTsholdSumPandl(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_busi_opor_no int,
    IN p_sum_realize_pandl decimal(18,4),
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
    declare v_busi_opor_no int;
    declare v_sum_realize_pandl decimal(18,4);
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
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_sum_realize_pandl = p_sum_realize_pandl;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

        /* [更新表记录][交易证券_T0_操作员阈值设置表][{累计实现盈亏}=@累计实现盈亏#][{操作员编号}=@业务操作员编号#][2][@业务操作员编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_tshold_set set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sum_realize_pandl=v_sum_realize_pandl where opor_no=v_busi_opor_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.41.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no);
            end if;
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_tdsecu;;

# 原子_交易证券_T0_修改操作员券源T0买入方式
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_tdset0_ModiOporStockT0BuyType;;
DELIMITER ;;
CREATE PROCEDURE pra_tdset0_ModiOporStockT0BuyType(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_busi_opor_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_t0_buy_type int,
    IN p_menu_no int,
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
    declare v_busi_opor_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_t0_buy_type int;
    declare v_menu_no int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_busi_opor_no = p_busi_opor_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_t0_buy_type = p_t0_buy_type;
    SET v_menu_no = p_menu_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

        /* [更新表记录][交易证券_T0_操作员券源设置表][{T0买入方式} =@T0买入方式#][{操作员编号}=@业务操作员编号# and {交易组编号}=@交易组编号# and {资产账户编号} = @资产账户编号# and {证券代码编号} = @证券代码编号# and {股东代码编号} = @股东代码编号#][1][@业务操作员编号#,@产品编号#,@交易组编号#,@资产账户编号#,@股东代码编号#,@证券代码编号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_tdsecu.tb_tdset0_opor_stock_source set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, t0_buy_type =v_t0_buy_type where opor_no=v_busi_opor_no and exch_group_no=v_exch_group_no and asset_acco_no = v_asset_acco_no and stock_code_no = v_stock_code_no and stock_acco_no = v_stock_acco_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "tdsecuA.6.42.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("业务操作员编号=",v_busi_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
            else
                SET v_error_info = concat("业务操作员编号=",v_busi_opor_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","股东代码编号=",v_stock_acco_no,",","证券代码编号=",v_stock_code_no);
            end if;
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


