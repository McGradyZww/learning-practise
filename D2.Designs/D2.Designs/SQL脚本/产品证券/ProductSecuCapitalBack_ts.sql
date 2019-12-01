DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_查询资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_QuerySecuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_QuerySecuCapitalDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_deal_flag_query_str varchar(2048),
    IN p_filter_diff_cond int,
    IN p_asset_sync_flag int,
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_deal_flag_query_str varchar(2048);
    declare v_filter_diff_cond int;
    declare v_asset_sync_flag int;
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_deal_flag_query_str = p_deal_flag_query_str;
    SET v_filter_diff_cond = p_filter_diff_cond;
    SET v_asset_sync_flag = p_asset_sync_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@处理标志查询串#] */
    set v_deal_flag_query_str = concat(";", v_deal_flag_query_str,";");


    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* [变量补分隔符][@机构编号串#] */
    set v_co_no_str = concat(";", v_co_no_str,";");


    /* 调用【原子_产品证券_资金运维_查询资产账户内外资金差异记录】*/
    call db_pdsecu.pra_pdsecabk_QuerySecuCapitalDiff(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no_str,
        v_pd_no_str,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_deal_flag_query_str,
        v_filter_diff_cond,
        v_asset_sync_flag,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_查询资产账户内外资金差异记录出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_资金运维_处理资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_DealSecuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_DealSecuCapitalDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    IN p_default_exch_group_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_weight_value_str varchar(255),
    IN p_busi_config_str varchar(64),
    IN p_deal_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_occur_amt decimal(18,4),
    OUT p_amt_check_diff decimal(18,4),
    OUT p_crncy_type varchar(3),
    OUT p_asset_sync_flag int,
    OUT p_sync_total_rece_payab int,
    OUT p_acco_total_rece_amt_diff decimal(18,4),
    OUT p_acco_total_payab_amt_diff decimal(18,4),
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
    declare v_row_id bigint;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_default_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_weight_value_str varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_deal_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_asset_sync_flag int;
    declare v_sync_total_rece_payab int;
    declare v_acco_total_rece_amt_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
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
    SET v_row_id = p_row_id;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_weight_value_str = p_weight_value_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_deal_info = p_deal_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_occur_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_crncy_type = "CNY";
    SET v_asset_sync_flag = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_acco_total_rece_amt_diff = 0;
    SET v_acco_total_payab_amt_diff = 0;
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


        /* 调用【原子_产品证券_资金运维_处理资产账户内外资金差异记录】*/
        call db_pdsecu.pra_pdsecabk_DealSecuCapitalDiff(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_oper_remark_info,
            v_menu_no,
            v_default_exch_group_no,
            v_exch_group_no_str,
            v_weight_value_str,
            v_busi_config_str,
            v_deal_info,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_exch_group_no,
            v_occur_amt,
            v_amt_check_diff,
            v_crncy_type,
            v_asset_sync_flag,
            v_sync_total_rece_payab,
            v_acco_total_rece_amt_diff,
            v_acco_total_payab_amt_diff,
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
            SET v_error_code = "pdsecuT.10.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理资产账户内外资金差异记录出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_occur_amt = v_occur_amt;
    SET p_amt_check_diff = v_amt_check_diff;
    SET p_crncy_type = v_crncy_type;
    SET p_asset_sync_flag = v_asset_sync_flag;
    SET p_sync_total_rece_payab = v_sync_total_rece_payab;
    SET p_acco_total_rece_amt_diff = v_acco_total_rece_amt_diff;
    SET p_acco_total_payab_amt_diff = v_acco_total_payab_amt_diff;
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


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_转入估值外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_AddEvaluOutCash;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_AddEvaluOutCash(
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
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_out_curr_amt decimal(18,4),
    IN p_out_enable_amt decimal(18,4),
    IN p_out_frozen_amt decimal(18,4),
    IN p_out_unfroz_amt decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_out_curr_amt = p_out_curr_amt;
    SET v_out_enable_amt = p_out_enable_amt;
    SET v_out_frozen_amt = p_out_frozen_amt;
    SET v_out_unfroz_amt = p_out_unfroz_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金运维_转入估值外部资金】*/
        call db_pdsecu.pra_pdsecabk_AddEvaluOutCash(
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
            v_out_acco,
            v_crncy_type,
            v_out_curr_amt,
            v_out_enable_amt,
            v_out_frozen_amt,
            v_out_unfroz_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_转入估值外部资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金运维_查询估值外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_QueryEvaluOutCash;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_QueryEvaluOutCash(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* 调用【原子_产品证券_资金运维_查询估值外部资金】*/
    call db_pdsecu.pra_pdsecabk_QueryEvaluOutCash(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.4.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_查询估值外部资金出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_资金运维_查询外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_QueryOutCash;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_QueryOutCash(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* 调用【原子_产品证券_资金运维_查询外部资金】*/
    call db_pdsecu.pra_pdsecabk_QueryOutCash(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no,
        v_pd_no_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.5.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_查询外部资金出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_资金运维_同步内外差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_SynchronizedDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_SynchronizedDiff(
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
    IN p_asset_acco_no int,
    IN p_default_exch_group_no int,
    IN p_co_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_pboc_rate decimal(18,12),
    IN p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_pboc_rate decimal(18,12);
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_pboc_rate = p_pboc_rate;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_avail_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_rece_amt = 0;

    
    label_pro:BEGIN
    

    /* if (substring(@机构业务控制配置串#, 12, 1) = 《资产是否同步-同步资金同步持仓》 or substring(@机构业务控制配置串#, 12, 1) = 《资产是否同步-同步资金不同步持仓》) then */
    if (substring(v_co_busi_config_str, 12, 1) = 1 or substring(v_co_busi_config_str, 12, 1) = 3) then

        /* 调用【原子_产品证券_资金_获取资产账户资金可用】*/
        call db_pdsecu.pra_pdseca_GetAsacCapitalAvail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_crncy_type,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_curr_amt,
            v_avail_amt,
            v_total_payab_amt,
            v_total_rece_amt);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.6.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取资产账户资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品证券_资金运维_同步内外差异】*/
            call db_pdsecu.pra_pdsecabk_QSynchronizedDiff(
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
                v_asac_busi_config_str,
                v_pass_no,
                v_out_acco,
                v_crncy_type,
                v_avail_amt,
                v_curr_amt,
                v_total_payab_amt,
                v_total_rece_amt,
                v_pboc_rate,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.10.6.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_同步内外差异出现错误！',v_mysql_message);
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
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_获取外部资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_GetOutCapitalData;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_GetOutCapitalData(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    IN p_asac_busi_config_str varchar(64),
    IN p_exch_rate decimal(18,12),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_row_id bigint,
    OUT p_init_date int,
    OUT p_target_co_no int,
    OUT p_target_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_out_curr_amt decimal(18,4),
    OUT p_out_enable_amt decimal(18,4),
    OUT p_out_total_payab_amt decimal(18,4),
    OUT p_out_total_rece_amt decimal(18,4)
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
    declare v_row_id bigint;
    declare v_asac_busi_config_str varchar(64);
    declare v_exch_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_row_id bigint;
    declare v_init_date int;
    declare v_target_co_no int;
    declare v_target_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);

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
    SET v_row_id = p_row_id;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_exch_rate = p_exch_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_co_no = 0;
    SET v_target_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_out_curr_amt = 0;
    SET v_out_enable_amt = 0;
    SET v_out_total_payab_amt = 0;
    SET v_out_total_rece_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金运维_获取外部资金数据】*/
        call db_pdsecu.pra_pdsecabk_GetOutCapitalData(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_row_id,
            v_asac_busi_config_str,
            v_exch_rate,
            v_error_code,
            v_error_info,
            v_curr_row_id,
            v_init_date,
            v_target_co_no,
            v_target_pd_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_crncy_type,
            v_out_curr_amt,
            v_out_enable_amt,
            v_out_total_payab_amt,
            v_out_total_rece_amt);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.7.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_获取外部资金数据出现错误！',v_mysql_message);
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
    SET p_curr_row_id = v_curr_row_id;
    SET p_init_date = v_init_date;
    SET p_target_co_no = v_target_co_no;
    SET p_target_pd_no = v_target_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_out_curr_amt = v_out_curr_amt;
    SET p_out_enable_amt = v_out_enable_amt;
    SET p_out_total_payab_amt = v_out_total_payab_amt;
    SET p_out_total_rece_amt = v_out_total_rece_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_清除外部资金记录差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_ClearOutCapitRecordDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_ClearOutCapitRecordDiffRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金运维_清除外部资金记录差异记录】*/
        call db_pdsecu.pra_pdsecabk_ClearOutCapitRecordDiffRecord(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_清除外部资金记录差异记录出现错误！',v_mysql_message);
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

# 事务_产品证券_资金运维_获取差异表资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_GetDiffCapitalData;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_GetDiffCapitalData(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_out_acco varchar(32)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_out_acco varchar(32);

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
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_产品证券_资金运维_获取差异表资金数据】*/
        call db_pdsecu.pra_pdsecabk_GetDiffCapitalData(
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
            v_asset_acco_no,
            v_exch_group_no,
            v_out_acco);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_获取差异表资金数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_out_acco = v_out_acco;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_更新证券代码信息行情汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_UpdateStockCodeInfoQuotRate;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_UpdateStockCodeInfoQuotRate(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_last_price decimal(16,9),
    IN p_fair_price decimal(16,9),
    IN p_net_price_flag int,
    IN p_bond_accr_intrst decimal(18,12),
    IN p_settle_buy_rate decimal(18,12),
    IN p_crncy_type varchar(3),
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
    declare v_query_row_id bigint;
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_last_price decimal(16,9);
    declare v_fair_price decimal(16,9);
    declare v_net_price_flag int;
    declare v_bond_accr_intrst decimal(18,12);
    declare v_settle_buy_rate decimal(18,12);
    declare v_crncy_type varchar(3);
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
    SET v_query_row_id = p_query_row_id;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_last_price = p_last_price;
    SET v_fair_price = p_fair_price;
    SET v_net_price_flag = p_net_price_flag;
    SET v_bond_accr_intrst = p_bond_accr_intrst;
    SET v_settle_buy_rate = p_settle_buy_rate;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金运维_更新证券代码信息行情汇率】*/
        call db_pdsecu.pra_pdsecabk_UpdateStockCodeInfoQuotRate(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_query_row_id,
            v_exch_no,
            v_stock_code_no,
            v_stock_type,
            v_asset_type,
            v_last_price,
            v_fair_price,
            v_net_price_flag,
            v_bond_accr_intrst,
            v_settle_buy_rate,
            v_crncy_type,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_更新证券代码信息行情汇率出现错误！',v_mysql_message);
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

# 事务_产品证券_资金运维_计算产品证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_CalcProdSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_CalcProdSecuAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id_str varchar(2048),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_stock_asset_str varchar(4096),
    OUT p_bond_asset_str varchar(4096),
    OUT p_fund_asset_str varchar(4096),
    OUT p_repo_asset_str varchar(4096),
    OUT p_hk_thrgh_stock_asset_str varchar(4096),
    OUT p_other_asset_str varchar(4096),
    OUT p_crncy_type_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_stock_asset_str varchar(4096);
    declare v_bond_asset_str varchar(4096);
    declare v_fund_asset_str varchar(4096);
    declare v_repo_asset_str varchar(4096);
    declare v_hk_thrgh_stock_asset_str varchar(4096);
    declare v_other_asset_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
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
    SET v_row_id_str = p_row_id_str;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_stock_asset_str = " ";
    SET v_bond_asset_str = " ";
    SET v_fund_asset_str = " ";
    SET v_repo_asset_str = " ";
    SET v_hk_thrgh_stock_asset_str = " ";
    SET v_other_asset_str = " ";
    SET v_crncy_type_str = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @股票资产串# = ""; */
    set v_stock_asset_str = "";

    /* set @债券资产串# = ""; */
    set v_bond_asset_str = "";

    /* set @基金资产串# = ""; */
    set v_fund_asset_str = "";

    /* set @回购资产串# = ""; */
    set v_repo_asset_str = "";

    /* set @港股通资产串# = ""; */
    set v_hk_thrgh_stock_asset_str = "";

    /* set @其他资产串# = ""; */
    set v_other_asset_str = "";

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";
    loop_label:loop

        /* if instr(@记录序号串#,";") > 0 then */
        if instr(v_row_id_str,";") > 0 then

            /* set @记录序号#=cast(substring(@记录序号串#,1,LOCATE(";",@记录序号串#)-1) as SIGNED); */
            set v_row_id=cast(substring(v_row_id_str,1,LOCATE(";",v_row_id_str)-1) as SIGNED);

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_产品证券_资金运维_计算产品资产新版】*/
                call db_pdsecu.pra_pdsecabk_CalcProdAssetNew(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_co_no,
                    v_pd_no,
                    v_error_code,
                    v_error_info,
                    v_stock_asset,
                    v_bond_asset,
                    v_fund_asset,
                    v_repo_asset,
                    v_hk_thrgh_stock_asset,
                    v_other_asset,
                    v_crncy_type);
                if v_error_code = "1" then
                    SET v_error_code = "pdsecuT.10.12.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_计算产品资产新版出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

            #20181022修改[原子_产品证券_资金运维_计算产品证券资产

            /* [事务结束] */
            COMMIT;


            /* set @股票资产串# = concat(@股票资产串#,@股票资产#,";"); */
            set v_stock_asset_str = concat(v_stock_asset_str,v_stock_asset,";");

            /* set @债券资产串# = concat(@债券资产串#,@债券资产#,";"); */
            set v_bond_asset_str = concat(v_bond_asset_str,v_bond_asset,";");

            /* set @基金资产串# = concat(@基金资产串#,@基金资产#,";"); */
            set v_fund_asset_str = concat(v_fund_asset_str,v_fund_asset,";");

            /* set @回购资产串# = concat(@回购资产串#,@回购资产#,";"); */
            set v_repo_asset_str = concat(v_repo_asset_str,v_repo_asset,";");

            /* set @港股通资产串# = concat(@港股通资产串#,@港股通资产#,";"); */
            set v_hk_thrgh_stock_asset_str = concat(v_hk_thrgh_stock_asset_str,v_hk_thrgh_stock_asset,";");

            /* set @其他资产串# = concat(@其他资产串#,@其他资产#,";"); */
            set v_other_asset_str = concat(v_other_asset_str,v_other_asset,";");

            /* set @本币币种串# = concat(@本币币种串#,@本币币种#,";"); */
            set v_crncy_type_str = concat(v_crncy_type_str,v_crncy_type,";");

            /* set @记录序号串#=substring(@记录序号串#,LOCATE(";",@记录序号串#)+1); */
            set v_row_id_str=substring(v_row_id_str,LOCATE(";",v_row_id_str)+1);

            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_stock_asset_str = v_stock_asset_str;
    SET p_bond_asset_str = v_bond_asset_str;
    SET p_fund_asset_str = v_fund_asset_str;
    SET p_repo_asset_str = v_repo_asset_str;
    SET p_hk_thrgh_stock_asset_str = v_hk_thrgh_stock_asset_str;
    SET p_other_asset_str = v_other_asset_str;
    SET p_crncy_type_str = v_crncy_type_str;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_计算交易组证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_CalcExchGroupSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_CalcExchGroupSecuAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id_str varchar(2048),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_exch_group_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_stock_cash_asset_str varchar(4096),
    OUT p_stock_asset_str varchar(4096),
    OUT p_bond_asset_str varchar(4096),
    OUT p_fund_asset_str varchar(4096),
    OUT p_repo_asset_str varchar(4096),
    OUT p_hk_thrgh_stock_asset_str varchar(4096),
    OUT p_other_asset_str varchar(4096),
    OUT p_crncy_type_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_exch_group_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_stock_cash_asset_str varchar(4096);
    declare v_stock_asset_str varchar(4096);
    declare v_bond_asset_str varchar(4096);
    declare v_fund_asset_str varchar(4096);
    declare v_repo_asset_str varchar(4096);
    declare v_hk_thrgh_stock_asset_str varchar(4096);
    declare v_other_asset_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_stock_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
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
    SET v_row_id_str = p_row_id_str;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_stock_cash_asset_str = " ";
    SET v_stock_asset_str = " ";
    SET v_bond_asset_str = " ";
    SET v_fund_asset_str = " ";
    SET v_repo_asset_str = " ";
    SET v_hk_thrgh_stock_asset_str = " ";
    SET v_other_asset_str = " ";
    SET v_crncy_type_str = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_stock_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @证券现金资产串# = ""; */
    set v_stock_cash_asset_str = "";

    /* set @股票资产串# = ""; */
    set v_stock_asset_str = "";

    /* set @债券资产串# = ""; */
    set v_bond_asset_str = "";

    /* set @基金资产串# = ""; */
    set v_fund_asset_str = "";

    /* set @回购资产串# = ""; */
    set v_repo_asset_str = "";

    /* set @港股通资产串# = ""; */
    set v_hk_thrgh_stock_asset_str = "";

    /* set @其他资产串# = ""; */
    set v_other_asset_str = "";

    /* set @本币币种串# = ""; */
    set v_crncy_type_str = "";
    loop_label:loop

        /* if instr(@记录序号串#,";") > 0 then */
        if instr(v_row_id_str,";") > 0 then

            /* set @记录序号#=cast(substring(@记录序号串#,1,LOCATE(";",@记录序号串#)-1) as SIGNED); */
            set v_row_id=cast(substring(v_row_id_str,1,LOCATE(";",v_row_id_str)-1) as SIGNED);

            /* set @机构编号#=cast(substring(@机构编号串#,1,LOCATE(";",@机构编号串#)-1) as SIGNED); */
            set v_co_no=cast(substring(v_co_no_str,1,LOCATE(";",v_co_no_str)-1) as SIGNED);

            /* set @产品编号#=cast(substring(@产品编号串#,1,LOCATE(";",@产品编号串#)-1) as SIGNED); */
            set v_pd_no=cast(substring(v_pd_no_str,1,LOCATE(";",v_pd_no_str)-1) as SIGNED);

            /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(";",@交易组编号串#)-1) as SIGNED); */
            set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(";",v_exch_group_no_str)-1) as SIGNED);

            /* [事务开始] */
            START TRANSACTION;


                /* 调用【原子_产品证券_资金运维_计算交易组资产】*/
                call db_pdsecu.pra_pdsecabk_CalcExchGroupAsset(
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
                    v_error_code,
                    v_error_info,
                    v_stock_cash_asset,
                    v_stock_asset,
                    v_bond_asset,
                    v_fund_asset,
                    v_money_fund_asset,
                    v_not_money_fund_asset,
                    v_repo_asset,
                    v_hk_thrgh_stock_asset,
                    v_other_asset,
                    v_crncy_type);
                if v_error_code = "1" then
                    SET v_error_code = "pdsecuT.10.13.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_计算交易组资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;

              #20181022修改  [原子_产品证券_资金运维_计算交易组证券资产]

            /* [事务结束] */
            COMMIT;


            /* set @证券现金资产串# = concat(@证券现金资产串#,@证券现金资产#,";"); */
            set v_stock_cash_asset_str = concat(v_stock_cash_asset_str,v_stock_cash_asset,";");

            /* set @股票资产串# = concat(@股票资产串#,@股票资产#,";"); */
            set v_stock_asset_str = concat(v_stock_asset_str,v_stock_asset,";");

            /* set @债券资产串# = concat(@债券资产串#,@债券资产#,";"); */
            set v_bond_asset_str = concat(v_bond_asset_str,v_bond_asset,";");

            /* set @基金资产串# = concat(@基金资产串#,@基金资产#,";"); */
            set v_fund_asset_str = concat(v_fund_asset_str,v_fund_asset,";");

            /* set @回购资产串# = concat(@回购资产串#,@回购资产#,";"); */
            set v_repo_asset_str = concat(v_repo_asset_str,v_repo_asset,";");

            /* set @港股通资产串# = concat(@港股通资产串#,@港股通资产#,";"); */
            set v_hk_thrgh_stock_asset_str = concat(v_hk_thrgh_stock_asset_str,v_hk_thrgh_stock_asset,";");

            /* set @其他资产串# = concat(@其他资产串#,@其他资产#,";"); */
            set v_other_asset_str = concat(v_other_asset_str,v_other_asset,";");

            /* set @本币币种串# = concat(@本币币种串#,@本币币种#,";"); */
            set v_crncy_type_str = concat(v_crncy_type_str,v_crncy_type,";");

            /* set @记录序号串#=substring(@记录序号串#,LOCATE(";",@记录序号串#)+1); */
            set v_row_id_str=substring(v_row_id_str,LOCATE(";",v_row_id_str)+1);

            /* set @机构编号串#=substring(@机构编号串#,LOCATE(";",@机构编号串#)+1); */
            set v_co_no_str=substring(v_co_no_str,LOCATE(";",v_co_no_str)+1);

            /* set @产品编号串#=substring(@产品编号串#,LOCATE(";",@产品编号串#)+1); */
            set v_pd_no_str=substring(v_pd_no_str,LOCATE(";",v_pd_no_str)+1);

            /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(";",@交易组编号串#)+1); */
            set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(";",v_exch_group_no_str)+1);
        else
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_stock_cash_asset_str = v_stock_cash_asset_str;
    SET p_stock_asset_str = v_stock_asset_str;
    SET p_bond_asset_str = v_bond_asset_str;
    SET p_fund_asset_str = v_fund_asset_str;
    SET p_repo_asset_str = v_repo_asset_str;
    SET p_hk_thrgh_stock_asset_str = v_hk_thrgh_stock_asset_str;
    SET p_other_asset_str = v_other_asset_str;
    SET p_crncy_type_str = v_crncy_type_str;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_计算产品证券资产修改版
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_CalcProdSecuAsset_New;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_CalcProdSecuAsset_New(
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
    IN p_hk_asset_calc_rate int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_money_fund_asset decimal(18,4),
    OUT p_not_money_fund_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_hk_thrgh_stock_asset decimal(18,4),
    OUT p_other_asset decimal(18,4),
    OUT p_crncy_type varchar(3)
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
    declare v_hk_asset_calc_rate int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_hk_asset_calc_rate = p_hk_asset_calc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金运维_计算产品证券资产修改版】*/
    call db_pdsecu.pra_pdsecabk_CalcProdSecuAsset_New(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_hk_asset_calc_rate,
        v_error_code,
        v_error_info,
        v_stock_asset,
        v_bond_asset,
        v_fund_asset,
        v_money_fund_asset,
        v_not_money_fund_asset,
        v_repo_asset,
        v_hk_thrgh_stock_asset,
        v_other_asset,
        v_crncy_type);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.14.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_计算产品证券资产修改版出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_asset = v_stock_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_money_fund_asset = v_money_fund_asset;
    SET p_not_money_fund_asset = v_not_money_fund_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_other_asset = v_other_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_计算交易组证券资产修改版
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_CalcExchGroupSecuAsset_New;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_CalcExchGroupSecuAsset_New(
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
    IN p_hk_asset_calc_rate int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_cash_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_money_fund_asset decimal(18,4),
    OUT p_not_money_fund_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_hk_thrgh_stock_asset decimal(18,4),
    OUT p_other_asset decimal(18,4),
    OUT p_crncy_type varchar(3)
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
    declare v_hk_asset_calc_rate int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
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
    SET v_row_id = p_row_id;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_hk_asset_calc_rate = p_hk_asset_calc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金运维_计算交易组证券资产修改版】*/
    call db_pdsecu.pra_pdsecabk_CalcExchGroupSecuAsset_New(
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
        v_hk_asset_calc_rate,
        v_error_code,
        v_error_info,
        v_cash_asset,
        v_stock_asset,
        v_bond_asset,
        v_fund_asset,
        v_money_fund_asset,
        v_not_money_fund_asset,
        v_repo_asset,
        v_hk_thrgh_stock_asset,
        v_other_asset,
        v_crncy_type);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.15.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_计算交易组证券资产修改版出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_cash_asset = v_cash_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_money_fund_asset = v_money_fund_asset;
    SET p_not_money_fund_asset = v_not_money_fund_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_other_asset = v_other_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_计算产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_CalcProdAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_CalcProdAsset(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_stock_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_money_fund_asset decimal(18,4),
    OUT p_not_money_fund_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_hk_thrgh_stock_asset decimal(18,4),
    OUT p_other_asset decimal(18,4),
    OUT p_crncy_type varchar(3),
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_crncy_type varchar(3);
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金运维_计算产品资产】*/
    call db_pdsecu.pra_pdsecabk_CalcProdAsset(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info,
        v_co_no,
        v_pd_no,
        v_stock_asset,
        v_bond_asset,
        v_fund_asset,
        v_money_fund_asset,
        v_not_money_fund_asset,
        v_repo_asset,
        v_hk_thrgh_stock_asset,
        v_other_asset,
        v_crncy_type,
        v_row_id);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.16.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_计算产品资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_stock_asset = v_stock_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_money_fund_asset = v_money_fund_asset;
    SET p_not_money_fund_asset = v_not_money_fund_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_other_asset = v_other_asset;
    SET p_crncy_type = v_crncy_type;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_计算交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_CalcExchGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_CalcExchGroupAsset(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_stock_cash_asset decimal(18,4),
    OUT p_stock_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
    OUT p_money_fund_asset decimal(18,4),
    OUT p_not_money_fund_asset decimal(18,4),
    OUT p_repo_asset decimal(18,4),
    OUT p_hk_thrgh_stock_asset decimal(18,4),
    OUT p_other_asset decimal(18,4),
    OUT p_crncy_type varchar(3)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金运维_计算交易组资产】*/
    call db_pdsecu.pra_pdsecabk_CalcExchGroupAsset(
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
        v_error_code,
        v_error_info,
        v_stock_cash_asset,
        v_stock_asset,
        v_bond_asset,
        v_fund_asset,
        v_money_fund_asset,
        v_not_money_fund_asset,
        v_repo_asset,
        v_hk_thrgh_stock_asset,
        v_other_asset,
        v_crncy_type);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.17.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_计算交易组资产出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_cash_asset = v_stock_cash_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_money_fund_asset = v_money_fund_asset;
    SET p_not_money_fund_asset = v_not_money_fund_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_other_asset = v_other_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_获取外部资金账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_GetOutCapitalAsacInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_GetOutCapitalAsacInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_row_id bigint,
    OUT p_init_date int,
    OUT p_target_co_no int,
    OUT p_target_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3)
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
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_row_id bigint;
    declare v_init_date int;
    declare v_target_co_no int;
    declare v_target_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_pd_no = p_pd_no;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_co_no = 0;
    SET v_target_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金运维_获取外部资金账户信息】*/
        call db_pdsecu.pra_pdsecabk_GetOutCapitalAsacInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_co_no,
            v_pd_no,
            v_row_id,
            v_error_code,
            v_error_info,
            v_curr_row_id,
            v_init_date,
            v_target_co_no,
            v_target_pd_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_crncy_type);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.18.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_获取外部资金账户信息出现错误！',v_mysql_message);
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
    SET p_curr_row_id = v_curr_row_id;
    SET p_init_date = v_init_date;
    SET p_target_co_no = v_target_co_no;
    SET p_target_pd_no = v_target_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_处理内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_DealCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_DealCapitalDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    IN p_default_exch_group_no int,
    IN p_exch_group_no_str varchar(2048),
    IN p_weight_value_str varchar(255),
    IN p_busi_config_str varchar(64),
    IN p_deal_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_occur_amt decimal(18,4),
    OUT p_amt_check_diff decimal(18,4),
    OUT p_crncy_type varchar(3),
    OUT p_asset_sync_flag int,
    OUT p_sync_total_rece_payab int,
    OUT p_acco_total_rece_amt_diff decimal(18,4),
    OUT p_acco_total_payab_amt_diff decimal(18,4),
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
    declare v_row_id bigint;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_default_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_weight_value_str varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_deal_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_asset_sync_flag int;
    declare v_sync_total_rece_payab int;
    declare v_acco_total_rece_amt_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
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
    SET v_row_id = p_row_id;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_weight_value_str = p_weight_value_str;
    SET v_busi_config_str = p_busi_config_str;
    SET v_deal_info = p_deal_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_occur_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_crncy_type = "CNY";
    SET v_asset_sync_flag = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_acco_total_rece_amt_diff = 0;
    SET v_acco_total_payab_amt_diff = 0;
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


        /* 调用【原子_产品证券_资金运维_处理内外资金差异记录】*/
        call db_pdsecu.pra_pdsecabk_DealCapitalDiff(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_oper_remark_info,
            v_menu_no,
            v_default_exch_group_no,
            v_exch_group_no_str,
            v_weight_value_str,
            v_busi_config_str,
            v_deal_info,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_exch_group_no,
            v_occur_amt,
            v_amt_check_diff,
            v_crncy_type,
            v_asset_sync_flag,
            v_sync_total_rece_payab,
            v_acco_total_rece_amt_diff,
            v_acco_total_payab_amt_diff,
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
            SET v_error_code = "pdsecuT.10.19.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理内外资金差异记录出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_occur_amt = v_occur_amt;
    SET p_amt_check_diff = v_amt_check_diff;
    SET p_crncy_type = v_crncy_type;
    SET p_asset_sync_flag = v_asset_sync_flag;
    SET p_sync_total_rece_payab = v_sync_total_rece_payab;
    SET p_acco_total_rece_amt_diff = v_acco_total_rece_amt_diff;
    SET p_acco_total_payab_amt_diff = v_acco_total_payab_amt_diff;
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


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_QueryExgpCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_crncy_type_str varchar(2048),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type_str varchar(2048);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金运维_查询交易组资金】*/
    call db_pdsecu.pra_pdsecabk_QueryExgpCapital(
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
        v_exch_group_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_查询交易组资金出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_资金运维_查询通道内外资金差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_QueryChannelCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_QueryChannelCapitalDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_deal_flag_query_str varchar(2048),
    IN p_query_pass_no int,
    IN p_min_amt decimal(18,4),
    IN p_max_amt decimal(18,4),
    IN p_filter_diff_cond int,
    IN p_asset_sync_flag int,
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_deal_flag_query_str varchar(2048);
    declare v_query_pass_no int;
    declare v_min_amt decimal(18,4);
    declare v_max_amt decimal(18,4);
    declare v_filter_diff_cond int;
    declare v_asset_sync_flag int;
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_deal_flag_query_str = p_deal_flag_query_str;
    SET v_query_pass_no = p_query_pass_no;
    SET v_min_amt = p_min_amt;
    SET v_max_amt = p_max_amt;
    SET v_filter_diff_cond = p_filter_diff_cond;
    SET v_asset_sync_flag = p_asset_sync_flag;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@处理标志查询串#] */
    set v_deal_flag_query_str = concat(";", v_deal_flag_query_str,";");


    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* [变量补分隔符][@机构编号串#] */
    set v_co_no_str = concat(";", v_co_no_str,";");


    /* 调用【原子_产品证券_资金运维_查询通道内外资金差异】*/
    call db_pdsecu.pra_pdsecabk_QueryChannelCapitalDiff(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no_str,
        v_pd_no_str,
        v_asset_acco_no,
        v_pass_no,
        v_out_acco,
        v_deal_flag_query_str,
        v_query_pass_no,
        v_min_amt,
        v_max_amt,
        v_filter_diff_cond,
        v_asset_sync_flag,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_查询通道内外资金差异出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_资金运维_重置内部证券资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_ResetInSecuCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_ResetInSecuCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;

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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金运维_重置内部证券资金表】*/
        call db_pdsecu.pra_pdsecabk_ResetInSecuCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_query_row_id,
            v_error_code,
            v_error_info,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_asset_acco_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.22.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_重置内部证券资金表出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_获取内部证券资金记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_GetInSecuCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_GetInSecuCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_asac_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_amt decimal(18,4),
    OUT p_avail_amt decimal(18,4),
    OUT p_total_payab_amt decimal(18,4),
    OUT p_total_rece_amt decimal(18,4)
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);

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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_avail_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_rece_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金运维_获取内部证券资金记录】*/
        call db_pdsecu.pra_pdsecabk_GetInSecuCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_curr_amt,
            v_avail_amt,
            v_total_payab_amt,
            v_total_rece_amt);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.10.23.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_获取内部证券资金记录出现错误！',v_mysql_message);
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
    SET p_curr_amt = v_curr_amt;
    SET p_avail_amt = v_avail_amt;
    SET p_total_payab_amt = v_total_payab_amt;
    SET p_total_rece_amt = v_total_rece_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_转入内部证券资金核对记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_AddInSecuCapitCkeck;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_AddInSecuCapitCkeck(
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
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_co_busi_config_str varchar(64),
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_curr_amt decimal(18,4),
    IN p_avail_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_co_busi_config_str = p_co_busi_config_str;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_curr_amt = p_curr_amt;
    SET v_avail_amt = p_avail_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if (substring(@机构业务控制配置串#, 12, 1) = 《资产是否同步-同步资金同步持仓》 or substring(@机构业务控制配置串#, 12, 1) = 《资产是否同步-同步资金不同步持仓》) then */
    if (substring(v_co_busi_config_str, 12, 1) = 1 or substring(v_co_busi_config_str, 12, 1) = 3) then

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品证券_资金运维_转入内部证券资金核对记录】*/
            call db_pdsecu.pra_pdsecabk_AddInSecuCapitCkeck(
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
                v_co_busi_config_str,
                v_asac_busi_config_str,
                v_pass_no,
                v_out_acco,
                v_curr_amt,
                v_avail_amt,
                v_total_payab_amt,
                v_total_rece_amt,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.10.24.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_转入内部证券资金核对记录出现错误！',v_mysql_message);
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
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金运维_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_QueryAsacCapital_Jour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no_str varchar(2048),
    IN p_busi_flag_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
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
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no_str varchar(2048);
    declare v_busi_flag_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
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
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_busi_flag_str = p_busi_flag_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@机构编号串#] */
    set v_co_no_str = concat(";", v_co_no_str,";");


    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* [变量补分隔符][@资产账户编号串#] */
    set v_asset_acco_no_str = concat(";", v_asset_acco_no_str,";");


    /* [变量补分隔符][@业务标志串#] */
    set v_busi_flag_str = concat(";", v_busi_flag_str,";");


    /* [变量补分隔符][@本币币种串#] */
    set v_crncy_type_str = concat(";", v_crncy_type_str,";");


    /* 调用【原子_产品证券_资金运维_查询资产账户资金流水】*/
    call db_pdsecu.pra_pdsecabk_QueryAsacCapital_Jour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_init_date,
        v_co_no_str,
        v_pd_no_str,
        v_asset_acco_no_str,
        v_busi_flag_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.25.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_查询资产账户资金流水出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_资金运维_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_QueryAsacCapital_JourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no_str varchar(2048),
    IN p_pd_no_str varchar(2048),
    IN p_asset_acco_no_str varchar(2048),
    IN p_busi_flag_str varchar(2048),
    IN p_crncy_type_str varchar(2048),
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);
    declare v_asset_acco_no_str varchar(2048);
    declare v_busi_flag_str varchar(2048);
    declare v_crncy_type_str varchar(2048);
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no_str = p_co_no_str;
    SET v_pd_no_str = p_pd_no_str;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_busi_flag_str = p_busi_flag_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@机构编号串#] */
    set v_co_no_str = concat(";", v_co_no_str,";");


    /* [变量补分隔符][@产品编号串#] */
    set v_pd_no_str = concat(";", v_pd_no_str,";");


    /* [变量补分隔符][@资产账户编号串#] */
    set v_asset_acco_no_str = concat(";", v_asset_acco_no_str,";");


    /* [变量补分隔符][@业务标志串#] */
    set v_busi_flag_str = concat(";", v_busi_flag_str,";");


    /* [变量补分隔符][@本币币种串#] */
    set v_crncy_type_str = concat(";", v_crncy_type_str,";");


    /* 调用【原子_产品证券_资金运维_查询历史资产账户资金流水】*/
    call db_pdsecu.pra_pdsecabk_QueryAsacCapital_JourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no_str,
        v_pd_no_str,
        v_asset_acco_no_str,
        v_busi_flag_str,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.10.26.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_查询历史资产账户资金流水出现错误！',v_mysql_message);
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
use db_pdsecu;;

# 事务_产品证券_资金运维_删除交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsecabk_DeleteExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsecabk_DeleteExgpCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_occur_amt decimal(18,4)
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_amt decimal(18,4);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_amt = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* 调用【原子_产品证券_资金运维_删除交易组资金】*/
       call db_pdsecu.pra_pdsecabk_DeleteExgpCapital(
           v_opor_co_no,
           v_opor_no,
           v_oper_mac,
           v_oper_ip_addr,
           v_oper_info,
           v_oper_way,
           v_func_code,
           v_pd_no,
           v_asset_acco_no,
           v_exch_group_no,
           v_crncy_type,
           v_row_id,
           v_error_code,
           v_error_info,
           v_occur_amt);
       if v_error_code = "1" then
           SET v_error_code = "pdsecuT.10.27.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_删除交易组资金出现错误！',v_mysql_message);
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
    SET p_occur_amt = v_occur_amt;

END;;


