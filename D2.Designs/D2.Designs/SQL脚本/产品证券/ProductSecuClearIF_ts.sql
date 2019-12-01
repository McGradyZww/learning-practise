DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_清算接口_获取证券代码持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_GetStockPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_GetStockPosiInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_stock_code_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_stock_acco_no int,
    OUT p_curr_qty decimal(18,2)
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
    declare v_stock_code_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_curr_qty decimal(18,2);

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
    SET v_stock_code_no = p_stock_code_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_stock_acco_no = 0;
    SET v_curr_qty = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_清算接口_获取证券代码持仓信息】*/
    call db_pdsecu.pra_pdsepubif_GetStockPosiInfo(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_stock_code_no,
        v_error_code,
        v_error_info,
        v_row_id,
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_stock_acco_no,
        v_curr_qty);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.5.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_获取证券代码持仓信息出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco_no = v_stock_acco_no;
    SET p_curr_qty = v_curr_qty;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_清算接口_清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_ClearCapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_ClearCapitalPosiRecorded(
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
    IN p_target_stock_code_no int,
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_order_qty decimal(18,2),
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_bond_rate_type int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_cost_calc_type int,
    IN p_intrst_entry_type int,
    IN p_busi_flag int,
    IN p_trade_code_no int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_arrive_date int,
    IN p_order_no int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
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
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_stock_code_no int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_order_qty decimal(18,2);
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_bond_rate_type int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_cost_calc_type int;
    declare v_intrst_entry_type int;
    declare v_busi_flag int;
    declare v_trade_code_no int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_entry_oper int;
    declare v_tmp_stock_code_no int;
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);

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
    SET v_target_stock_code_no = p_target_stock_code_no;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_order_qty = p_order_qty;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_bond_rate_type = p_bond_rate_type;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_intrst_entry_type = p_intrst_entry_type;
    SET v_busi_flag = p_busi_flag;
    SET v_trade_code_no = p_trade_code_no;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_arrive_date = p_arrive_date;
    SET v_order_no = p_order_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_entry_oper = 0;
    SET v_tmp_stock_code_no = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_pandl = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @本币币种# = 《本币币种-人民币》; */
        set v_crncy_type = "CNY";

        /* set @交易币种# = " "; */
        set v_exch_crncy_type = " ";

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
                SET v_error_code = "pdsecuT.5.101.999";
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

            /* if @业务标志#=《业务标志-基金转换》 and @到账日期#=@初始化日期# then */
            if v_busi_flag=2006003 and v_arrive_date=v_init_date then
                #基金转换成交数据,先将目标基金的数据入账,目标基金的份额增加

                /* set @变动数量#=-1*@变动数量#; */
                set v_occur_qty=-1*v_occur_qty;

                /* set @证券代码编号# = @目标证券代码编号#; */
                set v_stock_code_no = v_target_stock_code_no;

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
                    SET v_error_code = "pdsecuT.5.101.999";
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
                    SET v_error_code = "pdsecuT.5.101.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_清算持仓入账出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

                #再将源基金的数据入账,源基金的变动为份额减少

                /* set @证券代码编号# = @临时_证券代码编号#; */
                set v_stock_code_no = v_tmp_stock_code_no;

                /* set @变动数量#=-1*@订单数量#; */
                set v_occur_qty=-1*v_order_qty;

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
                    SET v_error_code = "pdsecuT.5.101.999";
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
                    SET v_error_code = "pdsecuT.5.101.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_清算持仓入账出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            else

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
                    SET v_error_code = "pdsecuT.5.101.999";
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
                    SET v_error_code = "pdsecuT.5.101.999";
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

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_清算接口_回滚清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_UndoClearCapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_UndoClearCapitalPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_busi_flag int,
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
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
    declare v_entry_money_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_busi_flag int;
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_order_no int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
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
    declare v_trade_code_no int;

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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_order_no = p_order_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
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
    SET v_trade_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


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
                SET v_error_code = "pdsecuT.5.102.999";
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
                SET v_error_code = "pdsecuT.5.102.999";
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
                SET v_error_code = "pdsecuT.5.102.999";
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
                SET v_error_code = "pdsecuT.5.102.999";
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
                SET v_error_code = "pdsecuT.5.102.999";
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

