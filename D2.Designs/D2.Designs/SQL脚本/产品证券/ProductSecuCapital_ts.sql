DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_分配产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DistrPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DistrPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_分配产品资金】*/
        call db_pdsecu.pra_pdseca_DistrPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_分配产品资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_回收产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_BackPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_BackPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_回收产品资金】*/
        call db_pdsecu.pra_pdseca_BackPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_回收产品资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_AuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_AuthPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_授权产品资金】*/
        call db_pdsecu.pra_pdseca_AuthPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.10.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_授权产品资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_回收授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_BackAuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_BackAuthPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_回收授权产品资金】*/
        call db_pdsecu.pra_pdseca_BackAuthPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.11.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_回收授权产品资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_FrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_FrozenExgpCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
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
    declare v_update_times int;
    declare v_asac_frozen_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @资产账户冻结解冻流水号# = 0; */
        set v_asac_frozen_no = 0;

        /* 调用【原子_产品证券_资金_冻结交易组资金】*/
        call db_pdsecu.pra_pdseca_FrozenExgpCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_expire_date,
            v_asac_frozen_no,
            v_oper_remark_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.32.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_冻结交易组资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_取消冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UndoFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UndoFrozenExgpCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_取消冻结交易组资金】*/
        call db_pdsecu.pra_pdseca_UndoFrozenExgpCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_asset_acco_no,
            v_exch_group_no,
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.33.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消冻结交易组资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UnFrozenExgpCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
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
    declare v_update_times int;
    declare v_asac_frozen_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @资产账户冻结解冻流水号# = 0; */
        set v_asac_frozen_no = 0;

        /* 调用【原子_产品证券_资金_解冻交易组资金】*/
        call db_pdsecu.pra_pdseca_UnFrozenExgpCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_expire_date,
            v_asac_frozen_no,
            v_oper_remark_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.34.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_解冻交易组资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_取消解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UndoUnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UndoUnFrozenExgpCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_取消解冻交易组资金】*/
        call db_pdsecu.pra_pdseca_UndoUnFrozenExgpCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_asset_acco_no,
            v_exch_group_no,
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.35.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消解冻交易组资金出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpCapital(
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询交易组资金】*/
    call db_pdsecu.pra_pdseca_QueryExgpCapital(
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
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.37.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询交易组资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询历史交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpCapital_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpCapital_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询历史交易组资金】*/
    call db_pdsecu.pra_pdseca_QueryExgpCapital_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.38.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询历史交易组资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpCapital_Jour(
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
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询交易组资金流水】*/
    call db_pdsecu.pra_pdseca_QueryExgpCapital_Jour(
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
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.39.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询交易组资金流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询历史交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpCapital_JourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询历史交易组资金流水】*/
    call db_pdsecu.pra_pdseca_QueryExgpCapital_JourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.40.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询历史交易组资金流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpCapitalFrozenJour(
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
    IN p_frozen_type int,
    IN p_jour_status varchar(2),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询交易组资金冻结解冻流水】*/
    call db_pdsecu.pra_pdseca_QueryExgpCapitalFrozenJour(
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
        v_frozen_type,
        v_jour_status,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.41.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询交易组资金冻结解冻流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询历史交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpCapitalFrozenJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_frozen_type int,
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_begin_date int;
    declare v_end_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_frozen_type int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_frozen_type = p_frozen_type;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询历史交易组资金冻结解冻流水】*/
    call db_pdsecu.pra_pdseca_QueryExgpCapitalFrozenJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_frozen_type,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.42.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询历史交易组资金冻结解冻流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_获取交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_GetExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_GetExgpCapitalFrozenJour(
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
    OUT p_oper_func_code varchar(16),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_crncy_type varchar(3),
    OUT p_frozen_type int,
    OUT p_occur_amt decimal(18,4),
    OUT p_expire_date int,
    OUT p_jour_status varchar(2),
    OUT p_asac_frozen_no bigint
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
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_frozen_type int;
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_jour_status varchar(2);
    declare v_asac_frozen_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_frozen_type = 0;
    SET v_occur_amt = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_jour_status = "0";
    SET v_asac_frozen_no = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_获取交易组资金冻结解冻流水】*/
    call db_pdsecu.pra_pdseca_GetExgpCapitalFrozenJour(
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
        v_oper_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_group_no,
        v_crncy_type,
        v_frozen_type,
        v_occur_amt,
        v_expire_date,
        v_jour_status,
        v_asac_frozen_no);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.43.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取交易组资金冻结解冻流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_oper_func_code = v_oper_func_code;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_crncy_type = v_crncy_type;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_amt = v_occur_amt;
    SET p_expire_date = v_expire_date;
    SET p_jour_status = v_jour_status;
    SET p_asac_frozen_no = v_asac_frozen_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_更新交易组资金累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UpdateExchGroupCapitalRecePayab;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UpdateExchGroupCapitalRecePayab(
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
    IN p_crncy_type varchar(3),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_更新交易组资金累计应收应付】*/
        call db_pdsecu.pra_pdseca_UpdateExchGroupCapitalRecePayab(
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
            v_crncy_type,
            v_total_rece_amt,
            v_total_payab_amt,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.44.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_更新交易组资金累计应收应付出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_查询交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpGroupAsset(
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
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询交易组资产】*/
    call db_pdsecu.pra_pdseca_QueryExgpGroupAsset(
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
        v_crncy_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.45.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询交易组资产出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_红冲蓝补资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_PatchAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_PatchAsacCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_is_change_exch_group_capital int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_is_change_exch_group_capital int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* if @是否调整交易组资金# = 《是否调整交易组资金-是》 then */
        if v_is_change_exch_group_capital = 1 then

            /* [检查报错返回][@交易组编号# = 0][14][@交易组编号#] */
            if v_exch_group_no = 0 then
                ROLLBACK;
                SET v_error_code = "pdsecuT.2.51.14";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no);
                end if;
                leave label_pro;
            end if;


            /* 调用【原子_产品证券_资金_红冲蓝补交易组资金】*/
            call db_pdsecu.pra_pdseca_PatchExchGroupCapital(
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
                v_crncy_type,
                v_occur_amt,
                v_oper_remark_info,
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
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.51.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_红冲蓝补交易组资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易组更新次数# = @更新次数#; */
            set v_exch_group_update_times = v_update_times;
        end if;

        /* 调用【原子_产品证券_资金_红冲蓝补资产账户资金】*/
        call db_pdsecu.pra_pdseca_PatchAsacCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_红冲蓝补资产账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

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


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_FrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_FrozenAsacCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_expire_date int,
    IN p_is_change_exch_group_capital int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_asac_update_times int,
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
    OUT p_exch_group_update_times int
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_is_change_exch_group_capital int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_asac_frozen_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_冻结资产账户资金】*/
        call db_pdsecu.pra_pdseca_FrozenAsacCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_expire_date,
            v_is_change_exch_group_capital,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times,
            v_asac_frozen_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.52.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_冻结资产账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* if @是否调整交易组资金# = 《是否调整交易组资金-是》 then */
        if v_is_change_exch_group_capital = 1 then

            /* 调用【原子_产品证券_资金_冻结交易组资金】*/
            call db_pdsecu.pra_pdseca_FrozenExgpCapital(
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
                v_crncy_type,
                v_occur_amt,
                v_expire_date,
                v_asac_frozen_no,
                v_oper_remark_info,
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
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.52.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_冻结交易组资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易组更新次数# = @更新次数#; */
            set v_exch_group_update_times = v_update_times;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_取消冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UndoFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UndoFrozenAsacCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_frozen_type int,
    IN p_occur_amt decimal(18,4),
    IN p_is_change_exch_group_capital int,
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_asac_update_times int,
    OUT p_exch_group_no int,
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
    OUT p_exch_group_update_times int
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_frozen_type int;
    declare v_occur_amt decimal(18,4);
    declare v_is_change_exch_group_capital int;
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_exch_group_no int;
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
    declare v_update_times int;
    declare v_asac_frozen_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_frozen_type = p_frozen_type;
    SET v_occur_amt = p_occur_amt;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_exch_group_no = 0;
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
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_取消冻结资产账户资金】*/
        call db_pdsecu.pra_pdseca_UndoFrozenAsacCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_asset_acco_no,
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_error_code,
            v_error_info,
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
            SET v_error_code = "pdsecuT.2.53.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消冻结资产账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* if @是否调整交易组资金# = 《是否调整交易组资金-是》 then */
        if v_is_change_exch_group_capital = 1 then

            /* set @资产账户冻结解冻流水号# = @记录序号#; */
            set v_asac_frozen_no = v_row_id;

            /* 调用【原子_产品证券_资金_获取资产账户关联交易组资金冻结解冻流水】*/
            call db_pdsecu.pra_pdseca_GetAascExgpCapitalFrozenJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_asset_acco_no,
                v_crncy_type,
                v_asac_frozen_no,
                v_frozen_type,
                v_error_code,
                v_error_info,
                v_row_id,
                v_exch_group_no,
                v_occur_amt);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.53.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取资产账户关联交易组资金冻结解冻流水出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_产品证券_资金_取消冻结交易组资金】*/
            call db_pdsecu.pra_pdseca_UndoFrozenExgpCapital(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_row_id,
                v_asset_acco_no,
                v_exch_group_no,
                v_crncy_type,
                v_occur_amt,
                v_oper_remark_info,
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
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.53.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消冻结交易组资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易组更新次数# = @更新次数#; */
            set v_exch_group_update_times = v_update_times;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_exch_group_no = v_exch_group_no;
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

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UnFrozenAsacCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_expire_date int,
    IN p_is_change_exch_group_capital int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_asac_update_times int,
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
    OUT p_exch_group_update_times int
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_is_change_exch_group_capital int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_asac_frozen_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_解冻资产账户资金】*/
        call db_pdsecu.pra_pdseca_UnFrozenAsacCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_expire_date,
            v_is_change_exch_group_capital,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times,
            v_asac_frozen_no);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_解冻资产账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* if @是否调整交易组资金# = 《是否调整交易组资金-是》 then */
        if v_is_change_exch_group_capital = 1 then

            /* 调用【原子_产品证券_资金_解冻交易组资金】*/
            call db_pdsecu.pra_pdseca_UnFrozenExgpCapital(
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
                v_crncy_type,
                v_occur_amt,
                v_expire_date,
                v_asac_frozen_no,
                v_oper_remark_info,
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
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.54.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_解冻交易组资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易组更新次数# = @更新次数#; */
            set v_exch_group_update_times = v_update_times;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_取消解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UndoUnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UndoUnFrozenAsacCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_frozen_type int,
    IN p_occur_amt decimal(18,4),
    IN p_is_change_exch_group_capital int,
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    OUT p_asac_update_times int,
    OUT p_exch_group_no int,
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
    OUT p_exch_group_update_times int
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_frozen_type int;
    declare v_occur_amt decimal(18,4);
    declare v_is_change_exch_group_capital int;
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_exch_group_no int;
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
    declare v_update_times int;
    declare v_asac_frozen_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_frozen_type = p_frozen_type;
    SET v_occur_amt = p_occur_amt;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_exch_group_no = 0;
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
    SET v_update_times = 1;
    SET v_asac_frozen_no = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_取消解冻资产账户资金】*/
        call db_pdsecu.pra_pdseca_UndoUnFrozenAsacCapital(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_asset_acco_no,
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_error_code,
            v_error_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.55.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消解冻资产账户资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* if @是否调整交易组资金# = 《是否调整交易组资金-是》 then */
        if v_is_change_exch_group_capital = 1 then

            /* set @资产账户冻结解冻流水号# = @记录序号#; */
            set v_asac_frozen_no = v_row_id;

            /* 调用【原子_产品证券_资金_获取资产账户关联交易组资金冻结解冻流水】*/
            call db_pdsecu.pra_pdseca_GetAascExgpCapitalFrozenJour(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_asset_acco_no,
                v_crncy_type,
                v_asac_frozen_no,
                v_frozen_type,
                v_error_code,
                v_error_info,
                v_row_id,
                v_exch_group_no,
                v_occur_amt);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.55.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取资产账户关联交易组资金冻结解冻流水出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* 调用【原子_产品证券_资金_取消解冻交易组资金】*/
            call db_pdsecu.pra_pdseca_UndoUnFrozenExgpCapital(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_row_id,
                v_asset_acco_no,
                v_exch_group_no,
                v_crncy_type,
                v_occur_amt,
                v_oper_remark_info,
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
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.55.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消解冻交易组资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @交易组更新次数# = @更新次数#; */
            set v_exch_group_update_times = v_update_times;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_exch_group_no = v_exch_group_no;
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

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_修改资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_ModiAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_ModiAsacCapital(
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
    IN p_crncy_type varchar(3),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_realize_pandl decimal(18,4),
    IN p_intrst_rate decimal(18,12),
    IN p_intrst_base_amt decimal(18,4),
    IN p_pre_entry_intrst_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_realize_pandl = p_realize_pandl;
    SET v_intrst_rate = p_intrst_rate;
    SET v_intrst_base_amt = p_intrst_base_amt;
    SET v_pre_entry_intrst_amt = p_pre_entry_intrst_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_修改资产账户资金】*/
        call db_pdsecu.pra_pdseca_ModiAsacCapital(
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
            v_crncy_type,
            v_total_rece_amt,
            v_total_payab_amt,
            v_realize_pandl,
            v_intrst_rate,
            v_intrst_base_amt,
            v_pre_entry_intrst_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.56.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_修改资产账户资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryAsacCapital(
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
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = ' '; */
        set v_pd_no_rights_str = ' ';
    end if;

    /* 调用【原子_产品证券_资金_查询资产账户资金】*/
    call db_pdsecu.pra_pdseca_QueryAsacCapital(
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
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.57.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询资产账户资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询历史资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryAsacCapital_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryAsacCapital_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询历史资产账户资金】*/
    call db_pdsecu.pra_pdseca_QueryAsacCapital_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.58.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询历史资产账户资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryAsacCapital_Jour(
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
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询资产账户资金流水】*/
    call db_pdsecu.pra_pdseca_QueryAsacCapital_Jour(
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
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.59.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询资产账户资金流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryAsacCapital_JourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询历史资产账户资金流水】*/
    call db_pdsecu.pra_pdseca_QueryAsacCapital_JourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.60.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询历史资产账户资金流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryAsacCapitalFrozenJour(
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
    IN p_frozen_type int,
    IN p_jour_status varchar(2),
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询资产账户资金冻结解冻流水】*/
    call db_pdsecu.pra_pdseca_QueryAsacCapitalFrozenJour(
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
        v_frozen_type,
        v_jour_status,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.61.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询资产账户资金冻结解冻流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询历史资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryAsacCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryAsacCapitalFrozenJour_His(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_begin_date int,
    IN p_end_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_frozen_type int,
    IN p_crncy_type_str varchar(2048),
    IN p_row_id bigint,
    IN p_row_count int,
    IN p_pd_no_rights_str varchar(2048),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_frozen_type int;
    declare v_crncy_type_str varchar(2048);
    declare v_row_id bigint;
    declare v_row_count int;
    declare v_pd_no_rights_str varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_frozen_type = p_frozen_type;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询历史资产账户资金冻结解冻流水】*/
    call db_pdsecu.pra_pdseca_QueryAsacCapitalFrozenJour_His(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_begin_date,
        v_end_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_frozen_type,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.62.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询历史资产账户资金冻结解冻流水出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_获取资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_GetAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_GetAsacCapitalFrozenJour(
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
    OUT p_oper_func_code varchar(16),
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_frozen_type int,
    OUT p_occur_amt decimal(18,4),
    OUT p_expire_date int,
    OUT p_jour_status varchar(2),
    OUT p_is_change_exch_group_capital int
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
    declare v_oper_func_code varchar(16);
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_frozen_type int;
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_jour_status varchar(2);
    declare v_is_change_exch_group_capital int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_oper_func_code = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_frozen_type = 0;
    SET v_occur_amt = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');
    SET v_jour_status = "0";
    SET v_is_change_exch_group_capital = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_获取资产账户资金冻结解冻流水】*/
    call db_pdsecu.pra_pdseca_GetAsacCapitalFrozenJour(
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
        v_oper_func_code,
        v_init_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_crncy_type,
        v_frozen_type,
        v_occur_amt,
        v_expire_date,
        v_jour_status,
        v_is_change_exch_group_capital);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.63.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取资产账户资金冻结解冻流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_oper_func_code = v_oper_func_code;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_amt = v_occur_amt;
    SET p_expire_date = v_expire_date;
    SET p_jour_status = v_jour_status;
    SET p_is_change_exch_group_capital = v_is_change_exch_group_capital;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_更新资产账户资金累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UpdateAsacCapitalRecePayab;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UpdateAsacCapitalRecePayab(
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
    IN p_crncy_type varchar(3),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_更新资产账户资金累计应收应付】*/
        call db_pdsecu.pra_pdseca_UpdateAsacCapitalRecePayab(
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
            v_crncy_type,
            v_total_rece_amt,
            v_total_payab_amt,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.64.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_更新资产账户资金累计应收应付出现错误！',v_mysql_message);
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_资产账户资金应收应付变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_AsacCapitalChange;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_AsacCapitalChange(
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
    IN p_crncy_type varchar(3),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_is_change_exch_group_capital int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
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
    OUT p_total_rece_amt_diff decimal(18,4),
    OUT p_total_payab_amt_diff decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_is_change_exch_group_capital int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
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
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_total_rece_amt_diff = 0;
    SET v_total_payab_amt_diff = 0;
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


        /* if @是否调整交易组资金# = 《是否调整交易组资金-是》 then */
        if v_is_change_exch_group_capital = 1 then

            /* [检查报错返回][@交易组编号# = 0][14][@交易组编号#] */
            if v_exch_group_no = 0 then
                ROLLBACK;
                SET v_error_code = "pdsecuT.2.65.14";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no);
                end if;
                leave label_pro;
            end if;


            /* 调用【原子_产品证券_资金_交易组资金应收应付变动】*/
            call db_pdsecu.pra_pdseca_ExchGroupCapitalChange(
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
                v_crncy_type,
                v_total_rece_amt,
                v_total_payab_amt,
                v_oper_remark_info,
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
                v_exch_group_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.65.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_交易组资金应收应付变动出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

            #set @交易组更新次数# = @更新次数#;
        end if;

        /* 调用【原子_产品证券_资金_资产账户资金应收应付变动】*/
        call db_pdsecu.pra_pdseca_AsacCapitalChange(
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
            v_crncy_type,
            v_total_rece_amt,
            v_total_payab_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_total_rece_amt_diff,
            v_total_payab_amt_diff,
            v_asac_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.65.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_资产账户资金应收应付变动出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

        #set @资产账户更新次数# = @更新次数#;

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
    SET p_total_rece_amt_diff = v_total_rece_amt_diff;
    SET p_total_payab_amt_diff = v_total_payab_amt_diff;
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

# 事务_产品证券_资金_新增银证转账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_AddBankTransferRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_AddBankTransferRecord(
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
    IN p_trans_date int,
    IN p_trans_time int,
    IN p_bank_name varchar(64),
    IN p_bank_code varchar(32),
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_crncy_type varchar(3),
    IN p_trans_status varchar(2),
    IN p_bank_jour_no varchar(64),
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
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_trans_date int;
    declare v_trans_time int;
    declare v_bank_name varchar(64);
    declare v_bank_code varchar(32);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_trans_status varchar(2);
    declare v_bank_jour_no varchar(64);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_trans_date = p_trans_date;
    SET v_trans_time = p_trans_time;
    SET v_bank_name = p_bank_name;
    SET v_bank_code = p_bank_code;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_crncy_type = p_crncy_type;
    SET v_trans_status = p_trans_status;
    SET v_bank_jour_no = p_bank_jour_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_新增银证转账记录】*/
        call db_pdsecu.pra_pdseca_AddBankTransferRecord(
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
            v_trans_date,
            v_trans_time,
            v_bank_name,
            v_bank_code,
            v_busi_flag,
            v_occur_amt,
            v_crncy_type,
            v_trans_status,
            v_bank_jour_no,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.66.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_新增银证转账记录出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_处理银证转账资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DealBankTransferCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DealBankTransferCapit(
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
    IN p_exch_group_no_str varchar(2048),
    IN p_weight_value_str varchar(255),
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_menu_no int,
    IN p_exch_group_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_exch_group_no_str varchar(2048);
    declare v_weight_value_str varchar(255);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_menu_no int;
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_weight_value_str = p_weight_value_str;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_menu_no = p_menu_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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


        /* 调用【原子_产品证券_资金_处理银证转账资金】*/
        call db_pdsecu.pra_pdseca_DealBankTransferCapit(
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
            v_default_exch_group_no,
            v_exch_group_no_str,
            v_weight_value_str,
            v_occur_amt,
            v_busi_flag,
            v_crncy_type,
            v_menu_no,
            v_exch_group_no,
            v_error_code,
            v_error_info,
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
            SET v_error_code = "pdsecuT.2.67.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_处理银证转账资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_外部证券资金流水记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DealOutSecuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DealOutSecuCapitalJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_money_jour_no bigint,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_busi_flag int,
    IN p_crncy_type varchar(3),
    IN p_entry_amt decimal(18,4),
    IN p_entry_end_amt decimal(18,4),
    IN p_exch_no int,
    IN p_stock_acco varchar(16),
    IN p_stock_code varchar(6),
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
    declare v_pass_money_jour_no bigint;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_busi_flag int;
    declare v_crncy_type varchar(3);
    declare v_entry_amt decimal(18,4);
    declare v_entry_end_amt decimal(18,4);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
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
    SET v_pass_money_jour_no = p_pass_money_jour_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_busi_flag = p_busi_flag;
    SET v_crncy_type = p_crncy_type;
    SET v_entry_amt = p_entry_amt;
    SET v_entry_end_amt = p_entry_end_amt;
    SET v_exch_no = p_exch_no;
    SET v_stock_acco = p_stock_acco;
    SET v_stock_code = p_stock_code;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_外部证券资金流水记录处理】*/
        call db_pdsecu.pra_pdseca_DealOutSecuCapitalJour(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_money_jour_no,
            v_pass_no,
            v_out_acco,
            v_busi_flag,
            v_crncy_type,
            v_entry_amt,
            v_entry_end_amt,
            v_exch_no,
            v_stock_acco,
            v_stock_code,
            v_remark_info,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.101.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_外部证券资金流水记录处理出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_获取外部证券资金流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_GetOutSecuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_GetOutSecuCapitalJour(
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
    OUT p_init_date int,
    OUT p_pass_money_jour_no bigint,
    OUT p_busi_flag int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_entry_amt decimal(18,4),
    OUT p_entry_end_amt decimal(18,4),
    OUT p_exch_no int,
    OUT p_stock_acco varchar(16),
    OUT p_stock_code varchar(6),
    OUT p_remark_info varchar(255),
    OUT p_deal_flag int
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
    declare v_init_date int;
    declare v_pass_money_jour_no bigint;
    declare v_busi_flag int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_entry_amt decimal(18,4);
    declare v_entry_end_amt decimal(18,4);
    declare v_exch_no int;
    declare v_stock_acco varchar(16);
    declare v_stock_code varchar(6);
    declare v_remark_info varchar(255);
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_money_jour_no = 0;
    SET v_busi_flag = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_entry_amt = 0;
    SET v_entry_end_amt = 0;
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_remark_info = " ";
    SET v_deal_flag = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_获取外部证券资金流水记录】*/
    call db_pdsecu.pra_pdseca_GetOutSecuCapitalJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_row_id,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.102.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取外部证券资金流水记录出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_pass_money_jour_no = v_pass_money_jour_no;
    SET p_busi_flag = v_busi_flag;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_entry_amt = v_entry_amt;
    SET p_entry_end_amt = v_entry_end_amt;
    SET p_exch_no = v_exch_no;
    SET p_stock_acco = v_stock_acco;
    SET p_stock_code = v_stock_code;
    SET p_remark_info = v_remark_info;
    SET p_deal_flag = v_deal_flag;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_查询外部证券资金流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryOutSecuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryOutSecuCapitalJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @本币币种串# <> " " then */
    if v_crncy_type_str <> " " then

        /* set @本币币种串#=concat(";",@本币币种串#,";"); */
        set v_crncy_type_str=concat(";",v_crncy_type_str,";");
    end if;

    /* 调用【原子_产品证券_资金_查询外部证券资金流水记录】*/
    call db_pdsecu.pra_pdseca_QueryOutSecuCapitalJour(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.103.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询外部证券资金流水记录出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_转入外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_AddOutCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_AddOutCapital(
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
    IN p_out_curr_amt decimal(18,4),
    IN p_out_enable_amt decimal(18,4),
    IN p_out_frozen_amt decimal(18,4),
    IN p_out_unfroz_amt decimal(18,4),
    IN p_out_total_payab_amt decimal(18,4),
    IN p_out_total_rece_amt decimal(18,4),
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
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
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
    SET v_out_curr_amt = p_out_curr_amt;
    SET v_out_enable_amt = p_out_enable_amt;
    SET v_out_frozen_amt = p_out_frozen_amt;
    SET v_out_unfroz_amt = p_out_unfroz_amt;
    SET v_out_total_payab_amt = p_out_total_payab_amt;
    SET v_out_total_rece_amt = p_out_total_rece_amt;
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
            SET v_error_code = "pdsecuT.2.171.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取资产账户资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品证券_资金_转入外部资金】*/
            call db_pdsecu.pra_pdseca_AddOutCapital(
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
                v_out_curr_amt,
                v_out_enable_amt,
                v_out_frozen_amt,
                v_out_unfroz_amt,
                v_curr_amt,
                v_avail_amt,
                v_out_total_payab_amt,
                v_out_total_rece_amt,
                v_total_payab_amt,
                v_total_rece_amt,
                v_pboc_rate,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.171.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_转入外部资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_处理日终到期冻结解冻
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DealCloseFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DealCloseFrozenUnfrozen(
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
    declare v_query_row_id bigint;
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_frozen_type int;
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
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
    declare v_update_times int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_row_id = 0;
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_frozen_type = 0;
    SET v_occur_amt = 0;
    SET v_oper_remark_info = " ";
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
    SET v_update_times = 1;
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
    
    #处理交易组资金冻结解冻

    /* set @查询记录序号#=0; */
    set v_query_row_id=0;
    loop_label:loop

        /* 调用【原子_产品证券_资金_获取日终到期交易组冻结解冻记录】*/
        call db_pdsecu.pra_pdseca_GetCloseExgpFrozenUnfrozen(
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
            v_asset_acco_no,
            v_exch_group_no,
            v_crncy_type,
            v_frozen_type,
            v_occur_amt);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* set @查询记录序号# = @记录序号#; */
            set v_query_row_id = v_row_id;

            /* [事务开始] */
            START TRANSACTION;


                /* if @冻结解冻类型#=《冻结解冻类型-冻结》 then */
                if v_frozen_type=1 then

                    /* set @操作备注#="交易组资金冻结日终冻结取消到期处理"; */
                    set v_oper_remark_info="交易组资金冻结日终冻结取消到期处理";

                    /* 调用【原子_产品证券_资金_取消冻结交易组资金】*/
                    call db_pdsecu.pra_pdseca_UndoFrozenExgpCapital(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_row_id,
                        v_asset_acco_no,
                        v_exch_group_no,
                        v_crncy_type,
                        v_occur_amt,
                        v_oper_remark_info,
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
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "pdsecuT.2.254.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消冻结交易组资金出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* elseif @冻结解冻类型#=《冻结解冻类型-解冻》 then */
                elseif v_frozen_type=2 then

                    /* set @操作备注#="交易组资金解冻日终解冻取消到期处理"; */
                    set v_oper_remark_info="交易组资金解冻日终解冻取消到期处理";

                    /* 调用【原子_产品证券_资金_取消解冻交易组资金】*/
                    call db_pdsecu.pra_pdseca_UndoUnFrozenExgpCapital(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_row_id,
                        v_asset_acco_no,
                        v_exch_group_no,
                        v_crncy_type,
                        v_occur_amt,
                        v_oper_remark_info,
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
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "pdsecuT.2.254.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消解冻交易组资金出现错误！',v_mysql_message);
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

        else

            /* set @错误编码# = "0"; */
            set v_error_code = "0";

            /* set @错误信息# = " "; */
            set v_error_info = " ";
            leave loop_label;
        end if;
    end loop;
    #处理资产账户持仓冻结解冻

    /* set @查询记录序号#=0; */
    set v_query_row_id=0;
    loop_label:loop

        /* 调用【原子_产品证券_资金_获取日终到期资产账户冻结解冻记录】*/
        call db_pdsecu.pra_pdseca_GetCloseAsacFrozenUnfrozen(
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
            v_asset_acco_no,
            v_crncy_type,
            v_frozen_type,
            v_occur_amt);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* set @查询记录序号# = @记录序号#; */
            set v_query_row_id = v_row_id;

            /* [事务开始] */
            START TRANSACTION;


                /* if @冻结解冻类型#=《冻结解冻类型-冻结》 then */
                if v_frozen_type=1 then

                    /* set @操作备注#="资产账户资金冻结日终冻结取消到期处理"; */
                    set v_oper_remark_info="资产账户资金冻结日终冻结取消到期处理";

                    /* 调用【原子_产品证券_资金_取消冻结资产账户资金】*/
                    call db_pdsecu.pra_pdseca_UndoFrozenAsacCapital(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_row_id,
                        v_asset_acco_no,
                        v_crncy_type,
                        v_occur_amt,
                        v_oper_remark_info,
                        v_error_code,
                        v_error_info,
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
                        SET v_error_code = "pdsecuT.2.254.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消冻结资产账户资金出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* elseif @冻结解冻类型#=《冻结解冻类型-解冻》 then */
                elseif v_frozen_type=2 then

                    /* set @操作备注#="资产账户资金解冻日终解冻取消到期处理"; */
                    set v_oper_remark_info="资产账户资金解冻日终解冻取消到期处理";

                    /* 调用【原子_产品证券_资金_取消解冻资产账户资金】*/
                    call db_pdsecu.pra_pdseca_UndoUnFrozenAsacCapital(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_row_id,
                        v_asset_acco_no,
                        v_crncy_type,
                        v_occur_amt,
                        v_oper_remark_info,
                        v_error_code,
                        v_error_info,
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
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "pdsecuT.2.254.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_取消解冻资产账户资金出现错误！',v_mysql_message);
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

        else

            /* set @错误编码# = '0'; */
            set v_error_code = '0';

            /* set @错误信息# = ' '; */
            set v_error_info = ' ';
            leave loop_label;
        end if;
    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_处理红利到期
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DealDividend;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DealDividend(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_menu_no int,
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
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_query_row_id bigint;
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_query_row_id = 0;
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_occur_amt = 0;
    SET v_busi_flag = 0;

    
    label_pro:BEGIN
    
    #处理交易组资金冻结解冻

    /* set @查询记录序号#=0; */
    set v_query_row_id=0;
    loop_label:loop

         /* [事务开始] */
         START TRANSACTION;


        /* 调用【原子_产品证券_资金_获取红利到期记录】*/
        call db_pdsecu.pra_pdseca_GetDividendRecord(
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
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_occur_amt,
            v_busi_flag);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* set @查询记录序号# = @记录序号#; */
            set v_query_row_id = v_row_id;

            /* 调用【原子_产品证券_资金_处理红利到期更新资金】*/
            call db_pdsecu.pra_pdseca_DealDividendUpdateCapital(
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
                v_occur_amt,
                v_menu_no,
                v_busi_flag,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.255.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_处理红利到期更新资金出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;

        else

            /* set @错误编码# = "0"; */
            set v_error_code = "0";

            /* set @错误信息# = " "; */
            set v_error_info = " ";
            rollback;
            leave loop_label;
        end if;

        /* [事务结束] */
        COMMIT;

    end loop;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_处理资金待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DealCapitPreEntry;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DealCapitPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_query_row_id bigint,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_busi_flag int,
    OUT p_occur_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_query_row_id bigint;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
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
    SET v_init_date = p_init_date;
    SET v_query_row_id = p_query_row_id;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* set @记录个数# = 1; */
        set v_record_count = 1;

        /* 调用【原子_产品证券_资金_获取资金待入账记录】*/
        call db_pdsecu.pra_pdsepo_GetCapitPreEntry(
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
            v_exch_group_no,
            v_asset_acco_no,
            v_crncy_type,
            v_busi_flag,
            v_occur_amt);

        /* if @错误编码# <> "0" then */
        if v_error_code <> "0" then

            /* set @记录个数# = 0; */
            set v_record_count = 0;

            /* set @错误编码# = "0"; */
            set v_error_code = "0";

            /* set @错误信息# = " "; */
            set v_error_info = " ";
            rollback;
            leave label_pro;
        end if;

        /* 调用【原子_产品证券_资金_处理资金待入账记录】*/
        call db_pdsecu.pra_pdseca_DealCapitPreEntry(
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
            v_busi_flag,
            v_occur_amt,
            v_menu_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.256.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_处理资金待入账记录出现错误！',v_mysql_message);
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
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_amt = v_occur_amt;
    SET p_record_count = v_record_count;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_更新交易资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UpdateTrdCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UpdateTrdCapital(
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
    IN p_shsz_avail_amt decimal(18,4),
    IN p_hk_avail_amt decimal(18,4),
    IN p_static_avail_amt decimal(18,4),
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
    declare v_shsz_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_shsz_avail_amt = p_shsz_avail_amt;
    SET v_hk_avail_amt = p_hk_avail_amt;
    SET v_static_avail_amt = p_static_avail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_更新交易资金】*/
        call db_pdsecu.pra_pdseca_UpdateTrdCapital(
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
            v_shsz_avail_amt,
            v_hk_avail_amt,
            v_static_avail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.257.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_更新交易资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_更新交易库交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UpdateTrdExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UpdateTrdExgpCapital(
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
    IN p_shsz_avail_amt decimal(18,4),
    IN p_hk_avail_amt decimal(18,4),
    IN p_static_avail_amt decimal(18,4),
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
    declare v_shsz_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_shsz_avail_amt = p_shsz_avail_amt;
    SET v_hk_avail_amt = p_hk_avail_amt;
    SET v_static_avail_amt = p_static_avail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_更新交易库交易组资金】*/
        call db_pdsecu.pra_pdseca_UpdateTrdExgpCapital(
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
            v_shsz_avail_amt,
            v_hk_avail_amt,
            v_static_avail_amt,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.258.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_更新交易库交易组资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_估值更新累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_UpEvaluUpdateTotalRece;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_UpEvaluUpdateTotalRece(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
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
    OUT p_asset_acco_no int,
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
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    declare v_asset_acco_no int;
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
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
    SET v_asset_acco_no = 0;
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


        /* 调用【原子_产品证券_资金_估值更新累计应收应付】*/
        call db_pdsecu.pra_pdseca_EvaluUpdateTotalRece(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_exch_group_no,
            v_crncy_type,
            v_total_rece_amt,
            v_total_payab_amt,
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
            v_asset_acco_no,
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
            SET v_error_code = "pdsecuT.2.259.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_估值更新累计应收应付出现错误！',v_mysql_message);
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
    SET p_asset_acco_no = v_asset_acco_no;
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

# 事务_产品证券_资金_导入资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_ImportCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_ImportCapital(
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
    IN p_target_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_crncy_type varchar(3),
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
    OUT p_total_rece_amt_diff decimal(18,4),
    OUT p_total_payab_amt_diff decimal(18,4),
    OUT p_occur_amt decimal(18,4),
    OUT p_occur_amt_check_diff decimal(18,4),
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
    declare v_target_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_crncy_type varchar(3);
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
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_occur_amt_check_diff decimal(18,4);
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
    SET v_target_amt = p_target_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_crncy_type = p_crncy_type;
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
    SET v_total_rece_amt_diff = 0;
    SET v_total_payab_amt_diff = 0;
    SET v_occur_amt = 0;
    SET v_occur_amt_check_diff = 0;
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


        /* 调用【原子_产品证券_资金_导入资金】*/
        call db_pdsecu.pra_pdseca_ImportCapital(
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
            v_crncy_type,
            v_target_amt,
            v_frozen_amt,
            v_unfroz_amt,
            v_total_rece_amt,
            v_total_payab_amt,
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
            v_occur_amt,
            v_total_rece_amt_diff,
            v_total_payab_amt_diff,
            v_occur_amt_check_diff,
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
            SET v_error_code = "pdsecuT.2.260.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_导入资金出现错误！',v_mysql_message);
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
    SET p_total_rece_amt_diff = v_total_rece_amt_diff;
    SET p_total_payab_amt_diff = v_total_payab_amt_diff;
    SET p_occur_amt = v_occur_amt;
    SET p_occur_amt_check_diff = v_occur_amt_check_diff;
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

# 事务_产品证券_资金_获取交易组对应资产账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_GetAssectStrsForExgp;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_GetAssectStrsForExgp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    declare v_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_获取交易组对应资产账户】*/
        call db_pdsecu.pra_pdseca_GetAssectStrsForExgp(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_exch_group_no,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.261.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取交易组对应资产账户出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_交易组资金划转
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_TransferExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_TransferExgpCapit(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_target_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_occur_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
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
    OUT p_co_no int,
    OUT p_crncy_type varchar(3),
    OUT p_row_id bigint,
    OUT p_begin_amt decimal(18,4),
    OUT p_curr_amt decimal(18,4),
    OUT p_frozen_amt decimal(18,4),
    OUT p_unfroz_amt decimal(18,4),
    OUT p_pre_settle_amt decimal(18,4),
    OUT p_shsz_avail_change_amt decimal(18,4),
    OUT p_hk_avail_change_amt decimal(18,4),
    OUT p_amt_check_diff decimal(18,4),
    OUT p_T_hk_buy_total_amt decimal(18,4),
    OUT p_T_hk_sell_total_amt decimal(18,4),
    OUT p_T1_hk_buy_total_amt decimal(18,4),
    OUT p_T1_hk_sell_total_amt decimal(18,4),
    OUT p_total_rece_amt decimal(18,4),
    OUT p_total_payab_amt decimal(18,4),
    OUT p_realize_pandl decimal(18,4),
    OUT p_intrst_rate decimal(18,12),
    OUT p_intrst_base_amt decimal(18,4),
    OUT p_pre_entry_intrst_amt decimal(18,4),
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
    declare v_init_date int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_target_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
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
    declare v_co_no int;
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_target_exch_group_no = p_target_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
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
    SET v_co_no = 0;
    SET v_crncy_type = "CNY";
    SET v_row_id = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_交易组资金划转】*/
        call db_pdsecu.pra_pdseca_TransferExgpCapit(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pd_no,
            v_exch_group_no,
            v_target_exch_group_no,
            v_asset_acco_no,
            v_occur_amt,
            v_oper_remark_info,
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
            v_co_no,
            v_crncy_type,
            v_row_id,
            v_begin_amt,
            v_curr_amt,
            v_frozen_amt,
            v_unfroz_amt,
            v_pre_settle_amt,
            v_shsz_avail_change_amt,
            v_hk_avail_change_amt,
            v_amt_check_diff,
            v_T_hk_buy_total_amt,
            v_T_hk_sell_total_amt,
            v_T1_hk_buy_total_amt,
            v_T1_hk_sell_total_amt,
            v_total_rece_amt,
            v_total_payab_amt,
            v_realize_pandl,
            v_intrst_rate,
            v_intrst_base_amt,
            v_pre_entry_intrst_amt,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.262.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_交易组资金划转出现错误！',v_mysql_message);
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
    SET p_co_no = v_co_no;
    SET p_crncy_type = v_crncy_type;
    SET p_row_id = v_row_id;
    SET p_begin_amt = v_begin_amt;
    SET p_curr_amt = v_curr_amt;
    SET p_frozen_amt = v_frozen_amt;
    SET p_unfroz_amt = v_unfroz_amt;
    SET p_pre_settle_amt = v_pre_settle_amt;
    SET p_shsz_avail_change_amt = v_shsz_avail_change_amt;
    SET p_hk_avail_change_amt = v_hk_avail_change_amt;
    SET p_amt_check_diff = v_amt_check_diff;
    SET p_T_hk_buy_total_amt = v_T_hk_buy_total_amt;
    SET p_T_hk_sell_total_amt = v_T_hk_sell_total_amt;
    SET p_T1_hk_buy_total_amt = v_T1_hk_buy_total_amt;
    SET p_T1_hk_sell_total_amt = v_T1_hk_sell_total_amt;
    SET p_total_rece_amt = v_total_rece_amt;
    SET p_total_payab_amt = v_total_payab_amt;
    SET p_realize_pandl = v_realize_pandl;
    SET p_intrst_rate = v_intrst_rate;
    SET p_intrst_base_amt = v_intrst_base_amt;
    SET p_pre_entry_intrst_amt = v_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_归档获取资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_BackUpGetAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_BackUpGetAsacCapit(
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
    OUT p_pd_no int,
    OUT p_pre_settle_amt decimal(18,4),
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
    declare v_pd_no int;
    declare v_pre_settle_amt decimal(18,4);
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
    SET v_pd_no = 0;
    SET v_pre_settle_amt = 0;
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_归档获取资产账户资金】*/
        call db_pdsecu.pra_pdseca_BackUpGetAsacCapit(
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
            v_pd_no,
            v_pre_settle_amt,
            v_row_id);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.263.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_归档获取资产账户资金出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_pre_settle_amt = v_pre_settle_amt;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_归档查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_BackUpQueryAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_BackUpQueryAsacCapit(
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
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品证券_资金_归档查询资产账户资金】*/
        call db_pdsecu.pra_pdseca_BackUpQueryAsacCapit(
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
            SET v_error_code = "pdsecuT.2.264.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_归档查询资产账户资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询银行证券转账转入转出金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryBankStockInOutAmt;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryBankStockInOutAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_tday_in_amt decimal(18,4),
    OUT p_tday_out_amt decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tday_in_amt decimal(18,4);
    declare v_tday_out_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tday_in_amt = 0;
    SET v_tday_out_amt = 0;

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询银行证券转账转入转出金额】*/
    call db_pdsecu.pra_pdseca_QueryBankStockInOutAmt(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_error_code,
        v_error_info,
        v_tday_in_amt,
        v_tday_out_amt);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.265.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询银行证券转账转入转出金额出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_tday_in_amt = v_tday_in_amt;
    SET p_tday_out_amt = v_tday_out_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_删除交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DeleteExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DeleteExgpCapital(
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
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
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


       /* 调用【原子_产品证券_资金_删除交易组资金】*/
       call db_pdsecu.pra_pdseca_DeleteExgpCapital(
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
           v_error_info);
       if v_error_code = "1" then
           SET v_error_code = "pdsecuT.2.266.999";
           if v_mysql_message <> "" then
                SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_删除交易组资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_同步场外基金外部基金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_SyncOffSetFundOutFund;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_SyncOffSetFundOutFund(
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
    IN p_out_total_payab_amt decimal(18,4),
    IN p_out_total_rece_amt decimal(18,4),
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
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
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
    SET v_out_total_payab_amt = p_out_total_payab_amt;
    SET v_out_total_rece_amt = p_out_total_rece_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_产品证券_资金_同步场外基金外部基金】*/
    call db_pdsecu.pra_pdseca_SyncOffSetFundOutFund(
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
        v_out_total_payab_amt,
        v_out_total_rece_amt,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.267.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_同步场外基金外部基金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_获取场外基金资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_GetOffSetFundAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_GetOffSetFundAsacCapit(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_产品证券_资金_获取场外基金资产账户资金】*/
    call db_pdsecu.pra_pdseca_GetOffSetFundAsacCapit(
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
        SET v_error_code = "pdsecuT.2.268.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取场外基金资产账户资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_清空外部资产账户资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_ClearOutAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_ClearOutAsacCapit(
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
    

    /* [事务开始] */
    START TRANSACTION;


    /* 调用【原子_产品证券_资金_清空外部资产账户资金表】*/
    call db_pdsecu.pra_pdseca_ClearOutAsacCapit(
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
        SET v_error_code = "pdsecuT.2.269.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_清空外部资产账户资金表出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_转入外部资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_AddOutAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_AddOutAsacCapital(
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
    IN p_out_curr_amt decimal(18,4),
    IN p_out_enable_amt decimal(18,4),
    IN p_out_frozen_amt decimal(18,4),
    IN p_out_unfroz_amt decimal(18,4),
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
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
    declare v_exch_group_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_out_curr_amt = p_out_curr_amt;
    SET v_out_enable_amt = p_out_enable_amt;
    SET v_out_frozen_amt = p_out_frozen_amt;
    SET v_out_unfroz_amt = p_out_unfroz_amt;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* if (substring(@机构业务控制配置串#, 12, 1) = 《资产是否同步-同步资金同步持仓》 or substring(@机构业务控制配置串#, 12, 1) = 《资产是否同步-同步资金不同步持仓》) then */
    if (substring(v_co_busi_config_str, 12, 1) = 1 or substring(v_co_busi_config_str, 12, 1) = 3) then

        /* 调用【原子_产品证券_资金_获取资产账户资金可用信息】*/
        call db_pdsecu.pra_pdseca_GetAsacCapitalAvailInfo(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_curr_amt,
            v_avail_amt);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.270.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_获取资产账户资金可用信息出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品证券_资金_转入外部资产账户资金】*/
            call db_pdsecu.pra_pdseca_AddOutAsacCapital(
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
                v_out_curr_amt,
                v_out_enable_amt,
                v_out_frozen_amt,
                v_out_unfroz_amt,
                v_curr_amt,
                v_avail_amt,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.270.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_转入外部资产账户资金出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_转入外部资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_EntryOutAsac;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_EntryOutAsac(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_out_nav_asset decimal(18,4),
    IN p_out_stock_asset decimal(18,4),
    IN p_out_bond_asset decimal(18,4),
    IN p_out_fund_asset decimal(18,4),
    IN p_out_repo_asset decimal(18,4),
    IN p_out_total_rece_amt decimal(18,4),
    IN p_out_total_payab_amt decimal(18,4),
    IN p_out_other_asset decimal(18,4),
    IN p_out_option_asset decimal(18,4),
    IN p_out_fina_debt decimal(18,4),
    IN p_out_loan_debt decimal(18,4),
    IN p_out_futu_asset decimal(18,4),
    IN p_out_margin_amt decimal(18,4),
    IN p_out_shsz_T0_avail decimal(18,4),
    IN p_out_shsz_T1_avail decimal(18,4),
    IN p_out_shhk_avail_amt decimal(18,4),
    IN p_out_szhk_avail_amt decimal(18,4),
    IN p_out_cash_asset decimal(18,4),
    IN p_out_futu_pandl_amt decimal(18,4),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_out_nav_asset decimal(18,4);
    declare v_out_stock_asset decimal(18,4);
    declare v_out_bond_asset decimal(18,4);
    declare v_out_fund_asset decimal(18,4);
    declare v_out_repo_asset decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_other_asset decimal(18,4);
    declare v_out_option_asset decimal(18,4);
    declare v_out_fina_debt decimal(18,4);
    declare v_out_loan_debt decimal(18,4);
    declare v_out_futu_asset decimal(18,4);
    declare v_out_margin_amt decimal(18,4);
    declare v_out_shsz_T0_avail decimal(18,4);
    declare v_out_shsz_T1_avail decimal(18,4);
    declare v_out_shhk_avail_amt decimal(18,4);
    declare v_out_szhk_avail_amt decimal(18,4);
    declare v_out_cash_asset decimal(18,4);
    declare v_out_futu_pandl_amt decimal(18,4);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_out_nav_asset = p_out_nav_asset;
    SET v_out_stock_asset = p_out_stock_asset;
    SET v_out_bond_asset = p_out_bond_asset;
    SET v_out_fund_asset = p_out_fund_asset;
    SET v_out_repo_asset = p_out_repo_asset;
    SET v_out_total_rece_amt = p_out_total_rece_amt;
    SET v_out_total_payab_amt = p_out_total_payab_amt;
    SET v_out_other_asset = p_out_other_asset;
    SET v_out_option_asset = p_out_option_asset;
    SET v_out_fina_debt = p_out_fina_debt;
    SET v_out_loan_debt = p_out_loan_debt;
    SET v_out_futu_asset = p_out_futu_asset;
    SET v_out_margin_amt = p_out_margin_amt;
    SET v_out_shsz_T0_avail = p_out_shsz_T0_avail;
    SET v_out_shsz_T1_avail = p_out_shsz_T1_avail;
    SET v_out_shhk_avail_amt = p_out_shhk_avail_amt;
    SET v_out_szhk_avail_amt = p_out_szhk_avail_amt;
    SET v_out_cash_asset = p_out_cash_asset;
    SET v_out_futu_pandl_amt = p_out_futu_pandl_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品证券_资金_转入外部资产】*/
            call db_pdsecu.pra_pdseca_EntryOutAsac(
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
                v_out_acco,
                v_out_nav_asset,
                v_out_stock_asset,
                v_out_bond_asset,
                v_out_fund_asset,
                v_out_repo_asset,
                v_out_total_rece_amt,
                v_out_total_payab_amt,
                v_out_other_asset,
                v_out_option_asset,
                v_out_fina_debt,
                v_out_loan_debt,
                v_out_futu_asset,
                v_out_margin_amt,
                v_out_shsz_T0_avail,
                v_out_shsz_T1_avail,
                v_out_shhk_avail_amt,
                v_out_szhk_avail_amt,
                v_out_cash_asset,
                v_out_futu_pandl_amt,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuT.2.271.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_转入外部资产出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_申赎产品同步资帐账户及交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_ApplyPdSyncAsacAndExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_ApplyPdSyncAsacAndExgpCapital(
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
    IN p_asset_acco_no_str varchar(2048),
    IN p_dist_amt_str varchar(4096),
    IN p_exch_group_no_str varchar(2048),
    IN p_default_exch_group_no_str varchar(2048),
    IN p_weight_value_str varchar(255),
    IN p_crncy_type varchar(3),
    IN p_redempt_type int,
    IN p_redempt_amt decimal(18,4),
    IN p_redempt_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_asset_acco_no_str varchar(2048);
    declare v_dist_amt_str varchar(4096);
    declare v_exch_group_no_str varchar(2048);
    declare v_default_exch_group_no_str varchar(2048);
    declare v_weight_value_str varchar(255);
    declare v_crncy_type varchar(3);
    declare v_redempt_type int;
    declare v_redempt_amt decimal(18,4);
    declare v_redempt_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_group_no_str varchar(2048);
    declare v_tmp_weight_value_str varchar(255);
    declare v_tmp_redempt_amt decimal(18,4);
    declare v_tmp_redempt_qty decimal(18,2);
    declare v_total_weight_value decimal(18,4);
    declare v_weight_value decimal(18,4);
    declare v_split_str varchar(4);
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_tmp_occur_amt decimal(18,4);
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
    declare v_update_times int;
    declare v_exch_group_no int;
    declare v_exgp_dist_amt_str varchar(4096);
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_dist_amt_str = p_dist_amt_str;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_default_exch_group_no_str = p_default_exch_group_no_str;
    SET v_weight_value_str = p_weight_value_str;
    SET v_crncy_type = p_crncy_type;
    SET v_redempt_type = p_redempt_type;
    SET v_redempt_amt = p_redempt_amt;
    SET v_redempt_qty = p_redempt_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_group_no_str = " ";
    SET v_tmp_weight_value_str = " ";
    SET v_tmp_redempt_amt = 0;
    SET v_tmp_redempt_qty = 0;
    SET v_total_weight_value = 0;
    SET v_weight_value = 0;
    SET v_split_str = " ";
    SET v_asset_acco_no = 0;
    SET v_default_exch_group_no = 0;
    SET v_occur_amt = 0;
    SET v_tmp_occur_amt = 0;
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
    SET v_update_times = 1;
    SET v_exch_group_no = 0;
    SET v_exgp_dist_amt_str = " ";
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* [检查报错返回][length(@资产账户编号串#)<>length(@默认交易组编号串#)][1][concat("资产账户编号串:",@资产账户编号串#," 与 默认交易组编号串:",@默认交易组编号串#,"长度不一致！")] */
    if length(v_asset_acco_no_str)<>length(v_default_exch_group_no_str) then
        ROLLBACK;
        SET v_error_code = "pdsecuT.2.272.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号串:",v_asset_acco_no_str," 与 默认交易组编号串:",v_default_exch_group_no_str,"长度不一致！"),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号串:",v_asset_acco_no_str," 与 默认交易组编号串:",v_default_exch_group_no_str,"长度不一致！");
        end if;
        leave label_pro;
    end if;


    /* set @临时_交易组编号串#=@交易组编号串#; */
    set v_tmp_exch_group_no_str=v_exch_group_no_str;

    /* set @临时_权重串#=@权重串#; */
    set v_tmp_weight_value_str=v_weight_value_str;

    /* set @临时_申赎金额#=@申赎金额#; */
    set v_tmp_redempt_amt=v_redempt_amt;
    #记录总的份额。流水是资产账户级的，根据分配金额的比例去 记各个资产账户的份额。

    /* set @临时_申赎份额# = @申赎份额#; */
    set v_tmp_redempt_qty = v_redempt_qty;

    /* if @申赎类型# = 《申赎类型-赎回》  then */
    if v_redempt_type = 2  then

        /* set @临时_申赎份额# = -@申赎份额#; */
        set v_tmp_redempt_qty = -v_redempt_qty;
    end if;
            #先计算金额总权重

            /* set @总权重#=0; */
            set v_total_weight_value=0;
            loop_label:loop

                /* set @权重值#=substring_index(@权重串#,";",1); */
                set v_weight_value=substring_index(v_weight_value_str,";",1);

                /* set @总权重#=@权重值#+@总权重#; */
                set v_total_weight_value=v_weight_value+v_total_weight_value;

                /* set @权重串#=substring_index(@权重串#,";",-(length(@权重串#) - length(REPLACE (@权重串#,';','')))); */
                set v_weight_value_str=substring_index(v_weight_value_str,";",-(length(v_weight_value_str) - length(REPLACE (v_weight_value_str,';',''))));

                /* if @权重串#=";" then */
                if v_weight_value_str=";" then
                    leave loop_label;
                end if;
            end loop;

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@资产账户编号串#)<>0   do */
    while LOCATE(v_split_str,v_asset_acco_no_str)<>0   do

          /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1) as SIGNED); */
          set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1) as SIGNED);

          /* set @默认交易组编号#=cast(substring_index(substring(@默认交易组编号串#,locate(concat(";",@资产账户编号#,";"),@资产账户编号串#)+1),";",1) as SIGNED); */
          set v_default_exch_group_no=cast(substring_index(substring(v_default_exch_group_no_str,locate(concat(";",v_asset_acco_no,";"),v_asset_acco_no_str)+1),";",1) as SIGNED);

          /* set @变动金额#=cast(substring(@分配金额串#,1,LOCATE(@分隔符#,@分配金额串#)-1) as decimal(18,4)); */
          set v_occur_amt=cast(substring(v_dist_amt_str,1,LOCATE(v_split_str,v_dist_amt_str)-1) as decimal(18,4));

          /* set @临时_变动金额#=@变动金额#; */
          set v_tmp_occur_amt=v_occur_amt;

          /* if @申赎类型# = 《申赎类型-申购》  then */
          if v_redempt_type = 1  then

              /* 调用【原子_产品证券_资金_分配产品资金】*/
              call db_pdsecu.pra_pdseca_DistrPdCapital(
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
                  v_crncy_type,
                  v_occur_amt,
                  v_oper_remark_info,
                  v_menu_no,
                  v_error_code,
                  v_error_info,
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
                  v_update_times);
              if v_error_code = "1" then
                  SET v_error_code = "pdsecuT.2.272.999";
                  if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_分配产品资金出现错误！',v_mysql_message);
                  end if;
                  ROLLBACK;
                  leave label_pro;
              elseif v_error_code <> "0" then
                  ROLLBACK;
                  leave label_pro;
              end if;


          /* elseif @申赎类型# = 《申赎类型-赎回》  then */
          elseif v_redempt_type = 2  then

              /* 调用【原子_产品证券_资金_回收产品资金】*/
              call db_pdsecu.pra_pdseca_BackPdCapital(
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
                  v_crncy_type,
                  v_occur_amt,
                  v_oper_remark_info,
                  v_menu_no,
                  v_error_code,
                  v_error_info,
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
                  v_update_times);
              if v_error_code = "1" then
                  SET v_error_code = "pdsecuT.2.272.999";
                  if v_mysql_message <> "" then
                       SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_回收产品资金出现错误！',v_mysql_message);
                  end if;
                  ROLLBACK;
                  leave label_pro;
              elseif v_error_code <> "0" then
                  ROLLBACK;
                  leave label_pro;
              end if;

          end if;
    #根据交易组权重再去分配资金

          /* if @总权重# = 0 then */
          if v_total_weight_value = 0 then

             /* set @交易组编号#=@默认交易组编号#; */
             set v_exch_group_no=v_default_exch_group_no;

             /* set @交易组编号串#=CONCAT(@交易组编号#,";;"); */
             set v_exch_group_no_str=CONCAT(v_exch_group_no,";;");

             /* set @交易组分配金额串# = CONCAT(@变动金额#,";;"); */
             set v_exgp_dist_amt_str = CONCAT(v_occur_amt,";;");

             /* if @申赎类型# = 《申赎类型-申购》  then */
             if v_redempt_type = 1  then

                     /* 调用【原子_产品证券_资金_授权产品资金】*/
                     call db_pdsecu.pra_pdseca_AuthPdCapital(
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
                         v_crncy_type,
                         v_occur_amt,
                         v_oper_remark_info,
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
                         v_update_times);
                     if v_error_code = "1" then
                         SET v_error_code = "pdsecuT.2.272.999";
                         if v_mysql_message <> "" then
                              SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_授权产品资金出现错误！',v_mysql_message);
                         end if;
                         ROLLBACK;
                         leave label_pro;
                     elseif v_error_code <> "0" then
                         ROLLBACK;
                         leave label_pro;
                     end if;


             /* elseif @申赎类型# = 《申赎类型-赎回》  then */
             elseif v_redempt_type = 2  then

                     /* 调用【原子_产品证券_资金_回收授权产品资金】*/
                     call db_pdsecu.pra_pdseca_BackAuthPdCapital(
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
                         v_crncy_type,
                         v_occur_amt,
                         v_oper_remark_info,
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
                         v_update_times);
                     if v_error_code = "1" then
                         SET v_error_code = "pdsecuT.2.272.999";
                         if v_mysql_message <> "" then
                              SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_回收授权产品资金出现错误！',v_mysql_message);
                         end if;
                         ROLLBACK;
                         leave label_pro;
                     elseif v_error_code <> "0" then
                         ROLLBACK;
                         leave label_pro;
                     end if;

             end if;
          else

             /* set @交易组编号串#=@临时_交易组编号串#; */
             set v_exch_group_no_str=v_tmp_exch_group_no_str;

             /* set @权重串#=@临时_权重串#; */
             set v_weight_value_str=v_tmp_weight_value_str;

             /* set @交易组分配金额串# = ""; */
             set v_exgp_dist_amt_str = "";
             loop_label:loop

                  /* set @权重值#=substring_index(@权重串#,";",1); */
                  set v_weight_value=substring_index(v_weight_value_str,";",1);

                  /* set @交易组编号#=substring_index(@交易组编号串#,";",1); */
                  set v_exch_group_no=substring_index(v_exch_group_no_str,";",1);

                  /* set @权重串#=substring_index(@权重串#,";",-(length(@权重串#) - length(REPLACE (@权重串#,';','')))); */
                  set v_weight_value_str=substring_index(v_weight_value_str,";",-(length(v_weight_value_str) - length(REPLACE (v_weight_value_str,';',''))));

                  /* set @交易组编号串#=substring_index(@交易组编号串#,";",-(length(@交易组编号串#) - length(REPLACE (@交易组编号串#,';','')))); */
                  set v_exch_group_no_str=substring_index(v_exch_group_no_str,";",-(length(v_exch_group_no_str) - length(REPLACE (v_exch_group_no_str,';',''))));

                  /* if @权重值#<>0 then */
                  if v_weight_value<>0 then

                       /* set @变动金额#=round(@临时_变动金额#*@权重值#/@总权重#,2); */
                       set v_occur_amt=round(v_tmp_occur_amt*v_weight_value/v_total_weight_value,2);

                       /* set @交易组分配金额串# = CONCAT(@交易组分配金额串#,@变动金额#,";"); */
                       set v_exgp_dist_amt_str = CONCAT(v_exgp_dist_amt_str,v_occur_amt,";");

                       /* if @申赎类型# = 《申赎类型-申购》  then */
                       if v_redempt_type = 1  then

                            /* 调用【原子_产品证券_资金_授权产品资金】*/
                            call db_pdsecu.pra_pdseca_AuthPdCapital(
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
                                v_crncy_type,
                                v_occur_amt,
                                v_oper_remark_info,
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
                                v_update_times);
                            if v_error_code = "1" then
                                SET v_error_code = "pdsecuT.2.272.999";
                                if v_mysql_message <> "" then
                                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_授权产品资金出现错误！',v_mysql_message);
                                end if;
                                ROLLBACK;
                                leave label_pro;
                            elseif v_error_code <> "0" then
                                ROLLBACK;
                                leave label_pro;
                            end if;


                      /* elseif @申赎类型# = 《申赎类型-赎回》  then */
                      elseif v_redempt_type = 2  then

                            /* 调用【原子_产品证券_资金_回收授权产品资金】*/
                            call db_pdsecu.pra_pdseca_BackAuthPdCapital(
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
                                v_crncy_type,
                                v_occur_amt,
                                v_oper_remark_info,
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
                                v_update_times);
                            if v_error_code = "1" then
                                SET v_error_code = "pdsecuT.2.272.999";
                                if v_mysql_message <> "" then
                                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_回收授权产品资金出现错误！',v_mysql_message);
                                end if;
                                ROLLBACK;
                                leave label_pro;
                            elseif v_error_code <> "0" then
                                ROLLBACK;
                                leave label_pro;
                            end if;

                      end if;
                  end if;

                   /* if @权重串#=";" then */
                   if v_weight_value_str=";" then
                       leave loop_label;
                   end if;
               end loop;

            /* set @交易组编号串#=@临时_交易组编号串#; */
            set v_exch_group_no_str=v_tmp_exch_group_no_str;
          end if;

          /* set @申赎金额#=@临时_变动金额#; */
          set v_redempt_amt=v_tmp_occur_amt;

          /* set @申赎份额#=(@临时_变动金额#/@临时_申赎金额#)*@临时_申赎份额#; */
          set v_redempt_qty=(v_tmp_occur_amt/v_tmp_redempt_amt)*v_tmp_redempt_qty;
           #set @交易组编号串#=@临时_交易组编号串#;

          /* 调用【原子_产品证券_资金_新增产品申赎流水记录】*/
          call db_pdsecu.pra_pdseca_AddPdApplyJourRecord(
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
              v_redempt_type,
              v_redempt_amt,
              v_redempt_qty,
              v_exch_group_no_str,
              v_exgp_dist_amt_str,
              v_oper_remark_info,
              v_menu_no,
              v_error_code,
              v_error_info);
          if v_error_code = "1" then
              SET v_error_code = "pdsecuT.2.272.999";
              if v_mysql_message <> "" then
                   SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_新增产品申赎流水记录出现错误！',v_mysql_message);
              end if;
              ROLLBACK;
              leave label_pro;
          elseif v_error_code <> "0" then
              ROLLBACK;
              leave label_pro;
          end if;


          /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
          set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);

          /* set @分配金额串#=substring(@分配金额串#,LOCATE(@分隔符#,@分配金额串#)+1); */
          set v_dist_amt_str=substring(v_dist_amt_str,LOCATE(v_split_str,v_dist_amt_str)+1);
    end while;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 事务_产品证券_资金_根据产品查询资产账户资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryAsacCapitInfoByPd;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryAsacCapitInfoByPd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_根据产品查询资产账户资金信息】*/
    call db_pdsecu.pra_pdseca_QueryAsacCapitInfoByPd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_crncy_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.273.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_根据产品查询资产账户资金信息出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_根据产品查询交易组资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryExgpCapitInfoByPd;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryExgpCapitInfoByPd(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_crncy_type = p_crncy_type;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_根据产品查询交易组资金信息】*/
    call db_pdsecu.pra_pdseca_QueryExgpCapitInfoByPd(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
        v_pd_no,
        v_crncy_type,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.274.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_根据产品查询交易组资金信息出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_删除申赎流水回退资帐账户及交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_DelApplyJourRebackAsacAndExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_DelApplyJourRebackAsacAndExgpCapital(
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
    IN p_exch_group_no_str varchar(2048),
    IN p_exgp_dist_amt_str varchar(4096),
    IN p_record_batch_no int,
    IN p_crncy_type varchar(3),
    IN p_redempt_type int,
    IN p_redempt_amt decimal(18,4),
    IN p_redempt_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
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
    declare v_exch_group_no_str varchar(2048);
    declare v_exgp_dist_amt_str varchar(4096);
    declare v_record_batch_no int;
    declare v_crncy_type varchar(3);
    declare v_redempt_type int;
    declare v_redempt_amt decimal(18,4);
    declare v_redempt_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_occur_amt decimal(18,4);
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
    declare v_update_times int;
    declare v_split_str varchar(4);
    declare v_exch_group_no int;
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exgp_dist_amt_str = p_exgp_dist_amt_str;
    SET v_record_batch_no = p_record_batch_no;
    SET v_crncy_type = p_crncy_type;
    SET v_redempt_type = p_redempt_type;
    SET v_redempt_amt = p_redempt_amt;
    SET v_redempt_qty = p_redempt_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_occur_amt = 0;
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
    SET v_update_times = 1;
    SET v_split_str = " ";
    SET v_exch_group_no = 0;
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


    /* set @变动金额# = @申赎金额#; */
    set v_occur_amt = v_redempt_amt;

    /* if @申赎类型# = 《申赎类型-申购》  then */
    if v_redempt_type = 1  then

        /* 调用【原子_产品证券_资金_分配产品资金】*/
        call db_pdsecu.pra_pdseca_DistrPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.275.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_分配产品资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


    /* elseif @申赎类型# = 《申赎类型-赎回》  then */
    elseif v_redempt_type = 2  then

        /* 调用【原子_产品证券_资金_回收产品资金】*/
        call db_pdsecu.pra_pdseca_BackPdCapital(
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
            v_crncy_type,
            v_occur_amt,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
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
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdsecuT.2.275.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_回收产品资金出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;

    end if;

    /* set @交易组编号串#=substring(@交易组编号串#,1,length(@交易组编号串#)-1); */
    set v_exch_group_no_str=substring(v_exch_group_no_str,1,length(v_exch_group_no_str)-1);

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@交易组编号串#)<>0   do */
    while LOCATE(v_split_str,v_exch_group_no_str)<>0   do

          /* set @交易组编号#=cast(substring(@交易组编号串#,1,LOCATE(@分隔符#,@交易组编号串#)-1) as SIGNED); */
          set v_exch_group_no=cast(substring(v_exch_group_no_str,1,LOCATE(v_split_str,v_exch_group_no_str)-1) as SIGNED);

          /* set @变动金额#=cast(substring(@交易组分配金额串#,1,LOCATE(@分隔符#,@交易组分配金额串#)-1) as decimal(18,4)); */
          set v_occur_amt=cast(substring(v_exgp_dist_amt_str,1,LOCATE(v_split_str,v_exgp_dist_amt_str)-1) as decimal(18,4));

           /* if @申赎类型# = 《申赎类型-申购》  then */
           if v_redempt_type = 1  then

                  /* 调用【原子_产品证券_资金_授权产品资金】*/
                  call db_pdsecu.pra_pdseca_AuthPdCapital(
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
                      v_crncy_type,
                      v_occur_amt,
                      v_oper_remark_info,
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
                      v_update_times);
                  if v_error_code = "1" then
                      SET v_error_code = "pdsecuT.2.275.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_授权产品资金出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      leave label_pro;
                  end if;


           /* elseif @申赎类型# = 《申赎类型-赎回》  then */
           elseif v_redempt_type = 2  then

                  /* 调用【原子_产品证券_资金_回收授权产品资金】*/
                  call db_pdsecu.pra_pdseca_BackAuthPdCapital(
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
                      v_crncy_type,
                      v_occur_amt,
                      v_oper_remark_info,
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
                      v_update_times);
                  if v_error_code = "1" then
                      SET v_error_code = "pdsecuT.2.275.999";
                      if v_mysql_message <> "" then
                           SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_回收授权产品资金出现错误！',v_mysql_message);
                      end if;
                      ROLLBACK;
                      leave label_pro;
                  elseif v_error_code <> "0" then
                      ROLLBACK;
                      leave label_pro;
                  end if;

            end if;

          /* set @交易组编号串#=substring(@交易组编号串#,LOCATE(@分隔符#,@交易组编号串#)+1); */
          set v_exch_group_no_str=substring(v_exch_group_no_str,LOCATE(v_split_str,v_exch_group_no_str)+1);

          /* set @交易组分配金额串#=substring(@交易组分配金额串#,LOCATE(@分隔符#,@交易组分配金额串#)+1); */
          set v_exgp_dist_amt_str=substring(v_exgp_dist_amt_str,LOCATE(v_split_str,v_exgp_dist_amt_str)+1);
    end while;

    /* [删除表记录][产品证券_资金_产品申赎流水表][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {记录批号}=@记录批号#][3][@初始化日期#,@机构编号#,@产品编号#,@资产账户编号#,@记录批号#] */
    delete from db_pdsecu.tb_pdseca_pd_apply_jour 
        where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and record_batch_no=v_record_batch_no;
    if v_error_code = 1 then
        ROLLBACK;        
        SET v_error_code = "pdsecuT.2.275.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","记录批号=",v_record_batch_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","记录批号=",v_record_batch_no);
        end if;
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

# 事务_产品证券_资金_查询产品申赎流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryPdApplyJourRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryPdApplyJourRecord(
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
    IN p_redempt_type int,
    IN p_record_batch_no int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_redempt_type int;
    declare v_record_batch_no int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_redempt_type = p_redempt_type;
    SET v_record_batch_no = p_record_batch_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询产品申赎流水记录】*/
    call db_pdsecu.pra_pdseca_QueryPdApplyJourRecord(
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
        v_redempt_type,
        v_record_batch_no,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.276.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询产品申赎流水记录出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询产品申赎流水历史记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryPdApplyJourHisRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryPdApplyJourHisRecord(
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
    IN p_redempt_type int,
    IN p_record_batch_no int,
    IN p_begin_date int,
    IN p_end_date int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_asset_acco_no int;
    declare v_redempt_type int;
    declare v_record_batch_no int;
    declare v_begin_date int;
    declare v_end_date int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_redempt_type = p_redempt_type;
    SET v_record_batch_no = p_record_batch_no;
    SET v_begin_date = p_begin_date;
    SET v_end_date = p_end_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_co_no_rights_str = p_co_no_rights_str;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询产品申赎流水历史记录】*/
    call db_pdsecu.pra_pdseca_QueryPdApplyJourHisRecord(
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
        v_redempt_type,
        v_record_batch_no,
        v_begin_date,
        v_end_date,
        v_row_id,
        v_row_count,
        v_co_no_rights_str,
        v_pd_no_rights_str,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.277.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询产品申赎流水历史记录出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询外部转入资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QueryEntryOutAsac;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QueryEntryOutAsac(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_init_date int,
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_init_date int;
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_init_date = p_init_date;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品证券_资金_查询外部转入资产】*/
    call db_pdsecu.pra_pdseca_QueryEntryOutAsac(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pass_no,
        v_out_acco,
        v_init_date,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.778.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询外部转入资产出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_查询资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_QuerySecuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_QuerySecuCapitalDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
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
    declare v_co_no int;
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
    SET v_co_no = p_co_no;
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

    #[变量补分隔符][@机构编号串#]

    /* 调用【原子_产品证券_资金_查询资产账户内外资金差异记录】*/
    call db_pdsecu.pra_pdseca_QuerySecuCapitalDiff(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_co_no,
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
        SET v_error_code = "pdsecuT.2.779.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_查询资产账户内外资金差异记录出现错误！',v_mysql_message);
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

# 事务_产品证券_资金_运维端查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdseca_OperQueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdseca_OperQueryExgpCapital(
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
    IN p_crncy_type_str varchar(2048),
    IN p_asset_acco_no int,
    IN p_row_id bigint,
    IN p_row_count int,
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
    declare v_crncy_type_str varchar(2048);
    declare v_asset_acco_no int;
    declare v_row_id bigint;
    declare v_row_count int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

    /* set @交易组编号权限串# = ' '; */
    set v_exch_group_no_rights_str = ' ';
    end if;

    /* 调用【原子_产品证券_资金_运维端查询交易组资金】*/
    call db_pdsecu.pra_pdseca_OperQueryExgpCapital(
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
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdsecuT.2.76.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金_运维端查询交易组资金出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


