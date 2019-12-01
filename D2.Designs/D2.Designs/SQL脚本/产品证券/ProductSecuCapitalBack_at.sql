DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_查询资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QuerySecuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QuerySecuCapitalDiff(
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
    

    /* [获取表记录][产品证券_资金_内外资产账户资金差异表][字段][(@机构编号串#="; ;" or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前金额差额}<>0 or {账户可用金额差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前金额差额}=0 and {账户可用金额差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_处理资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_DealSecuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_DealSecuCapitalDiff(
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
    declare v_sync_capital_way int;
    declare v_hk_cash_avail_date_type int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_acco_curr_amt decimal(18,4);
    declare v_acco_avail_amt decimal(18,4);
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_acco_curr_amt_diff decimal(18,4);
    declare v_acco_avail_amt_diff decimal(18,4);
    declare v_sys_avail_amt_diff decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
    declare v_tmp_deal_flag int;
    declare v_tmp_remark_info varchar(255);
    declare v_tmp_oper_remark_info varchar(255);
    declare v_tmp_exch_group_no_str varchar(2048);
    declare v_tmp_weight_value_str varchar(255);
    declare v_tmp_acco_avail_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_auth_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_tmp_amt_check_diff decimal(18,4);
    declare v_tmp_acco_total_rece_amt_diff decimal(18,4);
    declare v_tmp_acco_total_payab_amt_diff decimal(18,4);
    declare v_total_weight_value decimal(18,4);
    declare v_weight_value decimal(18,4);
    declare v_dist_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_asac_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_shsz_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_sync_capital_way = 0;
    SET v_hk_cash_avail_date_type = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_acco_curr_amt = 0;
    SET v_acco_avail_amt = 0;
    SET v_out_curr_amt = 0;
    SET v_out_enable_amt = 0;
    SET v_acco_curr_amt_diff = 0;
    SET v_acco_avail_amt_diff = 0;
    SET v_sys_avail_amt_diff = 0;
    SET v_total_payab_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_out_total_payab_amt = 0;
    SET v_out_total_rece_amt = 0;
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_tmp_deal_flag = 0;
    SET v_tmp_remark_info = " ";
    SET v_tmp_oper_remark_info = " ";
    SET v_tmp_exch_group_no_str = " ";
    SET v_tmp_weight_value_str = " ";
    SET v_tmp_acco_avail_amt = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_auth_amt = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_tmp_occur_amt = 0;
    SET v_tmp_amt_check_diff = 0;
    SET v_tmp_acco_total_rece_amt_diff = 0;
    SET v_tmp_acco_total_payab_amt_diff = 0;
    SET v_total_weight_value = 0;
    SET v_weight_value = 0;
    SET v_dist_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_asac_avail_amt = 0;
    SET v_hk_avail_amt = 0;
    SET v_shsz_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* set @同步资金方式#=cast(substring(@业务控制配置串#, 20, 1) as SIGNED); */
    set v_sync_capital_way=cast(substring(v_busi_config_str, 20, 1) as SIGNED);

    /* set @港股通资金可用日期#=cast(substring(@业务控制配置串#, 21, 1) as SIGNED); */
    set v_hk_cash_avail_date_type=cast(substring(v_busi_config_str, 21, 1) as SIGNED);

    /* set @同步累计应收应付#=cast(substring(@业务控制配置串#, 26, 1) as SIGNED); */
    set v_sync_total_rece_payab=cast(substring(v_busi_config_str, 26, 1) as SIGNED);

    /* [锁定获取表记录变量][产品证券_资金_内外资产账户资金差异表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_acco_curr_amt, 
        v_acco_avail_amt, v_out_curr_amt, v_out_enable_amt, v_acco_curr_amt_diff, 
        v_acco_avail_amt_diff, v_sys_avail_amt_diff, v_total_payab_amt, v_total_rece_amt, 
        v_out_total_payab_amt, v_out_total_rece_amt, v_acco_total_payab_amt_diff, v_acco_total_rece_amt_diff, 
        v_deal_flag, v_asset_sync_flag, v_remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.10.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @临时_处理标志# = @处理标志#; */
    set v_tmp_deal_flag = v_deal_flag;

    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* set @临时_操作备注#=@操作备注#; */
    set v_tmp_oper_remark_info=v_oper_remark_info;

    /* set @临时_交易组编号串#=@交易组编号串#; */
    set v_tmp_exch_group_no_str=v_exch_group_no_str;

    /* set @临时_权重串#=@权重串#; */
    set v_tmp_weight_value_str=v_weight_value_str;

    /* set @临时_账户可用金额#=@账户可用金额#; */
    set v_tmp_acco_avail_amt=v_acco_avail_amt;

    /* [检查报错返回][@处理标志# = 《处理标志-已处理》][14][@处理标志#] */
    if v_deal_flag = 1 then
        
        SET v_error_code = "pdsecuA.10.2.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("处理标志=",v_deal_flag),"#",v_mysql_message);
        else
            SET v_error_info = concat("处理标志=",v_deal_flag);
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][@资产是否同步#=《资产是否同步-不同步资金不同步持仓》 or  @资产是否同步#=《资产是否同步-不同步资金同步持仓》] */
    if v_asset_sync_flag=2 or  v_asset_sync_flag=4 then
        leave label_pro;
    end if;


    /* if @本币币种#<>"CNY" then */
    if v_crncy_type<>"CNY" then

        /* set @处理标志# = 《处理标志-不处理》; */
        set v_deal_flag = 5;

        /* set @备注信息#="币种非人民币 !"; */
        set v_remark_info="币种非人民币 !";

        /* [更新表记录][产品证券_资金_内外资产账户资金差异表][{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdseca_asac_capit_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.2.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;

    end if;

    /* [检查正常返回][@本币币种#<>"CNY"] */
    if v_crncy_type<>"CNY" then
        leave label_pro;
    end if;


    /* set @变动金额#=@账户当前金额差额#; */
    set v_occur_amt=v_acco_curr_amt_diff;

    /* set @金额核对差额#=@账户可用金额差额#; */
    set v_amt_check_diff=v_acco_avail_amt_diff;

    /* set @处理标志# = 《处理标志-已处理》; */
    set v_deal_flag = 1;

    /* if @处理信息#=" " then */
    if v_deal_info=" " then

        /* set @备注信息#="数据已成功同步！"; */
        set v_remark_info="数据已成功同步！";
    else

        /* set @备注信息#=@处理信息#; */
        set v_remark_info=v_deal_info;
    end if;

    /* if @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
    if v_sync_total_rece_payab = 0  then

          /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");

    /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
    elseif v_sync_total_rece_payab = 1  then

          /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额","|","累计应收应付差额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额","|","累计应收应付差额");
    end if;

    /* if @变动金额# > 0 then */
    if v_occur_amt > 0 then

        /* set @业务标志#=《业务标志-同步资金蓝补》; */
        set v_busi_flag=1003004;
    else

        /* set @业务标志#=《业务标志-同步资金红冲》; */
        set v_busi_flag=1003003;
    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* if (@变动金额# <> 0 or @账户可用金额差额# <> 0 or (@变动金额#=0 and @账户可用金额差额#=0) or @账户累计应收金额差额# <> 0 or @账户累计应付金额差额# <> 0) then */
    if (v_occur_amt <> 0 or v_acco_avail_amt_diff <> 0 or (v_occur_amt=0 and v_acco_avail_amt_diff=0) or v_acco_total_rece_amt_diff <> 0 or v_acco_total_payab_amt_diff <> 0) then

        /* set @授权金额# = 0; */
        set v_auth_amt = 0;

        /* set @期初金额# = 0; */
        set v_begin_amt = 0;

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @解冻金额# = 0; */
        set v_unfroz_amt = 0;

        /* set @待交收金额# = 0; */
        set v_pre_settle_amt = 0;

        /* set @沪深可用调整金额# = 0; */
        set v_shsz_avail_change_amt = 0;

        /* set @港股通可用调整金额# = 0; */
        set v_hk_avail_change_amt = 0;

        /* set @T日当日港股买入金额#=0; */
        set v_T_hk_buy_total_amt=0;

        /* set @T日当日港股卖出金额#=0; */
        set v_T_hk_sell_total_amt=0;

        /* set @T1日当日港股买入金额#=0; */
        set v_T1_hk_buy_total_amt=0;

        /* set @T1日当日港股卖出金额#=0; */
        set v_T1_hk_sell_total_amt=0;

        /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
        if  v_sync_total_rece_payab = 0  then

             /* set @累计应收金额# = 0; */
             set v_total_rece_amt = 0;

             /* set @累计应付金额# = 0; */
             set v_total_payab_amt = 0;

        /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
        elseif v_sync_total_rece_payab = 1  then

             /* set @累计应收金额# = @账户累计应收金额差额#; */
             set v_total_rece_amt = v_acco_total_rece_amt_diff;

             /* set @累计应付金额# = @账户累计应付金额差额#; */
             set v_total_payab_amt = v_acco_total_payab_amt_diff;
        end if;

        /* set @红冲蓝补金额# = 0; */
        set v_total_change_amt = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利率# = 0; */
        set v_intrst_rate = 0;

        /* set @利息积数# = 0; */
        set v_intrst_base_amt = 0;

        /* set @待入账利息# = 0; */
        set v_pre_entry_intrst_amt = 0;

        /* set @本币币种#="CNY"; */
        set v_crncy_type="CNY";
    #记录账户总的差额，方便交易组按权重值分配

        /* set @临时_变动金额#=@变动金额#; */
        set v_tmp_occur_amt=v_occur_amt;

        /* set @临时_金额核对差额#=@金额核对差额#; */
        set v_tmp_amt_check_diff=v_amt_check_diff;

        /* set @临时_账户累计应收金额差额#=@账户累计应收金额差额#; */
        set v_tmp_acco_total_rece_amt_diff=v_acco_total_rece_amt_diff;

        /* set @临时_账户累计应付金额差额#=@账户累计应付金额差额#; */
        set v_tmp_acco_total_payab_amt_diff=v_acco_total_payab_amt_diff;

        /* if @交易组编号#<>0 then */
        if v_exch_group_no<>0 then

            /* 调用【原子_产品证券_资金运维_处理交易组资金差异记录】*/
            call db_pdsecu.pra_pdsecabk_DealExgpDiff(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_oper_remark_info,
                v_menu_no,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_exch_group_no,
                v_occur_amt,
                v_sync_capital_way,
                v_hk_cash_avail_date_type,
                v_busi_flag,
                v_amt_check_diff,
                v_acco_total_payab_amt_diff,
                v_acco_total_rece_amt_diff,
                v_sync_total_rece_payab,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.10.2.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理交易组资金差异记录出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else
            #先计算总权重

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

            /* if @总权重#=0 then */
            if v_total_weight_value=0 then

                /* set @交易组编号#=@默认交易组编号#; */
                set v_exch_group_no=v_default_exch_group_no;

                /* 调用【原子_产品证券_资金运维_处理交易组资金差异记录】*/
                call db_pdsecu.pra_pdsecabk_DealExgpDiff(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_oper_remark_info,
                    v_menu_no,
                    v_init_date,
                    v_co_no,
                    v_pd_no,
                    v_asset_acco_no,
                    v_exch_group_no,
                    v_occur_amt,
                    v_sync_capital_way,
                    v_hk_cash_avail_date_type,
                    v_busi_flag,
                    v_amt_check_diff,
                    v_acco_total_payab_amt_diff,
                    v_acco_total_rece_amt_diff,
                    v_sync_total_rece_payab,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pdsecuA.10.2.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理交易组资金差异记录出现错误！',v_mysql_message);
                    end if;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    leave label_pro;
                end if;

            else

                /* set @交易组编号串#=@临时_交易组编号串#; */
                set v_exch_group_no_str=v_tmp_exch_group_no_str;

                /* set @权重串#=@临时_权重串#; */
                set v_weight_value_str=v_tmp_weight_value_str;
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

                        /* set @金额核对差额#=round(@临时_金额核对差额#*@权重值#/@总权重#,2); */
                        set v_amt_check_diff=round(v_tmp_amt_check_diff*v_weight_value/v_total_weight_value,2);

                        /* set @账户累计应收金额差额#=round(@临时_账户累计应收金额差额#*@权重值#/@总权重#,2); */
                        set v_acco_total_rece_amt_diff=round(v_tmp_acco_total_rece_amt_diff*v_weight_value/v_total_weight_value,2);

                        /* set @账户累计应付金额差额#=round(@临时_账户累计应付金额差额#*@权重值#/@总权重#,2); */
                        set v_acco_total_payab_amt_diff=round(v_tmp_acco_total_payab_amt_diff*v_weight_value/v_total_weight_value,2);

                        /* 调用【原子_产品证券_资金运维_处理交易组资金差异记录】*/
                        call db_pdsecu.pra_pdsecabk_DealExgpDiff(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_oper_remark_info,
                            v_menu_no,
                            v_init_date,
                            v_co_no,
                            v_pd_no,
                            v_asset_acco_no,
                            v_exch_group_no,
                            v_occur_amt,
                            v_sync_capital_way,
                            v_hk_cash_avail_date_type,
                            v_busi_flag,
                            v_amt_check_diff,
                            v_acco_total_payab_amt_diff,
                            v_acco_total_rece_amt_diff,
                            v_sync_total_rece_payab,
                            v_error_code,
                            v_error_info);
                        if v_error_code = "1" then
                            SET v_error_code = "pdsecuA.10.2.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理交易组资金差异记录出现错误！',v_mysql_message);
                            end if;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            leave label_pro;
                        end if;

                    end if;

                    /* if @权重串#=";" then */
                    if v_weight_value_str=";" then
                        leave loop_label;
                    end if;
                end loop;
            end if;
        end if;

        /* set @分配金额# = 0; */
        set v_dist_amt = 0;
    #还原至账户级的差额

        /* set @变动金额#=@临时_变动金额#; */
        set v_occur_amt=v_tmp_occur_amt;

        /* set @金额核对差额#=@临时_金额核对差额#; */
        set v_amt_check_diff=v_tmp_amt_check_diff;

        /* set @账户累计应收金额差额#=@临时_账户累计应收金额差额#; */
        set v_acco_total_rece_amt_diff=v_tmp_acco_total_rece_amt_diff;

        /* set @账户累计应付金额差额#=@临时_账户累计应付金额差额#; */
        set v_acco_total_payab_amt_diff=v_tmp_acco_total_payab_amt_diff;

        /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
        if  v_sync_total_rece_payab = 0  then

            /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{红冲蓝补金额}=0][1][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                asset_acco_no, crncy_type, begin_amt, curr_amt, 
                frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
                hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
                T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
                total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
                pre_entry_intrst_amt) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
                v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, v_shsz_avail_change_amt, 
                v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, 
                v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, v_total_payab_amt, 
                v_total_change_amt, v_realize_pandl, v_intrst_rate, v_intrst_base_amt, 
                v_pre_entry_intrst_amt) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_change_amt=0;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.2.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


        /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
        elseif v_sync_total_rece_payab = 1  then

            /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{红冲蓝补金额}=0,{累计应付金额}= {累计应付金额} + @账户累计应付金额差额#,{累计应收金额}={累计应收金额}+@账户累计应收金额差额#][1][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                asset_acco_no, crncy_type, begin_amt, curr_amt, 
                frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
                hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
                T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
                total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
                pre_entry_intrst_amt) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
                v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, v_shsz_avail_change_amt, 
                v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, 
                v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, v_total_payab_amt, 
                v_total_change_amt, v_realize_pandl, v_intrst_rate, v_intrst_base_amt, 
                v_pre_entry_intrst_amt) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_change_amt=0,total_payab_amt= total_payab_amt + v_acco_total_payab_amt_diff,total_rece_amt=total_rece_amt+v_acco_total_rece_amt_diff;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.2.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;

       #累计应收应付 记2笔流水。

            /* [获取表记录变量][产品证券_资金_资产账户资金表][{累计应收金额},{累计应付金额}][@累计应收金额#,@累计应付金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
            select total_rece_amt,total_payab_amt into v_total_rece_amt,v_total_payab_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.10.2.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


            /* set @操作备注#=concat(@临时_操作备注#,"|","累计应付差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应付差额");

            /* set @变动金额#=@账户累计应付金额差额#; */
            set v_occur_amt=v_acco_total_payab_amt_diff;

            /* set @变动后金额#=@累计应付金额#; */
            set v_occur_end_amt=v_total_payab_amt;

            /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, crncy_type, busi_flag, 
                occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
                v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.2.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* set @操作备注#=concat(@临时_操作备注#,"|","累计应收差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应收差额");

            /* set @变动金额#=@账户累计应收金额差额#; */
            set v_occur_amt=v_acco_total_rece_amt_diff;

            /* set @变动后金额#=@累计应收金额#; */
            set v_occur_end_amt=v_total_rece_amt;

            /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, crncy_type, busi_flag, 
                occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
                v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.2.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

        /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
        set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");

        /* set @变动金额#=@账户当前金额差额#; */
        set v_occur_amt=v_acco_curr_amt_diff;

        /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额}+{港股通可用调整金额}+{金额核对差额},{当前金额},{当前金额},{当前金额}+{沪深可用调整金额}+{金额核对差额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数},{红冲蓝补金额}][@资产账户可用金额#,@变动后金额#,@账户当前金额#,@账户可用金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#,@红冲蓝补金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select curr_amt+hk_avail_change_amt+amt_check_diff,curr_amt,curr_amt,curr_amt+shsz_avail_change_amt+amt_check_diff,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times,total_change_amt into v_asac_avail_amt,v_occur_end_amt,v_acco_curr_amt,v_acco_avail_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times,v_total_change_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.10.2.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


         /* set @流水变动字段# = "红冲蓝补金额|"; */
         set v_jour_occur_field = "红冲蓝补金额|";

         /* set @流水后信息# = concat(@红冲蓝补金额#,"|"); */
         set v_jour_after_occur_info = concat(v_total_change_amt,"|");

        /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_asac_capit_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, crncy_type, busi_flag, 
            occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
            v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.2.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;


         /* set @流水变动字段# = " "; */
         set v_jour_occur_field = " ";

         /* set @流水后信息# = " "; */
         set v_jour_after_occur_info = " ";
        #获取交易库中的可用金额

        /* set @港股可用金额#=0; */
        set v_hk_avail_amt=0;

        /* set @沪深可用金额#=0; */
        set v_shsz_avail_amt=0;

        /* set @静态可用金额#=0; */
        set v_static_avail_amt=0;

        /* set @可用金额#=0; */
        set v_avail_amt=0;

        /* [获取表记录变量语句][产品证券_资金_交易资产账户资金表][{港股可用金额},{沪深可用金额},{静态可用金额}][@港股可用金额#,@沪深可用金额#,@静态可用金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select hk_avail_amt,shsz_avail_amt,static_avail_amt into v_hk_avail_amt,v_shsz_avail_amt,v_static_avail_amt from db_pdsecu.tb_pdseca_trd_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


        /* if @同步资金方式#=0 then */
        if v_sync_capital_way=0 then

            /* if @港股通资金可用日期#=《港股通资金可用日期-T+2日日初可用》 then */
            if v_hk_cash_avail_date_type=4 then
                #港股轧差计算

                /* set @港股可用金额#=greatest(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+@港股可用金额#; */
                set v_hk_avail_amt=greatest(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+v_hk_avail_amt;
                #A股的可用金额=产品库的可用金额+交易库的A股可用金额+港股的轧差

                /* set @可用金额#=@账户可用金额#+@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#+least(0,@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+@沪深可用金额#+LEAST(@港股可用金额#,0); */
                set v_avail_amt=v_acco_avail_amt+v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt+least(0,v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+v_shsz_avail_amt+LEAST(v_hk_avail_amt,0);

            /* elseif @港股通资金可用日期#=《港股通资金可用日期-T+2日日终可用》 then */
            elseif v_hk_cash_avail_date_type=5 then
                #港股轧差计算

                /* set @港股可用金额#=greatest(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+@港股可用金额#; */
                set v_hk_avail_amt=greatest(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+v_hk_avail_amt;
                #A股的可用金额=产品库的可用金额+交易库的A股可用金额+港股的轧差

                /* set @可用金额#=@账户可用金额#+least(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+least(0,greatest(0,@资产账户T日当日港股卖出金额#-@资产账户T日当日港股买入金额#)+@资产账户T1日当日港股卖出金额#-@资产账户T1日当日港股买入金额#)+@沪深可用金额#+LEAST(@港股可用金额#,0); */
                set v_avail_amt=v_acco_avail_amt+least(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+least(0,greatest(0,v_asac_T_hk_sell_total_amt-v_asac_T_hk_buy_total_amt)+v_asac_T1_hk_sell_total_amt-v_asac_T1_hk_buy_total_amt)+v_shsz_avail_amt+LEAST(v_hk_avail_amt,0);
            end if;

            /* set @账户可用金额#=@可用金额#; */
            set v_acco_avail_amt=v_avail_amt;
        else

            /* set @账户可用金额#=@资产账户可用金额#+@静态可用金额#; */
            set v_acco_avail_amt=v_asac_avail_amt+v_static_avail_amt;
        end if;

        /* set @操作备注#=concat(@临时_操作备注#,"|","可用金额差额"); */
        set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","可用金额差额");

        /* set @变动金额#=@金额核对差额#; */
        set v_occur_amt=v_amt_check_diff;

        /* set @变动后金额#=@账户可用金额#; */
        set v_occur_end_amt=v_acco_avail_amt;

        /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_asac_capit_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, crncy_type, busi_flag, 
            occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
            v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.2.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* set @变动金额#=@账户当前金额差额#; */
        set v_occur_amt=v_acco_curr_amt_diff;

        /* set @账户当前金额差额# = @外部当前金额# - @账户当前金额#; */
        set v_acco_curr_amt_diff = v_out_curr_amt - v_acco_curr_amt;

        /* set @账户可用金额差额# = round(@外部可用金额# - @账户可用金额#-@账户当前金额差额#,2); */
        set v_acco_avail_amt_diff = round(v_out_enable_amt - v_acco_avail_amt-v_acco_curr_amt_diff,2);
    #增加{系统可用金额差额} 不更新，留记录。
       #set @系统可用金额差额# = @外部可用金额# - @账户可用金额#;

        /* set @账户累计应收金额差额# = @外部累计应收金额# - @资产账户累计应收金额#; */
        set v_acco_total_rece_amt_diff = v_out_total_rece_amt - v_asac_total_rece_amt;

        /* set @账户累计应付金额差额# = @外部累计应付金额# - @资产账户累计应付金额#; */
        set v_acco_total_payab_amt_diff = v_out_total_payab_amt - v_asac_total_payab_amt;

        /* if @账户当前金额差额#<>0 then */
        if v_acco_curr_amt_diff<>0 then

            /* set  @处理标志# = @临时_处理标志#; */
            set  v_deal_flag = v_tmp_deal_flag;

            /* set  @备注信息# = @临时_备注信息#; */
            set  v_remark_info = v_tmp_remark_info;
        end if;
    end if;

    /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
    if  v_sync_total_rece_payab = 0  then

        /* [更新表记录][产品证券_资金_内外资产账户资金差异表][{账户当前金额}=@账户当前金额#,{账户可用金额}=@账户可用金额#,{账户当前金额差额}=@账户当前金额差额#,{账户可用金额差额}=@账户可用金额差额#,{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdseca_asac_capit_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_amt=v_acco_curr_amt,acco_avail_amt=v_acco_avail_amt,acco_curr_amt_diff=v_acco_curr_amt_diff,acco_avail_amt_diff=v_acco_avail_amt_diff,deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.2.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;


    /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
    elseif v_sync_total_rece_payab = 1  then

        /* [更新表记录][产品证券_资金_内外资产账户资金差异表][{账户当前金额}=@账户当前金额#,{账户可用金额}=@账户可用金额#,{账户当前金额差额}=@账户当前金额差额#,{账户可用金额差额}=@账户可用金额差额#,{累计应付金额}=@资产账户累计应付金额#,{累计应收金额}=@资产账户累计应收金额#,{账户累计应收金额差额}=@账户累计应收金额差额#,{账户累计应付金额差额}=@账户累计应付金额差额#,{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdseca_asac_capit_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_amt=v_acco_curr_amt,acco_avail_amt=v_acco_avail_amt,acco_curr_amt_diff=v_acco_curr_amt_diff,acco_avail_amt_diff=v_acco_avail_amt_diff,total_payab_amt=v_asac_total_payab_amt,total_rece_amt=v_asac_total_rece_amt,acco_total_rece_amt_diff=v_acco_total_rece_amt_diff,acco_total_payab_amt_diff=v_acco_total_payab_amt_diff,deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.2.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;

    end if;
    #把资产账户级的差额 返回给产品级。

    /* set @账户累计应收金额差额#=@临时_账户累计应收金额差额#; */
    set v_acco_total_rece_amt_diff=v_tmp_acco_total_rece_amt_diff;

    /* set @账户累计应付金额差额#=@临时_账户累计应付金额差额#; */
    set v_acco_total_payab_amt_diff=v_tmp_acco_total_payab_amt_diff;
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

# 原子_产品证券_资金运维_转入估值外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_AddEvaluOutCash;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_AddEvaluOutCash(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_资金_估值外部资产账户资金表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#, {外部冻结金额}=@外部冻结金额#, {外部解冻金额}=@外部解冻金额#][1][@初始化日期#,@通道编号#,@外部账号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_evalu_out_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        crncy_type, out_curr_amt, out_enable_amt, out_frozen_amt, 
        out_unfroz_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_crncy_type, v_out_curr_amt, v_out_enable_amt, v_out_frozen_amt, 
        v_out_unfroz_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt, out_frozen_amt=v_out_frozen_amt, out_unfroz_amt=v_out_unfroz_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.10.3.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_查询估值外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QueryEvaluOutCash;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QueryEvaluOutCash(
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
    

    /* [获取表全记录][产品证券_资金_估值外部资产账户资金表][字段][{初始化日期}=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0)] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt from db_pdsecu.tb_pdseca_evalu_out_asac_capit where init_date=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0);

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_查询外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QueryOutCash;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QueryOutCash(
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
    

    /* [获取表全记录][产品证券_资金_外部资产账户资金表][字段][@初始化日期#>={初始化日期} and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and {资产账户编号}>0 and ({本币币种}="CNY" or {本币币种}="HKD")] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt, out_total_payab_amt, out_total_rece_amt from db_pdsecu.tb_pdseca_out_asac_capit where v_init_date>=init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and asset_acco_no>0 and (crncy_type="CNY" or crncy_type="HKD");

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_同步内外差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QSynchronizedDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QSynchronizedDiff(
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
    IN p_asac_busi_config_str varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_avail_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_pboc_rate decimal(18,12),
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
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_avail_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_pboc_rate decimal(18,12);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
    declare v_sync_hk_capital int;
    declare v_tmp_out_curr_amt decimal(18,4);
    declare v_tmp_out_enable_amt decimal(18,4);
    declare v_sync_total_rece_payab int;
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_remark_info varchar(255);
    declare v_acco_curr_amt decimal(18,4);
    declare v_acco_avail_amt decimal(18,4);
    declare v_sys_avail_amt_diff decimal(18,4);
    declare v_acco_curr_amt_diff decimal(18,4);
    declare v_acco_avail_amt_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
    declare v_acco_total_rece_amt_diff decimal(18,4);

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
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_avail_amt = p_avail_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_pboc_rate = p_pboc_rate;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_out_curr_amt = 0;
    SET v_out_enable_amt = 0;
    SET v_out_frozen_amt = 0;
    SET v_out_unfroz_amt = 0;
    SET v_out_total_payab_amt = 0;
    SET v_out_total_rece_amt = 0;
    SET v_sync_hk_capital = 0;
    SET v_tmp_out_curr_amt = 0;
    SET v_tmp_out_enable_amt = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_remark_info = " ";
    SET v_acco_curr_amt = 0;
    SET v_acco_avail_amt = 0;
    SET v_sys_avail_amt_diff = 0;
    SET v_acco_curr_amt_diff = 0;
    SET v_acco_avail_amt_diff = 0;
    SET v_acco_total_payab_amt_diff = 0;
    SET v_acco_total_rece_amt_diff = 0;

    
    label_pro:BEGIN
    

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_资金_外部资产账户资金表][字段][字段变量][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {本币币种}=@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt, out_total_payab_amt, out_total_rece_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_out_curr_amt, v_out_enable_amt, 
        v_out_frozen_amt, v_out_unfroz_amt, v_out_total_payab_amt, v_out_total_rece_amt from db_pdsecu.tb_pdseca_out_asac_capit where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and crncy_type=v_crncy_type limit 1;


    /* if @记录序号#>0  then */
    if v_row_id>0  then

      /* [检查正常返回][(@外部当前金额#+@外部可用金额#+@外部冻结金额#+@外部解冻金额#)=0] */
      if (v_out_curr_amt+v_out_enable_amt+v_out_frozen_amt+v_out_unfroz_amt)=0 then
          leave label_pro;
      end if;

    end if;

    /* set @同步港股资金#=cast(substring(@资产账户业务控制配置串#, 27, 1) as SIGNED); */
    set v_sync_hk_capital=cast(substring(v_asac_busi_config_str, 27, 1) as SIGNED);
    #拦住不需要同步的港股资金

      /* [检查正常返回][@同步港股资金# = 《同步港股资金-不同步》 and @本币币种# = "HKD"] */
      if v_sync_hk_capital = 0 and v_crncy_type = "HKD" then
          leave label_pro;
      end if;


    /* if @同步港股资金# = 《同步港股资金-同步》 then */
    if v_sync_hk_capital = 1 then
       #将同一账户下 不同币种的资金进行累计。

       /* set @临时_外部当前金额# = 0; */
       set v_tmp_out_curr_amt = 0;

       /* set @临时_外部可用金额# = 0; */
       set v_tmp_out_enable_amt = 0;
       #set @临时_外部累计应付金额# = 0;
       #set @临时_外部累计应收金额# = 0;

      /* [检查报错返回][@中国人行汇率#=0 and @本币币种# ="HKD"][1][concat("中国人行汇率不能为0！")] */
      if v_pboc_rate=0 and v_crncy_type ="HKD" then
          
          SET v_error_code = "pdsecuA.10.6.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("中国人行汇率不能为0！"),"#",v_mysql_message);
          else
              SET v_error_info = concat("中国人行汇率不能为0！");
          end if;
          leave label_pro;
      end if;


       /* [声明游标][产品证券_资金_外部资产账户资金表][{本币币种},{外部当前金额},{外部可用金额},{外部累计应付金额},{外部累计应收金额}][{机构编号} = @机构编号# and {初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# ][cursor_outasac] */
       cursor_outasac:BEGIN
       DECLARE v_cursor_done int default false;
       DECLARE cursor_outasac CURSOR FOR
           select crncy_type,out_curr_amt,out_enable_amt,out_total_payab_amt,out_total_rece_amt 
           from db_pdsecu.tb_pdseca_out_asac_capit 
           where co_no = v_co_no and init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco ;
       DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


       /* [打开游标][@本币币种#,@外部当前金额#,@外部可用金额#,@外部累计应付金额#,@外部累计应收金额#][cursor_outasac][loop_outasac] */
       open cursor_outasac;
       loop_outasac: LOOP
       fetch cursor_outasac into v_crncy_type,v_out_curr_amt,v_out_enable_amt,v_out_total_payab_amt,v_out_total_rece_amt;
           IF v_cursor_done THEN
               LEAVE loop_outasac;
           END IF;


            /* if @本币币种# = "CNY"  then */
            if v_crncy_type = "CNY"  then

                /* set @临时_外部当前金额# = @临时_外部当前金额# + @外部当前金额#; */
                set v_tmp_out_curr_amt = v_tmp_out_curr_amt + v_out_curr_amt;

                /* set @临时_外部可用金额# = @临时_外部可用金额# + @外部可用金额#; */
                set v_tmp_out_enable_amt = v_tmp_out_enable_amt + v_out_enable_amt;
                #set @临时_外部累计应付金额# = @临时_外部累计应付金额# + @外部累计应付金额#;
                #set @临时_外部累计应收金额# = @临时_外部累计应收金额# + @外部累计应收金额#;

           /* elseif @本币币种# = "HKD"  then */
           elseif v_crncy_type = "HKD"  then

                /* set @临时_外部当前金额# = @临时_外部当前金额# + @外部当前金额#* @中国人行汇率#; */
                set v_tmp_out_curr_amt = v_tmp_out_curr_amt + v_out_curr_amt* v_pboc_rate;

                /* set @临时_外部可用金额# = @临时_外部可用金额# + @外部可用金额#* @中国人行汇率#; */
                set v_tmp_out_enable_amt = v_tmp_out_enable_amt + v_out_enable_amt* v_pboc_rate;
                #set @临时_外部累计应付金额# = @临时_外部累计应付金额# + @外部累计应付金额#* @中国人行汇率#;
                #set @临时_外部累计应收金额# = @临时_外部累计应收金额# + @外部累计应收金额#* @中国人行汇率#;
            end if;

        /* [关闭游标][cursor_outasac] */
            IF v_cursor_done THEN
                set v_cursor_done = false;
            END IF;
        END LOOP;
        close cursor_outasac;
        end cursor_outasac;


        /* set @外部当前金额# = @临时_外部当前金额# ; */
        set v_out_curr_amt = v_tmp_out_curr_amt ;

        /* set @外部可用金额# = @临时_外部可用金额# ; */
        set v_out_enable_amt = v_tmp_out_enable_amt ;
        #set @外部累计应付金额# = @临时_外部累计应付金额#;
        #set @外部累计应收金额# = @临时_外部累计应收金额#;
    end if;

    /* set @同步累计应收应付#=cast(substring(@资产账户业务控制配置串#, 26, 1) as SIGNED); */
    set v_sync_total_rece_payab=cast(substring(v_asac_busi_config_str, 26, 1) as SIGNED);

    /* if @本币币种# = "HKD" and @同步港股资金# = 《同步港股资金-同步》  then */
    if v_crncy_type = "HKD" and v_sync_hk_capital = 1  then

        /* set @本币币种# = "CNY"; */
        set v_crncy_type = "CNY";
    end if;

    /* if @外部当前金额#=0 then */
    if v_out_curr_amt=0 then

      /* set @处理标志# = 《处理标志-内部数据》; */
      set v_deal_flag = 3;
    else

      /* set @处理标志# = 《处理标志-未处理》; */
      set v_deal_flag = 2;
    end if;

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* set @备注信息# = "外部数据转入"; */
    set v_remark_info = "外部数据转入";

    /* set @账户当前金额# = @当前金额#; */
    set v_acco_curr_amt = v_curr_amt;

    /* set @账户可用金额# = @可用金额#; */
    set v_acco_avail_amt = v_avail_amt;

    /* set @系统可用金额差额#=@外部可用金额#-@账户可用金额#; */
    set v_sys_avail_amt_diff=v_out_enable_amt-v_acco_avail_amt;

    /* set @账户当前金额差额#=@外部当前金额# - @账户当前金额#; */
    set v_acco_curr_amt_diff=v_out_curr_amt - v_acco_curr_amt;

    /* set @账户可用金额差额#=@外部可用金额# - @账户可用金额#-@账户当前金额差额#; */
    set v_acco_avail_amt_diff=v_out_enable_amt - v_acco_avail_amt-v_acco_curr_amt_diff;
    #if @同步累计应收应付# = 《同步累计应收应付-不同步》  then

        /* set @账户累计应付金额差额#=0; */
        set v_acco_total_payab_amt_diff=0;

        /* set @账户累计应收金额差额#=0; */
        set v_acco_total_rece_amt_diff=0;
    #elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then
       #  set @账户累计应付金额差额#=@外部累计应付金额# - @累计应付金额#;
      #   set @账户累计应收金额差额#=@外部累计应收金额# - @累计应收金额#;
    #end if;
    #暂不考虑盘中同步交易库数据时 处理 累计应收应付。

    /* [插入重复更新][产品证券_资金_内外资产账户资金差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {账户当前金额}=@账户当前金额#, {账户可用金额}=@账户可用金额#,{外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#,  {系统可用金额差额}=@系统可用金额差额#,{账户当前金额差额}=@账户当前金额差额#, {账户可用金额差额}=@账户可用金额差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, crncy_type, acco_curr_amt, acco_avail_amt, 
        out_curr_amt, out_enable_amt, acco_curr_amt_diff, acco_avail_amt_diff, 
        sys_avail_amt_diff, total_payab_amt, total_rece_amt, out_total_payab_amt, 
        out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, deal_flag, 
        asset_sync_flag, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_acco_curr_amt, v_acco_avail_amt, 
        v_out_curr_amt, v_out_enable_amt, v_acco_curr_amt_diff, v_acco_avail_amt_diff, 
        v_sys_avail_amt_diff, v_total_payab_amt, v_total_rece_amt, v_out_total_payab_amt, 
        v_out_total_rece_amt, v_acco_total_payab_amt_diff, v_acco_total_rece_amt_diff, v_deal_flag, 
        v_asset_sync_flag, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, acco_curr_amt=v_acco_curr_amt, acco_avail_amt=v_acco_avail_amt,out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt,  sys_avail_amt_diff=v_sys_avail_amt_diff,acco_curr_amt_diff=v_acco_curr_amt_diff, acco_avail_amt_diff=v_acco_avail_amt_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.10.6.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_获取外部资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_GetOutCapitalData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_GetOutCapitalData(
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
    declare v_tmp_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
    declare v_tmp_out_curr_amt decimal(18,4);
    declare v_tmp_out_enable_amt decimal(18,4);
    declare v_tmp_out_total_payab_amt decimal(18,4);
    declare v_tmp_out_total_rece_amt decimal(18,4);
    declare v_sync_hk_capital int;

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
    SET v_tmp_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_out_frozen_amt = 0;
    SET v_out_unfroz_amt = 0;
    SET v_tmp_out_curr_amt = 0;
    SET v_tmp_out_enable_amt = 0;
    SET v_tmp_out_total_payab_amt = 0;
    SET v_tmp_out_total_rece_amt = 0;
    SET v_sync_hk_capital = 0;

    
    label_pro:BEGIN
    

    /* set @临时_记录序号#=@记录序号#; */
    set v_tmp_row_id=v_row_id;

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_资金_外部资产账户资金表][字段][字段变量][{初始化日期}<>0 and {通道编号}<>0 and {外部账号}<>" " and ({本币币种}="CNY" or {本币币种}="HKD")and ({机构编号}=@机构编号# or @机构编号#=0) and ({产品编号}=@产品编号# or @产品编号#=0) and {记录序号}>@临时_记录序号# order by {记录序号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt, out_total_payab_amt, out_total_rece_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_out_curr_amt, v_out_enable_amt, 
        v_out_frozen_amt, v_out_unfroz_amt, v_out_total_payab_amt, v_out_total_rece_amt from db_pdsecu.tb_pdseca_out_asac_capit where init_date<>0 and pass_no<>0 and out_acco<>" " and (crncy_type="CNY" or crncy_type="HKD")and (co_no=v_co_no or v_co_no=0) and (pd_no=v_pd_no or v_pd_no=0) and row_id>v_tmp_row_id order by row_id limit 1;


    /* if @记录序号#>0  then */
    if v_row_id>0  then

      /* [检查正常返回][(@外部当前金额#+@外部可用金额#+@外部冻结金额#+@外部解冻金额#)=0] */
      if (v_out_curr_amt+v_out_enable_amt+v_out_frozen_amt+v_out_unfroz_amt)=0 then
          leave label_pro;
      end if;

    end if;
    #将同一账户下 不同币种的资金进行累计。

    /* set @临时_外部当前金额# = 0; */
    set v_tmp_out_curr_amt = 0;

    /* set @临时_外部可用金额# = 0; */
    set v_tmp_out_enable_amt = 0;

    /* set @临时_外部累计应付金额# = 0; */
    set v_tmp_out_total_payab_amt = 0;

    /* set @临时_外部累计应收金额# = 0; */
    set v_tmp_out_total_rece_amt = 0;

    /* [声明游标][产品证券_资金_外部资产账户资金表][{本币币种},{外部当前金额},{外部可用金额},{外部累计应付金额},{外部累计应收金额}][{机构编号} = @机构编号# and {初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# ][cursor_outasac] */
    cursor_outasac:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_outasac CURSOR FOR
        select crncy_type,out_curr_amt,out_enable_amt,out_total_payab_amt,out_total_rece_amt 
        from db_pdsecu.tb_pdseca_out_asac_capit 
        where co_no = v_co_no and init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco ;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][@本币币种#,@外部当前金额#,@外部可用金额#,@外部累计应付金额#,@外部累计应收金额#][cursor_outasac][loop_outasac] */
    open cursor_outasac;
    loop_outasac: LOOP
    fetch cursor_outasac into v_crncy_type,v_out_curr_amt,v_out_enable_amt,v_out_total_payab_amt,v_out_total_rece_amt;
        IF v_cursor_done THEN
            LEAVE loop_outasac;
        END IF;


        /* if @本币币种# = "CNY"  then */
        if v_crncy_type = "CNY"  then

            /* set @临时_外部当前金额# = @临时_外部当前金额# + @外部当前金额#; */
            set v_tmp_out_curr_amt = v_tmp_out_curr_amt + v_out_curr_amt;

            /* set @临时_外部可用金额# = @临时_外部可用金额# + @外部可用金额#; */
            set v_tmp_out_enable_amt = v_tmp_out_enable_amt + v_out_enable_amt;

            /* set @临时_外部累计应付金额# = @临时_外部累计应付金额# + @外部累计应付金额#; */
            set v_tmp_out_total_payab_amt = v_tmp_out_total_payab_amt + v_out_total_payab_amt;

            /* set @临时_外部累计应收金额# = @临时_外部累计应收金额# + @外部累计应收金额#; */
            set v_tmp_out_total_rece_amt = v_tmp_out_total_rece_amt + v_out_total_rece_amt;

        /* elseif @本币币种# = "HKD"  then */
        elseif v_crncy_type = "HKD"  then

            /* if @同步港股资金# = 《同步港股资金-同步》 then */
            if v_sync_hk_capital = 1 then

               /* set @临时_外部当前金额# = @临时_外部当前金额# + @外部当前金额#* @汇率#; */
               set v_tmp_out_curr_amt = v_tmp_out_curr_amt + v_out_curr_amt* v_exch_rate;

               /* set @临时_外部可用金额# = @临时_外部可用金额# + @外部可用金额#* @汇率#; */
               set v_tmp_out_enable_amt = v_tmp_out_enable_amt + v_out_enable_amt* v_exch_rate;

               /* set @临时_外部累计应付金额# = @临时_外部累计应付金额# + @外部累计应付金额#* @汇率#; */
               set v_tmp_out_total_payab_amt = v_tmp_out_total_payab_amt + v_out_total_payab_amt* v_exch_rate;

               /* set @临时_外部累计应收金额# = @临时_外部累计应收金额# + @外部累计应收金额#* @汇率#; */
               set v_tmp_out_total_rece_amt = v_tmp_out_total_rece_amt + v_out_total_rece_amt* v_exch_rate;
            end if;
        end if;

    /* [关闭游标][cursor_outasac] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_outasac;
    end cursor_outasac;


    /* set @外部当前金额# = @临时_外部当前金额# ; */
    set v_out_curr_amt = v_tmp_out_curr_amt ;

    /* set @外部可用金额# = @临时_外部可用金额# ; */
    set v_out_enable_amt = v_tmp_out_enable_amt ;

    /* set @外部累计应付金额# = @临时_外部累计应付金额#; */
    set v_out_total_payab_amt = v_tmp_out_total_payab_amt;

    /* set @外部累计应收金额# = @临时_外部累计应收金额#; */
    set v_out_total_rece_amt = v_tmp_out_total_rece_amt;

    /* set @目标机构编号#=@机构编号#; */
    set v_target_co_no=v_co_no;

    /* set @目标产品编号#=@产品编号#; */
    set v_target_pd_no=v_pd_no;

    /* set @当前记录序号#=@记录序号#; */
    set v_curr_row_id=v_row_id;
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

# 原子_产品证券_资金运维_清除外部资金记录差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_ClearOutCapitRecordDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_ClearOutCapitRecordDiffRecord(
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
    

    /* [删除表记录][产品证券_资金_外部资产账户资金表][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and {资产账户编号}<>0 and {初始化日期}<>0 and {本币币种}<>" "][3][@机构编号#,@产品编号#] */
    delete from db_pdsecu.tb_pdseca_out_asac_capit 
        where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and asset_acco_no<>0 and init_date<>0 and crncy_type<>" ";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.10.8.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_内外资产账户资金差异表][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and {本币币种}<>" " and {初始化日期}<>0][3][@机构编号#,@产品编号#] */
    delete from db_pdsecu.tb_pdseca_asac_capit_diff 
        where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and crncy_type<>" " and init_date<>0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.10.8.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_获取差异表资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_GetDiffCapitalData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_GetDiffCapitalData(
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
    

    /* [获取表记录变量][产品证券_资金_内外资产账户资金差异表][{机构编号},{交易组编号},{资产账户编号},{产品编号},{外部账号}][@机构编号#,@交易组编号#,@资产账户编号#,@产品编号#,@外部账号#][{记录序号}=@记录序号#][4][@记录序号#] */
    select co_no,exch_group_no,asset_acco_no,pd_no,out_acco into v_co_no,v_exch_group_no,v_asset_acco_no,v_pd_no,v_out_acco from db_pdsecu.tb_pdseca_asac_capit_diff where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.10.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #set @交易组编号串#=" ";
    #if @交易组编号#=0 then
     #   select GROUP_CONCAT(exch_group_no ORDER BY row_id SEPARATOR ';') into @交易组编号串# from tb_pdseca_exgp_capit where asset_acco_no=@资产账户编号#;
    #end if;
    #set @交易组编号串#=concat(@交易组编号串#,";;");
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

# 原子_产品证券_资金运维_处理交易组资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_DealExgpDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_DealExgpDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_occur_amt decimal(18,4),
    IN p_sync_capital_way int,
    IN p_hk_cash_avail_date_type int,
    IN p_busi_flag int,
    IN p_amt_check_diff decimal(18,4),
    IN p_acco_total_payab_amt_diff decimal(18,4),
    IN p_acco_total_rece_amt_diff decimal(18,4),
    IN p_sync_total_rece_payab int,
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
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_sync_capital_way int;
    declare v_hk_cash_avail_date_type int;
    declare v_busi_flag int;
    declare v_amt_check_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
    declare v_acco_total_rece_amt_diff decimal(18,4);
    declare v_sync_total_rece_payab int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_oper_remark_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_tmp_avail_amt decimal(18,4);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_shsz_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);

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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_occur_amt = p_occur_amt;
    SET v_sync_capital_way = p_sync_capital_way;
    SET v_hk_cash_avail_date_type = p_hk_cash_avail_date_type;
    SET v_busi_flag = p_busi_flag;
    SET v_amt_check_diff = p_amt_check_diff;
    SET v_acco_total_payab_amt_diff = p_acco_total_payab_amt_diff;
    SET v_acco_total_rece_amt_diff = p_acco_total_rece_amt_diff;
    SET v_sync_total_rece_payab = p_sync_total_rece_payab;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_oper_remark_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_tmp_occur_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_tmp_avail_amt = 0;
    SET v_exgp_avail_amt = 0;
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_avail_amt = 0;
    SET v_hk_avail_amt = 0;
    SET v_shsz_avail_amt = 0;
    SET v_static_avail_amt = 0;

    
    label_pro:BEGIN
    

        /* set @临时_操作备注#="系统自动同步外部资金数据！"; */
        set v_tmp_oper_remark_info="系统自动同步外部资金数据！";

        /* set @期初金额# = 0; */
        set v_begin_amt = 0;

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @解冻金额# = 0; */
        set v_unfroz_amt = 0;

        /* set @待交收金额# = 0; */
        set v_pre_settle_amt = 0;

        /* set @沪深可用调整金额# = 0; */
        set v_shsz_avail_change_amt = 0;

        /* set @港股通可用调整金额# = 0; */
        set v_hk_avail_change_amt = 0;

        /* set @T日当日港股买入金额#=0; */
        set v_T_hk_buy_total_amt=0;

        /* set @T日当日港股卖出金额#=0; */
        set v_T_hk_sell_total_amt=0;

        /* set @T1日当日港股买入金额#=0; */
        set v_T1_hk_buy_total_amt=0;

        /* set @T1日当日港股卖出金额#=0; */
        set v_T1_hk_sell_total_amt=0;

        /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
        if  v_sync_total_rece_payab = 0  then

             /* set @累计应收金额# = 0; */
             set v_total_rece_amt = 0;

             /* set @累计应付金额# = 0; */
             set v_total_payab_amt = 0;

        /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
        elseif v_sync_total_rece_payab = 1  then

             /* set @累计应收金额# = @账户累计应收金额差额#; */
             set v_total_rece_amt = v_acco_total_rece_amt_diff;

             /* set @累计应付金额# = @账户累计应付金额差额#; */
             set v_total_payab_amt = v_acco_total_payab_amt_diff;
        end if;

        /* set @红冲蓝补金额# = 0; */
        set v_total_change_amt = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利率# = 0; */
        set v_intrst_rate = 0;

        /* set @利息积数# = 0; */
        set v_intrst_base_amt = 0;

        /* set @待入账利息# = 0; */
        set v_pre_entry_intrst_amt = 0;

        /* set @本币币种#="CNY"; */
        set v_crncy_type="CNY";

        /* set @临时_变动金额#=@变动金额#; */
        set v_tmp_occur_amt=v_occur_amt;

            /* set @操作菜单#=@菜单编号#; */
            set v_oper_menu_no=v_menu_no;

            /* set @操作功能#=@功能编码#; */
            set v_oper_func_code=v_func_code;
    #4条流水，一条 当前金额，一条 可用金额。有同步累计应收应付时，总共计4条。

            /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
            if  v_sync_total_rece_payab = 0  then

                  /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{红冲蓝补金额}=0][1][@交易组编号#,@资产账户编号#,@本币币种#] */
                  set v_create_date = date_format(curdate(),'%Y%m%d');
                  set v_create_time = date_format(curtime(),'%H%i%s');
                  set v_update_date = v_create_date;
                  set v_update_time = v_create_time;
                  set v_update_times = 1;
                  insert into db_pdsecu.tb_pdseca_exgp_capit (
                      create_date, create_time, update_date, 
                      update_time, update_times, co_no, pd_no, 
                      asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                      curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
                      shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
                      T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
                      total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
                      intrst_base_amt, pre_entry_intrst_amt) 
                  values(
                      v_create_date, v_create_time, v_update_date, 
                      v_update_time, v_update_times, v_co_no, v_pd_no, 
                      v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                      v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
                      v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
                      v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
                      v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
                      v_intrst_base_amt, v_pre_entry_intrst_amt) 
                  ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_change_amt=0;
                  if v_error_code = "1" then
                              
                      SET v_error_code = "pdsecuA.10.10.1";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                      end if;
                      leave label_pro;
                  end if;


            /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
            elseif v_sync_total_rece_payab = 1  then

                  /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{红冲蓝补金额}=0,{累计应付金额}= {累计应付金额} + @账户累计应付金额差额#,{累计应收金额}={累计应收金额}+@账户累计应收金额差额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
                  set v_create_date = date_format(curdate(),'%Y%m%d');
                  set v_create_time = date_format(curtime(),'%H%i%s');
                  set v_update_date = v_create_date;
                  set v_update_time = v_create_time;
                  set v_update_times = 1;
                  insert into db_pdsecu.tb_pdseca_exgp_capit (
                      create_date, create_time, update_date, 
                      update_time, update_times, co_no, pd_no, 
                      asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                      curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
                      shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
                      T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
                      total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
                      intrst_base_amt, pre_entry_intrst_amt) 
                  values(
                      v_create_date, v_create_time, v_update_date, 
                      v_update_time, v_update_times, v_co_no, v_pd_no, 
                      v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                      v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
                      v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
                      v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
                      v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
                      v_intrst_base_amt, v_pre_entry_intrst_amt) 
                  ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_change_amt=0,total_payab_amt= total_payab_amt + v_acco_total_payab_amt_diff,total_rece_amt=total_rece_amt+v_acco_total_rece_amt_diff;
                  if v_error_code = "1" then
                              
                      SET v_error_code = "pdsecuA.10.10.1";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                      end if;
                      leave label_pro;
                  end if;


                  /* [获取表记录变量][产品证券_资金_交易组资金表][{累计应收金额},{累计应付金额}][@累计应收金额#,@累计应付金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
                  select total_rece_amt,total_payab_amt into v_total_rece_amt,v_total_payab_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
                  if FOUND_ROWS() = 0 then
                              
                      SET v_error_code = "pdsecuA.10.10.4";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                      end if;
                      leave label_pro;
                  end if;


                  /* set @操作备注#=concat(@临时_操作备注#,"|","累计应付差额"); */
                  set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应付差额");

                  /* set @变动金额#=@账户累计应付金额差额#; */
                  set v_occur_amt=v_acco_total_payab_amt_diff;

                  /* set @变动后金额#=@累计应付金额#; */
                  set v_occur_end_amt=v_total_payab_amt;

                 /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                     create_date, create_time, update_date, 
                     update_time, update_times, opor_co_no, opor_no, 
                     oper_mac, oper_ip_addr, oper_info, oper_way, 
                     oper_menu_no, oper_func_code, init_date, co_no, 
                     pd_no, asset_acco_no, exch_group_no, crncy_type, 
                     busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                     jour_after_occur_info, oper_remark_info) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                     v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                     v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                     v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                     v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                     v_jour_after_occur_info, v_oper_remark_info);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pdsecuA.10.10.5";
                     SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                     leave label_pro;
                 end if;


                 /* set @操作备注#=concat(@临时_操作备注#,"|","累计应收差额"); */
                 set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应收差额");

                 /* set @变动金额#=@账户累计应收金额差额#; */
                 set v_occur_amt=v_acco_total_rece_amt_diff;

                 /* set @变动后金额#=@累计应收金额#; */
                 set v_occur_end_amt=v_total_rece_amt;

                 /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                     create_date, create_time, update_date, 
                     update_time, update_times, opor_co_no, opor_no, 
                     oper_mac, oper_ip_addr, oper_info, oper_way, 
                     oper_menu_no, oper_func_code, init_date, co_no, 
                     pd_no, asset_acco_no, exch_group_no, crncy_type, 
                     busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                     jour_after_occur_info, oper_remark_info) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                     v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                     v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                     v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                     v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                     v_jour_after_occur_info, v_oper_remark_info);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pdsecuA.10.10.5";
                     SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                     leave label_pro;
                 end if;

            end if;

            /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");

            /* set @变动金额#=@临时_变动金额#; */
            set v_occur_amt=v_tmp_occur_amt;

            /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}+{港股通可用调整金额}+{金额核对差额},{当前金额}+{沪深可用调整金额}+{金额核对差额},{当前金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数},{红冲蓝补金额}][@临时_可用金额#,@交易组可用金额#,@变动后金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#,@红冲蓝补金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
            select curr_amt+hk_avail_change_amt+amt_check_diff,curr_amt+shsz_avail_change_amt+amt_check_diff,curr_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times,total_change_amt into v_tmp_avail_amt,v_exgp_avail_amt,v_occur_end_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times,v_total_change_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.10.10.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


            /* set @流水变动字段# = "红冲蓝补金额|"; */
            set v_jour_occur_field = "红冲蓝补金额|";

            /* set @流水后信息# = concat(@红冲蓝补金额#,"|"); */
            set v_jour_after_occur_info = concat(v_total_change_amt,"|");

            /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, exch_group_no, crncy_type, 
                busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                jour_after_occur_info, oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                v_jour_after_occur_info, v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.10.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* set @操作备注#=concat(@临时_操作备注#,"|","可用金额差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","可用金额差额");

            /* set @变动金额#=@金额核对差额#; */
            set v_occur_amt=v_amt_check_diff;

            /* set @可用金额#=0; */
            set v_avail_amt=0;

            /* set @港股可用金额#=0; */
            set v_hk_avail_amt=0;

            /* set @沪深可用金额#=0; */
            set v_shsz_avail_amt=0;

            /* set @静态可用金额#=0; */
            set v_static_avail_amt=0;

            /* [获取表记录变量语句][产品证券_资金_交易库交易组资金表][{港股可用金额},{沪深可用金额},{静态可用金额}][@港股可用金额#,@沪深可用金额#,@静态可用金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
            select hk_avail_amt,shsz_avail_amt,static_avail_amt into v_hk_avail_amt,v_shsz_avail_amt,v_static_avail_amt from db_pdsecu.tb_pdseca_trd_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

        #同步资金方式为0表示同步可用金额,为1表示同步资金余额

            /* if @同步资金方式#=0 then */
            if v_sync_capital_way=0 then

                /* if @港股通资金可用日期#=《港股通资金可用日期-T+2日日初可用》 then */
                if v_hk_cash_avail_date_type=4 then
                    #港股轧差计算

                    /* set @港股可用金额#=greatest(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+@港股可用金额#; */
                    set v_hk_avail_amt=greatest(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+v_hk_avail_amt;
                    #A股的可用金额=产品库的可用金额+交易库的A股可用金额+港股的轧差

                    /* set @可用金额#=@交易组可用金额#+@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#+least(0,@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+@沪深可用金额#+LEAST(@港股可用金额#,0); */
                    set v_avail_amt=v_exgp_avail_amt+v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt+least(0,v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+v_shsz_avail_amt+LEAST(v_hk_avail_amt,0);

                /* elseif @港股通资金可用日期#=《港股通资金可用日期-T+2日日终可用》 then */
                elseif v_hk_cash_avail_date_type=5 then
                    #港股轧差计算

                    /* set @港股可用金额#=greatest(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+@港股可用金额#; */
                    set v_hk_avail_amt=greatest(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+v_hk_avail_amt;
                   #A股的可用金额=产品库的可用金额+交易库的A股可用金额+港股的轧差

                    /* set @可用金额#=@交易组可用金额#+least(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+least(0,greatest(0,@交易组T日当日港股卖出金额#-@交易组T日当日港股买入金额#)+@交易组T1日当日港股卖出金额#-@交易组T1日当日港股买入金额#)+@沪深可用金额#+LEAST(@港股可用金额#,0); */
                    set v_avail_amt=v_exgp_avail_amt+least(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+least(0,greatest(0,v_exgp_T_hk_sell_total_amt-v_exgp_T_hk_buy_total_amt)+v_exgp_T1_hk_sell_total_amt-v_exgp_T1_hk_buy_total_amt)+v_shsz_avail_amt+LEAST(v_hk_avail_amt,0);
                end if;
            else

                /* set @可用金额#=@临时_可用金额#+@静态可用金额#; */
                set v_avail_amt=v_tmp_avail_amt+v_static_avail_amt;
            end if;

            /* set @流水变动字段# = " "; */
            set v_jour_occur_field = " ";

            /* set @流水后信息# = " "; */
            set v_jour_after_occur_info = " ";

            /* set @变动后金额#=@可用金额#; */
            set v_occur_end_amt=v_avail_amt;

            /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, exch_group_no, crncy_type, 
                busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                jour_after_occur_info, oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                v_jour_after_occur_info, v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.10.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_更新证券代码信息行情汇率
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_UpdateStockCodeInfoQuotRate;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_UpdateStockCodeInfoQuotRate(
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
    declare v_settle_sell_rate decimal(18,12);
    declare v_pboc_rate decimal(18,12);
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
    SET v_settle_sell_rate = 0;
    SET v_pboc_rate = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if @查询记录序号# = 0 then */
    if v_query_row_id = 0 then

        /* truncate table ~产品证券_持仓_证券代码信息行情汇率表^; */
        truncate table db_pdsecu.tb_pdsepo_stock_code_info_quot_rate;
    end if;
    #此处考虑到这两个汇率只是归档钱计算港股通资产使用的,固写入的时候可以不考虑值,modify by hgk,20180801

    /* set @卖出结算汇率#=1; */
    set v_settle_sell_rate=1;

    /* set @中国人行汇率#=1; */
    set v_pboc_rate=1;

    /* [插入重复更新][产品证券_持仓_证券代码信息行情汇率表][字段][字段变量][{市场编号}=@市场编号#,{证券类型}=@证券类型#,{资产类型}=@资产类型#,{最新价}=@最新价#,{公允价格}=@公允价格#,{净价标志}=@净价标志#,{债券计提利息}=@债券计提利息#,{买入结算汇率}=@买入结算汇率#,{卖出结算汇率}=@卖出结算汇率#,{中国人行汇率}=@中国人行汇率#][1][@市场编号#,@证券代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdsepo_stock_code_info_quot_rate (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code_no, 
        stock_type, asset_type, last_price, fair_price, 
        net_price_flag, bond_accr_intrst, settle_buy_rate, settle_sell_rate, 
        pboc_rate, crncy_type) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code_no, 
        v_stock_type, v_asset_type, v_last_price, v_fair_price, 
        v_net_price_flag, v_bond_accr_intrst, v_settle_buy_rate, v_settle_sell_rate, 
        v_pboc_rate, v_crncy_type) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, exch_no=v_exch_no,stock_type=v_stock_type,asset_type=v_asset_type,last_price=v_last_price,fair_price=v_fair_price,net_price_flag=v_net_price_flag,bond_accr_intrst=v_bond_accr_intrst,settle_buy_rate=v_settle_buy_rate,settle_sell_rate=v_settle_sell_rate,pboc_rate=v_pboc_rate;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.10.11.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码编号=",v_stock_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_计算产品证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_CalcProdSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_CalcProdSecuAsset(
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
    OUT p_error_info varchar(255),
    OUT p_stock_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算股票资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @股票资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type=11;

    /* set @股票资产#=round(ifnull(@股票资产#,0),2); */
    set v_stock_asset=round(ifnull(v_stock_asset,0),2);
    #计算债券资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*(b.{最新价}+b.{债券计提利息})) into @债券资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型} in (《资产类型-国债》,《资产类型-企业债》,《资产类型-公司债》,《资产类型-金融债》,《资产类型-地方政府债》,《资产类型-次级债》,《资产类型-资产支持证券》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*(b.last_price+b.bond_accr_intrst)) into v_bond_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type in (21,22,23,24,25,26,27);

    /* set @债券资产#=round(ifnull(@债券资产#,0),2); */
    set v_bond_asset=round(ifnull(v_bond_asset,0),2);
    #计算基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{资产类型} in (《资产类型-股票基金》,《资产类型-混合基金》,《资产类型-债券基金》,《资产类型-商品基金》,《资产类型-货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.asset_type in (51,52,53,54,55);

    /* set @基金资产#=round(ifnull(@基金资产#,0),2); */
    set v_fund_asset=round(ifnull(v_fund_asset,0),2);
    #计算回购资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*100) into @回购资产# from ~产品证券_持仓_资产账户持仓表^ a where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{资产类型} = 《资产类型-回购资产》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*100) into v_repo_asset from db_pdsecu.tb_pdsepo_asac_posi a where a.co_no=v_co_no and a.pd_no=v_pd_no and a.asset_type = 43;

    /* set @回购资产#=round(ifnull(@回购资产#,0),2); */
    set v_repo_asset=round(ifnull(v_repo_asset,0),2);
    #计算港股通资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{买入结算汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_buy_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* set @港股通资产#=round(ifnull(@港股通资产#,0),2); */
    set v_hk_thrgh_stock_asset=round(ifnull(v_hk_thrgh_stock_asset,0),2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_asset = v_stock_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_other_asset = v_other_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_计算交易组证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_CalcExchGroupSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_CalcExchGroupSecuAsset(
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
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_begin_NAV decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);

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
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_NAV = 0;
    SET v_futu_asset = 0;
    SET v_nav_asset = 0;

    
    label_pro:BEGIN
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算证券现金资产 Modify by wjp20181019

    /* select sum({当前金额}+{待交收金额}+{累计应收金额}-{累计应付金额}+{金额核对差额}) into @证券现金资产# from ~产品证券_资金_交易组资金表^ where {交易组编号}=@交易组编号# and {本币币种}=@本币币种#; */
    select sum(curr_amt+pre_settle_amt+total_rece_amt-total_payab_amt+amt_check_diff) into v_stock_cash_asset from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;

    /* set @证券现金资产#=round(ifnull(@证券现金资产#,0),2); */
    set v_stock_cash_asset=round(ifnull(v_stock_cash_asset,0),2);
    #计算期货现金资产 Modify by wjp20181019   跨库操作。
    #计算股票资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @股票资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type=11;

    /* set @股票资产#=round(ifnull(@股票资产#,0),2); */
    set v_stock_asset=round(ifnull(v_stock_asset,0),2);
    #计算债券资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*(b.{最新价}+b.{债券计提利息})) into @债券资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型} in (《资产类型-国债》,《资产类型-企业债》,《资产类型-公司债》,《资产类型-金融债》,《资产类型-地方政府债》,《资产类型-次级债》,《资产类型-资产支持证券》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*(b.last_price+b.bond_accr_intrst)) into v_bond_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type in (21,22,23,24,25,26,27);

    /* set @债券资产#=round(ifnull(@债券资产#,0),2); */
    set v_bond_asset=round(ifnull(v_bond_asset,0),2);
    #计算基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @基金资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{资产类型} in (《资产类型-股票基金》,《资产类型-混合基金》,《资产类型-债券基金》,《资产类型-商品基金》,《资产类型-货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_fund_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.asset_type in (51,52,53,54,55);

    /* set @基金资产#=round(ifnull(@基金资产#,0),2); */
    set v_fund_asset=round(ifnull(v_fund_asset,0),2);
    #计算回购资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*100) into @回购资产# from ~产品证券_持仓_交易组持仓表^ a where a.{交易组编号}=@交易组编号# and a.{资产类型} = 《资产类型-回购资产》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*100) into v_repo_asset from db_pdsecu.tb_pdsepo_exgp_posi a where a.exch_group_no=v_exch_group_no and a.asset_type = 43;

    /* set @回购资产#=round(ifnull(@回购资产#,0),2); */
    set v_repo_asset=round(ifnull(v_repo_asset,0),2);
    #计算港股通资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{买入结算汇率}) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_buy_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* set @港股通资产#=round(ifnull(@港股通资产#,0),2); */
    set v_hk_thrgh_stock_asset=round(ifnull(v_hk_thrgh_stock_asset,0),2);

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @其他资产# = 0; */
    set v_other_asset = 0;

    /* set @期货资产# = 0; */
    set v_futu_asset = 0;
    #现金资产 区分 证券和期货 Modify by wjp20181019

    /* set @净资产# = @证券现金资产# + @股票资产# + @债券资产# + @基金资产# + @回购资产# + @港股通资产#; */
    set v_nav_asset = v_stock_cash_asset + v_stock_asset + v_bond_asset + v_fund_asset + v_repo_asset + v_hk_thrgh_stock_asset;
    #set @净资产# = @现金资产# + @股票资产# + @债券资产# + @基金资产# + @回购资产# + @港股通资产#;
    #[插入重复更新][产品证券_资金_交易组资产表][字段][字段变量][{净资产}=@净资产#,{现金资产}=@证券现金资产#+@期货现金资产#,{股票资产}=@股票资产#,{债券资产}=@债券资产#,{基金资产}=@基金资产#,{回购资产}=@回购资产#,{港股通资产}=@港股通资产#][2][@交易组编号#,@本币币种#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_cash_asset = v_stock_cash_asset;
    SET p_stock_asset = v_stock_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_other_asset = v_other_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_计算产品证券资产修改版
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_CalcProdSecuAsset_New;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_CalcProdSecuAsset_New(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
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
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算股票资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @股票资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type=11;

    /* set @股票资产#=round(ifnull(@股票资产#,0),2); */
    set v_stock_asset=round(ifnull(v_stock_asset,0),2);
    #计算债券资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*(b.{最新价}+b.{债券计提利息})) into @债券资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型} in (《资产类型-国债》,《资产类型-企业债》,《资产类型-公司债》,《资产类型-金融债》,《资产类型-地方政府债》,《资产类型-次级债》,《资产类型-资产支持证券》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*(b.last_price+b.bond_accr_intrst)) into v_bond_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type in (21,22,23,24,25,26,27);

    /* set @债券资产#=round(ifnull(@债券资产#,0),2); */
    set v_bond_asset=round(ifnull(v_bond_asset,0),2);
    #计算基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{资产类型} in (《资产类型-股票基金》,《资产类型-混合基金》,《资产类型-债券基金》,《资产类型-商品基金》,《资产类型-货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.asset_type in (51,52,53,54,55);

    /* set @基金资产#=round(ifnull(@基金资产#,0),2); */
    set v_fund_asset=round(ifnull(v_fund_asset,0),2);
    #计算货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @货币基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-货币ETF基金》,《证券类型-普通货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_money_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.stock_type in (57,63);

    /* set @货币基金资产#=round(ifnull(@货币基金资产#,0),2); */
    set v_money_fund_asset=round(ifnull(v_money_fund_asset,0),2);
    #计算非货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @非货币基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-封闭式基金》,《证券类型-ETF基金》,《证券类型-LOF基金》,《证券类型-分级基金》,《证券类型-分级基金A》,《证券类型-分级基金B》,《证券类型-跨境ETF基金》,《证券类型-跨境LOF基金》,《证券类型-黄金ETF基金》,《证券类型-普通开放式基金》,《证券类型-债券ETF基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_not_money_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.stock_type in (51,52,53,54,55,56,58,59,60,62,64);

    /* set @非货币基金资产#=round(ifnull(@非货币基金资产#,0),2); */
    set v_not_money_fund_asset=round(ifnull(v_not_money_fund_asset,0),2);
    #计算回购资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*100) into @回购资产# from ~产品证券_持仓_资产账户持仓表^ a where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{资产类型} = 《资产类型-回购资产》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*100) into v_repo_asset from db_pdsecu.tb_pdsepo_asac_posi a where a.co_no=v_co_no and a.pd_no=v_pd_no and a.asset_type = 43;

    /* set @回购资产#=round(ifnull(@回购资产#,0),2); */
    set v_repo_asset=round(ifnull(v_repo_asset,0),2);
    #计算港股通资产,港股通资产计算修改,modify by hgk,20180731
    #配置值取的是产品控制配置串的第24位,表示计算资产时使用的汇率. 0 表示买卖结算汇率均值,1表示买入结算汇率,2表示卖出结算汇率,3表示中国人民银行汇率

    /* if @港股通资产计算采用汇率#=0 then */
    if v_hk_asset_calc_rate=0 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*(b.{买入结算汇率}+b.{卖出结算汇率})/2) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*(b.settle_buy_rate+b.settle_sell_rate)/2) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=1 then */
    elseif v_hk_asset_calc_rate=1 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{买入结算汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_buy_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=2 then */
    elseif v_hk_asset_calc_rate=2 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{卖出结算汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_sell_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=3 then */
    elseif v_hk_asset_calc_rate=3 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{中国人行汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.pboc_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;
    end if;

    /* set @港股通资产#=round(ifnull(@港股通资产#,0),2); */
    set v_hk_thrgh_stock_asset=round(ifnull(v_hk_thrgh_stock_asset,0),2);
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

# 原子_产品证券_资金运维_计算交易组证券资产修改版
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_CalcExchGroupSecuAsset_New;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_CalcExchGroupSecuAsset_New(
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
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算现金资产

    /* select sum({当前金额}+{待交收金额}+{累计应收金额}-{累计应付金额}+{金额核对差额}) into @现金资产# from ~产品证券_资金_交易组资金表^ where {交易组编号}=@交易组编号# and {本币币种}=@本币币种#; */
    select sum(curr_amt+pre_settle_amt+total_rece_amt-total_payab_amt+amt_check_diff) into v_cash_asset from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;

    /* set @现金资产#=round(ifnull(@现金资产#,0),2); */
    set v_cash_asset=round(ifnull(v_cash_asset,0),2);
    #计算股票资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @股票资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type=11;

    /* set @股票资产#=round(ifnull(@股票资产#,0),2); */
    set v_stock_asset=round(ifnull(v_stock_asset,0),2);
    #计算债券资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*(b.{最新价}+b.{债券计提利息})) into @债券资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型} in (《资产类型-国债》,《资产类型-企业债》,《资产类型-公司债》,《资产类型-金融债》,《资产类型-地方政府债》,《资产类型-次级债》,《资产类型-资产支持证券》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*(b.last_price+b.bond_accr_intrst)) into v_bond_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2) and b.asset_type in (21,22,23,24,25,26,27);

    /* set @债券资产#=round(ifnull(@债券资产#,0),2); */
    set v_bond_asset=round(ifnull(v_bond_asset,0),2);
    #计算基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @基金资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{资产类型} in (《资产类型-股票基金》,《资产类型-混合基金》,《资产类型-债券基金》,《资产类型-商品基金》,《资产类型-货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_fund_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.asset_type in (51,52,53,54,55);

    /* set @基金资产#=round(ifnull(@基金资产#,0),2); */
    set v_fund_asset=round(ifnull(v_fund_asset,0),2);
    #计算货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @货币基金资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-货币ETF基金》,《证券类型-普通货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_money_fund_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.stock_type in (57,63);

    /* set @货币基金资产#=round(ifnull(@货币基金资产#,0),2); */
    set v_money_fund_asset=round(ifnull(v_money_fund_asset,0),2);
    #计算非货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @非货币基金资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-封闭式基金》,《证券类型-ETF基金》,《证券类型-LOF基金》,《证券类型-分级基金》,《证券类型-分级基金A》,《证券类型-分级基金B》,《证券类型-跨境ETF基金》,《证券类型-跨境LOF基金》,《证券类型-黄金ETF基金》,《证券类型-普通开放式基金》,《证券类型-债券ETF基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_not_money_fund_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.stock_type in (51,52,53,54,55,56,58,59,60,62,64);

    /* set @非货币基金资产#=round(ifnull(@非货币基金资产#,0),2); */
    set v_not_money_fund_asset=round(ifnull(v_not_money_fund_asset,0),2);
    #计算回购资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*100) into @回购资产# from ~产品证券_持仓_交易组持仓表^ a where a.{交易组编号}=@交易组编号# and a.{资产类型} = 《资产类型-回购资产》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*100) into v_repo_asset from db_pdsecu.tb_pdsepo_exgp_posi a where a.exch_group_no=v_exch_group_no and a.asset_type = 43;

    /* set @回购资产#=round(ifnull(@回购资产#,0),2); */
    set v_repo_asset=round(ifnull(v_repo_asset,0),2);
    #计算港股通资产
    #配置值取的是产品控制配置串的第24位,表示计算资产时使用的汇率. 0 表示买卖结算汇率均值,1表示买入结算汇率,2表示卖出结算汇率,3表示中国人民银行汇率

    /* if @港股通资产计算采用汇率#=0 then */
    if v_hk_asset_calc_rate=0 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*(b.{买入结算汇率}+b.{卖出结算汇率})/2) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*(b.settle_buy_rate+b.settle_sell_rate)/2) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=1 then */
    elseif v_hk_asset_calc_rate=1 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{买入结算汇率}) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_buy_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=2 then */
    elseif v_hk_asset_calc_rate=2 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{卖出结算汇率}) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_sell_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=3 then */
    elseif v_hk_asset_calc_rate=3 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{中国人行汇率}) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.pboc_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and b.exch_no in (3,4) and b.asset_type=11;
    end if;

    /* set @港股通资产#=round(ifnull(@港股通资产#,0),2); */
    set v_hk_thrgh_stock_asset=round(ifnull(v_hk_thrgh_stock_asset,0),2);
    #此处取消维护pdsecu库的交易组资产表数据
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

# 原子_产品证券_资金运维_计算产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_CalcProdAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_CalcProdAsset(
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
    declare v_busi_config_str varchar(64);
    declare v_hk_asset_calc_rate int;
    declare v_tmp_stock_asset decimal(18,4);

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
    SET v_busi_config_str = " ";
    SET v_hk_asset_calc_rate = 0;
    SET v_tmp_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品证券_账户_产品信息表][{记录序号},{机构编号},{产品编号},{业务控制配置串}][@记录序号#,@机构编号#,@产品编号#,@业务控制配置串#][{记录序号}>@查询记录序号#] */
    select row_id,co_no,pd_no,busi_config_str into v_row_id,v_co_no,v_pd_no,v_busi_config_str from db_pdsecu.tb_pdseca_pd_info where row_id>v_query_row_id limit 1;


    /* [检查正常返回][@记录序号#=0] */
    if v_row_id=0 then
        leave label_pro;
    end if;


    /* set @港股通资产计算采用汇率#=cast(substring(@业务控制配置串#, 24, 1) as SIGNED); */
    set v_hk_asset_calc_rate=cast(substring(v_busi_config_str, 24, 1) as SIGNED);

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算股票资产,要加上大宗交易的持仓作为股票资产,修改日期20180822

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @股票资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2) and b.asset_type=11;

    /* select sum(a.{成交数量}* if(a.{公允价格}=0,b.{最新价},a.{公允价格})) into @临时_股票资产# from ~产品证券_持仓_大宗交易持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{处理状态}="0" and a.{证券代码编号}=b.{证券代码编号}; */
    select sum(a.strike_qty* if(a.fair_price=0,b.last_price,a.fair_price)) into v_tmp_stock_asset from db_pdsecu.tb_pdsepo_block_trade_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.deal_status="0" and a.stock_code_no=b.stock_code_no;

    /* set @股票资产#=round(ifnull(@股票资产#,0),2)+round(ifnull(@临时_股票资产#,0),2); */
    set v_stock_asset=round(ifnull(v_stock_asset,0),2)+round(ifnull(v_tmp_stock_asset,0),2);
    #计算债券资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*(b.{最新价}+b.{债券计提利息})) into @债券资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型} in (《资产类型-国债》,《资产类型-企业债》,《资产类型-公司债》,《资产类型-金融债》,《资产类型-地方政府债》,《资产类型-次级债》,《资产类型-资产支持证券》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*(b.last_price+b.bond_accr_intrst)) into v_bond_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2) and b.asset_type in (21,22,23,24,25,26,27);

    /* set @债券资产#=round(ifnull(@债券资产#,0),2); */
    set v_bond_asset=round(ifnull(v_bond_asset,0),2);
    #计算基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{投资类型} in (1,2) and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{资产类型} in (《资产类型-股票基金》,《资产类型-混合基金》,《资产类型-债券基金》,《资产类型-商品基金》,《资产类型-货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.invest_type in (1,2) and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.asset_type in (51,52,53,54,55);

    /* set @基金资产#=round(ifnull(@基金资产#,0),2); */
    set v_fund_asset=round(ifnull(v_fund_asset,0),2);
    #计算货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @货币基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{投资类型} in (1,2) and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-货币ETF基金》,《证券类型-普通货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_money_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.invest_type in (1,2) and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.stock_type in (57,63);

    /* set @货币基金资产#=round(ifnull(@货币基金资产#,0),2); */
    set v_money_fund_asset=round(ifnull(v_money_fund_asset,0),2);
    #计算非货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @非货币基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{投资类型} in (1,2) and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-封闭式基金》,《证券类型-ETF基金》,《证券类型-LOF基金》,《证券类型-分级基金》,《证券类型-分级基金A》,《证券类型-分级基金B》,《证券类型-跨境ETF基金》,《证券类型-跨境LOF基金》,《证券类型-黄金ETF基金》,《证券类型-普通开放式基金》,《证券类型-债券ETF基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_not_money_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.invest_type in (1,2) and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.stock_type in (51,52,53,54,55,56,58,59,60,62,64);

    /* set @非货币基金资产#=round(ifnull(@非货币基金资产#,0),2); */
    set v_not_money_fund_asset=round(ifnull(v_not_money_fund_asset,0),2);
    #计算回购资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*100) into @回购资产# from ~产品证券_持仓_资产账户持仓表^ a where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{投资类型} in (1,2) and a.{资产类型} = 《资产类型-回购资产》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*100) into v_repo_asset from db_pdsecu.tb_pdsepo_asac_posi a where a.co_no=v_co_no and a.pd_no=v_pd_no and a.invest_type in (1,2) and a.asset_type = 43;

    /* set @回购资产#=round(ifnull(@回购资产#,0),2); */
    set v_repo_asset=round(ifnull(v_repo_asset,0),2);
    #计算港股通资产,港股通资产计算修改,modify by hgk,20180731
    #配置值取的是产品控制配置串的第24位,表示计算资产时使用的汇率. 0 表示买卖结算汇率均值,1表示买入结算汇率,2表示卖出结算汇率,3表示中国人民银行汇率

    /* if @港股通资产计算采用汇率#=0 then */
    if v_hk_asset_calc_rate=0 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*(b.{买入结算汇率}+b.{卖出结算汇率})/2) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*(b.settle_buy_rate+b.settle_sell_rate)/2) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=1 then */
    elseif v_hk_asset_calc_rate=1 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{买入结算汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_buy_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=2 then */
    elseif v_hk_asset_calc_rate=2 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{卖出结算汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_sell_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=3 then */
    elseif v_hk_asset_calc_rate=3 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{中国人行汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.pboc_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;
    end if;

    /* set @港股通资产#=round(ifnull(@港股通资产#,0),2); */
    set v_hk_thrgh_stock_asset=round(ifnull(v_hk_thrgh_stock_asset,0),2);
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

# 原子_产品证券_资金运维_计算交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_CalcExchGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_CalcExchGroupAsset(
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
    declare v_busi_config_str varchar(64);
    declare v_hk_asset_calc_rate int;
    declare v_tmp_stock_asset decimal(18,4);

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
    SET v_busi_config_str = " ";
    SET v_hk_asset_calc_rate = 0;
    SET v_tmp_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_账户_产品信息表][{业务控制配置串}][@业务控制配置串#][{机构编号}=@机构编号# and {产品编号}=@产品编号#][4][@机构编号#,@产品编号#] */
    select busi_config_str into v_busi_config_str from db_pdsecu.tb_pdseca_pd_info where co_no=v_co_no and pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.10.17.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @港股通资产计算采用汇率#=cast(substring(@业务控制配置串#, 24, 1) as SIGNED); */
    set v_hk_asset_calc_rate=cast(substring(v_busi_config_str, 24, 1) as SIGNED);

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算证券现金资产  modify by wjp 20181019

    /* select sum({当前金额}+{待交收金额}+{累计应收金额}-{累计应付金额}+{金额核对差额}) into @证券现金资产# from ~产品证券_资金_交易组资金表^ where {交易组编号}=@交易组编号# and {本币币种}=@本币币种#; */
    select sum(curr_amt+pre_settle_amt+total_rece_amt-total_payab_amt+amt_check_diff) into v_stock_cash_asset from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;

    /* set @证券现金资产#=round(ifnull(@证券现金资产#,0),2); */
    set v_stock_cash_asset=round(ifnull(v_stock_cash_asset,0),2);
    #计算股票资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @股票资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2) and b.asset_type=11;

    /* select sum(a.{成交数量}* if(a.{公允价格}=0,b.{最新价},a.{公允价格})) into @临时_股票资产# from ~产品证券_持仓_大宗交易持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{交易组编号}=@交易组编号# and a.{处理状态}="0" and a.{证券代码编号}=b.{证券代码编号}; */
    select sum(a.strike_qty* if(a.fair_price=0,b.last_price,a.fair_price)) into v_tmp_stock_asset from db_pdsecu.tb_pdsepo_block_trade_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.exch_group_no=v_exch_group_no and a.deal_status="0" and a.stock_code_no=b.stock_code_no;

    /* set @股票资产#=round(ifnull(@股票资产#,0),2)+round(ifnull(@临时_股票资产#,0),2); */
    set v_stock_asset=round(ifnull(v_stock_asset,0),2)+round(ifnull(v_tmp_stock_asset,0),2);
    #计算债券资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*(b.{最新价}+b.{债券计提利息})) into @债券资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型} in (《资产类型-国债》,《资产类型-企业债》,《资产类型-公司债》,《资产类型-金融债》,《资产类型-地方政府债》,《资产类型-次级债》,《资产类型-资产支持证券》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*(b.last_price+b.bond_accr_intrst)) into v_bond_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2) and b.asset_type in (21,22,23,24,25,26,27);

    /* set @债券资产#=round(ifnull(@债券资产#,0),2); */
    set v_bond_asset=round(ifnull(v_bond_asset,0),2);
    #计算基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @基金资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{资产类型} in (《资产类型-股票基金》,《资产类型-混合基金》,《资产类型-债券基金》,《资产类型-商品基金》,《资产类型-货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_fund_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2,5) and b.asset_type in (51,52,53,54,55);

    /* set @基金资产#=round(ifnull(@基金资产#,0),2); */
    set v_fund_asset=round(ifnull(v_fund_asset,0),2);
    #计算货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @货币基金资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-货币ETF基金》,《证券类型-普通货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_money_fund_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2,5) and b.stock_type in (57,63);

    /* set @货币基金资产#=round(ifnull(@货币基金资产#,0),2); */
    set v_money_fund_asset=round(ifnull(v_money_fund_asset,0),2);
    #计算非货币基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @非货币基金资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{证券类型} in (《证券类型-封闭式基金》,《证券类型-ETF基金》,《证券类型-LOF基金》,《证券类型-分级基金》,《证券类型-分级基金A》,《证券类型-分级基金B》,《证券类型-跨境ETF基金》,《证券类型-跨境LOF基金》,《证券类型-黄金ETF基金》,《证券类型-普通开放式基金》,《证券类型-债券ETF基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_not_money_fund_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2,5) and b.stock_type in (51,52,53,54,55,56,58,59,60,62,64);

    /* set @非货币基金资产#=round(ifnull(@非货币基金资产#,0),2); */
    set v_not_money_fund_asset=round(ifnull(v_not_money_fund_asset,0),2);
    #计算回购资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*100) into @回购资产# from ~产品证券_持仓_交易组持仓表^ a where a.{交易组编号}=@交易组编号# and a.{投资类型} in (1,2) and a.{资产类型} = 《资产类型-回购资产》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*100) into v_repo_asset from db_pdsecu.tb_pdsepo_exgp_posi a where a.exch_group_no=v_exch_group_no and a.invest_type in (1,2) and a.asset_type = 43;

    /* set @回购资产#=round(ifnull(@回购资产#,0),2); */
    set v_repo_asset=round(ifnull(v_repo_asset,0),2);
    #计算港股通资产
    #配置值取的是产品控制配置串的第24位,表示计算资产时使用的汇率. 0 表示买卖结算汇率均值,1表示买入结算汇率,2表示卖出结算汇率,3表示中国人民银行汇率

    /* if @港股通资产计算采用汇率#=0 then */
    if v_hk_asset_calc_rate=0 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*(b.{买入结算汇率}+b.{卖出结算汇率})/2) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*(b.settle_buy_rate+b.settle_sell_rate)/2) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=1 then */
    elseif v_hk_asset_calc_rate=1 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{买入结算汇率}) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_buy_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=2 then */
    elseif v_hk_asset_calc_rate=2 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{卖出结算汇率}) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_sell_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=3 then */
    elseif v_hk_asset_calc_rate=3 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{中国人行汇率}) into @港股通资产# from ~产品证券_持仓_交易组持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{交易组编号}=@交易组编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.pboc_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_exgp_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.exch_group_no=v_exch_group_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;
    end if;

    /* set @港股通资产#=round(ifnull(@港股通资产#,0),2); */
    set v_hk_thrgh_stock_asset=round(ifnull(v_hk_thrgh_stock_asset,0),2);
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

# 原子_产品证券_资金运维_计算产品资产新版
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_CalcProdAssetNew;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_CalcProdAssetNew(
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
    OUT p_error_info varchar(255),
    OUT p_stock_asset decimal(18,4),
    OUT p_bond_asset decimal(18,4),
    OUT p_fund_asset decimal(18,4),
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_row_id bigint;
    declare v_busi_config_str varchar(64);
    declare v_hk_asset_calc_rate int;
    declare v_tmp_stock_asset decimal(18,4);

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
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_crncy_type = "CNY";
    SET v_row_id = 0;
    SET v_busi_config_str = " ";
    SET v_hk_asset_calc_rate = 0;
    SET v_tmp_stock_asset = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品证券_账户_产品信息表][{记录序号},{业务控制配置串}][@记录序号#,@业务控制配置串#][{机构编号}=@机构编号# and {产品编号}=@产品编号#] */
    select row_id,busi_config_str into v_row_id,v_busi_config_str from db_pdsecu.tb_pdseca_pd_info where co_no=v_co_no and pd_no=v_pd_no limit 1;


    /* [检查正常返回][@记录序号#=0] */
    if v_row_id=0 then
        leave label_pro;
    end if;


    /* set @港股通资产计算采用汇率#=cast(substring(@业务控制配置串#, 24, 1) as SIGNED); */
    set v_hk_asset_calc_rate=cast(substring(v_busi_config_str, 24, 1) as SIGNED);

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算股票资产,要加上大宗交易的持仓作为股票资产,修改日期20180822

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @股票资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型}=《资产类型-股票》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2) and b.asset_type=11;

    /* select sum({成交数量}*{公允价格}) into @临时_股票资产# from ~产品证券_持仓_大宗交易持仓表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号# and {处理状态}="0"; */
    select sum(strike_qty*fair_price) into v_tmp_stock_asset from db_pdsecu.tb_pdsepo_block_trade_posi where co_no=v_co_no and pd_no=v_pd_no and deal_status="0";

    /* set @股票资产#=round(ifnull(@股票资产#,0),2)+round(ifnull(@临时_股票资产#,0),2); */
    set v_stock_asset=round(ifnull(v_stock_asset,0),2)+round(ifnull(v_tmp_stock_asset,0),2);
    #计算债券资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*(b.{最新价}+b.{债券计提利息})) into @债券资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》) and b.{资产类型} in (《资产类型-国债》,《资产类型-企业债》,《资产类型-公司债》,《资产类型-金融债》,《资产类型-地方政府债》,《资产类型-次级债》,《资产类型-资产支持证券》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*(b.last_price+b.bond_accr_intrst)) into v_bond_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (1,2) and b.asset_type in (21,22,23,24,25,26,27);

    /* set @债券资产#=round(ifnull(@债券资产#,0),2); */
    set v_bond_asset=round(ifnull(v_bond_asset,0),2);
    #计算基金资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}) into @基金资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{投资类型} in (1,2) and a.{市场编号}=b.{市场编号} and b.{市场编号} in (《市场编号-上海证券交易所》,《市场编号-深圳证券交易所》,5) and b.{资产类型} in (《资产类型-股票基金》,《资产类型-混合基金》,《资产类型-债券基金》,《资产类型-商品基金》,《资产类型-货币基金》); */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price) into v_fund_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.invest_type in (1,2) and a.exch_no=b.exch_no and b.exch_no in (1,2,5) and b.asset_type in (51,52,53,54,55);

    /* set @基金资产#=round(ifnull(@基金资产#,0),2); */
    set v_fund_asset=round(ifnull(v_fund_asset,0),2);
    #计算回购资产

    /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*100) into @回购资产# from ~产品证券_持仓_资产账户持仓表^ a where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{投资类型} in (1,2) and a.{资产类型} = 《资产类型-回购资产》; */
    select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*100) into v_repo_asset from db_pdsecu.tb_pdsepo_asac_posi a where a.co_no=v_co_no and a.pd_no=v_pd_no and a.invest_type in (1,2) and a.asset_type = 43;

    /* set @回购资产#=round(ifnull(@回购资产#,0),2); */
    set v_repo_asset=round(ifnull(v_repo_asset,0),2);
    #计算港股通资产,港股通资产计算修改,modify by hgk,20180731
    #配置值取的是产品控制配置串的第24位,表示计算资产时使用的汇率. 0 表示买卖结算汇率均值,1表示买入结算汇率,2表示卖出结算汇率,3表示中国人民银行汇率

    /* if @港股通资产计算采用汇率#=0 then */
    if v_hk_asset_calc_rate=0 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*(b.{买入结算汇率}+b.{卖出结算汇率})/2) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*(b.settle_buy_rate+b.settle_sell_rate)/2) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=1 then */
    elseif v_hk_asset_calc_rate=1 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{买入结算汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_buy_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=2 then */
    elseif v_hk_asset_calc_rate=2 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{卖出结算汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.settle_sell_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;

    /* elseif @港股通资产计算采用汇率#=3 then */
    elseif v_hk_asset_calc_rate=3 then

        /* select sum((a.{当前数量}+a.{待交收数量}+a.{持仓核对差额})*b.{最新价}*b.{中国人行汇率}) into @港股通资产# from ~产品证券_持仓_资产账户持仓表^ a,~产品证券_持仓_证券代码信息行情汇率表^ b  where a.{机构编号}=@机构编号# and a.{产品编号}=@产品编号# and a.{证券代码编号}=b.{证券代码编号} and a.{市场编号}=b.{市场编号} and a.{投资类型} in (1,2) and b.{市场编号} in (《市场编号-沪港通证券交易所》,《市场编号-深港通证券交易所》) and b.{资产类型}=《资产类型-股票》; */
        select sum((a.curr_qty+a.pre_settle_qty+a.posi_qty_check_diff)*b.last_price*b.pboc_rate) into v_hk_thrgh_stock_asset from db_pdsecu.tb_pdsepo_asac_posi a,db_pdsecu.tb_pdsepo_stock_code_info_quot_rate b  where a.co_no=v_co_no and a.pd_no=v_pd_no and a.stock_code_no=b.stock_code_no and a.exch_no=b.exch_no and a.invest_type in (1,2) and b.exch_no in (3,4) and b.asset_type=11;
    end if;

    /* set @港股通资产#=round(ifnull(@港股通资产#,0),2); */
    set v_hk_thrgh_stock_asset=round(ifnull(v_hk_thrgh_stock_asset,0),2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_stock_asset = v_stock_asset;
    SET p_bond_asset = v_bond_asset;
    SET p_fund_asset = v_fund_asset;
    SET p_repo_asset = v_repo_asset;
    SET p_hk_thrgh_stock_asset = v_hk_thrgh_stock_asset;
    SET p_other_asset = v_other_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_获取外部资金账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_GetOutCapitalAsacInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_GetOutCapitalAsacInfo(
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
    declare v_tmp_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
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
    SET v_tmp_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_out_curr_amt = 0;
    SET v_out_enable_amt = 0;
    SET v_out_frozen_amt = 0;
    SET v_out_unfroz_amt = 0;
    SET v_out_total_payab_amt = 0;
    SET v_out_total_rece_amt = 0;

    
    label_pro:BEGIN
    

    /* set @临时_记录序号#=@记录序号#; */
    set v_tmp_row_id=v_row_id;

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_资金_外部资产账户资金表][字段][字段变量][{初始化日期}<>0 and {通道编号}<>0 and {外部账号}<>" " and ({本币币种}="CNY" or {本币币种}="HKD")and ({机构编号}=@机构编号# or @机构编号#=0) and ({产品编号}=@产品编号# or @产品编号#=0) and {记录序号}>@临时_记录序号# order by {记录序号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt, out_total_payab_amt, out_total_rece_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_out_curr_amt, v_out_enable_amt, 
        v_out_frozen_amt, v_out_unfroz_amt, v_out_total_payab_amt, v_out_total_rece_amt from db_pdsecu.tb_pdseca_out_asac_capit where init_date<>0 and pass_no<>0 and out_acco<>" " and (crncy_type="CNY" or crncy_type="HKD")and (co_no=v_co_no or v_co_no=0) and (pd_no=v_pd_no or v_pd_no=0) and row_id>v_tmp_row_id order by row_id limit 1;


    /* if @记录序号#>0  then */
    if v_row_id>0  then

      /* [检查正常返回][(@外部当前金额#+@外部可用金额#+@外部冻结金额#+@外部解冻金额#)=0] */
      if (v_out_curr_amt+v_out_enable_amt+v_out_frozen_amt+v_out_unfroz_amt)=0 then
          leave label_pro;
      end if;

    end if;

    /* set @目标机构编号#=@机构编号#; */
    set v_target_co_no=v_co_no;

    /* set @目标产品编号#=@产品编号#; */
    set v_target_pd_no=v_pd_no;

    /* set @当前记录序号#=@记录序号#; */
    set v_curr_row_id=v_row_id;
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

# 原子_产品证券_资金运维_处理内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_DealCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_DealCapitalDiff(
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
    declare v_sync_capital_way int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_acco_curr_amt decimal(18,4);
    declare v_acco_avail_amt decimal(18,4);
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_acco_curr_amt_diff decimal(18,4);
    declare v_acco_avail_amt_diff decimal(18,4);
    declare v_sys_avail_amt_diff decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
    declare v_tmp_deal_flag int;
    declare v_tmp_remark_info varchar(255);
    declare v_tmp_oper_remark_info varchar(255);
    declare v_tmp_exch_group_no_str varchar(2048);
    declare v_tmp_weight_value_str varchar(255);
    declare v_tmp_acco_avail_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_auth_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_tmp_amt_check_diff decimal(18,4);
    declare v_tmp_acco_total_rece_amt_diff decimal(18,4);
    declare v_tmp_acco_total_payab_amt_diff decimal(18,4);
    declare v_total_weight_value decimal(18,4);
    declare v_weight_value decimal(18,4);
    declare v_dist_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_asac_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_shsz_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_sync_capital_way = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_acco_curr_amt = 0;
    SET v_acco_avail_amt = 0;
    SET v_out_curr_amt = 0;
    SET v_out_enable_amt = 0;
    SET v_acco_curr_amt_diff = 0;
    SET v_acco_avail_amt_diff = 0;
    SET v_sys_avail_amt_diff = 0;
    SET v_total_payab_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_out_total_payab_amt = 0;
    SET v_out_total_rece_amt = 0;
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_tmp_deal_flag = 0;
    SET v_tmp_remark_info = " ";
    SET v_tmp_oper_remark_info = " ";
    SET v_tmp_exch_group_no_str = " ";
    SET v_tmp_weight_value_str = " ";
    SET v_tmp_acco_avail_amt = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_auth_amt = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_tmp_occur_amt = 0;
    SET v_tmp_amt_check_diff = 0;
    SET v_tmp_acco_total_rece_amt_diff = 0;
    SET v_tmp_acco_total_payab_amt_diff = 0;
    SET v_total_weight_value = 0;
    SET v_weight_value = 0;
    SET v_dist_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_asac_avail_amt = 0;
    SET v_hk_avail_amt = 0;
    SET v_shsz_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* set @同步资金方式#=cast(substring(@业务控制配置串#, 20, 1) as SIGNED); */
    set v_sync_capital_way=cast(substring(v_busi_config_str, 20, 1) as SIGNED);

    /* set @同步累计应收应付# =《同步累计应收应付-不同步》; */
    set v_sync_total_rece_payab =0;

    /* [锁定获取表记录变量][产品证券_资金_内外资产账户资金差异表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_acco_curr_amt, 
        v_acco_avail_amt, v_out_curr_amt, v_out_enable_amt, v_acco_curr_amt_diff, 
        v_acco_avail_amt_diff, v_sys_avail_amt_diff, v_total_payab_amt, v_total_rece_amt, 
        v_out_total_payab_amt, v_out_total_rece_amt, v_acco_total_payab_amt_diff, v_acco_total_rece_amt_diff, 
        v_deal_flag, v_asset_sync_flag, v_remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.10.20.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @临时_处理标志# = @处理标志#; */
    set v_tmp_deal_flag = v_deal_flag;

    /* set @临时_备注信息# = @备注信息#; */
    set v_tmp_remark_info = v_remark_info;

    /* set @临时_操作备注#=@操作备注#; */
    set v_tmp_oper_remark_info=v_oper_remark_info;

    /* set @临时_交易组编号串#=@交易组编号串#; */
    set v_tmp_exch_group_no_str=v_exch_group_no_str;

    /* set @临时_权重串#=@权重串#; */
    set v_tmp_weight_value_str=v_weight_value_str;

    /* set @临时_账户可用金额#=@账户可用金额#; */
    set v_tmp_acco_avail_amt=v_acco_avail_amt;

    /* [检查报错返回][@处理标志# = 《处理标志-已处理》][14][@处理标志#] */
    if v_deal_flag = 1 then
        
        SET v_error_code = "pdsecuA.10.20.14";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("处理标志=",v_deal_flag),"#",v_mysql_message);
        else
            SET v_error_info = concat("处理标志=",v_deal_flag);
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][@资产是否同步#=《资产是否同步-不同步资金不同步持仓》 or  @资产是否同步#=《资产是否同步-不同步资金同步持仓》] */
    if v_asset_sync_flag=2 or  v_asset_sync_flag=4 then
        leave label_pro;
    end if;


    /* set @变动金额#=@账户当前金额差额#; */
    set v_occur_amt=v_acco_curr_amt_diff;

    /* set @金额核对差额#=@账户可用金额差额#; */
    set v_amt_check_diff=v_acco_avail_amt_diff;

    /* set @处理标志# = 《处理标志-已处理》; */
    set v_deal_flag = 1;

    /* if @处理信息#=" " then */
    if v_deal_info=" " then

        /* set @备注信息#="数据已成功同步！"; */
        set v_remark_info="数据已成功同步！";
    else

        /* set @备注信息#=@处理信息#; */
        set v_remark_info=v_deal_info;
    end if;

    /* if @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
    if v_sync_total_rece_payab = 0  then

          /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");

    /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
    elseif v_sync_total_rece_payab = 1  then

          /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额","|","累计应收应付差额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额","|","累计应收应付差额");
    end if;

    /* if @变动金额# > 0 then */
    if v_occur_amt > 0 then

        /* set @业务标志#=《业务标志-同步资金蓝补》; */
        set v_busi_flag=1003004;
    else

        /* set @业务标志#=《业务标志-同步资金红冲》; */
        set v_busi_flag=1003003;
    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* if (@变动金额# <> 0 or @账户可用金额差额# <> 0 or (@变动金额#=0 and @账户可用金额差额#=0) or @账户累计应收金额差额# <> 0 or @账户累计应付金额差额# <> 0) then */
    if (v_occur_amt <> 0 or v_acco_avail_amt_diff <> 0 or (v_occur_amt=0 and v_acco_avail_amt_diff=0) or v_acco_total_rece_amt_diff <> 0 or v_acco_total_payab_amt_diff <> 0) then

        /* set @授权金额# = 0; */
        set v_auth_amt = 0;

        /* set @期初金额# = 0; */
        set v_begin_amt = 0;

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @解冻金额# = 0; */
        set v_unfroz_amt = 0;

        /* set @待交收金额# = 0; */
        set v_pre_settle_amt = 0;

        /* set @沪深可用调整金额# = 0; */
        set v_shsz_avail_change_amt = 0;

        /* set @港股通可用调整金额# = 0; */
        set v_hk_avail_change_amt = 0;

        /* set @T日当日港股买入金额#=0; */
        set v_T_hk_buy_total_amt=0;

        /* set @T日当日港股卖出金额#=0; */
        set v_T_hk_sell_total_amt=0;

        /* set @T1日当日港股买入金额#=0; */
        set v_T1_hk_buy_total_amt=0;

        /* set @T1日当日港股卖出金额#=0; */
        set v_T1_hk_sell_total_amt=0;

        /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
        if  v_sync_total_rece_payab = 0  then

             /* set @累计应收金额# = 0; */
             set v_total_rece_amt = 0;

             /* set @累计应付金额# = 0; */
             set v_total_payab_amt = 0;

        /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
        elseif v_sync_total_rece_payab = 1  then

             /* set @累计应收金额# = @账户累计应收金额差额#; */
             set v_total_rece_amt = v_acco_total_rece_amt_diff;

             /* set @累计应付金额# = @账户累计应付金额差额#; */
             set v_total_payab_amt = v_acco_total_payab_amt_diff;
        end if;

        /* set @红冲蓝补金额# = 0; */
        set v_total_change_amt = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利率# = 0; */
        set v_intrst_rate = 0;

        /* set @利息积数# = 0; */
        set v_intrst_base_amt = 0;

        /* set @待入账利息# = 0; */
        set v_pre_entry_intrst_amt = 0;

        /* set @本币币种#="CNY"; */
        set v_crncy_type="CNY";
    #记录账户总的差额，方便交易组按权重值分配

        /* set @临时_变动金额#=@变动金额#; */
        set v_tmp_occur_amt=v_occur_amt;

        /* set @临时_金额核对差额#=@金额核对差额#; */
        set v_tmp_amt_check_diff=v_amt_check_diff;

        /* set @临时_账户累计应收金额差额#=0; */
        set v_tmp_acco_total_rece_amt_diff=0;

        /* set @临时_账户累计应付金额差额#=0; */
        set v_tmp_acco_total_payab_amt_diff=0;

        /* if @交易组编号#<>0 then */
        if v_exch_group_no<>0 then

            /* 调用【原子_产品证券_资金运维_处理交易组差异记录】*/
            call db_pdsecu.pra_pdsecabk_DealExgpCapitalDiff(
                v_opor_co_no,
                v_opor_no,
                v_oper_mac,
                v_oper_ip_addr,
                v_oper_info,
                v_oper_way,
                v_func_code,
                v_oper_remark_info,
                v_menu_no,
                v_init_date,
                v_co_no,
                v_pd_no,
                v_asset_acco_no,
                v_exch_group_no,
                v_occur_amt,
                v_sync_capital_way,
                v_busi_flag,
                v_amt_check_diff,
                v_acco_total_payab_amt_diff,
                v_acco_total_rece_amt_diff,
                v_sync_total_rece_payab,
                v_error_code,
                v_error_info);
            if v_error_code = "1" then
                SET v_error_code = "pdsecuA.10.20.999";
                if v_mysql_message <> "" then
                     SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理交易组差异记录出现错误！',v_mysql_message);
                end if;
                leave label_pro;
            elseif v_error_code <> "0" then
                leave label_pro;
            end if;

        else
            #先计算总权重

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

            /* if @总权重#=0 then */
            if v_total_weight_value=0 then

                /* set @交易组编号#=@默认交易组编号#; */
                set v_exch_group_no=v_default_exch_group_no;

                /* 调用【原子_产品证券_资金运维_处理交易组差异记录】*/
                call db_pdsecu.pra_pdsecabk_DealExgpCapitalDiff(
                    v_opor_co_no,
                    v_opor_no,
                    v_oper_mac,
                    v_oper_ip_addr,
                    v_oper_info,
                    v_oper_way,
                    v_func_code,
                    v_oper_remark_info,
                    v_menu_no,
                    v_init_date,
                    v_co_no,
                    v_pd_no,
                    v_asset_acco_no,
                    v_exch_group_no,
                    v_occur_amt,
                    v_sync_capital_way,
                    v_busi_flag,
                    v_amt_check_diff,
                    v_acco_total_payab_amt_diff,
                    v_acco_total_rece_amt_diff,
                    v_sync_total_rece_payab,
                    v_error_code,
                    v_error_info);
                if v_error_code = "1" then
                    SET v_error_code = "pdsecuA.10.20.999";
                    if v_mysql_message <> "" then
                         SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理交易组差异记录出现错误！',v_mysql_message);
                    end if;
                    leave label_pro;
                elseif v_error_code <> "0" then
                    leave label_pro;
                end if;

            else

                /* set @交易组编号串#=@临时_交易组编号串#; */
                set v_exch_group_no_str=v_tmp_exch_group_no_str;

                /* set @权重串#=@临时_权重串#; */
                set v_weight_value_str=v_tmp_weight_value_str;
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

                        /* set @金额核对差额#=round(@临时_金额核对差额#*@权重值#/@总权重#,2); */
                        set v_amt_check_diff=round(v_tmp_amt_check_diff*v_weight_value/v_total_weight_value,2);

                        /* set @账户累计应收金额差额#=round(@临时_账户累计应收金额差额#*@权重值#/@总权重#,2); */
                        set v_acco_total_rece_amt_diff=round(v_tmp_acco_total_rece_amt_diff*v_weight_value/v_total_weight_value,2);

                        /* set @账户累计应付金额差额#=round(@临时_账户累计应付金额差额#*@权重值#/@总权重#,2); */
                        set v_acco_total_payab_amt_diff=round(v_tmp_acco_total_payab_amt_diff*v_weight_value/v_total_weight_value,2);

                        /* 调用【原子_产品证券_资金运维_处理交易组差异记录】*/
                        call db_pdsecu.pra_pdsecabk_DealExgpCapitalDiff(
                            v_opor_co_no,
                            v_opor_no,
                            v_oper_mac,
                            v_oper_ip_addr,
                            v_oper_info,
                            v_oper_way,
                            v_func_code,
                            v_oper_remark_info,
                            v_menu_no,
                            v_init_date,
                            v_co_no,
                            v_pd_no,
                            v_asset_acco_no,
                            v_exch_group_no,
                            v_occur_amt,
                            v_sync_capital_way,
                            v_busi_flag,
                            v_amt_check_diff,
                            v_acco_total_payab_amt_diff,
                            v_acco_total_rece_amt_diff,
                            v_sync_total_rece_payab,
                            v_error_code,
                            v_error_info);
                        if v_error_code = "1" then
                            SET v_error_code = "pdsecuA.10.20.999";
                            if v_mysql_message <> "" then
                                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品证券_资金运维_处理交易组差异记录出现错误！',v_mysql_message);
                            end if;
                            leave label_pro;
                        elseif v_error_code <> "0" then
                            leave label_pro;
                        end if;

                    end if;

                    /* if @权重串#=";" then */
                    if v_weight_value_str=";" then
                        leave loop_label;
                    end if;
                end loop;
            end if;
        end if;

        /* set @分配金额# = 0; */
        set v_dist_amt = 0;

        /* set @金额核对差额#=@临时_金额核对差额#; */
        set v_amt_check_diff=v_tmp_amt_check_diff;

        /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
        if  v_sync_total_rece_payab = 0  then

            /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#][1][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                asset_acco_no, crncy_type, begin_amt, curr_amt, 
                frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
                hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
                T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
                total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
                pre_entry_intrst_amt) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
                v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, v_shsz_avail_change_amt, 
                v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, 
                v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, v_total_payab_amt, 
                v_total_change_amt, v_realize_pandl, v_intrst_rate, v_intrst_base_amt, 
                v_pre_entry_intrst_amt) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.20.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


        /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
        elseif v_sync_total_rece_payab = 1  then

            /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{累计应付金额}= {累计应付金额} + @账户累计应付金额差额#,{累计应收金额}={累计应收金额}+@账户累计应收金额差额#][1][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit (
                create_date, create_time, update_date, 
                update_time, update_times, co_no, pd_no, 
                asset_acco_no, crncy_type, begin_amt, curr_amt, 
                frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
                hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
                T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
                total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
                pre_entry_intrst_amt) 
            values(
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_co_no, v_pd_no, 
                v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
                v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, v_shsz_avail_change_amt, 
                v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, v_T_hk_sell_total_amt, 
                v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, v_total_payab_amt, 
                v_total_change_amt, v_realize_pandl, v_intrst_rate, v_intrst_base_amt, 
                v_pre_entry_intrst_amt) 
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_payab_amt= total_payab_amt + v_acco_total_payab_amt_diff,total_rece_amt=total_rece_amt+v_acco_total_rece_amt_diff;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.20.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;

       #累计应收应付 记2笔流水。

            /* [获取表记录变量][产品证券_资金_资产账户资金表][{累计应收金额},{累计应付金额}][@累计应收金额#,@累计应付金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
            select total_rece_amt,total_payab_amt into v_total_rece_amt,v_total_payab_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.10.20.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


            /* set @操作备注#=concat(@临时_操作备注#,"|","累计应付差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应付差额");

            /* set @变动金额#=@账户累计应付金额差额#; */
            set v_occur_amt=v_acco_total_payab_amt_diff;

            /* set @变动后金额#=@累计应付金额#; */
            set v_occur_end_amt=v_total_payab_amt;

            /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, crncy_type, busi_flag, 
                occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
                v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.20.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* set @操作备注#=concat(@临时_操作备注#,"|","累计应收差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应收差额");

            /* set @变动金额#=@账户累计应收金额差额#; */
            set v_occur_amt=v_acco_total_rece_amt_diff;

            /* set @变动后金额#=@累计应收金额#; */
            set v_occur_end_amt=v_total_rece_amt;

            /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_asac_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, crncy_type, busi_flag, 
                occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
                oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
                v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
                v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.20.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;

        end if;

        /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
        set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");

        /* set @变动金额#=@账户当前金额差额#; */
        set v_occur_amt=v_acco_curr_amt_diff;

        /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额}+{金额核对差额},{当前金额},{当前金额},{当前金额}-{冻结金额}+{解冻金额}+{金额核对差额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@资产账户可用金额#,@变动后金额#,@账户当前金额#,@账户可用金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select curr_amt+amt_check_diff,curr_amt,curr_amt,curr_amt-frozen_amt+unfroz_amt+amt_check_diff,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_asac_avail_amt,v_occur_end_amt,v_acco_curr_amt,v_acco_avail_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.10.20.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_asac_capit_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, crncy_type, busi_flag, 
            occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
            v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.20.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;

        #获取交易库中的可用金额

        /* set @港股可用金额#=0; */
        set v_hk_avail_amt=0;

        /* set @沪深可用金额#=0; */
        set v_shsz_avail_amt=0;

        /* set @静态可用金额#=0; */
        set v_static_avail_amt=0;

        /* set @可用金额#=0; */
        set v_avail_amt=0;

        /* [获取表记录变量语句][产品证券_资金_交易资产账户资金表][{港股可用金额},{沪深可用金额},{静态可用金额}][@港股可用金额#,@沪深可用金额#,@静态可用金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select hk_avail_amt,shsz_avail_amt,static_avail_amt into v_hk_avail_amt,v_shsz_avail_amt,v_static_avail_amt from db_pdsecu.tb_pdseca_trd_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


        /* if @同步资金方式#=0 then */
        if v_sync_capital_way=0 then

                /* set @可用金额#=@账户可用金额#; */
                set v_avail_amt=v_acco_avail_amt;
        else

                /* set @账户可用金额#=@资产账户可用金额#; */
                set v_acco_avail_amt=v_asac_avail_amt;
        end if;

        /* set @操作备注#=concat(@临时_操作备注#,"|","可用金额差额"); */
        set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","可用金额差额");

        /* set @变动金额#=@金额核对差额#; */
        set v_occur_amt=v_amt_check_diff;

        /* set @变动后金额#=@账户可用金额#; */
        set v_occur_end_amt=v_acco_avail_amt;

        /* [插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdsecu.tb_pdseca_asac_capit_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, crncy_type, busi_flag, 
            occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_crncy_type, v_busi_flag, 
            v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.20.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* set @变动金额#=@账户当前金额差额#; */
        set v_occur_amt=v_acco_curr_amt_diff;

        /* set @账户当前金额差额# = @外部当前金额# - @账户当前金额#; */
        set v_acco_curr_amt_diff = v_out_curr_amt - v_acco_curr_amt;

        /* set @账户可用金额差额# = round(@外部可用金额# - @账户可用金额#-@账户当前金额差额#,2); */
        set v_acco_avail_amt_diff = round(v_out_enable_amt - v_acco_avail_amt-v_acco_curr_amt_diff,2);
    #增加{系统可用金额差额} 不更新，留记录。
       #set @系统可用金额差额# = @外部可用金额# - @账户可用金额#;

        /* set @账户累计应收金额差额# = @外部累计应收金额# - @资产账户累计应收金额#; */
        set v_acco_total_rece_amt_diff = v_out_total_rece_amt - v_asac_total_rece_amt;

        /* set @账户累计应付金额差额# = @外部累计应付金额# - @资产账户累计应付金额#; */
        set v_acco_total_payab_amt_diff = v_out_total_payab_amt - v_asac_total_payab_amt;

        /* if @账户当前金额差额#<>0 then */
        if v_acco_curr_amt_diff<>0 then

            /* set  @处理标志# = @临时_处理标志#; */
            set  v_deal_flag = v_tmp_deal_flag;

            /* set  @备注信息# = @临时_备注信息#; */
            set  v_remark_info = v_tmp_remark_info;
        end if;
    end if;

    /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
    if  v_sync_total_rece_payab = 0  then

        /* [更新表记录][产品证券_资金_内外资产账户资金差异表][{账户当前金额}=@账户当前金额#,{账户可用金额}=@账户可用金额#,{账户当前金额差额}=@账户当前金额差额#,{账户可用金额差额}=@账户可用金额差额#,{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdseca_asac_capit_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_amt=v_acco_curr_amt,acco_avail_amt=v_acco_avail_amt,acco_curr_amt_diff=v_acco_curr_amt_diff,acco_avail_amt_diff=v_acco_avail_amt_diff,deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.20.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;


    /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
    elseif v_sync_total_rece_payab = 1  then

        /* [更新表记录][产品证券_资金_内外资产账户资金差异表][{账户当前金额}=@账户当前金额#,{账户可用金额}=@账户可用金额#,{账户当前金额差额}=@账户当前金额差额#,{账户可用金额差额}=@账户可用金额差额#,{累计应付金额}=@资产账户累计应付金额#,{累计应收金额}=@资产账户累计应收金额#,{账户累计应收金额差额}=@账户累计应收金额差额#,{账户累计应付金额差额}=@账户累计应付金额差额#,{处理标志}=@处理标志#,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_pdsecu.tb_pdseca_asac_capit_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_amt=v_acco_curr_amt,acco_avail_amt=v_acco_avail_amt,acco_curr_amt_diff=v_acco_curr_amt_diff,acco_avail_amt_diff=v_acco_avail_amt_diff,total_payab_amt=v_asac_total_payab_amt,total_rece_amt=v_asac_total_rece_amt,acco_total_rece_amt_diff=v_acco_total_rece_amt_diff,acco_total_payab_amt_diff=v_acco_total_payab_amt_diff,deal_flag=v_deal_flag,remark_info=v_remark_info where row_id=v_row_id;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.10.20.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
            else
                SET v_error_info = concat("记录序号=",v_row_id);
            end if;
            leave label_pro;
        end if;

    end if;
    #把资产账户级的差额 返回给产品级。

    /* set @账户累计应收金额差额#=@临时_账户累计应收金额差额#; */
    set v_acco_total_rece_amt_diff=v_tmp_acco_total_rece_amt_diff;

    /* set @账户累计应付金额差额#=@临时_账户累计应付金额差额#; */
    set v_acco_total_payab_amt_diff=v_tmp_acco_total_payab_amt_diff;
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

# 原子_产品证券_资金运维_处理交易组差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_DealExgpCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_DealExgpCapitalDiff(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_asset_acco_no int,
    IN p_exch_group_no int,
    IN p_occur_amt decimal(18,4),
    IN p_sync_capital_way int,
    IN p_busi_flag int,
    IN p_amt_check_diff decimal(18,4),
    IN p_acco_total_payab_amt_diff decimal(18,4),
    IN p_acco_total_rece_amt_diff decimal(18,4),
    IN p_sync_total_rece_payab int,
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
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_sync_capital_way int;
    declare v_busi_flag int;
    declare v_amt_check_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
    declare v_acco_total_rece_amt_diff decimal(18,4);
    declare v_sync_total_rece_payab int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_tmp_oper_remark_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_tmp_avail_amt decimal(18,4);
    declare v_exgp_avail_amt decimal(18,4);
    declare v_exgp_cash_id bigint;
    declare v_exgp_begin_amt decimal(18,4);
    declare v_exgp_curr_amt decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exgp_pre_settle_amt decimal(18,4);
    declare v_exgp_shsz_avail_change_amt decimal(18,4);
    declare v_exgp_amt_check_diff decimal(18,4);
    declare v_exgp_hk_avail_change_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exgp_realize_pandl decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_exgp_T_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T_hk_sell_total_amt decimal(18,4);
    declare v_exgp_T1_hk_buy_total_amt decimal(18,4);
    declare v_exgp_T1_hk_sell_total_amt decimal(18,4);
    declare v_exch_group_update_times int;
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_occur_amt = p_occur_amt;
    SET v_sync_capital_way = p_sync_capital_way;
    SET v_busi_flag = p_busi_flag;
    SET v_amt_check_diff = p_amt_check_diff;
    SET v_acco_total_payab_amt_diff = p_acco_total_payab_amt_diff;
    SET v_acco_total_rece_amt_diff = p_acco_total_rece_amt_diff;
    SET v_sync_total_rece_payab = p_sync_total_rece_payab;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_tmp_oper_remark_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_tmp_occur_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_tmp_avail_amt = 0;
    SET v_exgp_avail_amt = 0;
    SET v_exgp_cash_id = 0;
    SET v_exgp_begin_amt = 0;
    SET v_exgp_curr_amt = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exgp_pre_settle_amt = 0;
    SET v_exgp_shsz_avail_change_amt = 0;
    SET v_exgp_amt_check_diff = 0;
    SET v_exgp_hk_avail_change_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exgp_realize_pandl = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_exgp_T_hk_buy_total_amt = 0;
    SET v_exgp_T_hk_sell_total_amt = 0;
    SET v_exgp_T1_hk_buy_total_amt = 0;
    SET v_exgp_T1_hk_sell_total_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_avail_amt = 0;

    
    label_pro:BEGIN
    

        /* set @临时_操作备注#="系统自动同步外部资金数据！"; */
        set v_tmp_oper_remark_info="系统自动同步外部资金数据！";

        /* set @期初金额# = 0; */
        set v_begin_amt = 0;

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @解冻金额# = 0; */
        set v_unfroz_amt = 0;

        /* set @待交收金额# = 0; */
        set v_pre_settle_amt = 0;

        /* set @沪深可用调整金额# = 0; */
        set v_shsz_avail_change_amt = 0;

        /* set @港股通可用调整金额# = 0; */
        set v_hk_avail_change_amt = 0;

        /* set @T日当日港股买入金额#=0; */
        set v_T_hk_buy_total_amt=0;

        /* set @T日当日港股卖出金额#=0; */
        set v_T_hk_sell_total_amt=0;

        /* set @T1日当日港股买入金额#=0; */
        set v_T1_hk_buy_total_amt=0;

        /* set @T1日当日港股卖出金额#=0; */
        set v_T1_hk_sell_total_amt=0;

        /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
        if  v_sync_total_rece_payab = 0  then

             /* set @累计应收金额# = 0; */
             set v_total_rece_amt = 0;

             /* set @累计应付金额# = 0; */
             set v_total_payab_amt = 0;

        /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
        elseif v_sync_total_rece_payab = 1  then

             /* set @累计应收金额# = @账户累计应收金额差额#; */
             set v_total_rece_amt = v_acco_total_rece_amt_diff;

             /* set @累计应付金额# = @账户累计应付金额差额#; */
             set v_total_payab_amt = v_acco_total_payab_amt_diff;
        end if;

        /* set @红冲蓝补金额# = 0; */
        set v_total_change_amt = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利率# = 0; */
        set v_intrst_rate = 0;

        /* set @利息积数# = 0; */
        set v_intrst_base_amt = 0;

        /* set @待入账利息# = 0; */
        set v_pre_entry_intrst_amt = 0;

        /* set @本币币种#="CNY"; */
        set v_crncy_type="CNY";

        /* set @临时_变动金额#=@变动金额#; */
        set v_tmp_occur_amt=v_occur_amt;

            /* set @操作菜单#=@菜单编号#; */
            set v_oper_menu_no=v_menu_no;

            /* set @操作功能#=@功能编码#; */
            set v_oper_func_code=v_func_code;
    #4条流水，一条 当前金额，一条 可用金额。有同步累计应收应付时，总共计4条。

            /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
            if  v_sync_total_rece_payab = 0  then

                  /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
                  set v_create_date = date_format(curdate(),'%Y%m%d');
                  set v_create_time = date_format(curtime(),'%H%i%s');
                  set v_update_date = v_create_date;
                  set v_update_time = v_create_time;
                  set v_update_times = 1;
                  insert into db_pdsecu.tb_pdseca_exgp_capit (
                      create_date, create_time, update_date, 
                      update_time, update_times, co_no, pd_no, 
                      asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                      curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
                      shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
                      T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
                      total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
                      intrst_base_amt, pre_entry_intrst_amt) 
                  values(
                      v_create_date, v_create_time, v_update_date, 
                      v_update_time, v_update_times, v_co_no, v_pd_no, 
                      v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                      v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
                      v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
                      v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
                      v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
                      v_intrst_base_amt, v_pre_entry_intrst_amt) 
                  ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff;
                  if v_error_code = "1" then
                              
                      SET v_error_code = "pdsecuA.10.21.1";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                      end if;
                      leave label_pro;
                  end if;


            /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
            elseif v_sync_total_rece_payab = 1  then

                  /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{累计应付金额}= {累计应付金额} + @账户累计应付金额差额#,{累计应收金额}={累计应收金额}+@账户累计应收金额差额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
                  set v_create_date = date_format(curdate(),'%Y%m%d');
                  set v_create_time = date_format(curtime(),'%H%i%s');
                  set v_update_date = v_create_date;
                  set v_update_time = v_create_time;
                  set v_update_times = 1;
                  insert into db_pdsecu.tb_pdseca_exgp_capit (
                      create_date, create_time, update_date, 
                      update_time, update_times, co_no, pd_no, 
                      asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                      curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
                      shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
                      T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
                      total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
                      intrst_base_amt, pre_entry_intrst_amt) 
                  values(
                      v_create_date, v_create_time, v_update_date, 
                      v_update_time, v_update_times, v_co_no, v_pd_no, 
                      v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                      v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
                      v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
                      v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
                      v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
                      v_intrst_base_amt, v_pre_entry_intrst_amt) 
                  ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_payab_amt= total_payab_amt + v_acco_total_payab_amt_diff,total_rece_amt=total_rece_amt+v_acco_total_rece_amt_diff;
                  if v_error_code = "1" then
                              
                      SET v_error_code = "pdsecuA.10.21.1";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                      end if;
                      leave label_pro;
                  end if;


                  /* [获取表记录变量][产品证券_资金_交易组资金表][{累计应收金额},{累计应付金额}][@累计应收金额#,@累计应付金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
                  select total_rece_amt,total_payab_amt into v_total_rece_amt,v_total_payab_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
                  if FOUND_ROWS() = 0 then
                              
                      SET v_error_code = "pdsecuA.10.21.4";
                      if v_mysql_message <> "" then
                          SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                      else
                          SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                      end if;
                      leave label_pro;
                  end if;


                  /* set @操作备注#=concat(@临时_操作备注#,"|","累计应付差额"); */
                  set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应付差额");

                  /* set @变动金额#=@账户累计应付金额差额#; */
                  set v_occur_amt=v_acco_total_payab_amt_diff;

                  /* set @变动后金额#=@累计应付金额#; */
                  set v_occur_end_amt=v_total_payab_amt;

                 /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                     create_date, create_time, update_date, 
                     update_time, update_times, opor_co_no, opor_no, 
                     oper_mac, oper_ip_addr, oper_info, oper_way, 
                     oper_menu_no, oper_func_code, init_date, co_no, 
                     pd_no, asset_acco_no, exch_group_no, crncy_type, 
                     busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                     jour_after_occur_info, oper_remark_info) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                     v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                     v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                     v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                     v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                     v_jour_after_occur_info, v_oper_remark_info);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pdsecuA.10.21.5";
                     SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                     leave label_pro;
                 end if;


                 /* set @操作备注#=concat(@临时_操作备注#,"|","累计应收差额"); */
                 set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应收差额");

                 /* set @变动金额#=@账户累计应收金额差额#; */
                 set v_occur_amt=v_acco_total_rece_amt_diff;

                 /* set @变动后金额#=@累计应收金额#; */
                 set v_occur_end_amt=v_total_rece_amt;

                 /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
                 set v_create_date = date_format(curdate(),'%Y%m%d');
                 set v_create_time = date_format(curtime(),'%H%i%s');
                 set v_update_date = v_create_date;
                 set v_update_time = v_create_time;
                 set v_update_times = 1;
                 insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                     create_date, create_time, update_date, 
                     update_time, update_times, opor_co_no, opor_no, 
                     oper_mac, oper_ip_addr, oper_info, oper_way, 
                     oper_menu_no, oper_func_code, init_date, co_no, 
                     pd_no, asset_acco_no, exch_group_no, crncy_type, 
                     busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                     jour_after_occur_info, oper_remark_info) 
                 value( 
                     v_create_date, v_create_time, v_update_date, 
                     v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                     v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                     v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                     v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                     v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                     v_jour_after_occur_info, v_oper_remark_info);
                 if v_error_code = "1" then
                             
                     SET v_error_code = "pdsecuA.10.21.5";
                     SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                     leave label_pro;
                 end if;

            end if;

            /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");

            /* set @变动金额#=@临时_变动金额#; */
            set v_occur_amt=v_tmp_occur_amt;

            /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}+{金额核对差额},{当前金额}-{冻结金额}+{解冻金额}+{金额核对差额},{当前金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@临时_可用金额#,@交易组可用金额#,@变动后金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
            select curr_amt+amt_check_diff,curr_amt-frozen_amt+unfroz_amt+amt_check_diff,curr_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_tmp_avail_amt,v_exgp_avail_amt,v_occur_end_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.10.21.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


            /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, exch_group_no, crncy_type, 
                busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                jour_after_occur_info, oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                v_jour_after_occur_info, v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.21.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;


            /* set @操作备注#=concat(@临时_操作备注#,"|","可用金额差额"); */
            set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","可用金额差额");

            /* set @变动金额#=@金额核对差额#; */
            set v_occur_amt=v_amt_check_diff;

            /* set @可用金额#=0; */
            set v_avail_amt=0;
        #同步资金方式为0表示同步可用金额,为1表示同步资金余额

            /* if @同步资金方式#=0 then */
            if v_sync_capital_way=0 then

                /* set @可用金额#=@交易组可用金额#; */
                set v_avail_amt=v_exgp_avail_amt;
            else

                /* set @可用金额#=@临时_可用金额#; */
                set v_avail_amt=v_tmp_avail_amt;
            end if;

            /* set @变动后金额#=@可用金额#; */
            set v_occur_end_amt=v_avail_amt;

            /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
            set v_create_date = date_format(curdate(),'%Y%m%d');
            set v_create_time = date_format(curtime(),'%H%i%s');
            set v_update_date = v_create_date;
            set v_update_time = v_create_time;
            set v_update_times = 1;
            insert into db_pdsecu.tb_pdseca_exgp_capit_jour(
                create_date, create_time, update_date, 
                update_time, update_times, opor_co_no, opor_no, 
                oper_mac, oper_ip_addr, oper_info, oper_way, 
                oper_menu_no, oper_func_code, init_date, co_no, 
                pd_no, asset_acco_no, exch_group_no, crncy_type, 
                busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
                jour_after_occur_info, oper_remark_info) 
            value( 
                v_create_date, v_create_time, v_update_date, 
                v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
                v_busi_flag, v_occur_amt, v_occur_end_amt, v_jour_occur_field, 
                v_jour_after_occur_info, v_oper_remark_info);
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.10.21.5";
                SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                leave label_pro;
            end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QueryExgpCapital(
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
    

    /* [获取表记录][产品证券_资金_交易组资金表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where (v_co_no=0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_查询通道内外资金差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QueryChannelCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QueryChannelCapitalDiff(
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
    

    /* [获取表记录][产品证券_资金_内外资产账户资金差异表][字段][(@机构编号串#="; ;" or instr(@机构编号串#, concat(";",{机构编号},";"))>0) and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前金额差额}<>0 or {账户可用金额差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前金额差额}=0 and {账户可用金额差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and ((@金额区间最小#=0 and @金额区间最大#=0) or ({系统可用金额差额} between @金额区间最小# and @金额区间最大#)) and (@查询通道编号#=0 or {通道编号} like concat(@查询通道编号#,"%")) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and ((v_min_amt=0 and v_max_amt=0) or (sys_avail_amt_diff between v_min_amt and v_max_amt)) and (v_query_pass_no=0 or pass_no like concat(v_query_pass_no,"%")) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where (v_co_no_str="; ;" or instr(v_co_no_str, concat(";",co_no,";"))>0) and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and ((v_min_amt=0 and v_max_amt=0) or (sys_avail_amt_diff between v_min_amt and v_max_amt)) and (v_query_pass_no=0 or pass_no like concat(v_query_pass_no,"%")) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    #SELECT a.{机构编号},a.{产品编号},a.{资产账户编号},a.{本币币种},a.{期初金额},a.{当前金额},a.{冻结金额},a.{解冻金额},a.{待交收金额},a.{沪深可用调整金额},a.{港股通可用调整金额},a.{金额核对差额},b.{记录序号},b.{初始化日期},b.{交易组编号},b.{通道编号},b.{外部账号},b.{账户当前金额},b.{账户可用金额},b.{外部当前金额},b.{外部可用金额},b.{系统可用金额差额},b.{账户当前金额差额},b.{账户可用金额差额},b.{处理标志},b.{资产是否同步},b.{备注信息}  FROM ~产品证券_资金_资产账户资金表^ a  LEFT JOIN ~产品证券_资金_内外资产账户资金差异表^ b  ON a.{机构编号}=b.{机构编号} AND a.{产品编号}=b.{产品编号} AND a.{资产账户编号}=b.{资产账户编号} AND a.{本币币种}=b.{本币币种}  WHERE (@机构编号串#="; ;" or instr(@机构编号串#, concat(";",a.{机构编号},";"))>0) AND (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",a.{产品编号},";"))>0) AND (@资产账户编号#=0 or a.{资产账户编号}=@资产账户编号#) AND (@通道编号#=0 or b.{通道编号}=@通道编号#) and (@外部账号#=" " or b.{外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",b.{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and (b.{账户当前金额差额}<>0 or b.{账户可用金额差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and (b.{账户当前金额差额}=0 and b.{账户可用金额差额}=0))) AND (@资产是否同步#=0 or b.{资产是否同步}=@资产是否同步#) AND ((@金额区间最小#=0 and @金额区间最大#=0) or (b.{系统可用金额差额} BETWEEN @金额区间最小# AND @金额区间最大#)) AND (@查询通道编号#=0 or b.{通道编号} like concat(@查询通道编号#,"%"));
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_重置内部证券资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_ResetInSecuCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_ResetInSecuCapital(
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
    SET v_init_date = p_init_date;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* if @查询记录序号# = 0  then */
    if v_query_row_id = 0  then

        /* truncate table ~产品证券_资金_内部资产账户资金核对表^; */
        truncate table db_pdsecu.tb_pdseca_asac_capit_check;
        #insert into ~产品证券_资金_内部资产账户资金核对表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{当前金额},{可用金额},{可用金额计算标志})  select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,a.{机构编号},a.{产品编号},a.{资产账户编号},a.{当前金额},0,《可用金额计算标志-未计算》 from ~产品证券_资金_资产账户资金表^ a where (a.{机构编号},a.{产品编号},a.{资产账户编号}) not in (select {机构编号},{产品编号},{资产账户编号}  from ~产品证券_资金_外部资产账户资金表^ where {初始化日期}=@初始化日期#)   and (a.{当前金额}<>0 or a.{待交收金额}<>0 or (a.{港股通可用调整金额}+a.{金额核对差额}<>0) or (a.{沪深可用调整金额}-a.{冻结金额}+a.{解冻金额}+a.{金额核对差额}<>0) or IFNULL((select b.{沪深可用金额}+b.{港股可用金额}+b.{静态可用金额} from ~产品证券_资金_交易资产账户资金表^ b where b.{机构编号}=a.{机构编号} and b.{产品编号}=a.{产品编号} and b.{资产账户编号}=a.{资产账户编号}),0)<>0)  order by a.{机构编号},a.{产品编号},a.{资产账户编号};

        /* insert into ~产品证券_资金_内部资产账户资金核对表^  ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{当前金额},{可用金额},{可用金额计算标志})  select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,a.{机构编号},a.{产品编号},a.{资产账户编号},a.{当前金额},0,《可用金额计算标志-未计算》 from ~产品证券_资金_资产账户资金表^ a where (a.{机构编号},a.{产品编号},a.{资产账户编号}) not in (select {机构编号},{产品编号},{资产账户编号}  from ~产品证券_资金_外部资产账户资金表^ where {初始化日期}=@初始化日期#)   order by a.{机构编号},a.{产品编号},a.{资产账户编号}; */
        insert into db_pdsecu.tb_pdseca_asac_capit_check  (create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,curr_amt,avail_amt,avail_amt_cal_flag)  select v_create_date,v_create_time,v_update_date,v_update_time,1,v_init_date,a.co_no,a.pd_no,a.asset_acco_no,a.curr_amt,0,0 from db_pdsecu.tb_pdseca_asac_capit a where (a.co_no,a.pd_no,a.asset_acco_no) not in (select co_no,pd_no,asset_acco_no  from db_pdsecu.tb_pdseca_out_asac_capit where init_date=v_init_date)   order by a.co_no,a.pd_no,a.asset_acco_no;
    end if;

    /* [获取表记录变量语句][产品证券_资金_内部资产账户资金核对表][IFNULL({记录序号},0),{机构编号},{产品编号},{资产账户编号}][@记录序号#,@机构编号#,@产品编号#,@资产账户编号#][{记录序号} > @查询记录序号# order by {记录序号}] */
    select IFNULL(row_id,0),co_no,pd_no,asset_acco_no into v_row_id,v_co_no,v_pd_no,v_asset_acco_no from db_pdsecu.tb_pdseca_asac_capit_check where row_id > v_query_row_id order by row_id limit 1;

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

# 原子_产品证券_资金运维_获取内部证券资金记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_GetInSecuCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_GetInSecuCapital(
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
    declare v_crncy_type varchar(3);
    declare v_sync_capital_way int;
    declare v_hk_cash_avail_date_type int;
    declare v_acco_avail_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_tmp_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_shsz_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_crncy_type = "CNY";
    SET v_sync_capital_way = 0;
    SET v_hk_cash_avail_date_type = 0;
    SET v_acco_avail_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_tmp_avail_amt = 0;
    SET v_hk_avail_amt = 0;
    SET v_shsz_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @同步资金方式#=cast(substring(@资产账户业务控制配置串#, 20, 1) as SIGNED); */
    set v_sync_capital_way=cast(substring(v_asac_busi_config_str, 20, 1) as SIGNED);

    /* set @港股通资金可用日期#=cast(substring(@资产账户业务控制配置串#, 21, 1) as SIGNED); */
    set v_hk_cash_avail_date_type=cast(substring(v_asac_busi_config_str, 21, 1) as SIGNED);

    /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额}+{港股通可用调整金额}+{金额核对差额},{当前金额},{当前金额}+{沪深可用调整金额}-{冻结金额}+{解冻金额}+{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应付金额},{累计应收金额}][@账户可用金额#,@当前金额#,@可用金额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应付金额#,@累计应收金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select curr_amt+hk_avail_change_amt+amt_check_diff,curr_amt,curr_amt+shsz_avail_change_amt-frozen_amt+unfroz_amt+amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_payab_amt,total_rece_amt into v_acco_avail_amt,v_curr_amt,v_avail_amt,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_payab_amt,v_total_rece_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* set @临时_可用金额#=@可用金额#; */
    set v_tmp_avail_amt=v_avail_amt;

    /* set @港股可用金额#=0; */
    set v_hk_avail_amt=0;

    /* set @沪深可用金额#=0; */
    set v_shsz_avail_amt=0;

    /* set @静态可用金额#=0; */
    set v_static_avail_amt=0;

    /* [获取表记录变量语句][产品证券_资金_交易资产账户资金表][{港股可用金额},{沪深可用金额},{静态可用金额}][@港股可用金额#,@沪深可用金额#,@静态可用金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select hk_avail_amt,shsz_avail_amt,static_avail_amt into v_hk_avail_amt,v_shsz_avail_amt,v_static_avail_amt from db_pdsecu.tb_pdseca_trd_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

    #同步资金方式为0表示同步可用金额,为1表示同步资金余额

    /* if @同步资金方式#=0 then */
    if v_sync_capital_way=0 then

        /* if @港股通资金可用日期#=《港股通资金可用日期-T+2日日初可用》 then */
        if v_hk_cash_avail_date_type=4 then
            #港股轧差计算

            /* set @港股可用金额#=greatest(0,@T1日当日港股卖出金额#-@T1日当日港股买入金额#)+@港股可用金额#; */
            set v_hk_avail_amt=greatest(0,v_T1_hk_sell_total_amt-v_T1_hk_buy_total_amt)+v_hk_avail_amt;
            #A股的可用金额=产品库的可用金额+交易库的A股可用金额+港股的轧差

            /* set @可用金额#=@临时_可用金额#+@T日当日港股卖出金额#-@T日当日港股买入金额#+least(0,@T1日当日港股卖出金额#-@T1日当日港股买入金额#)+@沪深可用金额#+LEAST(@港股可用金额#,0); */
            set v_avail_amt=v_tmp_avail_amt+v_T_hk_sell_total_amt-v_T_hk_buy_total_amt+least(0,v_T1_hk_sell_total_amt-v_T1_hk_buy_total_amt)+v_shsz_avail_amt+LEAST(v_hk_avail_amt,0);

        /* elseif @港股通资金可用日期#=《港股通资金可用日期-T+2日日终可用》 then */
        elseif v_hk_cash_avail_date_type=5 then
            #港股轧差计算

            /* set @港股可用金额#=greatest(0,greatest(0,@T日当日港股卖出金额#-@T日当日港股买入金额#)+@T1日当日港股卖出金额#-@T1日当日港股买入金额#)+@港股可用金额#; */
            set v_hk_avail_amt=greatest(0,greatest(0,v_T_hk_sell_total_amt-v_T_hk_buy_total_amt)+v_T1_hk_sell_total_amt-v_T1_hk_buy_total_amt)+v_hk_avail_amt;
            #A股的可用金额=产品库的可用金额+交易库的A股可用金额+港股的轧差

            /* set @可用金额#=@临时_可用金额#+least(0,@T日当日港股卖出金额#-@T日当日港股买入金额#)+least(0,greatest(0,@T日当日港股卖出金额#-@T日当日港股买入金额#)+@T1日当日港股卖出金额#-@T1日当日港股买入金额#)+@沪深可用金额#+LEAST(@港股可用金额#,0); */
            set v_avail_amt=v_tmp_avail_amt+least(0,v_T_hk_sell_total_amt-v_T_hk_buy_total_amt)+least(0,greatest(0,v_T_hk_sell_total_amt-v_T_hk_buy_total_amt)+v_T1_hk_sell_total_amt-v_T1_hk_buy_total_amt)+v_shsz_avail_amt+LEAST(v_hk_avail_amt,0);
        end if;
    else

        /* set @可用金额#=@账户可用金额#+@静态可用金额#; */
        set v_avail_amt=v_acco_avail_amt+v_static_avail_amt;
    end if;

    /* set @当前金额#=round(@当前金额#,2); */
    set v_curr_amt=round(v_curr_amt,2);

    /* set @可用金额#=round(@可用金额#,2); */
    set v_avail_amt=round(v_avail_amt,2);

    /* set @累计应付金额#=round(@累计应付金额#,2); */
    set v_total_payab_amt=round(v_total_payab_amt,2);

    /* set @累计应收金额#=round(@累计应收金额#,2); */
    set v_total_rece_amt=round(v_total_rece_amt,2);

    /* [更新表记录][产品证券_资金_内部资产账户资金核对表][{当前金额}=@当前金额#,{可用金额}=@可用金额#,{可用金额计算标志}=《可用金额计算标志-已计算》][{记录序号} =@记录序号# and {初始化日期}=@初始化日期# and {资产账户编号}=@资产账户编号#][2][@记录序号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit_check set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,avail_amt=v_avail_amt,avail_amt_cal_flag=1 where row_id =v_row_id and init_date=v_init_date and asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.10.25.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

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

# 原子_产品证券_资金运维_转入内部证券资金核对记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_AddInSecuCapitCkeck;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_AddInSecuCapitCkeck(
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
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
    declare v_asset_sync_flag int;
    declare v_sync_total_rece_payab int;
    declare v_crncy_type varchar(3);
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
    declare v_acco_curr_amt decimal(18,4);
    declare v_acco_avail_amt decimal(18,4);
    declare v_sys_avail_amt_diff decimal(18,4);
    declare v_acco_curr_amt_diff decimal(18,4);
    declare v_acco_avail_amt_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
    declare v_acco_total_rece_amt_diff decimal(18,4);
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
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_asset_sync_flag = 0;
    SET v_sync_total_rece_payab = 0;
    SET v_crncy_type = "CNY";
    SET v_out_curr_amt = 0;
    SET v_out_enable_amt = 0;
    SET v_out_frozen_amt = 0;
    SET v_out_unfroz_amt = 0;
    SET v_out_total_payab_amt = 0;
    SET v_out_total_rece_amt = 0;
    SET v_acco_curr_amt = 0;
    SET v_acco_avail_amt = 0;
    SET v_sys_avail_amt_diff = 0;
    SET v_acco_curr_amt_diff = 0;
    SET v_acco_avail_amt_diff = 0;
    SET v_acco_total_payab_amt_diff = 0;
    SET v_acco_total_rece_amt_diff = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理标志# = 《处理标志-内部检查》; */
    set v_deal_flag = 6;

    /* set @备注信息# = "内部检查转入"; */
    set v_remark_info = "内部检查转入";

    /* set @资产是否同步#=cast(substring(@资产账户业务控制配置串#, 12, 1) as SIGNED); */
    set v_asset_sync_flag=cast(substring(v_asac_busi_config_str, 12, 1) as SIGNED);

    /* set @同步累计应收应付#=cast(substring(@资产账户业务控制配置串#, 26, 1) as SIGNED); */
    set v_sync_total_rece_payab=cast(substring(v_asac_busi_config_str, 26, 1) as SIGNED);

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @外部当前金额# = 0; */
    set v_out_curr_amt = 0;

    /* set @外部可用金额# = 0; */
    set v_out_enable_amt = 0;

    /* set @外部冻结金额# = 0; */
    set v_out_frozen_amt = 0;

    /* set @外部解冻金额# = 0; */
    set v_out_unfroz_amt = 0;

    /* set @外部累计应付金额# = 0; */
    set v_out_total_payab_amt = 0;

    /* set @外部累计应收金额# = 0; */
    set v_out_total_rece_amt = 0;

    /* set @账户当前金额# = @当前金额#; */
    set v_acco_curr_amt = v_curr_amt;

    /* set @账户可用金额# = @可用金额#; */
    set v_acco_avail_amt = v_avail_amt;

    /* set @系统可用金额差额#=@外部可用金额#-@账户可用金额#; */
    set v_sys_avail_amt_diff=v_out_enable_amt-v_acco_avail_amt;

    /* set @账户当前金额差额#=@外部当前金额# - @账户当前金额#; */
    set v_acco_curr_amt_diff=v_out_curr_amt - v_acco_curr_amt;

    /* set @账户可用金额差额#=@外部可用金额# - @账户可用金额#-@账户当前金额差额#; */
    set v_acco_avail_amt_diff=v_out_enable_amt - v_acco_avail_amt-v_acco_curr_amt_diff;

    /* if @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
    if v_sync_total_rece_payab = 0  then

        /* set @账户累计应付金额差额#=0; */
        set v_acco_total_payab_amt_diff=0;

        /* set @账户累计应收金额差额#=0; */
        set v_acco_total_rece_amt_diff=0;

    /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
    elseif v_sync_total_rece_payab = 1  then

         /* set @账户累计应付金额差额#=@外部累计应付金额# - @累计应付金额#; */
         set v_acco_total_payab_amt_diff=v_out_total_payab_amt - v_total_payab_amt;

         /* set @账户累计应收金额差额#=@外部累计应收金额# - @累计应收金额#; */
         set v_acco_total_rece_amt_diff=v_out_total_rece_amt - v_total_rece_amt;
    end if;
    #diff表中 资金内部核对的记录 均记为 《处理标志-内部检查》，只做展示，不处理。

      /* [插入重复更新][产品证券_资金_内外资产账户资金差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {账户当前金额}=@账户当前金额#, {账户可用金额}=@账户可用金额#,{外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#,  {系统可用金额差额}=@系统可用金额差额#,{账户当前金额差额}=@账户当前金额差额#, {账户可用金额差额}=@账户可用金额差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#,{累计应付金额}=@累计应付金额#,{累计应收金额}=@累计应收金额#,{外部累计应付金额}=@外部累计应付金额#,{外部累计应收金额}=@外部累计应收金额#,{账户累计应付金额差额}=@账户累计应付金额差额#,{账户累计应收金额差额}=@账户累计应收金额差额#][1][@初始化日期#,@资产账户编号#,@本币币种#] */
      set v_create_date = date_format(curdate(),'%Y%m%d');
      set v_create_time = date_format(curtime(),'%H%i%s');
      set v_update_date = v_create_date;
      set v_update_time = v_create_time;
      set v_update_times = 1;
      insert into db_pdsecu.tb_pdseca_asac_capit_diff (
          create_date, create_time, update_date, 
          update_time, update_times, init_date, co_no, 
          pd_no, asset_acco_no, exch_group_no, pass_no, 
          out_acco, crncy_type, acco_curr_amt, acco_avail_amt, 
          out_curr_amt, out_enable_amt, acco_curr_amt_diff, acco_avail_amt_diff, 
          sys_avail_amt_diff, total_payab_amt, total_rece_amt, out_total_payab_amt, 
          out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, deal_flag, 
          asset_sync_flag, remark_info) 
      values(
          v_create_date, v_create_time, v_update_date, 
          v_update_time, v_update_times, v_init_date, v_co_no, 
          v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
          v_out_acco, v_crncy_type, v_acco_curr_amt, v_acco_avail_amt, 
          v_out_curr_amt, v_out_enable_amt, v_acco_curr_amt_diff, v_acco_avail_amt_diff, 
          v_sys_avail_amt_diff, v_total_payab_amt, v_total_rece_amt, v_out_total_payab_amt, 
          v_out_total_rece_amt, v_acco_total_payab_amt_diff, v_acco_total_rece_amt_diff, v_deal_flag, 
          v_asset_sync_flag, v_remark_info) 
      ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, acco_curr_amt=v_acco_curr_amt, acco_avail_amt=v_acco_avail_amt,out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt,  sys_avail_amt_diff=v_sys_avail_amt_diff,acco_curr_amt_diff=v_acco_curr_amt_diff, acco_avail_amt_diff=v_acco_avail_amt_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info,total_payab_amt=v_total_payab_amt,total_rece_amt=v_total_rece_amt,out_total_payab_amt=v_out_total_payab_amt,out_total_rece_amt=v_out_total_rece_amt,acco_total_payab_amt_diff=v_acco_total_payab_amt_diff,acco_total_rece_amt_diff=v_acco_total_rece_amt_diff;
      if v_error_code = "1" then
                  
          SET v_error_code = "pdsecuA.10.26.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
          else
              SET v_error_info = concat("初始化日期=",v_init_date,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
          end if;
          leave label_pro;
      end if;

    #避免在内部核对的过程中报盘已经把数据搂回来了,先检查表中是否有记录存在
    #[获取表记录数量][产品证券_资金_内外资产账户资金差异表][@记录个数#][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {本币币种}=@本币币种#]
    #if @记录个数# = 0  then
      #  [插入重复更新][产品证券_资金_内外资产账户资金差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {账户当前金额}=@账户当前金额#, {账户可用金额}=@账户可用金额#,{外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#,  {系统可用金额差额}=@系统可用金额差额#,{账户当前金额差额}=@账户当前金额差额#, {账户可用金额差额}=@账户可用金额差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#,{累计应付金额}=@累计应付金额#,{累计应收金额}=@累计应收金额#,{外部累计应付金额}=@外部累计应付金额#,{外部累计应收金额}=@外部累计应收金额#,{账户累计应付金额差额}=@账户累计应付金额差额#,{账户累计应收金额差额}=@账户累计应收金额差额#][1][@初始化日期#,@资产账户编号#,@本币币种#]
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QueryAsacCapital_Jour(
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
    

    /* [获取表记录][产品证券_资金_资产账户资金流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号串#="; ;" or  instr(@机构编号串#,concat(";",{机构编号},";"))>0) and (@产品编号串# = "; ;" or  instr(@产品编号串#,concat(";",{产品编号},";"))>0)  and (@资产账户编号串# = "; ;" or instr(@资产账户编号串#,concat(";",{资产账户编号},";"))>0) and (@业务标志串# = "; ;" or  instr(@业务标志串#,concat(";",{业务标志},";"))>0) and (@本币币种串# = "; ;" or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_jour where init_date<=v_init_date and (v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0) and (v_crncy_type_str = "; ;" or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_jour where init_date<=v_init_date and (v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0) and (v_crncy_type_str = "; ;" or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_QueryAsacCapital_JourHis(
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
    

    /* [获取表记录][历史_产品证券_资金_资产账户资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and(@机构编号串#="; ;" or  instr(@机构编号串#,concat(";",{机构编号},";"))>0) and (@产品编号串# = "; ;" or  instr(@产品编号串#,concat(";",{产品编号},";"))>0)  and (@资产账户编号串# = "; ;" or instr(@资产账户编号串#,concat(";",{资产账户编号},";"))>0) and (@业务标志串# = "; ;" or  instr(@业务标志串#,concat(";",{业务标志},";"))>0) and (@本币币种串# = "; ;" or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and(v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0) and (v_crncy_type_str = "; ;" or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and(v_co_no_str="; ;" or  instr(v_co_no_str,concat(";",co_no,";"))>0) and (v_pd_no_str = "; ;" or  instr(v_pd_no_str,concat(";",pd_no,";"))>0)  and (v_asset_acco_no_str = "; ;" or instr(v_asset_acco_no_str,concat(";",asset_acco_no,";"))>0) and (v_busi_flag_str = "; ;" or  instr(v_busi_flag_str,concat(";",busi_flag,";"))>0) and (v_crncy_type_str = "; ;" or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金运维_删除交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsecabk_DeleteExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsecabk_DeleteExgpCapital(
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
    declare v_pre_settle_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);

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
    SET v_pre_settle_amt = 0;
    SET v_amt_check_diff = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_交易组资金表][{待交收金额},{当前金额},{金额核对差额}][@待交收金额#,@变动金额#,@金额核对差额#][{记录序号}=@记录序号#][4][@资产账户编号#,@本币币种#,@交易组编号#,@记录序号#] */
    select pre_settle_amt,curr_amt,amt_check_diff into v_pre_settle_amt,v_occur_amt,v_amt_check_diff from db_pdsecu.tb_pdseca_exgp_capit where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.10.29.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type,",","交易组编号=",v_exch_group_no,",","记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type,",","交易组编号=",v_exch_group_no,",","记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@待交收金额# <> 0 or @金额核对差额#<>0][3][concat("该交易组资金存在在途业务,不能删除！记录序号为：",@记录序号#)]
    #[检查报错返回][@当前金额# <> 0][3][concat("该交易组存在待回收资金,不能删除！记录序号为：",@记录序号#)]

    /* [删除表记录][产品证券_资金_交易组资金表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pdsecu.tb_pdseca_exgp_capit 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.10.29.3";
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
    SET p_occur_amt = v_occur_amt;

END;;