# 事务_产品证券_清算接口_公司行为登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_CoActionRegDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_CoActionRegDeal(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_occur_amt decimal(18,4),
    IN p_occur_qty decimal(18,2),
    IN p_target_code_no int,
    IN p_impawn_ratio decimal(18,12),
    IN p_busi_flag int,
    IN p_cost_calc_type int,
    IN p_co_busi_config_str varchar(64),
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_entry_money_jour_no bigint,
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_qty decimal(18,2);
    declare v_target_code_no int;
    declare v_impawn_ratio decimal(18,12);
    declare v_busi_flag int;
    declare v_cost_calc_type int;
    declare v_co_busi_config_str varchar(64);
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_intrst_entry_type int;

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_occur_amt = p_occur_amt;
    SET v_occur_qty = p_occur_qty;
    SET v_target_code_no = p_target_code_no;
    SET v_impawn_ratio = p_impawn_ratio;
    SET v_busi_flag = p_busi_flag;
    SET v_cost_calc_type = p_cost_calc_type;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_intrst_entry_type = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @红利入账成本盈亏计算方式#=cast(substring(@机构业务控制配置串#,8,1) as SIGNED); */
        set v_intrst_entry_type=cast(substring(v_co_busi_config_str,8,1) as SIGNED);

        /* if @变动金额# <> 0 then */
        if v_occur_amt <> 0 then

            /* 调用【原子_产品证券_清算接口_公司行为资金登记处理】*/
            call db_pdsecu.pra_pdsepubif_CoActionCapiatlRegDeal(
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
                v_target_code_no,
                v_stock_type,
                v_asset_type,
                v_busi_flag,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt,
                v_cost_calc_type,
                v_intrst_entry_type,
                v_arrive_date,
                v_impawn_ratio,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no,
                v_entry_exgp_posi_jour_no,
                v_entry_asac_posi_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.5.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_公司行为资金登记处理出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* if @变动数量# <> 0  then */
        if v_occur_qty <> 0  then

            /* 调用【原子_产品证券_清算接口_公司行为股份登记处理】*/
            call db_pdsecu.pra_pdsepubif_CoActionPosiRegDeal(
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
                v_crncy_type,
                v_exch_no,
                v_stock_acco_no,
                v_stock_code_no,
                v_stock_type,
                v_asset_type,
                v_occur_amt,
                v_occur_qty,
                v_busi_flag,
                v_target_code_no,
                v_impawn_ratio,
                v_begin_trade_date,
                v_remark_info,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no,
                v_entry_exgp_posi_jour_no,
                v_entry_asac_posi_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.5.103.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_公司行为股份登记处理出现错误！',v_mysql_message);
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
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_exgp_posi_jour_no = v_entry_exgp_posi_jour_no;
    SET p_entry_asac_posi_jour_no = v_entry_asac_posi_jour_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_清算接口_回滚公司行为登记处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_UndoCoActionRegDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_UndoCoActionRegDeal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
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
    declare v_entry_money_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_arrive_date int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_target_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_occur_qty decimal(18,2);
    declare v_cost_amt decimal(18,4);
    declare v_intrst_cost_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_pandl decimal(18,4);
    declare v_impawn_ratio decimal(18,12);
    declare v_asac_cost_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_cost_amt decimal(18,4);
    declare v_asac_intrst_pandl decimal(18,4);
    declare v_impawn_qty decimal(18,2);
    declare v_exgp_cost_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exgp_intrst_cost_amt decimal(18,4);
    declare v_exgp_intrst_pandl decimal(18,4);
    declare v_trade_code_no int;

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
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_stock_acco_no = 0;
    SET v_stock_code_no = 0;
    SET v_target_code_no = 0;
    SET v_stock_type = 0;
    SET v_asset_type = 0;
    SET v_occur_qty = 0;
    SET v_cost_amt = 0;
    SET v_intrst_cost_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_pandl = 0;
    SET v_impawn_ratio = 0;
    SET v_asac_cost_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_cost_amt = 0;
    SET v_asac_intrst_pandl = 0;
    SET v_impawn_qty = 0;
    SET v_exgp_cost_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exgp_intrst_cost_amt = 0;
    SET v_exgp_intrst_pandl = 0;
    SET v_trade_code_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


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
                SET v_error_code = "pdsecuT.5.104.999";
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

            /* 调用【原子_产品证券_清算接口_回滚公司行为资金登记处理】*/
            call db_pdsecu.pra_pdsepubif_UndoCoActionCapiatlRegDeal(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_busi_flag,
                v_occur_amt,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.5.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_回滚公司行为资金登记处理出现错误！',v_mysql_message);
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
                SET v_error_code = "pdsecuT.5.104.999";
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
                SET v_error_code = "pdsecuT.5.104.999";
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

            /* set @质押数量# = -1* @质押数量#; */
            set v_impawn_qty = -1* v_impawn_qty;

            /* set @交易代码编号# = @证券代码编号#; */
            set v_trade_code_no = v_stock_code_no;

            /* 调用【原子_产品证券_清算接口_回滚公司行为股份登记处理】*/
            call db_pdsecu.pra_pdsepubif_UndoCoActionPosiRegDeal(
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
                v_impawn_qty,
                v_impawn_ratio,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no,
                v_entry_exgp_posi_jour_no,
                v_entry_asac_posi_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.5.104.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_回滚公司行为股份登记处理出现错误！',v_mysql_message);
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

# 事务_产品证券_清算接口_写入回购记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_InsertRepoRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_InsertRepoRecord(
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
    IN p_stock_code varchar(6),
    IN p_target_code_no int,
    IN p_target_code varchar(6),
    IN p_order_dir int,
    IN p_repo_qty decimal(18,2),
    IN p_repo_amt decimal(18,4),
    IN p_repo_rate decimal(18,12),
    IN p_repo_trade_date int,
    IN p_repo_days int,
    IN p_repo_cale_days int,
    IN p_repo_back_intrst decimal(18,4),
    IN p_repo_order_id bigint,
    IN p_strike_deal_type int,
    IN p_repo_back_trade_date int,
    IN p_repo_first_settle_date int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_stock_code_no int;
    declare v_stock_code varchar(6);
    declare v_target_code_no int;
    declare v_target_code varchar(6);
    declare v_order_dir int;
    declare v_repo_qty decimal(18,2);
    declare v_repo_amt decimal(18,4);
    declare v_repo_rate decimal(18,12);
    declare v_repo_trade_date int;
    declare v_repo_days int;
    declare v_repo_cale_days int;
    declare v_repo_back_intrst decimal(18,4);
    declare v_repo_order_id bigint;
    declare v_strike_deal_type int;
    declare v_repo_back_trade_date int;
    declare v_repo_first_settle_date int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_repo_back_date int;
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_strike_id bigint;

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
    SET v_stock_code = p_stock_code;
    SET v_target_code_no = p_target_code_no;
    SET v_target_code = p_target_code;
    SET v_order_dir = p_order_dir;
    SET v_repo_qty = p_repo_qty;
    SET v_repo_amt = p_repo_amt;
    SET v_repo_rate = p_repo_rate;
    SET v_repo_trade_date = p_repo_trade_date;
    SET v_repo_days = p_repo_days;
    SET v_repo_cale_days = p_repo_cale_days;
    SET v_repo_back_intrst = p_repo_back_intrst;
    SET v_repo_order_id = p_repo_order_id;
    SET v_strike_deal_type = p_strike_deal_type;
    SET v_repo_back_trade_date = p_repo_back_trade_date;
    SET v_repo_first_settle_date = p_repo_first_settle_date;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_repo_back_date = 0;
    SET v_repo_back_amt = 0;
    SET v_repo_strike_id = 0;

    
    label_pro:BEGIN
    

    /* set @回购到期日期# = @实际回购到期日期#; */
    set v_repo_back_date = v_repo_back_trade_date;

    /* set @回购购回金额# = @回购金额#; */
    set v_repo_back_amt = v_repo_amt;

    /* set @回购购回利息# = round(@回购购回利息#,2); */
    set v_repo_back_intrst = round(v_repo_back_intrst,2);
    #set @回购委托序号# = 0;

    /* set @回购成交序号# = 0; */
    set v_repo_strike_id = 0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_清算接口_写入回购记录】*/
        call db_pdsecu.pra_pdsepubif_InsertRepoRecord(
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
            v_stock_code,
            v_target_code_no,
            v_target_code,
            v_order_dir,
            v_repo_qty,
            v_repo_amt,
            v_repo_rate,
            v_repo_trade_date,
            v_repo_order_id,
            v_repo_strike_id,
            v_repo_days,
            v_repo_cale_days,
            v_repo_back_date,
            v_repo_back_amt,
            v_repo_back_intrst,
            v_repo_back_trade_date,
            v_repo_first_settle_date,
            v_strike_deal_type,
            v_error_code,
            v_error_info,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.5.111.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_写入回购记录出现错误！',v_mysql_message);
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
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_清算接口_写入回购记录回滚
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_InsertRepoRecordRollback;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_InsertRepoRecordRollback(
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_清算接口_写入回购记录回滚】*/
        call db_pdsecu.pra_pdsepubif_InsertRepoRecordRollback(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.5.112.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_写入回购记录回滚出现错误！',v_mysql_message);
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

# 事务_产品证券_清算接口_配股资金处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepubif_PlacementCapitalDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepubif_PlacementCapitalDeal(
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
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_stock_acco_no int,
    IN p_frozen_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_cash_id bigint,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exgp_pre_settle_amt decimal(18,4),
    OUT p_exgp_shsz_avail_change_amt decimal(18,4),
    OUT p_exgp_hk_avail_change_amt decimal(18,4),
    OUT p_exgp_amt_check_diff decimal(18,4),
    OUT p_exgp_T_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T_hk_sell_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_buy_total_amt decimal(18,4),
    OUT p_exgp_T1_hk_sell_total_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
    OUT p_exgp_realize_pandl decimal(18,4),
    OUT p_exch_group_intrst_rate decimal(18,4),
    OUT p_exch_group_intrst_base_amt decimal(18,4),
    OUT p_exch_group_pre_entry_intrst_amt decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_asac_cash_id bigint,
    OUT p_asac_begin_amt decimal(18,4),
    OUT p_asac_curr_amt decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_pre_settle_amt decimal(18,4),
    OUT p_asac_shsz_avail_change_amt decimal(18,4),
    OUT p_asac_hk_avail_change_amt decimal(18,4),
    OUT p_asac_amt_check_diff decimal(18,4),
    OUT p_asac_T_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T_hk_sell_total_amt decimal(18,4),
    OUT p_asac_T1_hk_buy_total_amt decimal(18,4),
    OUT p_asac_T1_hk_sell_total_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
    OUT p_asac_realize_pandl decimal(18,4),
    OUT p_asac_intrst_rate decimal(18,4),
    OUT p_asac_intrst_base_amt decimal(18,4),
    OUT p_asac_pre_entry_intrst_amt decimal(18,4),
    OUT p_asac_update_times int
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
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_stock_acco_no int;
    declare v_frozen_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_asac_cash_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_pre_settle_amt decimal(18,4);
    declare v_asac_shsz_avail_change_amt decimal(18,4);
    declare v_asac_hk_avail_change_amt decimal(18,4);
    declare v_asac_amt_check_diff decimal(18,4);
    declare v_asac_T_hk_buy_total_amt decimal(18,4);
    declare v_asac_T_hk_sell_total_amt decimal(18,4);
    declare v_asac_T1_hk_buy_total_amt decimal(18,4);
    declare v_asac_T1_hk_sell_total_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_realize_pandl decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_asac_update_times int;

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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco_no = p_stock_acco_no;
    SET v_frozen_amt = p_frozen_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_asac_cash_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_pre_settle_amt = 0;
    SET v_asac_shsz_avail_change_amt = 0;
    SET v_asac_hk_avail_change_amt = 0;
    SET v_asac_amt_check_diff = 0;
    SET v_asac_T_hk_buy_total_amt = 0;
    SET v_asac_T_hk_sell_total_amt = 0;
    SET v_asac_T1_hk_buy_total_amt = 0;
    SET v_asac_T1_hk_sell_total_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_realize_pandl = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_清算接口_配股资金处理】*/
        call db_pdsecu.pra_pdsepubif_PlacementCapitalDeal(
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
            v_crncy_type,
            v_exch_crncy_type,
            v_exch_no,
            v_stock_acco_no,
            v_frozen_amt,
            v_busi_flag,
            v_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exgp_cash_id,
            v_exgp_begin_amt,
            v_exgp_curr_amt,
            v_exgp_frozen_amt,
            v_exgp_unfroz_amt,
            v_exgp_pre_settle_amt,
            v_exgp_shsz_avail_change_amt,
            v_exgp_hk_avail_change_amt,
            v_exgp_amt_check_diff,
            v_exgp_T_hk_buy_total_amt,
            v_exgp_T_hk_sell_total_amt,
            v_exgp_T1_hk_buy_total_amt,
            v_exgp_T1_hk_sell_total_amt,
            v_exch_group_total_rece_amt,
            v_exch_group_total_payab_amt,
            v_exgp_realize_pandl,
            v_exch_group_intrst_rate,
            v_exch_group_intrst_base_amt,
            v_exch_group_pre_entry_intrst_amt,
            v_exch_group_update_times,
            v_asac_cash_id,
            v_asac_begin_amt,
            v_asac_curr_amt,
            v_asac_frozen_amt,
            v_asac_unfroz_amt,
            v_asac_pre_settle_amt,
            v_asac_shsz_avail_change_amt,
            v_asac_hk_avail_change_amt,
            v_asac_amt_check_diff,
            v_asac_T_hk_buy_total_amt,
            v_asac_T_hk_sell_total_amt,
            v_asac_T1_hk_buy_total_amt,
            v_asac_T1_hk_sell_total_amt,
            v_asac_total_rece_amt,
            v_asac_total_payab_amt,
            v_asac_realize_pandl,
            v_asac_intrst_rate,
            v_asac_intrst_base_amt,
            v_asac_pre_entry_intrst_amt,
            v_asac_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.5.113.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_清算接口_配股资金处理出现错误！',v_mysql_message);
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
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exgp_pre_settle_amt = v_exgp_pre_settle_amt;
    SET p_exgp_shsz_avail_change_amt = v_exgp_shsz_avail_change_amt;
    SET p_exgp_hk_avail_change_amt = v_exgp_hk_avail_change_amt;
    SET p_exgp_amt_check_diff = v_exgp_amt_check_diff;
    SET p_exgp_T_hk_buy_total_amt = v_exgp_T_hk_buy_total_amt;
    SET p_exgp_T_hk_sell_total_amt = v_exgp_T_hk_sell_total_amt;
    SET p_exgp_T1_hk_buy_total_amt = v_exgp_T1_hk_buy_total_amt;
    SET p_exgp_T1_hk_sell_total_amt = v_exgp_T1_hk_sell_total_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exgp_realize_pandl = v_exgp_realize_pandl;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_begin_amt = v_asac_begin_amt;
    SET p_asac_curr_amt = v_asac_curr_amt;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_pre_settle_amt = v_asac_pre_settle_amt;
    SET p_asac_shsz_avail_change_amt = v_asac_shsz_avail_change_amt;
    SET p_asac_hk_avail_change_amt = v_asac_hk_avail_change_amt;
    SET p_asac_amt_check_diff = v_asac_amt_check_diff;
    SET p_asac_T_hk_buy_total_amt = v_asac_T_hk_buy_total_amt;
    SET p_asac_T_hk_sell_total_amt = v_asac_T_hk_sell_total_amt;
    SET p_asac_T1_hk_buy_total_amt = v_asac_T1_hk_buy_total_amt;
    SET p_asac_T1_hk_sell_total_amt = v_asac_T1_hk_sell_total_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_realize_pandl = v_asac_realize_pandl;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_asac_update_times = v_asac_update_times;

END;;


