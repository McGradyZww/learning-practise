DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_融资融券清算接口_清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecrlif_CapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecrlif_CapitalPosiRecorded(
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
    IN p_debt_type int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_debt_qty decimal(18,2),
    IN p_debt_amt decimal(18,4),
    IN p_debt_intrst_rate decimal(18,12),
    IN p_order_qty decimal(18,2),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_order_dir int,
    IN p_pass_no int,
    IN p_report_no varchar(32),
    IN p_order_date int,
    IN p_order_time int,
    IN p_order_price decimal(16,9),
    IN p_all_fee decimal(18,4),
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_cost_calc_type int,
    IN p_intrst_entry_type int,
    IN p_busi_flag int,
    IN p_arrive_date int,
    IN p_order_no int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_exgp_debt_jour_no int,
    OUT p_entry_asac_debt_jour_no int,
    OUT p_entry_exgp_posi_jour_no bigint,
    OUT p_entry_asac_posi_jour_no bigint
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
    declare v_debt_type int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_debt_qty decimal(18,2);
    declare v_debt_amt decimal(18,4);
    declare v_debt_intrst_rate decimal(18,12);
    declare v_order_qty decimal(18,2);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_dir int;
    declare v_pass_no int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_price decimal(16,9);
    declare v_all_fee decimal(18,4);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_cost_calc_type int;
    declare v_intrst_entry_type int;
    declare v_busi_flag int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_debt_jour_no int;
    declare v_entry_asac_debt_jour_no int;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_entry_oper int;
    declare v_target_stock_code_no int;
    declare v_tmp_occur_amt decimal(18,4);
    declare v_tmp_occur_qty decimal(18,2);
    declare v_tmp_stock_code_no int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_strike_fee decimal(18,4);
    declare v_debt_fee decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_debt_type = p_debt_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_debt_qty = p_debt_qty;
    SET v_debt_amt = p_debt_amt;
    SET v_debt_intrst_rate = p_debt_intrst_rate;
    SET v_order_qty = p_order_qty;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_order_dir = p_order_dir;
    SET v_pass_no = p_pass_no;
    SET v_report_no = p_report_no;
    SET v_order_date = p_order_date;
    SET v_order_time = p_order_time;
    SET v_order_price = p_order_price;
    SET v_all_fee = p_all_fee;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_intrst_entry_type = p_intrst_entry_type;
    SET v_busi_flag = p_busi_flag;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_debt_jour_no = 0;
    SET v_entry_asac_debt_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_impawn_ratio = 0;
    SET v_entry_oper = 0;
    SET v_target_stock_code_no = 0;
    SET v_tmp_occur_amt = 0;
    SET v_tmp_occur_qty = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_strike_fee = 0;
    SET v_debt_fee = 0;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

     #赋默认值

        /* set @本币币种# = 《本币币种-人民币》; */
        set v_crncy_type = "CNY";

        /* set @交易币种# = 《本币币种-人民币》; */
        set v_exch_crncy_type = "CNY";

        /* set @交易代码编号#=0; */
        set v_trade_code_no=0;

        /* set @标的代码编号#=0; */
        set v_target_code_no=0;

        /* set @质押比例#=1; */
        set v_impawn_ratio=1;

        /* set @入账操作# = 1; */
        set v_entry_oper = 1;

        /* set @目标证券代码编号#=0; */
        set v_target_stock_code_no=0;

        /* set @本币币种# = 《本币币种-人民币》; */
        set v_crncy_type = "CNY";

        /* set @交易币种# = " "; */
        set v_exch_crncy_type = " ";

        /* set @临时_变动金额#=@变动金额#; */
        set v_tmp_occur_amt=v_occur_amt;

        /* set @临时_变动数量#=@变动数量#; */
        set v_tmp_occur_qty=v_occur_qty;

        /* if @变动金额# <> 0 then */
        if v_occur_amt <> 0 then

            /* set @入账操作# = 1; */
            set v_entry_oper = 1;

            /* 调用【原子_产品证券_清算接口_清算资金入账】*/
            call db_pdsecu.pra_pdsepubif_ClearCapitalRecorded(
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
                v_exch_no,
                v_busi_flag,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt,
                v_arrive_date,
                v_order_no,
                v_entry_oper,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_清算资金入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* set @临时_证券代码编号#=@证券代码编号#; */
        set v_tmp_stock_code_no=v_stock_code_no;

        /* if @变动数量# <> 0 or @变动金额#<>0 then */
        if v_occur_qty <> 0 or v_occur_amt<>0 then
            #所有成本盈亏计算均在入账时计算，包括清算结算

            /* if @订单方向#=《订单方向-融资买入》 then */
            if v_order_dir=5 then

               /* set @变动金额#=-1*@负债金额#; */
               set v_occur_amt=-1*v_debt_amt;
            end if;

            /* if @订单方向#=《订单方向-融券卖出》 then */
            if v_order_dir=6 then

               /* set @变动数量#=-1*@负债数量#; */
               set v_occur_qty=-1*v_debt_qty;
            end if;

            /* 调用【原子_产品证券_清算接口_计算成本盈亏】*/
            call db_pdsecu.pra_pdsepubif_ClearSecuCostProfitCacl(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_arrive_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_type,
                v_occur_amt,
                v_occur_qty,
                v_strike_qty,
                v_strike_amt,
                v_bond_rate_type,
                v_bond_accr_intrst,
                v_busi_flag,
                v_cost_calc_type,
                v_intrst_entry_type,
                v_error_code,
                v_error_info,
                v_exgp_cost_amt,
                v_exgp_intrst_cost_amt,
                v_exgp_realize_pandl,
                v_exgp_intrst_pandl,
                v_asac_cost_amt,
                v_asac_intrst_cost_amt,
                v_asac_realize_pandl,
                v_asac_intrst_pandl);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_计算成本盈亏出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @入账操作# = 1; */
            set v_entry_oper = 1;

          /* set @变动金额#=@临时_变动金额#; */
          set v_occur_amt=v_tmp_occur_amt;

          /* set @变动数量#=@临时_变动数量#; */
          set v_occur_qty=v_tmp_occur_qty;

          /* if @订单方向#<>《订单方向-融券卖出》  then */
          if v_order_dir<>6  then

            /* 调用【原子_产品证券_清算接口_清算持仓入账】*/
            call db_pdsecu.pra_pdsepubif_ClearSecuPosiRecorded(
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
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_type,
                v_asset_type,
                v_occur_qty,
                v_exgp_cost_amt,
                v_exgp_realize_pandl,
                v_exgp_intrst_cost_amt,
                v_exgp_intrst_pandl,
                v_asac_cost_amt,
                v_asac_realize_pandl,
                v_asac_intrst_cost_amt,
                v_asac_intrst_pandl,
                v_busi_flag,
                v_trade_code_no,
                v_target_code_no,
                v_impawn_ratio,
                v_arrive_date,
                v_order_no,
                v_entry_oper,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_exgp_posi_jour_no,
                v_entry_asac_posi_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_清算持仓入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

           end if;
        end if;

        /* if @订单方向#=《订单方向-融资买入》 and @负债金额#>0  then */
        if v_order_dir=5 and v_debt_amt>0  then
          #新增负债流水表

            /* set @成交费用#=@全部费用#; */
            set v_strike_fee=v_all_fee;

            /* set @负债费用#=@成交费用#; */
            set v_debt_fee=v_strike_fee;

            /* set  @备注信息#="融资融券清算资金持仓入账生成"; */
            set  v_remark_info="融资融券清算资金持仓入账生成";

            /* 调用【原子_产品证券_融资融券清算接口_增加资产账户负债流水】*/
            call db_pdsecu.pra_pdsecrlif_InsertAsacDebtJour(
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
                v_asset_acco_no,
                v_pass_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_debt_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_intrst_rate,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_row_id);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_增加资产账户负债流水出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @入账资产账户负债流水号#=@记录序号#; */
            set v_entry_asac_debt_jour_no=v_row_id;

            /* 调用【原子_产品证券_融资融券清算接口_增加交易组负债流水】*/
            call db_pdsecu.pra_pdsecrlif_InsertExgpDebtJour(
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
                v_asset_acco_no,
                v_exch_group_no,
                v_pass_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_debt_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_intrst_rate,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_row_id);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_增加交易组负债流水出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @入账交易组负债流水号#=@记录序号#; */
            set v_entry_exgp_debt_jour_no=v_row_id;

       /* elseif  @订单方向#=《订单方向-融券卖出》 and @负债数量#>0  then */
       elseif  v_order_dir=6 and v_debt_qty>0  then
          #新增负债流水表

            /* set @成交费用#=@全部费用#; */
            set v_strike_fee=v_all_fee;

            /* set @负债费用#=@成交费用#; */
            set v_debt_fee=v_strike_fee;

            /* set  @备注信息#="融资融券清算资金持仓入账生成"; */
            set  v_remark_info="融资融券清算资金持仓入账生成";

            /* 调用【原子_产品证券_融资融券清算接口_增加资产账户负债流水】*/
            call db_pdsecu.pra_pdsecrlif_InsertAsacDebtJour(
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
                v_asset_acco_no,
                v_pass_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_debt_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_intrst_rate,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_row_id);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_增加资产账户负债流水出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @入账资产账户负债流水号#=@记录序号#; */
            set v_entry_asac_debt_jour_no=v_row_id;

            /* 调用【原子_产品证券_融资融券清算接口_增加交易组负债流水】*/
            call db_pdsecu.pra_pdsecrlif_InsertExgpDebtJour(
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
                v_asset_acco_no,
                v_exch_group_no,
                v_pass_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_debt_type,
                v_strike_qty,
                v_strike_amt,
                v_strike_fee,
                v_order_no,
                v_report_no,
                v_order_date,
                v_order_time,
                v_order_dir,
                v_order_price,
                v_order_qty,
                v_debt_intrst_rate,
                v_debt_amt,
                v_debt_qty,
                v_debt_fee,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_row_id);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_增加交易组负债流水出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @入账交易组负债流水号#=@记录序号#; */
            set v_entry_exgp_debt_jour_no=v_row_id;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_debt_jour_no = v_entry_exgp_debt_jour_no;
    SET p_entry_asac_debt_jour_no = v_entry_asac_debt_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_融资融券清算接口_回滚清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecrliff_UndoClearCapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecrliff_UndoClearCapitalPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_debt_type int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_debt_jour_no int,
    IN p_entry_asac_debt_jour_no int,
    IN p_entry_asac_posi_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_busi_flag int,
    IN p_order_no int,
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
    declare v_debt_type int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_debt_jour_no int;
    declare v_entry_asac_debt_jour_no int;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_busi_flag int;
    declare v_order_no int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_crncy_type varchar(3);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
    declare v_entry_oper int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_impawn_qty decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_row_id bigint;
    declare v_record_valid_flag int;
    declare v_stock_code varchar(6);
    declare v_occur_end_qty decimal(18,2);
    declare v_occur_end_amt decimal(18,4);
    declare v_curr_row_id bigint;
    declare v_return_capit_jour_nor int;
    declare v_create_date int;
    declare v_create_time int;

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
    SET v_debt_type = p_debt_type;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_exgp_debt_jour_no = p_entry_exgp_debt_jour_no;
    SET v_entry_asac_debt_jour_no = p_entry_asac_debt_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_order_no = p_order_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_crncy_type = "CNY";
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_impawn_ratio = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_crncy_type = "CNY";
    SET v_occur_amt = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_oper = 0;
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_occur_qty = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_impawn_qty = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_row_id = 0;
    SET v_record_valid_flag = 0;
    SET v_stock_code = " ";
    SET v_occur_end_qty = 0;
    SET v_occur_end_amt = 0;
    SET v_curr_row_id = 0;
    SET v_return_capit_jour_nor = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @交易币种# = 《本币币种-人民币》; */
        set v_exch_crncy_type = "CNY";

        /* set @交易代码编号#=0; */
        set v_trade_code_no=0;

        /* set @标的代码编号#=0; */
        set v_target_code_no=0;

        /* set @质押比例#=1; */
        set v_impawn_ratio=1;

        /* if @入账资金流水号# <> 0 then */
        if v_entry_money_jour_no <> 0 then

            /* 调用【原子_产品证券_清算接口_获取资金入账流水信息】*/
            call db_pdsecu.pra_pdsepubif_GetCapitalEntryJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_entry_money_jour_no,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_crncy_type,
                v_exch_crncy_type,
                v_busi_flag,
                v_occur_amt,
                v_arrive_date);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_获取资金入账流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动金额# = -@变动金额#; */
            set v_occur_amt = -v_occur_amt;

            /* set @入账操作# = 2; */
            set v_entry_oper = 2;

            /* 调用【原子_产品证券_清算接口_清算资金入账】*/
            call db_pdsecu.pra_pdsepubif_ClearCapitalRecorded(
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
                v_exch_no,
                v_busi_flag,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt,
                v_arrive_date,
                v_order_no,
                v_entry_oper,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_清算资金入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* if @入账交易组持仓流水号# <> 0 and @入账资产账户持仓流水号# then */
        if v_entry_exgp_posi_jour_no <> 0 and v_entry_asac_posi_jour_no then

            /* 调用【原子_产品证券_清算接口_获取资产账户持仓入账流水信息】*/
            call db_pdsecu.pra_pdsepubif_GetAsacPosiEntryJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_entry_asac_posi_jour_no,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_target_code_no,
                v_stock_type,
                v_asset_type,
                v_busi_flag,
                v_occur_qty,
                v_cost_amt,
                v_intrst_cost_amt,
                v_realize_pandl,
                v_intrst_pandl,
                v_impawn_ratio,
                v_arrive_date);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_获取资产账户持仓入账流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动数量# = -@变动数量#; */
            set v_occur_qty = -v_occur_qty;

            /* set @资产账户成本金额# = -@成本金额#; */
            set v_asac_cost_amt = -v_cost_amt;

            /* set @资产账户实现盈亏# = -@实现盈亏#; */
            set v_asac_realize_pandl = -v_realize_pandl;

            /* set @资产账户利息成本金额# =  -@利息成本金额#; */
            set v_asac_intrst_cost_amt =  -v_intrst_cost_amt;

            /* set @资产账户利息收益# =  -@利息收益#; */
            set v_asac_intrst_pandl =  -v_intrst_pandl;

            /* 调用【原子_产品证券_清算接口_获取交易组持仓入账流水信息】*/
            call db_pdsecu.pra_pdsepubif_GetExgpPosiEntryJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_entry_exgp_posi_jour_no,
                v_error_code,
                v_error_info,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_target_code_no,
                v_stock_type,
                v_asset_type,
                v_busi_flag,
                v_occur_qty,
                v_cost_amt,
                v_intrst_cost_amt,
                v_realize_pandl,
                v_intrst_pandl,
                v_impawn_qty,
                v_impawn_ratio,
                v_arrive_date);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_获取交易组持仓入账流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动数量# = -@变动数量#; */
            set v_occur_qty = -v_occur_qty;

            /* set @交易组成本金额# = -@成本金额#; */
            set v_exgp_cost_amt = -v_cost_amt;

            /* set @交易组实现盈亏# = -@实现盈亏#; */
            set v_exgp_realize_pandl = -v_realize_pandl;

            /* set @交易组利息成本金额# =  -@利息成本金额#; */
            set v_exgp_intrst_cost_amt =  -v_intrst_cost_amt;

            /* set @交易组利息收益# =  -@利息收益#; */
            set v_exgp_intrst_pandl =  -v_intrst_pandl;

            /* set @交易代码编号# = @证券代码编号#; */
            set v_trade_code_no = v_stock_code_no;

            /* set @入账操作# = 2; */
            set v_entry_oper = 2;

            /* 调用【原子_产品证券_清算接口_清算持仓入账】*/
            call db_pdsecu.pra_pdsepubif_ClearSecuPosiRecorded(
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
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_type,
                v_asset_type,
                v_occur_qty,
                v_exgp_cost_amt,
                v_exgp_realize_pandl,
                v_exgp_intrst_cost_amt,
                v_exgp_intrst_pandl,
                v_asac_cost_amt,
                v_asac_realize_pandl,
                v_asac_intrst_cost_amt,
                v_asac_intrst_pandl,
                v_busi_flag,
                v_trade_code_no,
                v_target_code_no,
                v_impawn_ratio,
                v_arrive_date,
                v_order_no,
                v_entry_oper,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_exgp_posi_jour_no,
                v_entry_asac_posi_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_清算持仓入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* if  @入账交易组负债流水号#>0  then */
        if  v_entry_exgp_debt_jour_no>0  then
          #删除负债流水表

            /* set  @记录序号#=@入账交易组负债流水号#; */
            set  v_row_id=v_entry_exgp_debt_jour_no;

            /* set  @记录有效标志#=《记录有效标志-无效》; */
            set  v_record_valid_flag=2;

            /* set  @备注信息#="回滚"; */
            set  v_remark_info="回滚";

            /* 调用【原子_产品证券_融资融券清算接口_更新获取负债变动流水信息】*/
            call db_pdsecu.pra_pdsecrlif_UpdateGetDebtOccurJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_row_id,
                v_record_valid_flag,
                v_error_code,
                v_error_info,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_exch_group_no,
                v_asset_acco_no,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_code,
                v_stock_type,
                v_asset_type,
                v_debt_type,
                v_busi_flag,
                v_occur_qty,
                v_occur_amt,
                v_occur_end_qty,
                v_occur_end_amt,
                v_curr_row_id,
                v_return_capit_jour_nor,
                v_remark_info,
                v_create_date,
                v_create_time);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_更新获取负债变动流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_产品证券_融资融券清算接口_回滚清算负债明细】*/
            call db_pdsecu.pra_pdsecrlif_UndoDebtJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_init_date,
                v_debt_type,
                v_occur_qty,
                v_occur_amt,
                v_curr_row_id,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.22.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_回滚清算负债明细出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_融资融券清算接口_还券处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecrlif_RetuStockDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecrlif_RetuStockDebt(
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
    IN p_debt_type int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_order_dir int,
    IN p_pre_entry_amt decimal(18,4),
    IN p_pre_entry_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
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
    declare v_debt_type int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_dir int;
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_remark_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_entry_oper int;
    declare v_return_qty decimal(18,2);
    declare v_occur_qty decimal(18,2);
    declare v_entry_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_busi_flag int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_debt_type = p_debt_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_order_dir = p_order_dir;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_all_fee = p_all_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_remark_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_entry_oper = 0;
    SET v_return_qty = 0;
    SET v_occur_qty = 0;
    SET v_entry_qty = 0;
    SET v_occur_amt = 0;
    SET v_exgp_cost_amt = 0;
    SET v_asac_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_trade_code_no = 0;
    SET v_target_code_no = 0;
    SET v_impawn_ratio = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_busi_flag = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

     #赋默认值

       /* set  @备注信息#=""; */
       set  v_remark_info="";

        /* set @本币币种# = 《本币币种-人民币》; */
        set v_crncy_type = "CNY";

        /* set @交易币种# = 《本币币种-人民币》; */
        set v_exch_crncy_type = "CNY";

        /* set @入账操作# = 1; */
        set v_entry_oper = 1;

        /* set @归还数量#= @成交数量#; */
        set v_return_qty= v_strike_qty;

        /* set @负债类型#=《负债类型-融券》; */
        set v_debt_type=2;

        /* 调用【原子_产品证券_融资融券清算接口_交易组还券处理】*/
        call db_pdsecu.pra_pdsecrlif_ExgpStockRetuDebt(
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
            v_asset_acco_no,
            v_exch_group_no,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_type,
            v_debt_type,
            v_order_dir,
            v_return_qty,
            v_error_code,
            v_error_info,
            v_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.22.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_交易组还券处理出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_融资融券清算接口_资产账户还券处理】*/
        call db_pdsecu.pra_pdsecrlif_AsacStockRetuDebt(
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
            v_asset_acco_no,
            v_exch_no,
            v_stock_acco_no,
            v_stock_code_no,
            v_stock_code,
            v_stock_type,
            v_debt_type,
            v_order_dir,
            v_return_qty,
            v_error_code,
            v_error_info,
            v_occur_qty);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.22.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_资产账户还券处理出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set  @入账数量#=@归还数量#-@变动数量#; */
        set  v_entry_qty=v_return_qty-v_occur_qty;

       /* if @入账数量#>0  and @订单方向#<>《订单方向-直接还券》  then */
       if v_entry_qty>0  and v_order_dir<>15  then

            /* set @变动数量#=-@入账数量#; */
            set v_occur_qty=-v_entry_qty;

            /* set  @变动金额#=@入账数量#/@成交数量#* @待入账金额#; */
            set  v_occur_amt=v_entry_qty/v_strike_qty* v_pre_entry_amt;

            /* set @入账操作# = 1; */
            set v_entry_oper = 1;

            /* set @交易组成本金额# = -1 * @变动金额#; */
            set v_exgp_cost_amt = -1 * v_occur_amt;

            /* set @资产账户成本金额# = -1 * @变动金额#; */
            set v_asac_cost_amt = -1 * v_occur_amt;

            /* set @交易组实现盈亏#=0; */
            set v_exgp_realize_pandl=0;

            /* set @交易组利息成本金额#=0; */
            set v_exgp_intrst_cost_amt=0;

            /* set @交易组利息收益#=0; */
            set v_exgp_intrst_pandl=0;

            /* set @资产账户实现盈亏#=0; */
            set v_asac_realize_pandl=0;

            /* set @资产账户利息成本金额#=0; */
            set v_asac_intrst_cost_amt=0;

            /* set @资产账户利息收益#=0; */
            set v_asac_intrst_pandl=0;

            /* set @交易代码编号#=0; */
            set v_trade_code_no=0;

            /* set @标的代码编号#=0; */
            set v_target_code_no=0;

            /* set @质押比例#=0; */
            set v_impawn_ratio=0;

            /* set @到账日期#=@初始化日期#; */
            set v_arrive_date=v_init_date;

            /* set @备注信息#=“买券还券反冲持仓数量”; */
            set v_remark_info="买券还券反冲持仓数量";

            /* set @订单编号#=0; */
            set v_order_no=0;

            /* set @业务标志#=《业务标志-买券还券》; */
            set v_busi_flag=4002002;

           /* 调用【原子_产品证券_清算接口_清算持仓入账】*/
           call db_pdsecu.pra_pdsepubif_ClearSecuPosiRecorded(
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
               v_exch_no,
               v_stock_acco_no,
               v_stock_code_no,
               v_stock_type,
               v_asset_type,
               v_occur_qty,
               v_exgp_cost_amt,
               v_exgp_realize_pandl,
               v_exgp_intrst_cost_amt,
               v_exgp_intrst_pandl,
               v_asac_cost_amt,
               v_asac_realize_pandl,
               v_asac_intrst_cost_amt,
               v_asac_intrst_pandl,
               v_busi_flag,
               v_trade_code_no,
               v_target_code_no,
               v_impawn_ratio,
               v_arrive_date,
               v_order_no,
               v_entry_oper,
               v_remark_info,
               v_error_code,
               v_error_info,
               v_entry_exgp_posi_jour_no,
               v_entry_asac_posi_jour_no);
           if v_error_code = "1" then
               SET v_error_code = "pdsecuT.22.3.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_清算持仓入账出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;

       end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_融资融券清算接口_还款处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecrlif_RetuCapitDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecrlif_RetuCapitDebt(
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
    IN p_debt_type int,
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_code varchar(6),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_order_dir int,
    IN p_pre_entry_amt decimal(18,4),
    IN p_pre_entry_qty decimal(18,2),
    IN p_all_fee decimal(18,4),
    IN p_fina_return_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_total_amt decimal(18,4)
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
    declare v_debt_type int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_order_dir int;
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_all_fee decimal(18,4);
    declare v_fina_return_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_total_amt decimal(18,4);
    declare v_remark_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_entry_oper int;
    declare v_return_amt decimal(18,4);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_acco_amt decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_tmp_total_amt decimal(18,4);

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
    SET v_debt_type = p_debt_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_code = p_stock_code;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_order_dir = p_order_dir;
    SET v_pre_entry_amt = p_pre_entry_amt;
    SET v_pre_entry_qty = p_pre_entry_qty;
    SET v_all_fee = p_all_fee;
    SET v_fina_return_type = p_fina_return_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_total_amt = 0;
    SET v_remark_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_entry_oper = 0;
    SET v_return_amt = 0;
    SET v_tmp_occur_amt = 0;
    SET v_acco_amt = 0;
    SET v_occur_amt = 0;
    SET v_tmp_total_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

     #赋默认值

       /* set  @备注信息#=""; */
       set  v_remark_info="";

        /* set @本币币种# = 《本币币种-人民币》; */
        set v_crncy_type = "CNY";

        /* set @交易币种# = 《本币币种-人民币》; */
        set v_exch_crncy_type = "CNY";

        /* set @入账操作# = 1; */
        set v_entry_oper = 1;

        /* set @归还金额#=@待入账金额#; */
        set v_return_amt=v_pre_entry_amt;

        /* set @临时_变动金额#=@待入账金额#; */
        set v_tmp_occur_amt=v_pre_entry_amt;

        /* set @账户金额#=@待入账金额#; */
        set v_acco_amt=v_pre_entry_amt;

        /* if  @订单方向#=《订单方向-卖出》 or (@订单方向#=《订单方向-卖券还款》 and @卖券还款方式#=《卖券还款方式-先还同券》) then */
        if  v_order_dir=2 or (v_order_dir=7 and v_fina_return_type=0) then

           /* 调用【原子_产品证券_融资融券清算接口_交易组还款处理】*/
           call db_pdsecu.pra_pdsecrlif_ExgpCapitRetuDebt(
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
               v_asset_acco_no,
               v_exch_group_no,
               v_exch_no,
               v_stock_acco_no,
               v_stock_code_no,
               v_stock_type,
               v_debt_type,
               v_return_amt,
               v_order_dir,
               v_fina_return_type,
               v_remark_info,
               v_error_code,
               v_error_info,
               v_occur_amt,
               v_total_amt);
           if v_error_code = "1" then
               SET v_error_code = "pdsecuT.22.4.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_交易组还款处理出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;


             /* set @临时_变动金额#=@变动金额#; */
             set v_tmp_occur_amt=v_occur_amt;

           /* 调用【原子_产品证券_融资融券清算接口_资产账户还款处理】*/
           call db_pdsecu.pra_pdsecrlif_AsacCapitRetuDebt(
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
               v_asset_acco_no,
               v_exch_no,
               v_stock_acco_no,
               v_stock_code_no,
               v_stock_type,
               v_debt_type,
               v_return_amt,
               v_order_dir,
               v_fina_return_type,
               v_remark_info,
               v_error_code,
               v_error_info,
               v_occur_amt,
               v_total_amt);
           if v_error_code = "1" then
               SET v_error_code = "pdsecuT.22.4.999";
               if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_资产账户还款处理出现错误！',v_mysql_message);
               end if;
               ROLLBACK;
               leave label_pro;
           elseif v_error_code <> "0" then
               ROLLBACK;
               leave label_pro;
           end if;


            /* set  @账户金额#=@变动金额#; */
            set  v_acco_amt=v_occur_amt;
        end if;

        /* set @临时_总金额#=@总金额#; */
        set v_tmp_total_amt=v_total_amt;

        /* set  @总金额#=0; */
        set  v_total_amt=0;

        /* if  @订单方向#=《订单方向-卖券还款》 then */
        if  v_order_dir=7 then
       #还其他负债

            /* set @证券代码编号#=0; */
            set v_stock_code_no=0;

           /* if @临时_变动金额#>0  then */
           if v_tmp_occur_amt>0  then

               /* set  @归还金额#=@临时_变动金额#; */
               set  v_return_amt=v_tmp_occur_amt;

               /* 调用【原子_产品证券_融资融券清算接口_交易组还款处理】*/
               call db_pdsecu.pra_pdsecrlif_ExgpCapitRetuDebt(
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
                   v_asset_acco_no,
                   v_exch_group_no,
                   v_exch_no,
                   v_stock_acco_no,
                   v_stock_code_no,
                   v_stock_type,
                   v_debt_type,
                   v_return_amt,
                   v_order_dir,
                   v_fina_return_type,
                   v_remark_info,
                   v_error_code,
                   v_error_info,
                   v_occur_amt,
                   v_total_amt);
               if v_error_code = "1" then
                   SET v_error_code = "pdsecuT.22.4.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_交易组还款处理出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   leave label_pro;
               end if;

           end if;

           /* if @账户金额#>0  then */
           if v_acco_amt>0  then

               /* set  @归还金额#=@账户金额#; */
               set  v_return_amt=v_acco_amt;

               /* 调用【原子_产品证券_融资融券清算接口_资产账户还款处理】*/
               call db_pdsecu.pra_pdsecrlif_AsacCapitRetuDebt(
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
                   v_asset_acco_no,
                   v_exch_no,
                   v_stock_acco_no,
                   v_stock_code_no,
                   v_stock_type,
                   v_debt_type,
                   v_return_amt,
                   v_order_dir,
                   v_fina_return_type,
                   v_remark_info,
                   v_error_code,
                   v_error_info,
                   v_occur_amt,
                   v_total_amt);
               if v_error_code = "1" then
                   SET v_error_code = "pdsecuT.22.4.999";
                   if v_mysql_message <> "" then
                        SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_资产账户还款处理出现错误！',v_mysql_message);
                   end if;
                   ROLLBACK;
                   leave label_pro;
               elseif v_error_code <> "0" then
                   ROLLBACK;
                   leave label_pro;
               end if;

            end if;
        end if;

        /* set @总金额#=@总金额#+@临时_总金额#; */
        set v_total_amt=v_total_amt+v_tmp_total_amt;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_total_amt = v_total_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_融资融券清算接口_更新融券卖出所得金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecrlif_UpdateLoanCapitalDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecrlif_UpdateLoanCapitalDebt(
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
    IN p_occur_amt decimal(18,4),
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
    declare v_occur_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_occur_amt = p_occur_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

     #赋默认值

       /* set @备注信息#=""; */
       set v_remark_info="";

        /* 调用【原子_产品证券_融资融券清算接口_融券卖出所得资金更新】*/
        call db_pdsecu.pra_pdsecrlif_UpdateLoanCapitalDebt(
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
            v_occur_amt,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.22.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_融券卖出所得资金更新出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_融资融券清算接口_更新汇总持仓负债
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecrlif_UpdateSumPosiDebt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecrlif_UpdateSumPosiDebt(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

     #赋默认值

       /* set @备注信息#=""; */
       set v_remark_info="";

        /* 调用【原子_产品证券_融资融券清算接口_汇总交易组持仓负债】*/
        call db_pdsecu.pra_pdsecrlif_UpdateSumExgpPosiDebt(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.22.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_汇总交易组持仓负债出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_融资融券清算接口_汇总资产账户持仓负债】*/
        call db_pdsecu.pra_pdsecrlif_UpdateSumAsacPosiDebt(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.22.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券清算接口_汇总资产账户持仓负债出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_融资融券清算接口_更新负债利息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecrlif_UpdateDebtInterest;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecrlif_UpdateDebtInterest(
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
    SET v_init_date = p_init_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;

     #赋默认值

       /* set @备注信息#=""; */
       set v_remark_info="";

        /* 调用【原子_产品证券_融资融券_更新交易组负债利息】*/
        call db_pdsecu.pra_pdsecrdt_UpdateExgpDebtInterest(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.22.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_更新交易组负债利息出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_产品证券_融资融券_更新资产账户负债利息】*/
        call db_pdsecu.pra_pdsecrdt_UpdateAsacDebtInterest(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.22.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_融资融券_更新资产账户负债利息出现错误！',v_mysql_message);
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


