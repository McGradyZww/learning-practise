DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_资金运维_查询资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_QueryFutuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_QueryFutuCapitalDiff(
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


    /* 调用【原子_产品期货_资金运维_查询资产账户内外资金差异记录】*/
    call db_pdfutu.pra_pdfucabk_QueryFutuCapitalDiff(
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
        SET v_error_code = "pdfutuT.10.1.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_查询资产账户内外资金差异记录出现错误！',v_mysql_message);
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

# 事务_产品期货_资金运维_处理资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_DealFutuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_DealFutuCapitalDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_oper_remark_info varchar(255),
    IN p_busi_config_str varchar(64),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_amt_check_diff decimal(18,4),
    OUT p_occur_amt decimal(18,4),
    OUT p_crncy_type varchar(3),
    OUT p_asset_sync_flag int,
    OUT p_asset_acco_no int,
    OUT p_act_capt_margin_diff decimal(18,4),
    OUT p_asac_cash_id bigint,
    OUT p_asac_begin_amt decimal(18,4),
    OUT p_asac_curr_amt decimal(18,4),
    OUT p_asac_capt_margin decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
    OUT p_asac_intrst_rate decimal(18,4),
    OUT p_asac_intrst_base_amt decimal(18,4),
    OUT p_asac_pre_entry_intrst_amt decimal(18,4),
    OUT p_asac_update_times int,
    OUT p_exgp_cash_id bigint,
    OUT p_exch_group_no int,
    OUT p_exgp_begin_amt decimal(18,4),
    OUT p_exgp_curr_amt decimal(18,4),
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_oper_remark_info varchar(255);
    declare v_busi_config_str varchar(64);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_amt_check_diff decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_asset_sync_flag int;
    declare v_asset_acco_no int;
    declare v_act_capt_margin_diff decimal(18,4);
    declare v_asac_cash_id bigint;
    declare v_asac_begin_amt decimal(18,4);
    declare v_asac_curr_amt decimal(18,4);
    declare v_asac_capt_margin decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_asac_update_times int;
    declare v_exgp_cash_id bigint;
    declare v_exch_group_no int;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_busi_config_str = p_busi_config_str;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_amt_check_diff = 0;
    SET v_occur_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_asset_sync_flag = 0;
    SET v_asset_acco_no = 0;
    SET v_act_capt_margin_diff = 0;
    SET v_asac_cash_id = 0;
    SET v_asac_begin_amt = 0;
    SET v_asac_curr_amt = 0;
    SET v_asac_capt_margin = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_asac_update_times = 0;
    SET v_exgp_cash_id = 0;
    SET v_exch_group_no = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_capt_margin = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* [事务开始] */
    START TRANSACTION;


        /* 调用【原子_产品期货_资金运维_处理资产账户内外资金差异记录】*/
        call db_pdfutu.pra_pdfucabk_DealFutuCapitalDiff(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_row_id,
            v_oper_remark_info,
            v_busi_config_str,
            v_menu_no,
            v_error_code,
            v_error_info,
            v_co_no,
            v_pd_no,
            v_occur_amt,
            v_crncy_type,
            v_asset_sync_flag,
            v_asset_acco_no,
            v_act_capt_margin_diff,
            v_asac_cash_id,
            v_asac_begin_amt,
            v_asac_curr_amt,
            v_asac_capt_margin,
            v_asac_frozen_amt,
            v_asac_unfroz_amt,
            v_asac_total_rece_amt,
            v_asac_total_payab_amt,
            v_asac_intrst_rate,
            v_asac_intrst_base_amt,
            v_asac_pre_entry_intrst_amt,
            v_asac_update_times,
            v_exgp_cash_id,
            v_exch_group_no,
            v_exgp_begin_amt,
            v_exgp_curr_amt,
            v_exgp_capt_margin,
            v_exgp_frozen_amt,
            v_exgp_unfroz_amt,
            v_exch_group_total_rece_amt,
            v_exch_group_total_payab_amt,
            v_exch_group_intrst_rate,
            v_exch_group_intrst_base_amt,
            v_exch_group_pre_entry_intrst_amt,
            v_exch_group_update_times);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.10.2.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_处理资产账户内外资金差异记录出现错误！',v_mysql_message);
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
    SET p_amt_check_diff = v_amt_check_diff;
    SET p_occur_amt = v_occur_amt;
    SET p_crncy_type = v_crncy_type;
    SET p_asset_sync_flag = v_asset_sync_flag;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_act_capt_margin_diff = v_act_capt_margin_diff;
    SET p_asac_cash_id = v_asac_cash_id;
    SET p_asac_begin_amt = v_asac_begin_amt;
    SET p_asac_curr_amt = v_asac_curr_amt;
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_asac_update_times = v_asac_update_times;
    SET p_exgp_cash_id = v_exgp_cash_id;
    SET p_exch_group_no = v_exch_group_no;
    SET p_exgp_begin_amt = v_exgp_begin_amt;
    SET p_exgp_curr_amt = v_exgp_curr_amt;
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_exch_group_update_times = v_exch_group_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_资金运维_计算产品期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_CalcProdFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_CalcProdFutuAsset(
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
    OUT p_futu_asset_str varchar(4096),
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
    declare v_futu_asset_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_futu_asset decimal(18,4);
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
    SET v_futu_asset_str = " ";
    SET v_crncy_type_str = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_futu_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @期货资产串# = ""; */
    set v_futu_asset_str = "";

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


                /* 调用【原子_产品期货_资金运维_计算产品期货资产】*/
                call db_pdfutu.pra_pdfucabk_CalcProdFutuAsset(
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
                    v_futu_asset,
                    v_crncy_type);
                if v_error_code = "1" then
                    SET v_error_code = "pdfutuT.10.12.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_计算产品期货资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* [事务结束] */
            COMMIT;


            /* set @期货资产串# = concat(@期货资产串#,@期货资产#,";"); */
            set v_futu_asset_str = concat(v_futu_asset_str,v_futu_asset,";");

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
    SET p_futu_asset_str = v_futu_asset_str;
    SET p_crncy_type_str = v_crncy_type_str;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_资金运维_计算交易组期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_CalcExchGroupFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_CalcExchGroupFutuAsset(
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
    OUT p_cash_asset_str varchar(4096),
    OUT p_futu_asset_str varchar(4096),
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
    declare v_cash_asset_str varchar(4096);
    declare v_futu_asset_str varchar(4096);
    declare v_crncy_type_str varchar(2048);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
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
    SET v_cash_asset_str = " ";
    SET v_futu_asset_str = " ";
    SET v_crncy_type_str = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @现金资产串# = ""; */
    set v_cash_asset_str = "";

    /* set @期货资产串# = ""; */
    set v_futu_asset_str = "";

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


                /* 调用【原子_产品期货_资金运维_计算交易组期货资产】*/
                call db_pdfutu.pra_pdfucabk_CalcExchGroupFutuAsset(
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
                    v_cash_asset,
                    v_futu_asset,
                    v_crncy_type);
                if v_error_code = "1" then
                    SET v_error_code = "pdfutuT.10.13.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_计算交易组期货资产出现错误！',v_mysql_message);
                    end if;
                    ROLLBACK;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    ROLLBACK;
                    leave label_pro;
                end if;


            /* [事务结束] */
            COMMIT;


            /* set @现金资产串# = concat(@现金资产串#,@现金资产#,";"); */
            set v_cash_asset_str = concat(v_cash_asset_str,v_cash_asset,";");

            /* set @期货资产串# = concat(@期货资产串#,@期货资产#,";"); */
            set v_futu_asset_str = concat(v_futu_asset_str,v_futu_asset,";");

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
    SET p_cash_asset_str = v_cash_asset_str;
    SET p_futu_asset_str = v_futu_asset_str;
    SET p_crncy_type_str = v_crncy_type_str;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_资金运维_清除外部资金记录差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_ClearOutCapitRecordDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_ClearOutCapitRecordDiffRecord(
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


        /* 调用【原子_产品期货_资金运维_清除外部资金记录差异记录】*/
        call db_pdfutu.pra_pdfucabk_ClearOutCapitRecordDiffRecord(
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
            SET v_error_code = "pdfutuT.10.14.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_清除外部资金记录差异记录出现错误！',v_mysql_message);
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

# 事务_产品期货_资金运维_获取外部资金账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_GetOutCapitalAsacInfo;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_GetOutCapitalAsacInfo(
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


        /* 调用【原子_产品期货_资金运维_获取外部资金账户信息】*/
        call db_pdfutu.pra_pdfucabk_GetOutCapitalAsacInfo(
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
            SET v_error_code = "pdfutuT.10.15.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_获取外部资金账户信息出现错误！',v_mysql_message);
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
use db_pdfutu;;

# 事务_产品期货_资金运维_同步内外差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_SynchronizedDiff;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_SynchronizedDiff(
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_curr_amt = 0;
    SET v_avail_amt = 0;
    SET v_capt_margin = 0;

    
    label_pro:BEGIN
    

    /* if (substring(@机构业务控制配置串#, 12, 1) =《资产是否同步-同步资金同步持仓》 or substring(@机构业务控制配置串#, 12, 1) =《资产是否同步-同步资金不同步持仓》 )then */
    if (substring(v_co_busi_config_str, 12, 1) =1 or substring(v_co_busi_config_str, 12, 1) =3 )then

        /* 调用【原子_产品期货_资金_获取资产账户资金可用】*/
        call db_pdfutu.pra_pdfuca_GetAsacCapitalAvail(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_asset_acco_no,
            v_default_exch_group_no,
            v_crncy_type,
            v_asac_busi_config_str,
            v_error_code,
            v_error_info,
            v_exch_group_no,
            v_curr_amt,
            v_avail_amt,
            v_capt_margin);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.10.16.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金_获取资产账户资金可用出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;


        /* [事务开始] */
        START TRANSACTION;


            /* 调用【原子_产品期货_资金运维_同步内外差异】*/
            call db_pdfutu.pra_pdfucabk_QSynchronizedDiff(
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
                v_capt_margin,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdfutuT.10.16.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_同步内外差异出现错误！',v_mysql_message);
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

# 事务_产品期货_资金运维_获取差异表资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_GetDiffCapitalData;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_GetDiffCapitalData(
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
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_out_acco = " ";

    
    label_pro:BEGIN
    

        /* 调用【原子_产品期货_资金运维_获取差异表资金数据】*/
        call db_pdfutu.pra_funct_pdfucabk_GetDiffCapitalData(
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
            v_pd_no,
            v_asset_acco_no,
            v_exch_group_no,
            v_out_acco);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuT.10.17.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_获取差异表资金数据出现错误！',v_mysql_message);
            end if;
            leave label_pro;
        elseif v_error_code <> "0" then
            leave label_pro;
        end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_out_acco = v_out_acco;

END;;


DELIMITER ;;
use db_pdfutu;;

# 事务_产品期货_资金运维_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_QueryExgpCapital(
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
    

    /* 调用【原子_产品期货_资金运维_查询交易组资金】*/
    call db_pdfutu.pra_pdfucabk_QueryExgpCapital(
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
        SET v_error_code = "pdfutuT.10.18.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_查询交易组资金出现错误！',v_mysql_message);
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

# 事务_产品期货_资金运维_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_QueryAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_QueryAsacCapital(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_资金运维_查询资产账户资金】*/
    call db_pdfutu.pra_pdfucabk_QueryAsacCapital(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.10.19.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_查询资产账户资金出现错误！',v_mysql_message);
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

# 事务_产品期货_资金运维_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_QueryAsacCapital_Jour(
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
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_资金运维_查询资产账户资金流水】*/
    call db_pdfutu.pra_pdfucabk_QueryAsacCapital_Jour(
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
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.10.20.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_查询资产账户资金流水出现错误！',v_mysql_message);
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

# 事务_产品期货_资金运维_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS prt_pdfucabk_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE prt_pdfucabk_QueryAsacCapital_JourHis(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
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
    declare v_query_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
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
    SET v_query_date = p_query_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* 调用【原子_产品期货_资金运维_查询历史资产账户资金流水】*/
    call db_pdfutu.pra_pdfucabk_QueryAsacCapital_JourHis(
        v_opor_co_no,
        v_opor_no,
        v_oper_mac,
        v_oper_ip_addr,
        v_oper_info,
        v_oper_way,
        v_func_code,
        v_query_date,
        v_co_no,
        v_pd_no,
        v_asset_acco_no,
        v_crncy_type_str,
        v_row_id,
        v_row_count,
        v_error_code,
        v_error_info);
    if v_error_code = "1" then
        SET v_error_code = "pdfutuT.10.21.999";
        if v_mysql_message <> "" then
             SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_资金运维_查询历史资产账户资金流水出现错误！',v_mysql_message);
        end if;
        leave label_pro;
    elseif v_error_code <> "0" then
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


