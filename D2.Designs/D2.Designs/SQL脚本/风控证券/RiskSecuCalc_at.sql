DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取证券估值价格
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetStockValuationPrice;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetStockValuationPrice(
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
    OUT p_evalu_price decimal(16,9)
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
    declare v_evalu_price decimal(16,9);
    declare v_bond_accr_intrst decimal(18,12);
    declare v_net_price_flag int;
    declare v_asset_type int;
    declare v_bond_rate_type int;
    declare v_last_price decimal(16,9);
    declare v_fair_price decimal(16,9);

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
    SET v_evalu_price = 0;
    SET v_bond_accr_intrst = 0;
    SET v_net_price_flag = 0;
    SET v_asset_type = 0;
    SET v_bond_rate_type = 0;
    SET v_last_price = 0;
    SET v_fair_price = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_证券信息表][{债券计提利息},{净价标志},{资产类型},{债券利率类型},{最新价},{公允价格}][@债券计提利息#,@净价标志#,@资产类型#,@债券利率类型#,@最新价#,@公允价格#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select bond_accr_intrst,net_price_flag,asset_type,bond_rate_type,last_price,fair_price into v_bond_accr_intrst,v_net_price_flag,v_asset_type,v_bond_rate_type,v_last_price,v_fair_price from db_rksecu.tb_rksecc_secu_stock_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;

    if FOUND_ROWS() = 0 then

      /* SET @估值价格# = 0; */
      SET v_evalu_price = 0;
    else

      /* if @资产类型# = 0 then */
      if v_asset_type = 0 then

        /* SET @估值价格# = 0; */
        SET v_evalu_price = 0;

      /* elseif @公允价格# > 0 then */
      elseif v_fair_price > 0 then

        /* SET @估值价格# = @公允价格#; */
        SET v_evalu_price = v_fair_price;

      /* elseif @净价标志# = '1' and @债券利率类型# <> 3 then */
      elseif v_net_price_flag = '1' and v_bond_rate_type <> 3 then

        /* SET @估值价格# = @最新价# + @债券计提利息#; */
        SET v_evalu_price = v_last_price + v_bond_accr_intrst;
      else

        /* SET @估值价格# = @最新价#; */
        SET v_evalu_price = v_last_price;
      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_evalu_price = v_evalu_price;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_计算单证券持仓数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_CalcStockPositionHoldingEquities;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_CalcStockPositionHoldingEquities(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_trig_type int,
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_trig_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_qty decimal(18,2);
    declare v_compli_calc_dir_type int;
    declare v_curr_qty decimal(18,2);
    declare v_strike_capt_qty decimal(18,2);
    declare v_strike_releas_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_trade_releas_qty decimal(18,2);
    declare v_trade_capt_qty decimal(18,2);
    declare v_comm_capt_qty decimal(18,2);
    declare v_comm_releas_qty decimal(18,2);
    declare v_cost_calc_type int;

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_trig_type = p_trig_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_qty = 0;
    SET v_compli_calc_dir_type = 0;
    SET v_curr_qty = 0;
    SET v_strike_capt_qty = 0;
    SET v_strike_releas_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_frozen_qty = 0;
    SET v_trade_releas_qty = 0;
    SET v_trade_capt_qty = 0;
    SET v_comm_capt_qty = 0;
    SET v_comm_releas_qty = 0;
    SET v_cost_calc_type = 0;

    
    label_pro:BEGIN
    
    #根据触发方向来判断增加还是减少

    /* if @触发方向# = 1 or @触发方向# =2 then */
    if v_trig_type = 1 or v_trig_type =2 then

      /* set @合规计算方向# = 1; */
      set v_compli_calc_dir_type = 1;
    else

      /* set @合规计算方向# = 2; */
      set v_compli_calc_dir_type = 2;
    end if;
    #根据层级来获取数量

    /* if @合规计算层级# = 1 then */
    if v_compli_calc_level = 1 then

      /* if @市场编号# = 1 or @市场编号# = 2 then */
      if v_exch_no = 1 or v_exch_no = 2 then

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum({当前数量}),0),ifnull(sum({成交占用数量}),0),ifnull(sum({成交释放数量}),0),ifnull(sum({解冻数量}),0),ifnull(sum({冻结数量}),0),ifnull(sum({交易释放数量}),0),ifnull(sum({交易占用数量}),0),ifnull(sum({指令占用数量}),0),ifnull(sum({指令释放数量}),0),{成本计算方式}][@当前数量#,@成交占用数量#,@成交释放数量#,@解冻数量#,@冻结数量#,@交易释放数量#,@交易占用数量#,@指令占用数量#,@指令释放数量#,@成本计算方式#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and ( instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1' or  @交易组编号串# = ' ') and {证券代码}=@证券代码# and {市场编号}=@市场编号# and {投资类型}<>3] */
        select ifnull(sum(curr_qty),0),ifnull(sum(strike_capt_qty),0),ifnull(sum(strike_releas_qty),0),ifnull(sum(unfroz_qty),0),ifnull(sum(frozen_qty),0),ifnull(sum(trade_releas_qty),0),ifnull(sum(trade_capt_qty),0),ifnull(sum(comm_capt_qty),0),ifnull(sum(comm_releas_qty),0),cost_calc_type into v_curr_qty,v_strike_capt_qty,v_strike_releas_qty,v_unfroz_qty,v_frozen_qty,v_trade_releas_qty,v_trade_capt_qty,v_comm_capt_qty,v_comm_releas_qty,v_cost_calc_type from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and ( instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1' or  v_exch_group_no_str = ' ') and stock_code=v_stock_code and exch_no=v_exch_no and invest_type<>3 limit 1;

      else

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum({当前数量}),0),ifnull(sum({成交占用数量}),0),ifnull(sum({成交释放数量}),0),ifnull(sum({解冻数量}),0),ifnull(sum({冻结数量}),0),ifnull(sum({交易释放数量}),0),ifnull(sum({交易占用数量}),0),ifnull(sum({指令占用数量}),0),ifnull(sum({指令释放数量}),0),{成本计算方式}][@当前数量#,@成交占用数量#,@成交释放数量#,@解冻数量#,@冻结数量#,@交易释放数量#,@交易占用数量#,@指令占用数量#,@指令释放数量#,@成本计算方式#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and ( instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1' or  @交易组编号串# = ' ') and {证券代码}=@证券代码# and {投资类型}<>3] */
        select ifnull(sum(curr_qty),0),ifnull(sum(strike_capt_qty),0),ifnull(sum(strike_releas_qty),0),ifnull(sum(unfroz_qty),0),ifnull(sum(frozen_qty),0),ifnull(sum(trade_releas_qty),0),ifnull(sum(trade_capt_qty),0),ifnull(sum(comm_capt_qty),0),ifnull(sum(comm_releas_qty),0),cost_calc_type into v_curr_qty,v_strike_capt_qty,v_strike_releas_qty,v_unfroz_qty,v_frozen_qty,v_trade_releas_qty,v_trade_capt_qty,v_comm_capt_qty,v_comm_releas_qty,v_cost_calc_type from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and ( instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1' or  v_exch_group_no_str = ' ') and stock_code=v_stock_code and invest_type<>3 limit 1;

      end if;

    /* elseif @合规计算层级# = 2 then */
    elseif v_compli_calc_level = 2 then

      /* if @市场编号# = 1 or @市场编号# = 2 then */
      if v_exch_no = 1 or v_exch_no = 2 then

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum( {当前数量}),0),ifnull(sum( {成交占用数量}),0),ifnull(sum( {成交释放数量}),0),ifnull(sum( {解冻数量}),0),ifnull(sum( {冻结数量}),0),ifnull(sum( {交易释放数量}),0),ifnull(sum( {交易占用数量}),0),ifnull(sum( {指令占用数量}),0),ifnull(sum( {指令释放数量}),0),{成本计算方式}][@当前数量#,@成交占用数量#,@成交释放数量#,@解冻数量#,@冻结数量#,@交易释放数量#,@交易占用数量#,@指令占用数量#,@指令释放数量#,@成本计算方式#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1')and {交易组编号} = 0 and {证券代码}=@证券代码# and {市场编号}=@市场编号# and {投资类型}<>3] */
        select ifnull(sum( curr_qty),0),ifnull(sum( strike_capt_qty),0),ifnull(sum( strike_releas_qty),0),ifnull(sum( unfroz_qty),0),ifnull(sum( frozen_qty),0),ifnull(sum( trade_releas_qty),0),ifnull(sum( trade_capt_qty),0),ifnull(sum( comm_capt_qty),0),ifnull(sum( comm_releas_qty),0),cost_calc_type into v_curr_qty,v_strike_capt_qty,v_strike_releas_qty,v_unfroz_qty,v_frozen_qty,v_trade_releas_qty,v_trade_capt_qty,v_comm_capt_qty,v_comm_releas_qty,v_cost_calc_type from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1')and exch_group_no = 0 and stock_code=v_stock_code and exch_no=v_exch_no and invest_type<>3 limit 1;

      else

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum( {当前数量}),0),ifnull(sum( {成交占用数量}),0),ifnull(sum( {成交释放数量}),0),ifnull(sum( {解冻数量}),0),ifnull(sum( {冻结数量}),0),ifnull(sum( {交易释放数量}),0),ifnull(sum( {交易占用数量}),0),ifnull(sum( {指令占用数量}),0),ifnull(sum( {指令释放数量}),0),{成本计算方式}][@当前数量#,@成交占用数量#,@成交释放数量#,@解冻数量#,@冻结数量#,@交易释放数量#,@交易占用数量#,@指令占用数量#,@指令释放数量#,@成本计算方式#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1')and {交易组编号} = 0 and {证券代码}=@证券代码# and {投资类型}<>3] */
        select ifnull(sum( curr_qty),0),ifnull(sum( strike_capt_qty),0),ifnull(sum( strike_releas_qty),0),ifnull(sum( unfroz_qty),0),ifnull(sum( frozen_qty),0),ifnull(sum( trade_releas_qty),0),ifnull(sum( trade_capt_qty),0),ifnull(sum( comm_capt_qty),0),ifnull(sum( comm_releas_qty),0),cost_calc_type into v_curr_qty,v_strike_capt_qty,v_strike_releas_qty,v_unfroz_qty,v_frozen_qty,v_trade_releas_qty,v_trade_capt_qty,v_comm_capt_qty,v_comm_releas_qty,v_cost_calc_type from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1')and exch_group_no = 0 and stock_code=v_stock_code and invest_type<>3 limit 1;

      end if;
    end if;
    #计算持仓数量

    /* if @触发阶段类型# = 1 then */
    if v_trig_stage_type = 1 then

      /* if @合规计算方向# = 1 then */
      if v_compli_calc_dir_type = 1 then

        /* SET @持仓数量#=ifnull(@当前数量#,0)-ifnull(@成交占用数量#,0)+ifnull(@成交释放数量#,0)+ifnull(@交易释放数量#,0)+ifnull(@指令释放数量#,0); */
        SET v_posi_qty=ifnull(v_curr_qty,0)-ifnull(v_strike_capt_qty,0)+ifnull(v_strike_releas_qty,0)+ifnull(v_trade_releas_qty,0)+ifnull(v_comm_releas_qty,0);
      else

        /* SET @持仓数量#=ifnull(@当前数量#,0)-ifnull(@成交占用数量#,0)+ifnull(@成交释放数量#,0)-ifnull(@交易占用数量#,0)-ifnull(@指令占用数量#,0); */
        SET v_posi_qty=ifnull(v_curr_qty,0)-ifnull(v_strike_capt_qty,0)+ifnull(v_strike_releas_qty,0)-ifnull(v_trade_capt_qty,0)-ifnull(v_comm_capt_qty,0);
      end if;

    /* elseif @触发阶段类型# = 2 then */
    elseif v_trig_stage_type = 2 then

      /* if @合规计算方向# = 1 then */
      if v_compli_calc_dir_type = 1 then

        /* SET @持仓数量#=ifnull(@当前数量#,0)-ifnull(@成交占用数量#,0)+ifnull(@成交释放数量#,0)+ifnull(@交易释放数量#,0); */
        SET v_posi_qty=ifnull(v_curr_qty,0)-ifnull(v_strike_capt_qty,0)+ifnull(v_strike_releas_qty,0)+ifnull(v_trade_releas_qty,0);
      else

        /* SET @持仓数量#=ifnull(@当前数量#,0)-ifnull(@成交占用数量#,0)+ifnull(@成交释放数量#,0)-ifnull(@交易占用数量#,0); */
        SET v_posi_qty=ifnull(v_curr_qty,0)-ifnull(v_strike_capt_qty,0)+ifnull(v_strike_releas_qty,0)-ifnull(v_trade_capt_qty,0);
      end if;

    /* elseif @触发阶段类型# = 3 then */
    elseif v_trig_stage_type = 3 then

        /* SET @持仓数量#=ifnull(@当前数量#,0)+ifnull(@成交释放数量#,0)-ifnull(@成交占用数量#,0); */
        SET v_posi_qty=ifnull(v_curr_qty,0)+ifnull(v_strike_releas_qty,0)-ifnull(v_strike_capt_qty,0);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_qty = v_posi_qty;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_计算单证券持仓成本
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_CalcStockPositionHoldingCost;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_CalcStockPositionHoldingCost(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code varchar(6),
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_trig_type int,
    IN p_buy_ref_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_cost decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code varchar(6);
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_trig_type int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_cost decimal(18,4);
    declare v_compli_calc_dir_type int;
    declare v_evalu_price decimal(16,9);
    declare v_comm_releas_cost decimal(18,4);
    declare v_comm_capt_cost decimal(18,4);
    declare v_trade_releas_cost decimal(18,4);
    declare v_trade_capt_cost decimal(18,4);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code = p_stock_code;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_trig_type = p_trig_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_cost = 0;
    SET v_compli_calc_dir_type = 0;
    SET v_evalu_price = 0;
    SET v_comm_releas_cost = 0;
    SET v_comm_capt_cost = 0;
    SET v_trade_releas_cost = 0;
    SET v_trade_capt_cost = 0;

    
    label_pro:BEGIN
    
    #根据触发方向来判断增加还是减少

    /* if @触发方向# = 1 or @触发方向# =2 then */
    if v_trig_type = 1 or v_trig_type =2 then

      /* set @合规计算方向# = 1; */
      set v_compli_calc_dir_type = 1;
    else

      /* set @合规计算方向# = 2; */
      set v_compli_calc_dir_type = 2;
    end if;

    /* if @合规计算层级# = 1 then */
    if v_compli_calc_level = 1 then

      /* if @市场编号# = 1 or @市场编号# = 2 then */
      if v_exch_no = 1 or v_exch_no = 2 then

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum({当前成本金额}+{利息成本金额}),0)][@持仓成本#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' or  @交易组编号串# = ' '  )  and {交易组编号} <> 0  and {证券代码}=@证券代码# and {市场编号}=@市场编号#] */
        select ifnull(sum(curr_cost_amt+intrst_cost_amt),0) into v_posi_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' or  v_exch_group_no_str = ' '  )  and exch_group_no <> 0  and stock_code=v_stock_code and exch_no=v_exch_no limit 1;

      else

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum({当前成本金额}+{利息成本金额}),0)][@持仓成本#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' or  @交易组编号串# = ' '   ) and {交易组编号} <> 0 and {证券代码}=@证券代码# ] */
        select ifnull(sum(curr_cost_amt+intrst_cost_amt),0) into v_posi_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' or  v_exch_group_no_str = ' '   ) and exch_group_no <> 0 and stock_code=v_stock_code  limit 1;

      end if;
    else

      /* if @市场编号# = 1 or @市场编号# = 2 then */
      if v_exch_no = 1 or v_exch_no = 2 then

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum({当前成本金额}+{利息成本金额}),0)][@持仓成本#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# =  '-1' ) and {交易组编号} = 0 and {证券代码}=@证券代码# and {市场编号}=@市场编号#] */
        select ifnull(sum(curr_cost_amt+intrst_cost_amt),0) into v_posi_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str =  '-1' ) and exch_group_no = 0 and stock_code=v_stock_code and exch_no=v_exch_no limit 1;

      else

       /* [获取表记录变量语句][风控证券_计算_交易组证券业务持仓表][ifnull(sum({当前成本金额}+{利息成本金额}),0)][@持仓成本#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# =  '-1' ) and {交易组编号} = 0 and {证券代码}=@证券代码#] */
       select ifnull(sum(curr_cost_amt+intrst_cost_amt),0) into v_posi_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str =  '-1' ) and exch_group_no = 0 and stock_code=v_stock_code limit 1;

      end if;
    end if;
    #根据不同触发阶段进一步进行计算

    /* 调用【原子_风控证券_计算_获取证券估值价格】*/
    call db_rksecu.pra_rksecc_GetStockValuationPrice(
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
        v_evalu_price);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.2.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @指令释放成本# = 0; */
    set v_comm_releas_cost = 0;

    /* set @指令占用成本# = 0; */
    set v_comm_capt_cost = 0;

    /* set @交易释放成本# = 0; */
    set v_trade_releas_cost = 0;

    /* set @交易占用成本# = 0; */
    set v_trade_capt_cost = 0;

    /* if @触发阶段类型# = 1 then */
    if v_trig_stage_type = 1 then

      /* if @合规计算方向# = 1 then */
      if v_compli_calc_dir_type = 1 then

        /* if @市场编号# = 1 or @市场编号# = 2 then */
        if v_exch_no = 1 or v_exch_no = 2 then

          /* select ifnull(sum(({交易释放数量} + {指令释放数量})* @估值价格# ),0) into @指令释放成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码# and {市场编号} = @市场编号#; */
          select ifnull(sum((trade_releas_qty + comm_releas_qty)* v_evalu_price ),0) into v_comm_releas_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code and exch_no = v_exch_no;
        else

          /* select ifnull(sum(({交易释放数量} + {指令释放数量})* @估值价格# * @买入参考汇率#),0) into @指令释放成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码#; */
          select ifnull(sum((trade_releas_qty + comm_releas_qty)* v_evalu_price * v_buy_ref_rate),0) into v_comm_releas_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code;
        end if;

        /* set @持仓成本# = @持仓成本# + @指令释放成本#; */
        set v_posi_cost = v_posi_cost + v_comm_releas_cost;
      else

        /* if @市场编号# = 1 or @市场编号# = 2 then */
        if v_exch_no = 1 or v_exch_no = 2 then

          /* select ifnull(sum(case when {成本计算方式} = 2 and {当前数量} - {成交占用数量} + {成交释放数量} = 0 then 0 when {成本计算方式} = 2 then ({交易占用数量} + {指令占用数量})*(({当前成本金额}+{利息成本金额})/({当前数量} - {成交占用数量} + {成交释放数量})) else ({交易占用数量} + {指令占用数量}) * @估值价格#  end),0) into @指令占用成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码# and {市场编号} = @市场编号#; */
          select ifnull(sum(case when cost_calc_type = 2 and curr_qty - strike_capt_qty + strike_releas_qty = 0 then 0 when cost_calc_type = 2 then (trade_capt_qty + comm_capt_qty)*((curr_cost_amt+intrst_cost_amt)/(curr_qty - strike_capt_qty + strike_releas_qty)) else (trade_capt_qty + comm_capt_qty) * v_evalu_price  end),0) into v_comm_capt_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code and exch_no = v_exch_no;
        else

          /* select ifnull(sum(case when {成本计算方式} = 2 and {当前数量} - {成交占用数量} + {成交释放数量} = 0 then 0 when {成本计算方式} = 2 then ({交易占用数量} + {指令占用数量})*(({当前成本金额}+{利息成本金额})/({当前数量} - {成交占用数量} + {成交释放数量})) else ({交易占用数量} + {指令占用数量}) * @估值价格# * @买入参考汇率# end),0) into @指令占用成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码#; */
          select ifnull(sum(case when cost_calc_type = 2 and curr_qty - strike_capt_qty + strike_releas_qty = 0 then 0 when cost_calc_type = 2 then (trade_capt_qty + comm_capt_qty)*((curr_cost_amt+intrst_cost_amt)/(curr_qty - strike_capt_qty + strike_releas_qty)) else (trade_capt_qty + comm_capt_qty) * v_evalu_price * v_buy_ref_rate end),0) into v_comm_capt_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code;
        end if;

          /* set @持仓成本# = @持仓成本# - @指令占用成本#; */
          set v_posi_cost = v_posi_cost - v_comm_capt_cost;
      end if;

    /* elseif @触发阶段类型# = 2 then */
    elseif v_trig_stage_type = 2 then

      /* if @合规计算方向# = 1 then */
      if v_compli_calc_dir_type = 1 then

        /* if @市场编号# = 1 or @市场编号# = 2 then */
        if v_exch_no = 1 or v_exch_no = 2 then

          /* select ifnull(sum({交易释放数量}* @估值价格#),0) into @交易释放成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码# and {市场编号} = @市场编号#; */
          select ifnull(sum(trade_releas_qty* v_evalu_price),0) into v_trade_releas_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code and exch_no = v_exch_no;
        else

          /* select ifnull(sum({交易释放数量}* @估值价格# * @买入参考汇率#),0) into @交易释放成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码#; */
          select ifnull(sum(trade_releas_qty* v_evalu_price * v_buy_ref_rate),0) into v_trade_releas_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code;
        end if;

        /* set @持仓成本# = @持仓成本# + @交易释放成本#; */
        set v_posi_cost = v_posi_cost + v_trade_releas_cost;
      else

        /* if @市场编号# = 1 or @市场编号# = 2 then */
        if v_exch_no = 1 or v_exch_no = 2 then

          /* select ifnull(sum(case when {成本计算方式} = 2 and {当前数量} - {成交占用数量} + {成交释放数量} = 0 then 0 when {成本计算方式} = 2 then {交易占用数量}*(({当前成本金额}+{利息成本金额})/({当前数量} - {成交占用数量} + {成交释放数量})) else {交易占用数量}* @估值价格# end),0) into @交易占用成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码# and {市场编号} = @市场编号#; */
          select ifnull(sum(case when cost_calc_type = 2 and curr_qty - strike_capt_qty + strike_releas_qty = 0 then 0 when cost_calc_type = 2 then trade_capt_qty*((curr_cost_amt+intrst_cost_amt)/(curr_qty - strike_capt_qty + strike_releas_qty)) else trade_capt_qty* v_evalu_price end),0) into v_trade_capt_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code and exch_no = v_exch_no;
        else

          /* select ifnull(sum(case when {成本计算方式} = 2 and {当前数量} - {成交占用数量} + {成交释放数量} = 0 then 0 when {成本计算方式} = 2 then {交易占用数量}*(({当前成本金额}+{利息成本金额})/({当前数量} - {成交占用数量} + {成交释放数量})) else {交易占用数量}* @估值价格# * @买入参考汇率# end),0) into @交易占用成本# from ~风控证券_计算_交易组证券业务持仓表^ where {机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (case when @交易组编号串#= ' 'then {交易组编号}= 0 else (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' )  end ) and {证券代码} = @证券代码#; */
          select ifnull(sum(case when cost_calc_type = 2 and curr_qty - strike_capt_qty + strike_releas_qty = 0 then 0 when cost_calc_type = 2 then trade_capt_qty*((curr_cost_amt+intrst_cost_amt)/(curr_qty - strike_capt_qty + strike_releas_qty)) else trade_capt_qty* v_evalu_price * v_buy_ref_rate end),0) into v_trade_capt_cost from db_rksecu.tb_rksecc_secu_exgp_posi where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (case when v_exch_group_no_str= ' 'then exch_group_no= 0 else (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' )  end ) and stock_code = v_stock_code;
        end if;

        /* set @持仓成本# = @持仓成本# - @交易占用成本#; */
        set v_posi_cost = v_posi_cost - v_trade_capt_cost;
      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_cost = v_posi_cost;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_计算单证券持仓市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_CalcStockPositionHoldingValue;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_CalcStockPositionHoldingValue(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_trig_type int,
    IN p_order_dir int,
    IN p_order_qty decimal(18,2),
    IN p_trade_qty decimal(18,2),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_market_value decimal(18,4),
    OUT p_evalu_price decimal(16,9)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_trig_type int;
    declare v_order_dir int;
    declare v_order_qty decimal(18,2);
    declare v_trade_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_market_value decimal(18,4);
    declare v_evalu_price decimal(16,9);
    declare v_posi_qty decimal(18,2);
    declare v_tmp_posi_market_value decimal(18,4);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_trig_type = p_trig_type;
    SET v_order_dir = p_order_dir;
    SET v_order_qty = p_order_qty;
    SET v_trade_qty = p_trade_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_market_value = 0;
    SET v_evalu_price = 0;
    SET v_posi_qty = 0;
    SET v_tmp_posi_market_value = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_计算_计算单证券持仓数量】*/
    call db_rksecu.pra_rksecc_CalcStockPositionHoldingEquities(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_exch_no,
        v_stock_code,
        v_trig_stage_type,
        v_compli_calc_level,
        v_trig_type,
        v_error_code,
        v_error_info,
        v_posi_qty);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.2.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券持仓数量出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* 调用【原子_风控证券_计算_获取证券估值价格】*/
    call db_rksecu.pra_rksecc_GetStockValuationPrice(
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
        v_evalu_price);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.2.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取证券估值价格出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* SET @持仓市值#=(@持仓数量#+ @交易数量#) * @估值价格#; */
    SET v_posi_market_value=(v_posi_qty+ v_trade_qty) * v_evalu_price;

    /* SET @临时_持仓市值# = @持仓市值#; */
    SET v_tmp_posi_market_value = v_posi_market_value;

    /* 调用【原子_风控证券_计算_计算单证券大宗交易市值】*/
    call db_rksecu.pra_rksecc_CalcStockBlockTradeHoldingEquities(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_exch_no,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_posi_market_value);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.2.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_计算单证券大宗交易市值出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* SET @持仓市值#=@临时_持仓市值# + @持仓市值#; */
    SET v_posi_market_value=v_tmp_posi_market_value + v_posi_market_value;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_market_value = v_posi_market_value;
    SET p_evalu_price = v_evalu_price;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取昨日净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetProductPreNetAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetProductPreNetAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_compli_calc_level int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_compli_calc_level int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* if @合规计算层级# = 1 then */
    if v_compli_calc_level = 1 then

      /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({期初资产值}),0)][@净资产#][ {机构编号} = @机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串#= '-1' or @交易组编号串#= ' ') and {本币币种}=@本币币种#] */
      select ifnull(sum(begin_asset_value),0) into v_nav_asset from db_rksecu.tb_rksecc_secu_exgp_asset where  co_no = v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= '-1' or v_exch_group_no_str= ' ') and crncy_type=v_crncy_type limit 1;

    else

      /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({期初资产值}),0)][@净资产#][{机构编号} = @机构编号# and {机构编号} = @机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and {本币币种}=@本币币种#] */
      select ifnull(sum(begin_asset_value),0) into v_nav_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and co_no = v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and crncy_type=v_crncy_type limit 1;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取反向交易合规
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetStockReverseTradeCompliance;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetStockReverseTradeCompliance(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_target_risk_param varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_target_risk_param varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_reve_order_dir int;

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_target_risk_param = p_target_risk_param;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_reve_order_dir = 0;

    
    label_pro:BEGIN
    
    #获取方向订单方向

    /* if @订单方向# = 1 then */
    if v_order_dir = 1 then

      /* SET @反向订单方向# = 2; */
      SET v_reve_order_dir = 2;
    end if;

    /* if @订单方向# = 2 then */
    if v_order_dir = 2 then

      /* SET @反向订单方向# = 1; */
      SET v_reve_order_dir = 1;
    end if;

    /* [检查正常返回][@反向订单方向# = 0] */
    if v_reve_order_dir = 0 then
        leave label_pro;
    end if;


    /* if @触发阶段类型# = 2 then */
    if v_trig_stage_type = 2 then

      /* if @合规计算层级# = 2 then */
      if v_compli_calc_level = 2 then

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and (({价格类型}<>1) or ({价格类型}=1 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and ((price_type<>1) or (price_type=1 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','6','7','a','b');


        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and (({价格类型}<>1) or ({价格类型}=1 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and ((price_type<>1) or (price_type=1 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','a','b');


        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','6','7','a','b');


       /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
       elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','a','b');

       end if;
      else

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and (({价格类型}<>1) or ({价格类型}=1 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and ((price_type<>1) or (price_type=1 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','6','7','a','b');


        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and (({价格类型}<>1) or ({价格类型}=1 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and ((price_type<>1) or (price_type=1 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','a','b');


        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','6','7','a','b');


        /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
        elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ') and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ') and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','a','b');

        end if;
      end if;
    else

      /* if @合规计算层级# = 2 then */
      if v_compli_calc_level = 2 then

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and {指令状态} not in ('5','6')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and comm_status not in ('5','6');


          /* if @记录个数# = 0 then */
          if v_record_count = 0 then

               /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and (({价格类型}<>1) or ({价格类型}=1 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} not in ('-2','4','8','9') and {指令序号}<>0] */
               select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and ((price_type<>1) or (price_type=1 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 and order_dir = 2 and order_price<=v_order_price)) and order_status not in ('-2','4','8','9') and comm_id<>0;

          end if;

        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and {指令状态} not in ('5','6')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and comm_status not in ('5','6');


          /* if @记录个数# = 0 then */
          if v_record_count = 0 then

               /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向#  and {订单状态} not in ('-2','4','8','9') and {指令序号}<>0] */
               select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir  and order_status not in ('-2','4','8','9') and comm_id<>0;

          end if;

        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and ({指令状态} in ('1','2','4') or ({指令状态}=3 and {成交状态}<>3))] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and (comm_status in ('1','2','4') or (comm_status=3 and strike_status<>3));


        /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
        elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and ({指令状态} in ('1','2','4') or ({指令状态}=3 and {成交状态}<>3))] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and (comm_status in ('1','2','4') or (comm_status=3 and strike_status<>3));

        end if;
      else

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and {指令状态} in ('1','2','3','4','5')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and comm_status in ('1','2','3','4','5');


          /* if @记录个数# = 0 then */
          if v_record_count = 0 then

               /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向# and (({价格类型}<>1) or ({价格类型}=1 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} not in ('-2','4','8','9') and {指令序号}<>0] */
               select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir and ((price_type<>1) or (price_type=1 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 and order_dir = 2 and order_price<=v_order_price)) and order_status not in ('-2','4','8','9') and comm_id<>0;

          end if;

        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ')  and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and {指令状态} not in ('5','6')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ')  and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and comm_status not in ('5','6');


          /* if @记录个数# = 0 then */
          if v_record_count = 0 then

               /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {订单方向}=@反向订单方向#  and {订单状态} not in ('-2','4','8','9') and {指令序号}<>0] */
               select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and exch_no=v_exch_no and stock_code_no=v_stock_code_no and order_dir=v_reve_order_dir  and order_status not in ('-2','4','8','9') and comm_id<>0;

          end if;

        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ') and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and ({指令状态} in ('1','2','4') or ({指令状态}=3 and {成交状态}<>3))] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ') and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and (comm_status in ('1','2','4') or (comm_status=3 and strike_status<>3));


        /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
        elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ') and {市场编号}=@市场编号# and {证券代码编号}=@证券代码编号# and {指令方向}=@反向订单方向# and ({指令状态} in ('1','2','4') or ({指令状态}=3 and {成交状态}<>3))] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ') and exch_no=v_exch_no and stock_code_no=v_stock_code_no and comm_dir=v_reve_order_dir and (comm_status in ('1','2','4') or (comm_status=3 and strike_status<>3));

        end if;
      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_计算当前交易金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_CalcCurrentTradingAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_CalcCurrentTradingAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_compli_calc_level int,
    IN p_trig_stage_type int,
    IN p_buy_ref_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_trade_amt decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_compli_calc_level int;
    declare v_trig_stage_type int;
    declare v_buy_ref_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_trade_amt decimal(18,4);
    declare v_exch_no int;
    declare v_sell_ref_rate decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_settle_sell_rate decimal(18,12);
    declare v_tmp_trade_amt decimal(18,4);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_buy_ref_rate = p_buy_ref_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_trade_amt = 0;
    SET v_exch_no = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;
    SET v_tmp_trade_amt = 0;

    
    label_pro:BEGIN
    

    /* set @市场编号# = 3; */
    set v_exch_no = 3;

    /* 调用【原子_风控证券_计算_获取港股汇率】*/
    call db_rksecu.pra_rksecc_GetHKRate(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_exch_no,
        v_error_code,
        v_error_info,
        v_buy_ref_rate,
        v_sell_ref_rate,
        v_settle_buy_rate,
        v_settle_sell_rate);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.2.7.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取港股汇率出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* set @临时_交易金额# = 0; */
    set v_tmp_trade_amt = 0;

    /* if @触发阶段类型# = 1 then */
    if v_trig_stage_type = 1 then

      /* if @合规计算层级# = 1 then */
      if v_compli_calc_level = 1 then

        /* [获取表记录变量语句][风控证券_计算_订单表][ifnull(SUM({全部费用}+{成交金额}+(case when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=1) then {订单冻结金额}
     when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=2) then {订单冻结数量}*{订单价格}  when {订单方向}=4 then {订单冻结金额} else {订单冻结金额} end)),0)][@交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and  (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1') and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(all_fee+strike_amt+(case when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=1) then order_frozen_amt
             when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=2) then order_frozen_qty*order_price  when order_dir=4 then order_frozen_amt else order_frozen_amt end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and  (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1') and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* [获取表记录变量语句][风控证券_计算_指令表][ifnull(SUM(case when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {指令方向}=1) then {指令冻结金额}
     when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {指令方向}=2) then {指令冻结数量}*{指令实际限价}
     when {指令方向}=4 then {指令冻结金额}
else {指令冻结金额} end),0)][@临时_交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and  (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1') and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(case when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and comm_dir=1) then comm_frozen_amt
             when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and comm_dir=2) then comm_frozen_qty*limit_actual_price
             when comm_dir=4 then comm_frozen_amt
        else comm_frozen_amt end),0) into v_tmp_trade_amt from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and  (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1') and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* set @临时_交易金额# = @交易金额# + @临时_交易金额#; */
        set v_tmp_trade_amt = v_trade_amt + v_tmp_trade_amt;

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务资金表][ifnull(SUM(({指令释放金额}+{交易释放金额}+{成交释放金额})*(case when {交易币种} = 'HKD' then @买入参考汇率# else 1 end))+SUM(({指令占用金额}+{交易占用金额}+{成交占用金额})*(case when {交易币种} = 'HKD' then @卖出参考汇率# else 1 end)),0)][@交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and  (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1')] */
        select ifnull(SUM((comm_releas_amt+trade_releas_amt+strike_releas_amt)*(case when exch_crncy_type = 'HKD' then v_buy_ref_rate else 1 end))+SUM((comm_capt_amt+trade_capt_amt+strike_capt_amt)*(case when exch_crncy_type = 'HKD' then v_sell_ref_rate else 1 end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_exgp_capit where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and  (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1') limit 1;


        /* set @交易金额# = @交易金额# - @临时_交易金额#; */
        set v_trade_amt = v_trade_amt - v_tmp_trade_amt;
      else

        /* [获取表记录变量语句][风控证券_计算_订单表][ifnull(SUM({全部费用}+{成交金额}+(case when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=1) then {订单冻结金额}
     when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=2) then {订单冻结数量}*{订单价格}  when {订单方向}=4 then {订单冻结金额} else {订单冻结金额} end)),0)][@交易金额#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(all_fee+strike_amt+(case when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=1) then order_frozen_amt
             when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=2) then order_frozen_qty*order_price  when order_dir=4 then order_frozen_amt else order_frozen_amt end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* [获取表记录变量语句][风控证券_计算_指令表][ifnull(SUM(case when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {指令方向}=1) then {指令冻结金额}
     when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {指令方向}=2) then {指令冻结数量}*{指令实际限价}
     when {指令方向}=4 then {指令冻结金额}
else {指令冻结金额} end),0)][@临时_交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1')  and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(case when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and comm_dir=1) then comm_frozen_amt
             when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and comm_dir=2) then comm_frozen_qty*limit_actual_price
             when comm_dir=4 then comm_frozen_amt
        else comm_frozen_amt end),0) into v_tmp_trade_amt from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1')  and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* set @临时_交易金额# = @交易金额# + @临时_交易金额#; */
        set v_tmp_trade_amt = v_trade_amt + v_tmp_trade_amt;

        /* [获取表记录变量语句][风控证券_计算_交易组证券业务资金表][ifnull(SUM(({指令释放金额}+{交易释放金额}+{成交释放金额})*(case when {交易币种} = 'HKD' then @买入参考汇率# else 1 end))+SUM(({指令占用金额}+{交易占用金额}+{成交占用金额})*(case when {交易币种} = 'HKD' then @卖出参考汇率# else 1 end)),0)][@交易金额#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and {交易组编号} = 0] */
        select ifnull(SUM((comm_releas_amt+trade_releas_amt+strike_releas_amt)*(case when exch_crncy_type = 'HKD' then v_buy_ref_rate else 1 end))+SUM((comm_capt_amt+trade_capt_amt+strike_capt_amt)*(case when exch_crncy_type = 'HKD' then v_sell_ref_rate else 1 end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_exgp_capit where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and exch_group_no = 0 limit 1;


        /* set @交易金额# = @交易金额# - @临时_交易金额#; */
        set v_trade_amt = v_trade_amt - v_tmp_trade_amt;
      end if;

    /* elseif @触发阶段类型# = 2 then */
    elseif v_trig_stage_type = 2 then

      /* if @合规计算层级# = 1 then */
      if v_compli_calc_level = 1 then

        /* [获取表记录变量语句][风控证券_计算_订单表][ifnull(SUM({全部费用}+{成交金额}+(case when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=1) then {订单冻结金额}
     when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=2) then {订单冻结数量}*{订单价格}  when {订单方向}=4 then {订单冻结金额} else {订单冻结金额} end)),0)][@临时_交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and  (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1') and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(all_fee+strike_amt+(case when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=1) then order_frozen_amt
             when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=2) then order_frozen_qty*order_price  when order_dir=4 then order_frozen_amt else order_frozen_amt end)),0) into v_tmp_trade_amt from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and  (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1') and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* [获取表记录变量语句][风控证券_计算_交易组证券业务资金表][ifnull(SUM(({交易释放金额}+{成交释放金额})*(case when {交易币种} = 'HKD' then @买入参考汇率# else 1 end))+SUM(({交易占用金额}+{成交占用金额})*(case when {交易币种} = 'HKD' then @卖出参考汇率# else 1 end)),0)][@交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and  (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1')] */
        select ifnull(SUM((trade_releas_amt+strike_releas_amt)*(case when exch_crncy_type = 'HKD' then v_buy_ref_rate else 1 end))+SUM((trade_capt_amt+strike_capt_amt)*(case when exch_crncy_type = 'HKD' then v_sell_ref_rate else 1 end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_exgp_capit where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and  (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1') limit 1;


        /* set @交易金额# = @交易金额# - @临时_交易金额#; */
        set v_trade_amt = v_trade_amt - v_tmp_trade_amt;
      else

        /* [获取表记录变量语句][风控证券_计算_订单表][ifnull(SUM({全部费用}+{成交金额}+(case when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=1) then {订单冻结金额}
     when ((instr(concat(';',"57;63;"),concat(';',{证券类型},';'))>0) and {订单方向}=2) then {订单冻结数量}*{订单价格}  when {订单方向}=4 then {订单冻结金额} else {订单冻结金额} end)),0)][@临时_交易金额#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(all_fee+strike_amt+(case when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=1) then order_frozen_amt
             when ((instr(concat(';',"57;63;"),concat(';',stock_type,';'))>0) and order_dir=2) then order_frozen_qty*order_price  when order_dir=4 then order_frozen_amt else order_frozen_amt end)),0) into v_tmp_trade_amt from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* [获取表记录变量语句][风控证券_计算_交易组证券业务资金表][ifnull(SUM(({交易释放金额}+{成交释放金额})*(case when {交易币种} = 'HKD' then @买入参考汇率# else 1 end))+SUM(({交易占用金额}+{成交占用金额})*(case when {交易币种} = 'HKD' then @卖出参考汇率# else 1 end)),0)][@交易金额#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1')and {交易组编号} = 0] */
        select ifnull(SUM((trade_releas_amt+strike_releas_amt)*(case when exch_crncy_type = 'HKD' then v_buy_ref_rate else 1 end))+SUM((trade_capt_amt+strike_capt_amt)*(case when exch_crncy_type = 'HKD' then v_sell_ref_rate else 1 end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_exgp_capit where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1')and exch_group_no = 0 limit 1;


        /* set @交易金额# = @交易金额# - @临时_交易金额#; */
        set v_trade_amt = v_trade_amt - v_tmp_trade_amt;
      end if;

    /* elseif @触发阶段类型# = 3 then */
    elseif v_trig_stage_type = 3 then

      /* if @合规计算层级# = 1 then */
      if v_compli_calc_level = 1 then

        /* [获取表记录变量语句][风控证券_计算_订单表][ifnull(SUM({全部费用}+{成交金额}),0)][@临时_交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and  (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0 or @交易组编号串# = '-1') and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(all_fee+strike_amt),0) into v_tmp_trade_amt from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and  (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str = '-1') and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* [获取表记录变量语句][风控证券_计算_交易组证券业务资金表][ifnull(SUM(({成交释放金额})*(case when {交易币种} = 'HKD' then @买入参考汇率# else 1 end))+SUM(({成交占用金额})*(case when {交易币种} = 'HKD' then @卖出参考汇率# else 1 end)),0)][@交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1') and  (instr(concat(';',@交易组编号串#),concat(';',{交易组编号},';'))>0  or @交易组编号串# = '-1')] */
        select ifnull(SUM((strike_releas_amt)*(case when exch_crncy_type = 'HKD' then v_buy_ref_rate else 1 end))+SUM((strike_capt_amt)*(case when exch_crncy_type = 'HKD' then v_sell_ref_rate else 1 end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_exgp_capit where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1') and  (instr(concat(';',v_exch_group_no_str),concat(';',exch_group_no,';'))>0  or v_exch_group_no_str = '-1') limit 1;


        /* set @交易金额# = @交易金额# - @临时_交易金额#; */
        set v_trade_amt = v_trade_amt - v_tmp_trade_amt;
      else

        /* [获取表记录变量语句][风控证券_计算_订单表][ifnull(SUM({全部费用}+{成交金额}),0)][@临时_交易金额#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0 or @产品编号串# = '-1')  and (instr(concat(';',"26;57;63;"),concat(';',{证券类型},';'))>0)] */
        select ifnull(SUM(all_fee+strike_amt),0) into v_tmp_trade_amt from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and  (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0 or v_pd_no_str = '-1')  and (instr(concat(';',"26;57;63;"),concat(';',stock_type,';'))>0) limit 1;


        /* [获取表记录变量语句][风控证券_计算_交易组证券业务资金表][ifnull(SUM(({成交释放金额})*(case when {交易币种} = 'HKD' then @买入参考汇率# else 1 end))+SUM(({成交占用金额})*(case when {交易币种} = 'HKD' then @卖出参考汇率# else 1 end)),0)][@交易金额#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#),concat(';',{产品编号},';'))>0  or @产品编号串# = '-1')and {交易组编号} = 0] */
        select ifnull(SUM((strike_releas_amt)*(case when exch_crncy_type = 'HKD' then v_buy_ref_rate else 1 end))+SUM((strike_capt_amt)*(case when exch_crncy_type = 'HKD' then v_sell_ref_rate else 1 end)),0) into v_trade_amt from db_rksecu.tb_rksecc_secu_exgp_capit where co_no=v_co_no and (instr(concat(';',v_pd_no_str),concat(';',pd_no,';'))>0  or v_pd_no_str = '-1')and exch_group_no = 0 limit 1;


        /* set @交易金额# = @交易金额# - @临时_交易金额#; */
        set v_trade_amt = v_trade_amt - v_tmp_trade_amt;
      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_trade_amt = v_trade_amt;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取证券信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetStockInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetStockInfo(
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
    OUT p_total_stock_issue decimal(18,2),
    OUT p_circl_stock_capit decimal(18,2),
    OUT p_stock_type int,
    OUT p_last_price decimal(16,9),
    OUT p_pre_close_price decimal(16,9),
    OUT p_today_open_price decimal(16,9),
    OUT p_strike_amt decimal(18,4)
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
    declare v_total_stock_issue decimal(18,2);
    declare v_circl_stock_capit decimal(18,2);
    declare v_stock_type int;
    declare v_last_price decimal(16,9);
    declare v_pre_close_price decimal(16,9);
    declare v_today_open_price decimal(16,9);
    declare v_strike_amt decimal(18,4);

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
    SET v_total_stock_issue = 0;
    SET v_circl_stock_capit = 0;
    SET v_stock_type = 0;
    SET v_last_price = 0;
    SET v_pre_close_price = 0;
    SET v_today_open_price = 0;
    SET v_strike_amt = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_证券信息表][{总股本},{流通股本},{证券类型},{最新价},{今开盘价},{昨收盘价},{成交金额}][@总股本#,@流通股本#,@证券类型#,@最新价#,@今开盘价#,@昨收盘价#,@成交金额#][{市场编号}=@市场编号# and {证券代码}=@证券代码#] */
    select total_stock_issue,circl_stock_capit,stock_type,last_price,today_open_price,pre_close_price,strike_amt into v_total_stock_issue,v_circl_stock_capit,v_stock_type,v_last_price,v_today_open_price,v_pre_close_price,v_strike_amt from db_rksecu.tb_rksecc_secu_stock_info where exch_no=v_exch_no and stock_code=v_stock_code limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_total_stock_issue = v_total_stock_issue;
    SET p_circl_stock_capit = v_circl_stock_capit;
    SET p_stock_type = v_stock_type;
    SET p_last_price = v_last_price;
    SET p_pre_close_price = v_pre_close_price;
    SET p_today_open_price = v_today_open_price;
    SET p_strike_amt = v_strike_amt;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取多产品净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetMultiProductNetAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetMultiProductNetAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@现金资产#][{机构编号} = @机构编号# and ( instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0 or @产品编号串# = '-1') and {资产项} = 1] */
    select ifnull(sum(asset_value),0) into v_cash_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and ( instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0 or v_pd_no_str = '-1') and asset_item = 1 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@股票资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0 or @产品编号串# = '-1') and {资产项} = 2] */
    select ifnull(sum(asset_value),0) into v_stock_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0 or v_pd_no_str = '-1') and asset_item = 2 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@债券资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0 or @产品编号串# = '-1')and {资产项} = 3] */
    select ifnull(sum(asset_value),0) into v_bond_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0 or v_pd_no_str = '-1')and asset_item = 3 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@基金资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0 or @产品编号串# = '-1') and {资产项} = 4] */
    select ifnull(sum(asset_value),0) into v_fund_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0 or v_pd_no_str = '-1') and asset_item = 4 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@回购资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0 or @产品编号串# = '-1') and {资产项} = 5] */
    select ifnull(sum(asset_value),0) into v_repo_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0 or v_pd_no_str = '-1') and asset_item = 5 limit 1;


    /* set @净资产# = ifnull(@现金资产#+@基金资产#+@债券资产#+@股票资产#+@回购资产#, 0); */
    set v_nav_asset = ifnull(v_cash_asset+v_fund_asset+v_bond_asset+v_stock_asset+v_repo_asset, 0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_stock_asset = v_stock_asset;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取多单元净资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetMultiUnitNetAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetMultiUnitNetAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_nav_asset decimal(18,4),
    OUT p_cash_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_nav_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_nav_asset = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@现金资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0   or @产品编号串# = '-1')and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = '-1' or  @交易组编号串# = ' ') and {资产项} = 1] */
    select ifnull(sum(asset_value),0) into v_cash_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0   or v_pd_no_str = '-1')and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = '-1' or  v_exch_group_no_str = ' ') and asset_item = 1 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@股票资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0   or @产品编号串# = '-1')and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = '-1' or  @交易组编号串# = ' ') and {资产项} = 2] */
    select ifnull(sum(asset_value),0) into v_stock_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0   or v_pd_no_str = '-1')and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = '-1' or  v_exch_group_no_str = ' ') and asset_item = 2 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@债券资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0   or @产品编号串# = '-1')and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = '-1' or  @交易组编号串# = ' ') and {资产项} = 3] */
    select ifnull(sum(asset_value),0) into v_bond_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0   or v_pd_no_str = '-1')and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = '-1' or  v_exch_group_no_str = ' ') and asset_item = 3 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@基金资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0 or @产品编号串# = '-1')and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = '-1' or  @交易组编号串# = ' ') and {资产项} = 4] */
    select ifnull(sum(asset_value),0) into v_fund_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0 or v_pd_no_str = '-1')and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = '-1' or  v_exch_group_no_str = ' ') and asset_item = 4 limit 1;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({资产值}),0)][@回购资产#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0  or @产品编号串# = '-1') and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0 or @交易组编号串# = '-1' or  @交易组编号串# = ' ')and {资产项} = 5] */
    select ifnull(sum(asset_value),0) into v_repo_asset from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0  or v_pd_no_str = '-1') and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0 or v_exch_group_no_str = '-1' or  v_exch_group_no_str = ' ')and asset_item = 5 limit 1;


    /* set @净资产# = ifnull(@现金资产#+@基金资产#+@债券资产#+@股票资产#+@回购资产#, 0); */
    set v_nav_asset = ifnull(v_cash_asset+v_fund_asset+v_bond_asset+v_stock_asset+v_repo_asset, 0);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_nav_asset = v_nav_asset;
    SET p_cash_asset = v_cash_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_stock_asset = v_stock_asset;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取多单元单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetMultiUnitNAV;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetMultiUnitNAV(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_part_part_nav decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_part_part_nav decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_part_share decimal(18,2);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_part_part_nav = 0;
    SET v_nav_asset = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset = 0;
    SET v_part_share = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_计算_获取多单元净资产】*/
    call db_rksecu.pra_rksecc_GetMultiUnitNetAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no_str,
        v_exch_group_no_str,
        v_error_code,
        v_error_info,
        v_nav_asset,
        v_cash_asset,
        v_fund_asset,
        v_bond_asset,
        v_repo_asset,
        v_stock_asset);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.2.12.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取多单元净资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({交易单元份额}),0)][@交易单元份额#][{机构编号} = @机构编号# and (instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0  or @产品编号串# = '-1') and (instr(concat(";",@交易组编号串#),concat(";",{交易组编号},";"))>0  or @交易组编号串# = '-1'  or  @交易组编号串# = ' ')] */
    select ifnull(sum(part_share),0) into v_part_share from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and (instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0  or v_pd_no_str = '-1') and (instr(concat(";",v_exch_group_no_str),concat(";",exch_group_no,";"))>0  or v_exch_group_no_str = '-1'  or  v_exch_group_no_str = ' ') limit 1;


    /* if @交易单元份额# > 0 then */
    if v_part_share > 0 then

      /* SET @单元单位净值# = Round(@净资产# / @交易单元份额#,4); */
      SET v_part_part_nav = Round(v_nav_asset / v_part_share,4);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_part_part_nav = v_part_part_nav;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取多产品单位净值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetMultiProductNAV;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetMultiProductNAV(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_part_nav decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_part_nav decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_cash_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_pd_all_share decimal(18,2);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_part_nav = 0;
    SET v_nav_asset = 0;
    SET v_cash_asset = 0;
    SET v_fund_asset = 0;
    SET v_bond_asset = 0;
    SET v_repo_asset = 0;
    SET v_stock_asset = 0;
    SET v_pd_all_share = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_风控证券_计算_获取多产品净资产】*/
    call db_rksecu.pra_rksecc_GetMultiProductNetAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no_str,
        v_error_code,
        v_error_info,
        v_nav_asset,
        v_cash_asset,
        v_fund_asset,
        v_bond_asset,
        v_repo_asset,
        v_stock_asset);
    if v_error_code = "1" then
        SET v_error_code = "rksecuA.2.13.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_风控证券_计算_获取多产品净资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [获取表记录变量语句][风控证券_计算_交易组资产表][ifnull(sum({产品总份额}),0)][@产品总份额#][{机构编号} = @机构编号# and ( instr(concat(";",@产品编号串#),concat(";",{产品编号},";"))>0  or @产品编号串# = '-1')] */
    select ifnull(sum(pd_all_share),0) into v_pd_all_share from db_rksecu.tb_rksecc_secu_exgp_asset where co_no = v_co_no and ( instr(concat(";",v_pd_no_str),concat(";",pd_no,";"))>0  or v_pd_no_str = '-1') limit 1;


    /* if @产品总份额# > 0 then */
    if v_pd_all_share > 0 then

      /* SET @产品单位净值# = Round(@净资产# / @产品总份额#,4); */
      SET v_pd_part_nav = Round(v_nav_asset / v_pd_all_share,4);
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_part_nav = v_pd_part_nav;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_计算数据归历史
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_SecuDataToHis;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_SecuDataToHis(
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
    

    /* [清空表记录][风控证券_计算_订单表] */
    truncate table db_rksecu.tb_rksecc_secu_order;


    /* [清空表记录][风控证券_计算_指令表] */
    truncate table db_rksecu.tb_rksecc_secu_command;


    /* [清空表记录][风控证券_计算_交易组证券业务持仓表] */
    truncate table db_rksecu.tb_rksecc_secu_exgp_posi;


    /* [清空表记录][风控证券_计算_交易组证券业务资金表] */
    truncate table db_rksecu.tb_rksecc_secu_exgp_capit;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取港股反向交易合规
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetHKStockReverseTradeCompliance;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetHKStockReverseTradeCompliance(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_sh_hk_stock_code_no int,
    IN p_sz_hk_stock_code_no int,
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_target_risk_param varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_sh_hk_stock_code_no int;
    declare v_sz_hk_stock_code_no int;
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_target_risk_param varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_reve_order_dir int;
    declare v_stock_acco varchar(16);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_sh_hk_stock_code_no = p_sh_hk_stock_code_no;
    SET v_sz_hk_stock_code_no = p_sz_hk_stock_code_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_target_risk_param = p_target_risk_param;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_reve_order_dir = 0;
    SET v_stock_acco = " ";

    
    label_pro:BEGIN
    
    #获取方向订单方向

    /* if @订单方向# = 1 then */
    if v_order_dir = 1 then

      /* SET @反向订单方向# = 2; */
      SET v_reve_order_dir = 2;
    end if;

    /* if @订单方向# = 2 then */
    if v_order_dir = 2 then

      /* SET @反向订单方向# = 1; */
      SET v_reve_order_dir = 1;
    end if;

    /* [检查正常返回][@反向订单方向# = 0] */
    if v_reve_order_dir = 0 then
        leave label_pro;
    end if;


    /* if @触发阶段类型# = 2 then */
    if v_trig_stage_type = 2 then

      /* if @合规计算层级# = 2 then */
      if v_compli_calc_level = 2 then

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and (({价格类型} not in (1,9,10)) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and ((price_type not in (1,9,10)) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','6','7','a','b');


        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and (({价格类型} not in (1,9,10)) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and ((price_type not in (1,9,10)) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','a','b');


        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','6','7','a','b');


       /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
       elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','a','b');

       end if;
      else

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and (({价格类型} not in (1,9,10)) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and ((price_type not in (1,9,10)) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','6','7','a','b');


        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and (({价格类型} not in (1,9,10)) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 1 and {订单价格}>=@订单价格#) or ({价格类型}=1 or {价格类型}=9 or {价格类型}=10 and {订单方向} = 2 and {订单价格}<=@订单价格#)) and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and ((price_type not in (1,9,10)) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 1 and order_price>=v_order_price) or (price_type=1 or price_type=9 or price_type=10 and order_dir = 2 and order_price<=v_order_price)) and order_status in ('1','2','3','5','a','b');


        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','6','7','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','6','7','a','b');


        /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
        elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_订单表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ') and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {订单方向}=@反向订单方向# and {订单状态} in ('1','2','3','5','a','b')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_order where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ') and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and order_dir=v_reve_order_dir and order_status in ('1','2','3','5','a','b');

        end if;
      end if;
    else

      /* if @合规计算层级# = 2 then */
      if v_compli_calc_level = 2 then

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and {指令状态} in ('1','2','3','4','5')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and comm_status in ('1','2','3','4','5');


        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and {指令状态} in ('1','2','3','4','5')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and comm_status in ('1','2','3','4','5');


        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and {指令状态} in ('1','2','4')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and comm_status in ('1','2','4');


        /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
        elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and {指令状态} in ('1','2','4')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and comm_status in ('1','2','4');

        end if;
      else

        /* if instr(@目标风险要素#,"日内对敲")>0  then */
        if instr(v_target_risk_param,"日内对敲")>0  then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ' ) and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and {指令状态} in ('1','2','3','4','5')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ' ) and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and comm_status in ('1','2','3','4','5');


        /* elseif instr(@目标风险要素#,"日内反向")>0 then */
        elseif instr(v_target_risk_param,"日内反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ') and {股东代码}=@股东代码# and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and {指令状态} in ('1','2','3','4','5')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ') and stock_acco=v_stock_acco and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and comm_status in ('1','2','3','4','5');


        /* elseif instr(@目标风险要素#,"挂单对敲")>0 then */
        elseif instr(v_target_risk_param,"挂单对敲")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ') and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and (({指令限价}=0) or ({指令方向} = 1 and {指令限价}>=@订单价格#) or ({指令方向} = 2 and {指令限价}<=@订单价格#)) and {指令状态} in ('1','2','4')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ') and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and ((comm_limit_price=0) or (comm_dir = 1 and comm_limit_price>=v_order_price) or (comm_dir = 2 and comm_limit_price<=v_order_price)) and comm_status in ('1','2','4');


        /* elseif instr(@目标风险要素#,"挂单反向")>0 then */
        elseif instr(v_target_risk_param,"挂单反向")>0 then

          /* [获取表记录数量][风控证券_计算_指令表][@记录个数#][{机构编号}=@机构编号# and (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串#= "-1" ) and (instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0 or @交易组编号串#= "-1"  or  @交易组编号串# = ' ') and {证券代码编号} in( @沪港通证券代码编号#, @深港通证券代码编号#) and {指令方向}=@反向订单方向# and {指令状态} in ('1','2','4')] */
          select count(1) into v_record_count from db_rksecu.tb_rksecc_secu_command where co_no=v_co_no and (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str= "-1" ) and (instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0 or v_exch_group_no_str= "-1"  or  v_exch_group_no_str = ' ') and stock_code_no in( v_sh_hk_stock_code_no, v_sz_hk_stock_code_no) and comm_dir=v_reve_order_dir and comm_status in ('1','2','4');

        end if;
      end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取港股证券代码编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetHKStockCodeNo;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetHKStockCodeNo(
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
    OUT p_sh_hk_stock_code_no int,
    OUT p_sz_hk_stock_code_no int
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
    declare v_sh_hk_stock_code_no int;
    declare v_sz_hk_stock_code_no int;

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
    SET v_sh_hk_stock_code_no = 0;
    SET v_sz_hk_stock_code_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_证券信息表][ifnull({证券代码编号},0)][@沪港通证券代码编号#][{市场编号}=3 and {证券代码}=@证券代码#] */
    select ifnull(stock_code_no,0) into v_sh_hk_stock_code_no from db_rksecu.tb_rksecc_secu_stock_info where exch_no=3 and stock_code=v_stock_code limit 1;


    /* [获取表记录变量语句][风控证券_计算_证券信息表][ifnull({证券代码编号},0)][@深港通证券代码编号#][{市场编号}=4 and {证券代码}=@证券代码#] */
    select ifnull(stock_code_no,0) into v_sz_hk_stock_code_no from db_rksecu.tb_rksecc_secu_stock_info where exch_no=4 and stock_code=v_stock_code limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sh_hk_stock_code_no = v_sh_hk_stock_code_no;
    SET p_sz_hk_stock_code_no = v_sz_hk_stock_code_no;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_获取港股汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_GetHKRate;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_GetHKRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_buy_ref_rate decimal(18,12),
    OUT p_sell_ref_rate decimal(18,12),
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
    declare v_exch_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_buy_ref_rate decimal(18,12);
    declare v_sell_ref_rate decimal(18,12);
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
    SET v_exch_no = p_exch_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_buy_ref_rate = 0;
    SET v_sell_ref_rate = 0;
    SET v_settle_buy_rate = 0;
    SET v_settle_sell_rate = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_港股汇率表][{买入参考汇率},{卖出参考汇率}, {买入结算汇率},{卖出结算汇率}][@买入参考汇率#,@卖出参考汇率#,@买入结算汇率#,@卖出结算汇率#][{市场编号} = @市场编号# ] */
    select buy_ref_rate,sell_ref_rate, settle_buy_rate,settle_sell_rate into v_buy_ref_rate,v_sell_ref_rate,v_settle_buy_rate,v_settle_sell_rate from db_rksecu.tb_rksecc_HK_rate where exch_no = v_exch_no  limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_buy_ref_rate = v_buy_ref_rate;
    SET p_sell_ref_rate = v_sell_ref_rate;
    SET p_settle_buy_rate = v_settle_buy_rate;
    SET p_settle_sell_rate = v_settle_sell_rate;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_计算单证券大宗交易市值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_CalcStockBlockTradeHoldingEquities;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_CalcStockBlockTradeHoldingEquities(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_posi_market_value decimal(18,4)
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_posi_market_value decimal(18,4);

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_market_value = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_大宗交易持仓表][ifnull(sum({成交数量}*{公允价格}),0)][@持仓市值#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串# = ' ') and ( instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0  or  @交易组编号串# = ' ') and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {处理状态}<>'1'] */
    select ifnull(sum(strike_qty*fair_price),0) into v_posi_market_value from db_rksecu.tb_rksecc_block_trade_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str = ' ') and ( instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0  or  v_exch_group_no_str = ' ') and stock_code_no=v_stock_code_no and exch_no=v_exch_no and deal_status<>'1' limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_market_value = v_posi_market_value;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_计算单证券大宗交易数量
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_CalcStockBlockTradeHoldingQty;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_CalcStockBlockTradeHoldingQty(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code_no int,
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code_no int;
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_posi_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][风控证券_计算_大宗交易持仓表][ifnull(sum({成交数量}),0)][@持仓数量#][{机构编号}=@机构编号# and  (instr(concat(';',@产品编号串#,';'),concat(';',{产品编号},';'))>0 or @产品编号串# = ' ') and ( instr(concat(';',@交易组编号串#,';'),concat(';',{交易组编号},';'))>0  or  @交易组编号串# = ' ') and {证券代码编号}=@证券代码编号# and {市场编号}=@市场编号# and {处理状态}<>'1'] */
    select ifnull(sum(strike_qty),0) into v_posi_qty from db_rksecu.tb_rksecc_block_trade_posi where co_no=v_co_no and  (instr(concat(';',v_pd_no_str,';'),concat(';',pd_no,';'))>0 or v_pd_no_str = ' ') and ( instr(concat(';',v_exch_group_no_str,';'),concat(';',exch_group_no,';'))>0  or  v_exch_group_no_str = ' ') and stock_code_no=v_stock_code_no and exch_no=v_exch_no and deal_status<>'1' limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_posi_qty = v_posi_qty;

END;;


DELIMITER ;;
use db_rksecu;;

# 原子_风控证券_计算_联合汇总获取反向交易合规
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_rksecc_SumGetStockReverseTradeCompliance;;
DELIMITER ;;
CREATE PROCEDURE pra_rksecc_SumGetStockReverseTradeCompliance(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_trig_stage_type int,
    IN p_compli_calc_level int,
    IN p_risk_rule_code varchar(2048),
    IN p_union_flag int,
    IN p_row_id_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int
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
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_trig_stage_type int;
    declare v_compli_calc_level int;
    declare v_risk_rule_code varchar(2048);
    declare v_union_flag int;
    declare v_row_id_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;

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
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_trig_stage_type = p_trig_stage_type;
    SET v_compli_calc_level = p_compli_calc_level;
    SET v_risk_rule_code = p_risk_rule_code;
    SET v_union_flag = p_union_flag;
    SET v_row_id_str = p_row_id_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* if @联合标志# =《联合标志-单独控制》 then */
    if v_union_flag =1 then
        #订单

        /* if @触发阶段类型# = 2 then */
        if v_trig_stage_type = 2 then
            #产品级

            /* if @合规计算层级# = 2 then */
            if v_compli_calc_level = 2 then

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select count(*) into @记录个数# from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY pd_no
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY pd_no
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY pd_no
) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY pd_no
                    ) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            else

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select count(*) into @记录个数# from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY exch_group_no
) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY exch_group_no
                    ) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY exch_group_no
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY exch_group_no
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            end if;
        else
            #产品级

            /* if @合规计算层级# = 2 then */
            if v_compli_calc_level = 2 then

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select count(*) into @记录个数# from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY pd_no
) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY pd_no
                    ) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY pd_no
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT pd_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY pd_no
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            else

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select count(*) into @记录个数# from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY exch_group_no
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY exch_group_no
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 GROUP BY exch_group_no
) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT exch_group_no,group_concat(order_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 GROUP BY exch_group_no
                    ) as t where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            end if;
        end if;
    else
        #订单

        /* if @触发阶段类型# = 2 then */
        if v_trig_stage_type = 2 then
            #产品级

            /* if @合规计算层级# = 2 then */
            if v_compli_calc_level = 2 then

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select 
(select max(order_price) from tb_rkserk_preorder where order_dir = 1 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) >=
(select min(order_price) from tb_rkserk_preorder where order_dir = 2 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) into @记录个数#; */
                    select 
                    (select max(order_price) from tb_rkserk_preorder where order_dir = 1 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) >=
                    (select min(order_price) from tb_rkserk_preorder where order_dir = 2 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) into v_record_count;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT group_concat(pd_no),group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT group_concat(pd_no),group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            else

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select 
(select max(order_price) from tb_rkserk_preorder where order_dir = 1 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) >=
(select min(order_price) from tb_rkserk_preorder where order_dir = 2 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) into @记录个数#; */
                    select 
                    (select max(order_price) from tb_rkserk_preorder where order_dir = 1 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) >=
                    (select min(order_price) from tb_rkserk_preorder where order_dir = 2 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) into v_record_count;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT group_concat(exch_group_no),group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT group_concat(exch_group_no),group_concat(order_dir) as order_dir   FROM tb_rkserk_preorder where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            end if;
        else
            #产品级

            /* if @合规计算层级# = 2 then */
            if v_compli_calc_level = 2 then

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select 
(select max(order_price) from tb_rkserk_precommand where comm_dir = 1 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) >=
(select min(order_price) from tb_rkserk_precommand where comm_dir = 2 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) into @记录个数#; */
                    select 
                    (select max(order_price) from tb_rkserk_precommand where comm_dir = 1 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) >=
                    (select min(order_price) from tb_rkserk_precommand where comm_dir = 2 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) into v_record_count;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT group_concat(pd_no),group_concat(comm_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT group_concat(pd_no),group_concat(comm_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            else

                /* if instr(@风险规则代码#,"日内对敲")>0 or   instr(@风险规则代码#,"挂单对敲")>0 then */
                if instr(v_risk_rule_code,"日内对敲")>0 or   instr(v_risk_rule_code,"挂单对敲")>0 then

                    /* select 
(select max(order_price) from tb_rkserk_precommand where comm_dir = 1 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) >=
(select min(order_price) from tb_rkserk_precommand where comm_dir = 2 and instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0) into @记录个数#; */
                    select 
                    (select max(order_price) from tb_rkserk_precommand where comm_dir = 1 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) >=
                    (select min(order_price) from tb_rkserk_precommand where comm_dir = 2 and instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0) into v_record_count;

                /* elseif instr(@风险规则代码#,"日内反向")>0 or instr(@风险规则代码#,"挂单反向")>0 then */
                elseif instr(v_risk_rule_code,"日内反向")>0 or instr(v_risk_rule_code,"挂单反向")>0 then

                    /* select count(*) into @记录个数# from  (SELECT group_concat(exch_group_no),group_concat(comm_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",@记录序号串#,";"),concat(";",{记录序号},";"))>0 
) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0; */
                    select count(*) into v_record_count from  (SELECT group_concat(exch_group_no),group_concat(comm_dir) as order_dir   FROM tb_rkserk_precommand where instr(concat(";",v_row_id_str,";"),concat(";",row_id,";"))>0 
                    ) as t  where  instr(order_dir,'1')>0 and instr(order_dir,'2')>0;
               end if;
            end if;
        end if;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_record_count = v_record_count;

END;;


