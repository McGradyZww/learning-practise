DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓运维_获取内部期货持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdsepobk_GetInFutuPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdsepobk_GetInFutuPosi(
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
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
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


        /* 调用【原子_产品期货_持仓运维_获取内部期货持仓记录】*/
        call db_pdfutu.pra_pdfupobk_GetInFutuPosi(
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
            SET v_error_code = "pdfutuT.9.1.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_获取内部期货持仓记录出现错误！',v_mysql_message);
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
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;
    SET p_rece_margin = v_rece_margin;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓运维_转入内部期货持仓核对记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_AddInFutuPosiCkeck;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_AddInFutuPosiCkeck(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_pre_settle_price decimal(16,9),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_curr_qty decimal(18,2),
    IN p_avail_qty decimal(18,2),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_pre_settle_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_exch_no int;
    declare v_futu_acco varchar(16);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_exch_no = 0;
    SET v_futu_acco = " ";

    
    label_pro:BEGIN
    

    /* if (substring(@机构业务控制配置串#, 12, 1) =《资产是否同步-同步资金同步持仓》 or substring(@机构业务控制配置串#, 12, 1) =《资产是否同步-不同步资金同步持仓》) then */
    if (substring(v_co_busi_config_str, 12, 1) =1 or substring(v_co_busi_config_str, 12, 1) =4) then

        /* set @临时_市场编号# = @市场编号#; */
        set v_tmp_exch_no = v_exch_no;

        /* 调用【原子_产品期货_账户_获取交易编码】*/
        call db_pdfutu.pra_pdfuac_GetFutuAcco(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_futu_acco_no,
            v_error_code,
            v_error_info,
            v_exch_no,
            v_futu_acco);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.9.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_账户_获取交易编码出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* set @市场编号# = @临时_市场编号#; */
        set v_exch_no = v_tmp_exch_no;

        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品期货_持仓运维_转入内部期货持仓核对记录】*/
            call db_pdfutu.pra_pdfupobk_AddInFutuPosiCkeck(
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
                v_lngsht_type,
                v_hedge_type,
                v_comb_code,
                v_contrc_unit,
                v_pre_settle_price,
                v_curr_qty,
                v_avail_qty,
                v_rece_margin,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.9.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_转入内部期货持仓核对记录出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓运维_查询资产账户内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_QueryFutuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_QueryFutuPosiDiff(
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


    /* 调用【原子_产品期货_持仓运维_查询资产账户内外持仓差异记录】*/
    call db_pdfutu.pra_pdfupobk_QueryFutuPosiDiff(
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
        SET v_error_code = "pdfutuT.9.3.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_查询资产账户内外持仓差异记录出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓运维_处理资产账户内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_DealFutuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_DealFutuPosiDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_sync_deal_type int,
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_occur_qty decimal(18,2),
    OUT p_asset_sync_flag int,
    OUT p_acco_rece_margin_diff decimal(18,4),
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
    OUT p_exch_group_no int,
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
    declare v_row_id bigint;
    declare v_sync_deal_type int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_asset_sync_flag int;
    declare v_acco_rece_margin_diff decimal(18,4);
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
    declare v_exch_group_no int;
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

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_sync_deal_type = p_sync_deal_type;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_occur_qty = 0;
    SET v_asset_sync_flag = 0;
    SET v_acco_rece_margin_diff = 0;
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
    SET v_exch_group_no = 0;
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

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓运维_处理资产账户内外持仓差异记录】*/
        call db_pdfutu.pra_pdfupobk_DealFutuPosiDiff(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_sync_deal_type,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_asset_acco_no,
            v_out_acco,
            v_exch_no,
            v_futu_acco_no,
            v_contrc_code_no,
            v_occur_qty,
            v_asset_sync_flag,
            v_acco_rece_margin_diff,
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
            v_asac_update_times,
            v_exch_group_no,
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
            v_exch_group_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.9.4.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_处理资产账户内外持仓差异记录出现错误！',v_mysql_message);
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
    SET p_out_acco = v_out_acco;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_occur_qty = v_occur_qty;
    SET p_asset_sync_flag = v_asset_sync_flag;
    SET p_acco_rece_margin_diff = v_acco_rece_margin_diff;
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
    SET p_exch_group_no = v_exch_group_no;
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

# 事务_产品期货_持仓运维_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_QueryAsacPosi(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓运维_查询资产账户持仓】*/
    call db_pdfutu.pra_pdfupobk_QueryAsacPosi(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.9.71.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_查询资产账户持仓出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓运维_查询历史资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_QueryAsacPosi_His;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_QueryAsacPosi_His(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓运维_查询历史资产账户持仓】*/
    call db_pdfutu.pra_pdfupobk_QueryAsacPosi_His(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.9.72.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_查询历史资产账户持仓出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓运维_获取外部数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_GetOutPosiData;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_GetOutPosiData(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_row_id bigint,
    OUT p_init_date int,
    OUT p_target_co_no int,
    OUT p_target_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_futu_acco varchar(16),
    OUT p_contrc_code_no int,
    OUT p_contrc_code varchar(6),
    OUT p_contrc_name varchar(64),
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_contrc_unit int,
    OUT p_out_curr_qty decimal(18,2),
    OUT p_out_enable_qty decimal(18,2),
    OUT p_out_rece_margin decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_row_id bigint;
    declare v_init_date int;
    declare v_target_co_no int;
    declare v_target_pd_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_target_co_no = 0;
    SET v_target_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_futu_acco = " ";
    SET v_contrc_code_no = 0;
    SET v_contrc_code = " ";
    SET v_contrc_name = " ";
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_contrc_unit = 0;
    SET v_out_curr_qty = 0;
    SET v_out_enable_qty = 0;
    SET v_out_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_持仓运维_获取外部数据】*/
        call db_pdfutu.pra_pdfupobk_GetOutPosiData(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_co_no,
            v_pd_no,
            v_error_code,
            v_error_info,
            v_curr_row_id,
            v_init_date,
            v_target_co_no,
            v_target_pd_no,
            v_asset_acco_no,
            v_pass_no,
            v_out_acco,
            v_exch_no,
            v_futu_acco_no,
            v_futu_acco,
            v_contrc_code_no,
            v_contrc_code,
            v_contrc_name,
            v_lngsht_type,
            v_hedge_type,
            v_contrc_unit,
            v_out_curr_qty,
            v_out_enable_qty,
            v_out_rece_margin);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.9.8.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_获取外部数据出现错误！',v_mysql_message);
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
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_futu_acco = v_futu_acco;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_code = v_contrc_code;
    SET p_contrc_name = v_contrc_name;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_out_curr_qty = v_out_curr_qty;
    SET p_out_enable_qty = v_out_enable_qty;
    SET p_out_rece_margin = v_out_rece_margin;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_持仓运维_同步内外差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_SynchronizedDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_SynchronizedDiff(
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
    IN p_futu_acco_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code_no int,
    IN p_contrc_code varchar(6),
    IN p_contrc_name varchar(64),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_contrc_unit int,
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_out_rece_margin decimal(18,4),
    IN p_contrc_type int,
    IN p_pre_settle_price decimal(16,9),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_co_busi_config_str varchar(64);
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code_no int;
    declare v_contrc_code varchar(6);
    declare v_contrc_name varchar(64);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_contrc_unit int;
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_rece_margin decimal(18,4);
    declare v_contrc_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_comb_code varchar(6);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_code = p_contrc_code;
    SET v_contrc_name = p_contrc_name;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_out_rece_margin = p_out_rece_margin;
    SET v_contrc_type = p_contrc_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_comb_code = p_comb_code;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* if (substring(@机构业务控制配置串#, 12, 1) =《资产是否同步-同步资金同步持仓》 or substring(@机构业务控制配置串#, 12, 1) =《资产是否同步-不同步资金同步持仓》) then */
    if (substring(v_co_busi_config_str, 12, 1) =1 or substring(v_co_busi_config_str, 12, 1) =4) then

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
            SET v_error_code = "pdfutuT.9.9.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓_获取资产账户持仓可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品期货_持仓运维_同步内外差异】*/
            call db_pdfutu.pra_pdfupobk_SynchronizedDiff(
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
                SET v_error_code = "pdfutuT.9.9.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_同步内外差异出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓运维_清除外部持仓记录差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_ClearOutPosiRecordDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_ClearOutPosiRecordDiffRecord(
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


            /* 调用【原子_产品期货_持仓运维_清除外部持仓记录差异记录】*/
            call db_pdfutu.pra_pdfupobk_ClearOutPosiRecordDiffRecord(
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
                SET v_error_code = "pdfutuT.9.10.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_清除外部持仓记录差异记录出现错误！',v_mysql_message);
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

# 事务_产品期货_持仓运维_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfupobk_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfupobk_QueryExgpPosi(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [变量补分隔符][@市场编号串#] */
    set v_exch_no_str = concat(";", v_exch_no_str,";");


    /* 调用【原子_产品期货_持仓运维_查询交易组持仓】*/
    call db_pdfutu.pra_pdfupobk_QueryExgpPosi(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.9.73.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_持仓运维_查询交易组持仓出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


