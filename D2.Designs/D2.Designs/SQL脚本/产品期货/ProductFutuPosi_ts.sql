DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_红冲蓝补交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UpdateExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UpdateExgpPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_is_change_asac_posi int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_sett_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_contrc_unit int,
    OUT p_exgp_contrc_type int,
    OUT p_exgp_lngsht_type int,
    OUT p_exgp_comb_code varchar(6),
    OUT p_exgp_hedge_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_pre_settle_price decimal(16,9),
    OUT p_exgp_sett_price decimal(16,9),
    OUT p_exgp_rece_margin decimal(18,4),
    OUT p_exch_group_update_times int,
    OUT p_asac_posi_id bigint,
    OUT p_asac_contrc_unit int,
    OUT p_asac_contrc_type int,
    OUT p_asac_lngsht_type int,
    OUT p_asac_comb_code varchar(6),
    OUT p_asac_hedge_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_pre_settle_price decimal(16,9),
    OUT p_asac_sett_price decimal(16,9),
    OUT p_asac_rece_margin decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_is_change_asac_posi int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_asac_posi_id bigint;
    declare v_asac_contrc_unit int;
    declare v_asac_contrc_type int;
    declare v_asac_lngsht_type int;
    declare v_asac_comb_code varchar(6);
    declare v_asac_hedge_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_pre_settle_price decimal(16,9);
    declare v_asac_sett_price decimal(16,9);
    declare v_asac_rece_margin decimal(18,4);
    declare v_asac_update_times int;
    declare v_futu_acco_status varchar(2);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_is_change_asac_posi = p_is_change_asac_posi;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_sett_price = p_sett_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_exch_group_update_times = 0;
    SET v_asac_posi_id = 0;
    SET v_asac_contrc_unit = 0;
    SET v_asac_contrc_type = 0;
    SET v_asac_lngsht_type = 0;
    SET v_asac_comb_code = " ";
    SET v_asac_hedge_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_pre_settle_price = 0;
    SET v_asac_sett_price = 0;
    SET v_asac_rece_margin = 0;
    SET v_asac_update_times = 0;
    SET v_futu_acco_status = "0";
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @交易编码状态# = 0; */
    set v_futu_acco_status = 0;

    /* 调用【原子_产品期货_账户_检查期货账户状态】*/
    call db_pdfutu.pra_pdfuac_CheckFutuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_futu_acco_no,
        v_exch_no,
        v_futu_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户_检查期货账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_红冲蓝补交易组持仓】*/
        call db_pdfutu.pra_pdfupo_UpdateExgpPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_sett_price,
            v_pre_settle_price,
            v_lngsht_type,
            v_hedge_type,
            v_comb_code,
            v_occur_qty,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exgp_posi_id,
            v_exgp_contrc_unit,
            v_exgp_contrc_type,
            v_exgp_lngsht_type,
            v_exgp_comb_code,
            v_exgp_hedge_type,
            v_exch_group_begin_qty,
            v_exgp_curr_qty,
            v_exgp_frozen_qty,
            v_exgp_unfroz_qty,
            v_exgp_pre_settle_price,
            v_exgp_sett_price,
            v_exgp_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_红冲蓝补交易组持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @交易组更新次数# = @更新次数#; */
        set v_exch_group_update_times = v_update_times;

        /* if @是否调整资产账户持仓# = 《是否调整资产账户持仓-是》 then */
        if v_is_change_asac_posi = 1 then

            /* 调用【原子_产品期货_持仓_红冲蓝补资产账户持仓】*/
            call db_pdfutu.pra_pdfupo_UpdateAsacPosi(
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
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_type,
                v_contrc_unit,
                v_sett_price,
                v_pre_settle_price,
                v_lngsht_type,
                v_hedge_type,
                v_comb_code,
                v_occur_qty,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info,
                v_asac_posi_id,
                v_asac_contrc_unit,
                v_asac_contrc_type,
                v_asac_lngsht_type,
                v_asac_comb_code,
                v_asac_hedge_type,
                v_asac_begin_qty,
                v_asac_curr_qty,
                v_asac_frozen_qty,
                v_asac_unfroz_qty,
                v_asac_pre_settle_price,
                v_asac_sett_price,
                v_asac_rece_margin,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.3.1.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_红冲蓝补资产账户持仓出现错误！',v_mysql_message);
                end if;
                ROLLBACK;
                leave label_pro;
            elseif v_error_code <> "0" then
                ROLLBACK;
                leave label_pro;
            end if;


            /* set @资产账户更新次数# = @更新次数#; */
            set v_asac_update_times = v_update_times;
        end if;

    /* [事务结束] */
    COMMIT;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_contrc_unit = v_exgp_contrc_unit;
    SET p_exgp_contrc_type = v_exgp_contrc_type;
    SET p_exgp_lngsht_type = v_exgp_lngsht_type;
    SET p_exgp_comb_code = v_exgp_comb_code;
    SET p_exgp_hedge_type = v_exgp_hedge_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_pre_settle_price = v_exgp_pre_settle_price;
    SET p_exgp_sett_price = v_exgp_sett_price;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_exch_group_update_times = v_exch_group_update_times;
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_contrc_unit = v_asac_contrc_unit;
    SET p_asac_contrc_type = v_asac_contrc_type;
    SET p_asac_lngsht_type = v_asac_lngsht_type;
    SET p_asac_comb_code = v_asac_comb_code;
    SET p_asac_hedge_type = v_asac_hedge_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_pre_settle_price = v_asac_pre_settle_price;
    SET p_asac_sett_price = v_asac_sett_price;
    SET p_asac_rece_margin = v_asac_rece_margin;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_FrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_FrozenExgpPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_contrc_unit int,
    OUT p_exgp_contrc_type int,
    OUT p_exgp_lngsht_type int,
    OUT p_exgp_comb_code varchar(6),
    OUT p_exgp_hedge_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_pre_settle_price decimal(16,9),
    OUT p_exgp_sett_price decimal(16,9),
    OUT p_exgp_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_冻结交易组持仓】*/
        call db_pdfutu.pra_pdfupo_FrozenExgpPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_expire_date,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exgp_posi_id,
            v_exgp_contrc_unit,
            v_exgp_contrc_type,
            v_exgp_lngsht_type,
            v_exgp_comb_code,
            v_exgp_hedge_type,
            v_exch_group_begin_qty,
            v_exgp_curr_qty,
            v_exgp_frozen_qty,
            v_exgp_unfroz_qty,
            v_exgp_pre_settle_price,
            v_exgp_sett_price,
            v_exgp_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_冻结交易组持仓出现错误！',v_mysql_message);
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
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_contrc_unit = v_exgp_contrc_unit;
    SET p_exgp_contrc_type = v_exgp_contrc_type;
    SET p_exgp_lngsht_type = v_exgp_lngsht_type;
    SET p_exgp_comb_code = v_exgp_comb_code;
    SET p_exgp_hedge_type = v_exgp_hedge_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_pre_settle_price = v_exgp_pre_settle_price;
    SET p_exgp_sett_price = v_exgp_sett_price;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_取消冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UndoFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UndoFrozenExgpPosi(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_contrc_unit int,
    OUT p_exgp_contrc_type int,
    OUT p_exgp_lngsht_type int,
    OUT p_exgp_comb_code varchar(6),
    OUT p_exgp_hedge_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_pre_settle_price decimal(16,9),
    OUT p_exgp_sett_price decimal(16,9),
    OUT p_exgp_rece_margin decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_取消冻结交易组持仓】*/
        call db_pdfutu.pra_pdfupo_UndoFrozenExgpPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_oper_remark_info,
            v_error_code,
            v_error_info,
            v_exgp_posi_id,
            v_exgp_contrc_unit,
            v_exgp_contrc_type,
            v_exgp_lngsht_type,
            v_exgp_comb_code,
            v_exgp_hedge_type,
            v_exch_group_begin_qty,
            v_exgp_curr_qty,
            v_exgp_frozen_qty,
            v_exgp_unfroz_qty,
            v_exgp_pre_settle_price,
            v_exgp_sett_price,
            v_exgp_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.3.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消冻结交易组持仓出现错误！',v_mysql_message);
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
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_contrc_unit = v_exgp_contrc_unit;
    SET p_exgp_contrc_type = v_exgp_contrc_type;
    SET p_exgp_lngsht_type = v_exgp_lngsht_type;
    SET p_exgp_comb_code = v_exgp_comb_code;
    SET p_exgp_hedge_type = v_exgp_hedge_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_pre_settle_price = v_exgp_pre_settle_price;
    SET p_exgp_sett_price = v_exgp_sett_price;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UnFrozenExgpPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_contrc_unit int,
    OUT p_exgp_contrc_type int,
    OUT p_exgp_lngsht_type int,
    OUT p_exgp_comb_code varchar(6),
    OUT p_exgp_hedge_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_pre_settle_price decimal(16,9),
    OUT p_exgp_sett_price decimal(16,9),
    OUT p_exgp_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_解冻交易组持仓】*/
        call db_pdfutu.pra_pdfupo_UnFrozenExgpPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_expire_date,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_exgp_posi_id,
            v_exgp_contrc_unit,
            v_exgp_contrc_type,
            v_exgp_lngsht_type,
            v_exgp_comb_code,
            v_exgp_hedge_type,
            v_exch_group_begin_qty,
            v_exgp_curr_qty,
            v_exgp_frozen_qty,
            v_exgp_unfroz_qty,
            v_exgp_pre_settle_price,
            v_exgp_sett_price,
            v_exgp_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_解冻交易组持仓出现错误！',v_mysql_message);
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
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_contrc_unit = v_exgp_contrc_unit;
    SET p_exgp_contrc_type = v_exgp_contrc_type;
    SET p_exgp_lngsht_type = v_exgp_lngsht_type;
    SET p_exgp_comb_code = v_exgp_comb_code;
    SET p_exgp_hedge_type = v_exgp_hedge_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_pre_settle_price = v_exgp_pre_settle_price;
    SET p_exgp_sett_price = v_exgp_sett_price;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_取消解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UndoUnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UndoUnFrozenExgpPosi(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_contrc_unit int,
    OUT p_exgp_contrc_type int,
    OUT p_exgp_lngsht_type int,
    OUT p_exgp_comb_code varchar(6),
    OUT p_exgp_hedge_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_pre_settle_price decimal(16,9),
    OUT p_exgp_sett_price decimal(16,9),
    OUT p_exgp_rece_margin decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_取消解冻交易组持仓】*/
        call db_pdfutu.pra_pdfupo_UndoUnFrozenExgpPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_oper_remark_info,
            v_error_code,
            v_error_info,
            v_exgp_posi_id,
            v_exgp_contrc_unit,
            v_exgp_contrc_type,
            v_exgp_lngsht_type,
            v_exgp_comb_code,
            v_exgp_hedge_type,
            v_exch_group_begin_qty,
            v_exgp_curr_qty,
            v_exgp_frozen_qty,
            v_exgp_unfroz_qty,
            v_exgp_pre_settle_price,
            v_exgp_sett_price,
            v_exgp_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.5.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消解冻交易组持仓出现错误！',v_mysql_message);
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
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_contrc_unit = v_exgp_contrc_unit;
    SET p_exgp_contrc_type = v_exgp_contrc_type;
    SET p_exgp_lngsht_type = v_exgp_lngsht_type;
    SET p_exgp_comb_code = v_exgp_comb_code;
    SET p_exgp_hedge_type = v_exgp_hedge_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_pre_settle_price = v_exgp_pre_settle_price;
    SET p_exgp_sett_price = v_exgp_sett_price;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryExgpPosi(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询交易组持仓】*/
    call db_pdfutu.pra_pdfupo_QueryExgpPosi(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询交易组持仓出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询历史交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryExgpPosi_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryExgpPosi_His(
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
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询历史交易组持仓】*/
    call db_pdfutu.pra_pdfupo_QueryExgpPosi_His(
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
        v_exch_group_no,
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.22.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询历史交易组持仓出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryExgpPosiJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryExgpPosiJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询交易组持仓流水】*/
    call db_pdfutu.pra_pdfupo_QueryExgpPosiJour(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.31.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询交易组持仓流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询历史交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryExgpPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryExgpPosiJour_His(
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
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询历史交易组持仓流水】*/
    call db_pdfutu.pra_pdfupo_QueryExgpPosiJour_His(
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
        v_exch_group_no,
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.32.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询历史交易组持仓流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_获取交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_GetExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_GetExgpPosiFrozenJour(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_frozen_type int,
    OUT p_jour_status varchar(2),
    OUT p_occur_qty decimal(18,2),
    OUT p_expire_date int
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_frozen_type = 0;
    SET v_jour_status = "0";
    SET v_occur_qty = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_持仓_获取交易组持仓冻结解冻流水】*/
    call db_pdfutu.pra_pdfupo_GetExgpPosiFrozenJour(
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
        v_co_no,
        v_pd_no,
        v_exch_group_no,
        v_asset_acco_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_frozen_type,
        v_jour_status,
        v_occur_qty,
        v_expire_date);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.33.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_获取交易组持仓冻结解冻流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_oper_func_code = v_oper_func_code;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_frozen_type = v_frozen_type;
    SET p_jour_status = v_jour_status;
    SET p_occur_qty = v_occur_qty;
    SET p_expire_date = v_expire_date;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_查询交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryExgpPosiFrozenJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_frozen_type int,
    IN p_jour_status varchar(2),
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
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询交易组持仓冻结解冻流水】*/
    call db_pdfutu.pra_pdfupo_QueryExgpPosiFrozenJour(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_frozen_type,
        v_jour_status,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.34.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询交易组持仓冻结解冻流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询历史交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryExgpPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryExgpPosiFrozenJour_His(
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
    IN p_exch_group_no int,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_frozen_type int,
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
    declare v_exch_group_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询历史交易组持仓冻结解冻流水】*/
    call db_pdfutu.pra_pdfupo_QueryExgpPosiFrozenJour_His(
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
        v_exch_group_no,
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_frozen_type,
        v_row_id,
        v_row_count,
        v_exch_group_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.35.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询历史交易组持仓冻结解冻流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_红冲蓝补资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UpdateAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UpdateAsacPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_sett_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_contrc_unit int,
    OUT p_asac_contrc_type int,
    OUT p_asac_lngsht_type int,
    OUT p_asac_comb_code varchar(6),
    OUT p_asac_hedge_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_pre_settle_price decimal(16,9),
    OUT p_asac_sett_price decimal(16,9),
    OUT p_asac_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_contrc_unit int;
    declare v_asac_contrc_type int;
    declare v_asac_lngsht_type int;
    declare v_asac_comb_code varchar(6);
    declare v_asac_hedge_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_pre_settle_price decimal(16,9);
    declare v_asac_sett_price decimal(16,9);
    declare v_asac_rece_margin decimal(18,4);
    declare v_update_times int;
    declare v_futu_acco_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_sett_price = p_sett_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_contrc_unit = 0;
    SET v_asac_contrc_type = 0;
    SET v_asac_lngsht_type = 0;
    SET v_asac_comb_code = " ";
    SET v_asac_hedge_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_pre_settle_price = 0;
    SET v_asac_sett_price = 0;
    SET v_asac_rece_margin = 0;
    SET v_update_times = 1;
    SET v_futu_acco_status = "0";

    
    label_pro:BEGIN
    

    /* set @交易编码状态# = 0; */
    set v_futu_acco_status = 0;

    /* 调用【原子_产品期货_账户_检查期货账户状态】*/
    call db_pdfutu.pra_pdfuac_CheckFutuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_futu_acco_no,
        v_exch_no,
        v_futu_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.51.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户_检查期货账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_红冲蓝补资产账户持仓】*/
        call db_pdfutu.pra_pdfupo_UpdateAsacPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_contrc_type,
            v_contrc_unit,
            v_sett_price,
            v_pre_settle_price,
            v_lngsht_type,
            v_hedge_type,
            v_comb_code,
            v_occur_qty,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_asac_posi_id,
            v_asac_contrc_unit,
            v_asac_contrc_type,
            v_asac_lngsht_type,
            v_asac_comb_code,
            v_asac_hedge_type,
            v_asac_begin_qty,
            v_asac_curr_qty,
            v_asac_frozen_qty,
            v_asac_unfroz_qty,
            v_asac_pre_settle_price,
            v_asac_sett_price,
            v_asac_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.51.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_红冲蓝补资产账户持仓出现错误！',v_mysql_message);
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
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_contrc_unit = v_asac_contrc_unit;
    SET p_asac_contrc_type = v_asac_contrc_type;
    SET p_asac_lngsht_type = v_asac_lngsht_type;
    SET p_asac_comb_code = v_asac_comb_code;
    SET p_asac_hedge_type = v_asac_hedge_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_pre_settle_price = v_asac_pre_settle_price;
    SET p_asac_sett_price = v_asac_sett_price;
    SET p_asac_rece_margin = v_asac_rece_margin;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_FrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_FrozenAsacPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_is_change_exch_group_posi int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_contrc_unit int,
    OUT p_asac_contrc_type int,
    OUT p_asac_lngsht_type int,
    OUT p_asac_comb_code varchar(6),
    OUT p_asac_hedge_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_pre_settle_price decimal(16,9),
    OUT p_asac_sett_price decimal(16,9),
    OUT p_asac_rece_margin decimal(18,4),
    OUT p_asac_update_times int,
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_contrc_unit int,
    OUT p_exgp_contrc_type int,
    OUT p_exgp_lngsht_type int,
    OUT p_exgp_comb_code varchar(6),
    OUT p_exgp_hedge_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_pre_settle_price decimal(16,9),
    OUT p_exgp_sett_price decimal(16,9),
    OUT p_exgp_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_is_change_exch_group_posi int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_contrc_unit int;
    declare v_asac_contrc_type int;
    declare v_asac_lngsht_type int;
    declare v_asac_comb_code varchar(6);
    declare v_asac_hedge_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_pre_settle_price decimal(16,9);
    declare v_asac_sett_price decimal(16,9);
    declare v_asac_rece_margin decimal(18,4);
    declare v_asac_update_times int;
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
    declare v_exch_group_update_times int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_posi = p_is_change_exch_group_posi;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_contrc_unit = 0;
    SET v_asac_contrc_type = 0;
    SET v_asac_lngsht_type = 0;
    SET v_asac_comb_code = " ";
    SET v_asac_hedge_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_pre_settle_price = 0;
    SET v_asac_sett_price = 0;
    SET v_asac_rece_margin = 0;
    SET v_asac_update_times = 0;
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_exch_group_update_times = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_冻结资产账户持仓】*/
        call db_pdfutu.pra_pdfupo_FrozenAsacPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_expire_date,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_asac_posi_id,
            v_asac_contrc_unit,
            v_asac_contrc_type,
            v_asac_lngsht_type,
            v_asac_comb_code,
            v_asac_hedge_type,
            v_asac_begin_qty,
            v_asac_curr_qty,
            v_asac_frozen_qty,
            v_asac_unfroz_qty,
            v_asac_pre_settle_price,
            v_asac_sett_price,
            v_asac_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.52.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_冻结资产账户持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 then */
        if v_is_change_exch_group_posi = 1 then

            /* 调用【原子_产品期货_持仓_冻结交易组持仓】*/
            call db_pdfutu.pra_pdfupo_FrozenExgpPosi(
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
                v_futu_acco_no,
                v_contrc_code_no,
                v_lngsht_type,
                v_hedge_type,
                v_occur_qty,
                v_expire_date,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info,
                v_exgp_posi_id,
                v_exgp_contrc_unit,
                v_exgp_contrc_type,
                v_exgp_lngsht_type,
                v_exgp_comb_code,
                v_exgp_hedge_type,
                v_exch_group_begin_qty,
                v_exgp_curr_qty,
                v_exgp_frozen_qty,
                v_exgp_unfroz_qty,
                v_exgp_pre_settle_price,
                v_exgp_sett_price,
                v_exgp_rece_margin,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.3.52.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_冻结交易组持仓出现错误！',v_mysql_message);
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
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_contrc_unit = v_asac_contrc_unit;
    SET p_asac_contrc_type = v_asac_contrc_type;
    SET p_asac_lngsht_type = v_asac_lngsht_type;
    SET p_asac_comb_code = v_asac_comb_code;
    SET p_asac_hedge_type = v_asac_hedge_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_pre_settle_price = v_asac_pre_settle_price;
    SET p_asac_sett_price = v_asac_sett_price;
    SET p_asac_rece_margin = v_asac_rece_margin;
    SET p_asac_update_times = v_asac_update_times;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_contrc_unit = v_exgp_contrc_unit;
    SET p_exgp_contrc_type = v_exgp_contrc_type;
    SET p_exgp_lngsht_type = v_exgp_lngsht_type;
    SET p_exgp_comb_code = v_exgp_comb_code;
    SET p_exgp_hedge_type = v_exgp_hedge_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_pre_settle_price = v_exgp_pre_settle_price;
    SET p_exgp_sett_price = v_exgp_sett_price;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_取消冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UndoFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UndoFrozenAsacPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_contrc_unit int,
    OUT p_asac_contrc_type int,
    OUT p_asac_lngsht_type int,
    OUT p_asac_comb_code varchar(6),
    OUT p_asac_hedge_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_pre_settle_price decimal(16,9),
    OUT p_asac_sett_price decimal(16,9),
    OUT p_asac_rece_margin decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_contrc_unit int;
    declare v_asac_contrc_type int;
    declare v_asac_lngsht_type int;
    declare v_asac_comb_code varchar(6);
    declare v_asac_hedge_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_pre_settle_price decimal(16,9);
    declare v_asac_sett_price decimal(16,9);
    declare v_asac_rece_margin decimal(18,4);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_contrc_unit = 0;
    SET v_asac_contrc_type = 0;
    SET v_asac_lngsht_type = 0;
    SET v_asac_comb_code = " ";
    SET v_asac_hedge_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_pre_settle_price = 0;
    SET v_asac_sett_price = 0;
    SET v_asac_rece_margin = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_取消冻结资产账户持仓】*/
        call db_pdfutu.pra_pdfupo_UndoFrozenAsacPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_asset_acco_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_oper_remark_info,
            v_error_code,
            v_error_info,
            v_asac_posi_id,
            v_asac_contrc_unit,
            v_asac_contrc_type,
            v_asac_lngsht_type,
            v_asac_comb_code,
            v_asac_hedge_type,
            v_asac_begin_qty,
            v_asac_curr_qty,
            v_asac_frozen_qty,
            v_asac_unfroz_qty,
            v_asac_pre_settle_price,
            v_asac_sett_price,
            v_asac_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.53.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消冻结资产账户持仓出现错误！',v_mysql_message);
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
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_contrc_unit = v_asac_contrc_unit;
    SET p_asac_contrc_type = v_asac_contrc_type;
    SET p_asac_lngsht_type = v_asac_lngsht_type;
    SET p_asac_comb_code = v_asac_comb_code;
    SET p_asac_hedge_type = v_asac_hedge_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_pre_settle_price = v_asac_pre_settle_price;
    SET p_asac_sett_price = v_asac_sett_price;
    SET p_asac_rece_margin = v_asac_rece_margin;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UnFrozenAsacPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_is_change_exch_group_posi int,
    IN p_exch_group_no int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_contrc_unit int,
    OUT p_asac_contrc_type int,
    OUT p_asac_lngsht_type int,
    OUT p_asac_comb_code varchar(6),
    OUT p_asac_hedge_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_pre_settle_price decimal(16,9),
    OUT p_asac_sett_price decimal(16,9),
    OUT p_asac_rece_margin decimal(18,4),
    OUT p_asac_update_times int,
    OUT p_exgp_posi_id bigint,
    OUT p_exgp_contrc_unit int,
    OUT p_exgp_contrc_type int,
    OUT p_exgp_lngsht_type int,
    OUT p_exgp_comb_code varchar(6),
    OUT p_exgp_hedge_type int,
    OUT p_exch_group_begin_qty decimal(18,2),
    OUT p_exgp_curr_qty decimal(18,2),
    OUT p_exgp_frozen_qty decimal(18,2),
    OUT p_exgp_unfroz_qty decimal(18,2),
    OUT p_exgp_pre_settle_price decimal(16,9),
    OUT p_exgp_sett_price decimal(16,9),
    OUT p_exgp_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_is_change_exch_group_posi int;
    declare v_exch_group_no int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_contrc_unit int;
    declare v_asac_contrc_type int;
    declare v_asac_lngsht_type int;
    declare v_asac_comb_code varchar(6);
    declare v_asac_hedge_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_pre_settle_price decimal(16,9);
    declare v_asac_sett_price decimal(16,9);
    declare v_asac_rece_margin decimal(18,4);
    declare v_asac_update_times int;
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
    declare v_exch_group_update_times int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_posi = p_is_change_exch_group_posi;
    SET v_exch_group_no = p_exch_group_no;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_contrc_unit = 0;
    SET v_asac_contrc_type = 0;
    SET v_asac_lngsht_type = 0;
    SET v_asac_comb_code = " ";
    SET v_asac_hedge_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_pre_settle_price = 0;
    SET v_asac_sett_price = 0;
    SET v_asac_rece_margin = 0;
    SET v_asac_update_times = 0;
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_exch_group_update_times = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_解冻资产账户持仓】*/
        call db_pdfutu.pra_pdfupo_UnFrozenAsacPosi(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_expire_date,
            v_oper_remark_info,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_asac_posi_id,
            v_asac_contrc_unit,
            v_asac_contrc_type,
            v_asac_lngsht_type,
            v_asac_comb_code,
            v_asac_hedge_type,
            v_asac_begin_qty,
            v_asac_curr_qty,
            v_asac_frozen_qty,
            v_asac_unfroz_qty,
            v_asac_pre_settle_price,
            v_asac_sett_price,
            v_asac_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.54.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_解冻资产账户持仓出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* set @资产账户更新次数# = @更新次数#; */
        set v_asac_update_times = v_update_times;

        /* if @是否调整交易组持仓# = 《是否调整交易组持仓-是》 then */
        if v_is_change_exch_group_posi = 1 then

            /* 调用【原子_产品期货_持仓_解冻交易组持仓】*/
            call db_pdfutu.pra_pdfupo_UnFrozenExgpPosi(
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
                v_futu_acco_no,
                v_contrc_code_no,
                v_lngsht_type,
                v_hedge_type,
                v_occur_qty,
                v_expire_date,
                v_oper_remark_info,
                v_menu_no,
                v_error_code,
                v_error_info,
                v_exgp_posi_id,
                v_exgp_contrc_unit,
                v_exgp_contrc_type,
                v_exgp_lngsht_type,
                v_exgp_comb_code,
                v_exgp_hedge_type,
                v_exch_group_begin_qty,
                v_exgp_curr_qty,
                v_exgp_frozen_qty,
                v_exgp_unfroz_qty,
                v_exgp_pre_settle_price,
                v_exgp_sett_price,
                v_exgp_rece_margin,
                v_update_times);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.3.54.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_解冻交易组持仓出现错误！',v_mysql_message);
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
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_contrc_unit = v_asac_contrc_unit;
    SET p_asac_contrc_type = v_asac_contrc_type;
    SET p_asac_lngsht_type = v_asac_lngsht_type;
    SET p_asac_comb_code = v_asac_comb_code;
    SET p_asac_hedge_type = v_asac_hedge_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_pre_settle_price = v_asac_pre_settle_price;
    SET p_asac_sett_price = v_asac_sett_price;
    SET p_asac_rece_margin = v_asac_rece_margin;
    SET p_asac_update_times = v_asac_update_times;
    SET p_exgp_posi_id = v_exgp_posi_id;
    SET p_exgp_contrc_unit = v_exgp_contrc_unit;
    SET p_exgp_contrc_type = v_exgp_contrc_type;
    SET p_exgp_lngsht_type = v_exgp_lngsht_type;
    SET p_exgp_comb_code = v_exgp_comb_code;
    SET p_exgp_hedge_type = v_exgp_hedge_type;
    SET p_exch_group_begin_qty = v_exch_group_begin_qty;
    SET p_exgp_curr_qty = v_exgp_curr_qty;
    SET p_exgp_frozen_qty = v_exgp_frozen_qty;
    SET p_exgp_unfroz_qty = v_exgp_unfroz_qty;
    SET p_exgp_pre_settle_price = v_exgp_pre_settle_price;
    SET p_exgp_sett_price = v_exgp_sett_price;
    SET p_exgp_rece_margin = v_exgp_rece_margin;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_取消解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UndoUnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UndoUnFrozenAsacPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_asset_acco_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_asac_posi_id bigint,
    OUT p_asac_contrc_unit int,
    OUT p_asac_contrc_type int,
    OUT p_asac_lngsht_type int,
    OUT p_asac_comb_code varchar(6),
    OUT p_asac_hedge_type int,
    OUT p_asac_begin_qty decimal(18,2),
    OUT p_asac_curr_qty decimal(18,2),
    OUT p_asac_frozen_qty decimal(18,2),
    OUT p_asac_unfroz_qty decimal(18,2),
    OUT p_asac_pre_settle_price decimal(16,9),
    OUT p_asac_sett_price decimal(16,9),
    OUT p_asac_rece_margin decimal(18,4),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_asac_posi_id bigint;
    declare v_asac_contrc_unit int;
    declare v_asac_contrc_type int;
    declare v_asac_lngsht_type int;
    declare v_asac_comb_code varchar(6);
    declare v_asac_hedge_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_pre_settle_price decimal(16,9);
    declare v_asac_sett_price decimal(16,9);
    declare v_asac_rece_margin decimal(18,4);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_asac_posi_id = 0;
    SET v_asac_contrc_unit = 0;
    SET v_asac_contrc_type = 0;
    SET v_asac_lngsht_type = 0;
    SET v_asac_comb_code = " ";
    SET v_asac_hedge_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_pre_settle_price = 0;
    SET v_asac_sett_price = 0;
    SET v_asac_rece_margin = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_取消解冻资产账户持仓】*/
        call db_pdfutu.pra_pdfupo_UndoUnFrozenAsacPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_asset_acco_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_occur_qty,
            v_oper_remark_info,
            v_error_code,
            v_error_info,
            v_asac_posi_id,
            v_asac_contrc_unit,
            v_asac_contrc_type,
            v_asac_lngsht_type,
            v_asac_comb_code,
            v_asac_hedge_type,
            v_asac_begin_qty,
            v_asac_curr_qty,
            v_asac_frozen_qty,
            v_asac_unfroz_qty,
            v_asac_pre_settle_price,
            v_asac_sett_price,
            v_asac_rece_margin,
            v_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.55.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消解冻资产账户持仓出现错误！',v_mysql_message);
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
    SET p_asac_posi_id = v_asac_posi_id;
    SET p_asac_contrc_unit = v_asac_contrc_unit;
    SET p_asac_contrc_type = v_asac_contrc_type;
    SET p_asac_lngsht_type = v_asac_lngsht_type;
    SET p_asac_comb_code = v_asac_comb_code;
    SET p_asac_hedge_type = v_asac_hedge_type;
    SET p_asac_begin_qty = v_asac_begin_qty;
    SET p_asac_curr_qty = v_asac_curr_qty;
    SET p_asac_frozen_qty = v_asac_frozen_qty;
    SET p_asac_unfroz_qty = v_asac_unfroz_qty;
    SET p_asac_pre_settle_price = v_asac_pre_settle_price;
    SET p_asac_sett_price = v_asac_sett_price;
    SET p_asac_rece_margin = v_asac_rece_margin;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryAsacPosi(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* if @操作员编号# = 99990001 then */
    if v_opor_no = 99990001 then

        /* set @机构编号# = 0; */
        set v_co_no = 0;

        /* set @产品编号权限串# = ' '; */
        set v_pd_no_rights_str = ' ';
    end if;

    /* 调用【原子_产品期货_持仓_查询资产账户持仓】*/
    call db_pdfutu.pra_pdfupo_QueryAsacPosi(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询资产账户持仓出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询历史资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryAsacPosi_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryAsacPosi_His(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询历史资产账户持仓】*/
    call db_pdfutu.pra_pdfupo_QueryAsacPosi_His(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询历史资产账户持仓出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryAsacPosiJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryAsacPosiJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询资产账户持仓流水】*/
    call db_pdfutu.pra_pdfupo_QueryAsacPosiJour(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.81.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询资产账户持仓流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询历史资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryAsacPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryAsacPosiJour_His(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询历史资产账户持仓流水】*/
    call db_pdfutu.pra_pdfupo_QueryAsacPosiJour_His(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.82.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询历史资产账户持仓流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_获取资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_GetAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_GetAsacPosiFrozenJour(
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
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_frozen_type int,
    OUT p_jour_status varchar(2),
    OUT p_occur_qty decimal(18,2),
    OUT p_expire_date int
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_frozen_type = 0;
    SET v_jour_status = "0";
    SET v_occur_qty = 0;
    SET v_expire_date = date_format(curdate(),'%Y%m%d');

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_持仓_获取资产账户持仓冻结解冻流水】*/
    call db_pdfutu.pra_pdfupo_GetAsacPosiFrozenJour(
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
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_exch_no,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_frozen_type,
        v_jour_status,
        v_occur_qty,
        v_expire_date);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.83.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_获取资产账户持仓冻结解冻流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_oper_func_code = v_oper_func_code;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_frozen_type = v_frozen_type;
    SET p_jour_status = v_jour_status;
    SET p_occur_qty = v_occur_qty;
    SET p_expire_date = v_expire_date;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓_查询资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryAsacPosiFrozenJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_frozen_type int,
    IN p_jour_status varchar(2),
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
    declare v_jour_status varchar(2);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询资产账户持仓冻结解冻流水】*/
    call db_pdfutu.pra_pdfupo_QueryAsacPosiFrozenJour(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_frozen_type,
        v_jour_status,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.84.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询资产账户持仓冻结解冻流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_查询历史资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryAsacPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryAsacPosiFrozenJour_His(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_frozen_type int,
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓_查询历史资产账户持仓冻结解冻流水】*/
    call db_pdfutu.pra_pdfupo_QueryAsacPosiFrozenJour_His(
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
        v_exch_no_str,
        v_futu_acco_no,
        v_contrc_code_no,
        v_lngsht_type,
        v_hedge_type,
        v_frozen_type,
        v_row_id,
        v_row_count,
        v_pd_no_rights_str,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.85.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询历史资产账户持仓冻结解冻流水出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_转入外部期货持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_AddOutFutuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_AddOutFutuPosi(
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
    IN p_exch_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_pre_settle_price decimal(16,9),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_out_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_pre_settle_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco varchar(16);
    declare v_futu_acco_no int;
    declare v_exch_group_no int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_out_rece_margin = p_out_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco = " ";
    SET v_futu_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* if (substring(@机构业务控制配置串#, 12, 1) = 《资产是否同步-同步资金同步持仓》 or substring(@机构业务控制配置串#, 12, 1) =《资产是否同步-不同步资金同步持仓》) then */
    if (substring(v_co_busi_config_str, 12, 1) = 1 or substring(v_co_busi_config_str, 12, 1) =4) then

        /* 调用【原子_产品期货_账户_获取持仓同步交易编码】*/
        call db_pdfutu.pra_pdfuac_GetFutuAccoBySync(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_exch_no,
            v_hedge_type,
            v_error_code,
            v_error_info,
            v_futu_acco,
            v_futu_acco_no);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.171.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户_获取持仓同步交易编码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* 调用【原子_产品期货_持仓_获取资产账户持仓可用】*/
        call db_pdfutu.pra_pdfupo_GetAsacPosiAvail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_default_exch_group_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_hedge_type,
            v_lngsht_type,
            v_error_code,
            v_error_info,
            v_exch_group_no,
            v_curr_qty,
            v_avail_qty,
            v_rece_margin);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.171.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_获取资产账户持仓可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品期货_持仓_转入外部期货持仓记录】*/
            call db_pdfutu.pra_pdfupo_AddOutFutuPosi(
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
                v_exch_no,
                v_futu_acco,
                v_futu_acco_no,
                v_contrc_code_no,
                v_contrc_code,
                v_contrc_name,
                v_contrc_type,
                v_contrc_unit,
                v_pre_settle_price,
                v_lngsht_type,
                v_hedge_type,
                v_comb_code,
                v_out_curr_qty,
                v_out_enable_qty,
                v_out_rece_margin,
                v_curr_qty,
                v_avail_qty,
                v_rece_margin,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.3.171.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_转入外部期货持仓记录出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_清除外部转入记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_ClearOutRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_ClearOutRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_资金_清除外部转入记录】*/
        call db_pdfutu.pra_pdfuca_ClearOutRecord(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_out_acco,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.172.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金_清除外部转入记录出现错误！',v_mysql_message);
            end if;
            ROLLBACK;
            leave label_pro;
        elseif v_error_code <> "0" then
            ROLLBACK;
            leave label_pro;
        end if;


        /* 调用【原子_产品期货_持仓_清除外部转入记录】*/
        call db_pdfutu.pra_pdfupo_ClearOutRecord(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_out_acco,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.172.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_清除外部转入记录出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓_处理日终到期冻结解冻
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_DealCloseFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_DealCloseFrozenUnfrozen(
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_exgp_posi_id bigint;
    declare v_exgp_contrc_unit int;
    declare v_exgp_contrc_type int;
    declare v_exgp_lngsht_type int;
    declare v_exgp_comb_code varchar(6);
    declare v_exgp_hedge_type int;
    declare v_exch_group_begin_qty decimal(18,2);
    declare v_exgp_curr_qty decimal(18,2);
    declare v_exgp_frozen_qty decimal(18,2);
    declare v_exgp_unfroz_qty decimal(18,2);
    declare v_exgp_pre_settle_price decimal(16,9);
    declare v_exgp_sett_price decimal(16,9);
    declare v_exgp_rece_margin decimal(18,4);
    declare v_update_times int;
    declare v_asac_posi_id bigint;
    declare v_asac_contrc_unit int;
    declare v_asac_contrc_type int;
    declare v_asac_lngsht_type int;
    declare v_asac_comb_code varchar(6);
    declare v_asac_hedge_type int;
    declare v_asac_begin_qty decimal(18,2);
    declare v_asac_curr_qty decimal(18,2);
    declare v_asac_frozen_qty decimal(18,2);
    declare v_asac_unfroz_qty decimal(18,2);
    declare v_asac_pre_settle_price decimal(16,9);
    declare v_asac_sett_price decimal(16,9);
    declare v_asac_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_frozen_type = 0;
    SET v_occur_qty = 0;
    SET v_oper_remark_info = " ";
    SET v_exgp_posi_id = 0;
    SET v_exgp_contrc_unit = 0;
    SET v_exgp_contrc_type = 0;
    SET v_exgp_lngsht_type = 0;
    SET v_exgp_comb_code = " ";
    SET v_exgp_hedge_type = 0;
    SET v_exch_group_begin_qty = 0;
    SET v_exgp_curr_qty = 0;
    SET v_exgp_frozen_qty = 0;
    SET v_exgp_unfroz_qty = 0;
    SET v_exgp_pre_settle_price = 0;
    SET v_exgp_sett_price = 0;
    SET v_exgp_rece_margin = 0;
    SET v_update_times = 1;
    SET v_asac_posi_id = 0;
    SET v_asac_contrc_unit = 0;
    SET v_asac_contrc_type = 0;
    SET v_asac_lngsht_type = 0;
    SET v_asac_comb_code = " ";
    SET v_asac_hedge_type = 0;
    SET v_asac_begin_qty = 0;
    SET v_asac_curr_qty = 0;
    SET v_asac_frozen_qty = 0;
    SET v_asac_unfroz_qty = 0;
    SET v_asac_pre_settle_price = 0;
    SET v_asac_sett_price = 0;
    SET v_asac_rece_margin = 0;

    
    label_pro:BEGIN
    
    #处理交易组持仓冻结解冻

    /* set @查询记录序号#=0; */
    set v_query_row_id=0;
    loop_label:loop

        /* 调用【原子_产品期货_持仓_获取日终到期交易组冻结解冻记录】*/
        call db_pdfutu.pra_pdfupo_GetCloseExgpFrozenUnfrozen(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_frozen_type,
            v_occur_qty);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* set @查询记录序号# = @记录序号#; */
            set v_query_row_id = v_row_id;

            /* [事务开始] */
            START TRANSACTION;


                /* if @冻结解冻类型#=《冻结解冻类型-冻结》 then */
                if v_frozen_type=1 then

                    /* set @操作备注#="交易组证券冻结日终冻结取消到期处理"; */
                    set v_oper_remark_info="交易组证券冻结日终冻结取消到期处理";

                    /* 调用【原子_产品期货_持仓_取消冻结交易组持仓】*/
                    call db_pdfutu.pra_pdfupo_UndoFrozenExgpPosi(
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
                        v_futu_acco_no,
                        v_contrc_code_no,
                        v_lngsht_type,
                        v_hedge_type,
                        v_occur_qty,
                        v_oper_remark_info,
                        v_error_code,
                        v_error_info,
                        v_exgp_posi_id,
                        v_exgp_contrc_unit,
                        v_exgp_contrc_type,
                        v_exgp_lngsht_type,
                        v_exgp_comb_code,
                        v_exgp_hedge_type,
                        v_exch_group_begin_qty,
                        v_exgp_curr_qty,
                        v_exgp_frozen_qty,
                        v_exgp_unfroz_qty,
                        v_exgp_pre_settle_price,
                        v_exgp_sett_price,
                        v_exgp_rece_margin,
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "pdfutuT.3.201.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消冻结交易组持仓出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* elseif @冻结解冻类型#=《冻结解冻类型-解冻》 then */
                elseif v_frozen_type=2 then

                    /* set @操作备注#="交易组证券解冻日终解冻取消到期处理"; */
                    set v_oper_remark_info="交易组证券解冻日终解冻取消到期处理";

                    /* 调用【原子_产品期货_持仓_取消解冻交易组持仓】*/
                    call db_pdfutu.pra_pdfupo_UndoUnFrozenExgpPosi(
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
                        v_futu_acco_no,
                        v_contrc_code_no,
                        v_lngsht_type,
                        v_hedge_type,
                        v_occur_qty,
                        v_oper_remark_info,
                        v_error_code,
                        v_error_info,
                        v_exgp_posi_id,
                        v_exgp_contrc_unit,
                        v_exgp_contrc_type,
                        v_exgp_lngsht_type,
                        v_exgp_comb_code,
                        v_exgp_hedge_type,
                        v_exch_group_begin_qty,
                        v_exgp_curr_qty,
                        v_exgp_frozen_qty,
                        v_exgp_unfroz_qty,
                        v_exgp_pre_settle_price,
                        v_exgp_sett_price,
                        v_exgp_rece_margin,
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "pdfutuT.3.201.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消解冻交易组持仓出现错误！',v_mysql_message);
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

        /* 调用【原子_产品期货_持仓_获取日终到期资产账户冻结解冻记录】*/
        call db_pdfutu.pra_pdfupo_GetCloseAsacFrozenUnfrozen(
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
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_frozen_type,
            v_occur_qty);

        /* if @错误编码#="0" then */
        if v_error_code="0" then

            /* set @查询记录序号# = @记录序号#; */
            set v_query_row_id = v_row_id;

            /* [事务开始] */
            START TRANSACTION;


                /* if @冻结解冻类型#=《冻结解冻类型-冻结》 then */
                if v_frozen_type=1 then

                    /* set @操作备注#="资产账户证券冻结日终冻结取消到期处理"; */
                    set v_oper_remark_info="资产账户证券冻结日终冻结取消到期处理";

                    /* 调用【原子_产品期货_持仓_取消冻结资产账户持仓】*/
                    call db_pdfutu.pra_pdfupo_UndoFrozenAsacPosi(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_row_id,
                        v_asset_acco_no,
                        v_futu_acco_no,
                        v_contrc_code_no,
                        v_lngsht_type,
                        v_hedge_type,
                        v_occur_qty,
                        v_oper_remark_info,
                        v_error_code,
                        v_error_info,
                        v_asac_posi_id,
                        v_asac_contrc_unit,
                        v_asac_contrc_type,
                        v_asac_lngsht_type,
                        v_asac_comb_code,
                        v_asac_hedge_type,
                        v_asac_begin_qty,
                        v_asac_curr_qty,
                        v_asac_frozen_qty,
                        v_asac_unfroz_qty,
                        v_asac_pre_settle_price,
                        v_asac_sett_price,
                        v_asac_rece_margin,
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "pdfutuT.3.201.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消冻结资产账户持仓出现错误！',v_mysql_message);
                        end if;
                        ROLLBACK;
                        leave label_pro;
                    elseif v_error_code <> "0" then
                        ROLLBACK;
                        leave label_pro;
                    end if;


                /* elseif @冻结解冻类型#=《冻结解冻类型-解冻》 then */
                elseif v_frozen_type=2 then

                    /* set @操作备注#="资产账户证券解冻日终解冻取消到期处理"; */
                    set v_oper_remark_info="资产账户证券解冻日终解冻取消到期处理";

                    /* 调用【原子_产品期货_持仓_取消解冻资产账户持仓】*/
                    call db_pdfutu.pra_pdfupo_UndoUnFrozenAsacPosi(
                        v_opor_co_no,
                        v_opor_no,
                        v_oper_mac,
                        v_oper_ip_addr,
                        v_oper_info,
                        v_oper_way,
                        v_func_code,
                        v_row_id,
                        v_asset_acco_no,
                        v_futu_acco_no,
                        v_contrc_code_no,
                        v_lngsht_type,
                        v_hedge_type,
                        v_occur_qty,
                        v_oper_remark_info,
                        v_error_code,
                        v_error_info,
                        v_asac_posi_id,
                        v_asac_contrc_unit,
                        v_asac_contrc_type,
                        v_asac_lngsht_type,
                        v_asac_comb_code,
                        v_asac_hedge_type,
                        v_asac_begin_qty,
                        v_asac_curr_qty,
                        v_asac_frozen_qty,
                        v_asac_unfroz_qty,
                        v_asac_pre_settle_price,
                        v_asac_sett_price,
                        v_asac_rece_margin,
                        v_update_times);
                    if v_error_code = "1" then
                        SET v_error_code = "pdfutuT.3.201.999";
                        if v_mysql_message <> "" then
                             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_取消解冻资产账户持仓出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_更新交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UpdateTrdPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UpdateTrdPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_strike_capt_qty decimal(18,2),
    IN p_marked_pandl decimal(18,4),
    IN p_posi_qty decimal(18,2),
    IN p_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_marked_pandl decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_strike_capt_qty = p_pre_strike_capt_qty;
    SET v_marked_pandl = p_marked_pandl;
    SET v_posi_qty = p_posi_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_status = "0";

    
    label_pro:BEGIN
    

    /* set @交易编码状态# = 0; */
    set v_futu_acco_status = 0;

    /* 调用【原子_产品期货_账户_检查期货账户状态】*/
    call db_pdfutu.pra_pdfuac_CheckFutuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_futu_acco_no,
        v_exch_no,
        v_futu_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.301.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户_检查期货账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_更新交易持仓】*/
        call db_pdfutu.pra_pdfupo_UpdateTrdPosi(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_pre_strike_capt_qty,
            v_marked_pandl,
            v_posi_qty,
            v_rece_margin,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.301.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_更新交易持仓出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓_更新交易库交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_UpdateTrdExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_UpdateTrdExgpPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_strike_capt_qty decimal(18,2),
    IN p_marked_pandl decimal(18,4),
    IN p_posi_qty decimal(18,2),
    IN p_rece_margin decimal(18,4),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_marked_pandl decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_futu_acco_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_strike_capt_qty = p_pre_strike_capt_qty;
    SET v_marked_pandl = p_marked_pandl;
    SET v_posi_qty = p_posi_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_acco_status = "0";

    
    label_pro:BEGIN
    

    /* set @交易编码状态# = 0; */
    set v_futu_acco_status = 0;

    /* 调用【原子_产品期货_账户_检查期货账户状态】*/
    call db_pdfutu.pra_pdfuac_CheckFutuAccoStatus(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_pd_no,
        v_asset_acco_no,
        v_futu_acco_no,
        v_exch_no,
        v_futu_acco_status,
        v_error_code,
        v_error_info,
        v_co_no);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.3.302.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户_检查期货账户状态出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;


    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_更新交易库交易组持仓】*/
        call db_pdfutu.pra_pdfupo_UpdateTrdExgpPosi(
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
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_pre_strike_capt_qty,
            v_marked_pandl,
            v_posi_qty,
            v_rece_margin,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.302.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_更新交易库交易组持仓出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓_清除外部持仓转入记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_ClearOutPosiRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_ClearOutPosiRecord(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_清除外部转入记录】*/
        call db_pdfutu.pra_pdfupo_ClearOutRecord(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_pass_no,
            v_out_acco,
            v_error_code,
            v_error_info);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.173.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_清除外部转入记录出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓_查询资产账户内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupo_QueryFutuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupo_QueryFutuPosiDiff(
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
    declare v_pd_no int;
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
    SET v_pd_no = p_pd_no;
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


    /* 调用【原子_产品期货_持仓_查询资产账户内外持仓差异记录】*/
    call db_pdfutu.pra_pdfupo_QueryFutuPosiDiff(
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
        SET v_error_code = "pdfutuT.3.86.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_查询资产账户内外持仓差异记录出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_持仓_获取机构内部期货持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepo_GetCoInFutuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepo_GetCoInFutuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_avail_qty decimal(18,2),
    OUT p_rece_margin decimal(18,4)
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓_获取机构内部期货持仓记录】*/
        call db_pdfutu.pra_pdfupo_GetCoInFutuPosi(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_init_date,
            v_co_no,
            v_query_row_id,
            v_error_code,
            v_error_info,
            v_row_id,
            v_pd_no,
            v_asset_acco_no,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_lngsht_type,
            v_hedge_type,
            v_curr_qty,
            v_avail_qty,
            v_rece_margin);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.3.87.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_获取机构内部期货持仓记录出现错误！',v_mysql_message);
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
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;
    SET p_rece_margin = v_rece_margin;

END;;


