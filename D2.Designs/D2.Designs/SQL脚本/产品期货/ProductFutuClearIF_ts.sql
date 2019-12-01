DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_清算接口_更新持仓结算价应收保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuclif_UpdatePosiSettInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuclif_UpdatePosiSettInfo(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_comb_code varchar(6),
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_sett_price decimal(16,9),
    IN p_rece_margin decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_comb_code varchar(6);
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_comb_code = p_comb_code;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_sett_price = p_sett_price;
    SET v_rece_margin = p_rece_margin;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_清算接口_更新持仓结算价应收保证金】*/
        call db_pdfutu.pra_pdfuclif_UpdatePosiSettInfo(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_comb_code,
            v_hedge_type,
            v_contrc_unit,
            v_sett_price,
            v_rece_margin,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.5.76.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_更新持仓结算价应收保证金出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_清算接口_更新获取交易组持仓信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuclif_UpdateGetExgpPosiInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuclif_UpdateGetExgpPosiInfo(
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
    OUT p_row_id bigint,
    OUT p_record_count int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_crncy_type varchar(3),
    OUT p_begin_qty decimal(18,2),
    OUT p_curr_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_comb_code varchar(6),
    OUT p_open_amount decimal(18,4)
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
    declare v_row_id bigint;
    declare v_record_count int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_crncy_type varchar(3);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id = 0;
    SET v_record_count = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_comb_code = " ";
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_清算接口_更新获取交易组持仓信息】*/
        call db_pdfutu.pra_pdfuclif_UpdateGetExgpPosiInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_qry_no,
            v_error_code,
            v_error_info,
            v_row_id,
            v_record_count,
            v_co_no,
            v_pd_no,
            v_exch_group_no,
            v_asset_acco_no,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_contrc_type,
            v_contrc_unit,
            v_crncy_type,
            v_curr_qty,
            v_pre_settle_price,
            v_comb_code,
            v_open_amount);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.5.80.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_更新获取交易组持仓信息出现错误！',v_mysql_message);
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
    SET p_record_count = v_record_count;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_crncy_type = v_crncy_type;
    SET p_begin_qty = v_begin_qty;
    SET p_curr_qty = v_curr_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_comb_code = v_comb_code;
    SET p_open_amount = v_open_amount;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_清算接口_设置持仓记录处理标志
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuclif_UpdatePosiDeal;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuclif_UpdatePosiDeal(
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_清算接口_设置持仓记录处理标志】*/
        call db_pdfutu.pra_pdfuclif_UpdatePosiDeal(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_deal_flag,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.5.82.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_设置持仓记录处理标志出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_清算接口_清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuclif_ClearCapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuclif_ClearCapitalPosiRecorded(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_occur_qty decimal(18,2),
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_comb_code varchar(6),
    IN p_open_amount decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_comb_code varchar(6);
    declare v_open_amount decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_entry_money_jour_no bigint;
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
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_occur_qty = p_occur_qty;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_comb_code = p_comb_code;
    SET v_open_amount = p_open_amount;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* [事务开始] */
    START TRANSACTION;

        #if @变动金额# <> 0 then

            /* 调用【原子_产品期货_清算接口_清算资金入账】*/
            call db_pdfutu.pra_pdfuclif_ClearCapitalRecorded(
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
                v_busi_flag,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt,
                v_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.5.101.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_清算资金入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        #end if;

        /* if @变动数量# <> 0 then */
        if v_occur_qty <> 0 then

            /* 调用【原子_产品期货_清算接口_清算持仓入账】*/
            call db_pdfutu.pra_pdfuclif_ClearPosiRecorded(
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
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_type,
                v_lngsht_type,
                v_hedge_type,
                v_contrc_unit,
                v_busi_flag,
                v_occur_qty,
                v_remark_info,
                v_menu_no,
                v_comb_code,
                v_open_amount,
                v_error_code,
                v_error_info,
                v_entry_exgp_posi_jour_no,
                v_entry_asac_posi_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.5.101.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_清算持仓入账出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_清算接口_回滚清算资金持仓入账
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuclif_UndoClearCapitalPosiRecorded;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuclif_UndoClearCapitalPosiRecorded(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_entry_money_jour_no bigint,
    IN p_entry_exgp_posi_jour_no bigint,
    IN p_entry_asac_posi_jour_no bigint,
    IN p_busi_flag int,
    IN p_remark_info varchar(255),
    IN p_menu_no int,
    IN p_comb_code varchar(6),
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
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
    declare v_menu_no int;
    declare v_comb_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_occur_qty decimal(18,2);
    declare v_open_amount decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_entry_exgp_posi_jour_no = p_entry_exgp_posi_jour_no;
    SET v_entry_asac_posi_jour_no = p_entry_asac_posi_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_comb_code = p_comb_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_occur_amt = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_contrc_unit = 0;
    SET v_occur_qty = 0;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* if @入账资金流水号# <> 0 then */
        if v_entry_money_jour_no <> 0 then

            /* 调用【原子_产品期货_清算接口_获取资金入账流水信息】*/
            call db_pdfutu.pra_pdfuclif_GetCapitalEntryJour(
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
                v_crncy_type,
                v_exch_crncy_type,
                v_busi_flag,
                v_occur_amt);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_获取资金入账流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动金额# = -@变动金额#; */
            set v_occur_amt = -v_occur_amt;

            /* 调用【原子_产品期货_清算接口_清算资金入账】*/
            call db_pdfutu.pra_pdfuclif_ClearCapitalRecorded(
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
                v_busi_flag,
                v_crncy_type,
                v_exch_crncy_type,
                v_occur_amt,
                v_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info,
                v_entry_money_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_清算资金入账出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        end if;

        /* if @入账交易组持仓流水号# <> 0 or @入账资产账户持仓流水号# <> 0 then */
        if v_entry_exgp_posi_jour_no <> 0 or v_entry_asac_posi_jour_no <> 0 then

            /* 调用【原子_产品期货_清算接口_获取资产账户持仓入账流水信息】*/
            call db_pdfutu.pra_pdfuclif_GetAsacPosiEntryJour(
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
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_type,
                v_lngsht_type,
                v_hedge_type,
                v_contrc_unit,
                v_busi_flag,
                v_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_获取资产账户持仓入账流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_产品期货_清算接口_获取交易组持仓入账流水信息】*/
            call db_pdfutu.pra_pdfuclif_GetExgpPosiEntryJour(
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
                v_asset_acco_no,
                v_exch_group_no,
                v_exch_no,
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_type,
                v_lngsht_type,
                v_hedge_type,
                v_contrc_unit,
                v_busi_flag,
                v_occur_qty);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_获取交易组持仓入账流水信息出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @变动数量#=-@变动数量#; */
            set v_occur_qty=-v_occur_qty;

            /* set @开仓金额#=0; */
            set v_open_amount=0;

            /* 调用【原子_产品期货_清算接口_清算持仓入账】*/
            call db_pdfutu.pra_pdfuclif_ClearPosiRecorded(
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
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_type,
                v_lngsht_type,
                v_hedge_type,
                v_contrc_unit,
                v_busi_flag,
                v_occur_qty,
                v_remark_info,
                v_menu_no,
                v_comb_code,
                v_open_amount,
                v_error_code,
                v_error_info,
                v_entry_exgp_posi_jour_no,
                v_entry_asac_posi_jour_no);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.5.102.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_清算持仓入账出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_清算接口_查询交易组持仓序号
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfuclif_QueryPosiId;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfuclif_QueryPosiId(
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
    

    /* if @指定行数#>500 or @指定行数# <1 then */
    if v_row_count>500 or v_row_count <1 then

      /* set @指定行数#=500; */
      set v_row_count=500;
    end if;

    /* 调用【原子_产品期货_清算接口_查询交易组持仓序号】*/
    call db_pdfutu.pra_pdfuclif_QueryPosiId(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_qry_no,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.5.103.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_清算接口_查询交易组持仓序号出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


