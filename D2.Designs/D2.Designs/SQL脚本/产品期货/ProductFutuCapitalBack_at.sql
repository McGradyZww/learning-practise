DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_查询资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_QueryFutuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_QueryFutuCapitalDiff(
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
    

    /* [获取表记录][产品期货_资金_内外资产账户资金差异表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前金额差额}<>0 or {账户可用金额差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前金额差额}=0 and {账户可用金额差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, act_capt_margin, out_curr_amt, out_enable_amt, 
        out_capt_margin, acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdfutu.tb_pdfuca_asac_capit_diff where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, act_capt_margin, out_curr_amt, out_enable_amt, 
        out_capt_margin, acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdfutu.tb_pdfuca_asac_capit_diff where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_处理资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_DealFutuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_DealFutuCapitalDiff(
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
    declare v_act_capt_margin decimal(18,4);
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_capt_margin decimal(18,4);
    declare v_acco_curr_amt_diff decimal(18,4);
    declare v_acco_avail_amt_diff decimal(18,4);
    declare v_deal_flag int;
    declare v_remark_info varchar(255);
    declare v_sync_margin_amt int;
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_tmp_oper_remark_info varchar(255);
    declare v_tmp_act_capt_margin_diff decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_tmp_capt_margin decimal(18,4);
    declare v_tmp_avail_amt decimal(18,4);
    declare v_tmp_asac_capt_margin decimal(18,4);
    declare v_tmp_asac_curr_amt decimal(18,4);

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
    SET v_act_capt_margin = 0;
    SET v_out_curr_amt = 0;
    SET v_out_enable_amt = 0;
    SET v_out_capt_margin = 0;
    SET v_acco_curr_amt_diff = 0;
    SET v_acco_avail_amt_diff = 0;
    SET v_deal_flag = 0;
    SET v_remark_info = " ";
    SET v_sync_margin_amt = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_tmp_oper_remark_info = " ";
    SET v_tmp_act_capt_margin_diff = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_capt_margin = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_tmp_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_tmp_capt_margin = 0;
    SET v_tmp_avail_amt = 0;
    SET v_tmp_asac_capt_margin = 0;
    SET v_tmp_asac_curr_amt = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_资金_内外资产账户资金差异表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, act_capt_margin, out_curr_amt, out_enable_amt, 
        out_capt_margin, acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, 
        deal_flag, asset_sync_flag, remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_acco_curr_amt, 
        v_acco_avail_amt, v_act_capt_margin, v_out_curr_amt, v_out_enable_amt, 
        v_out_capt_margin, v_acco_curr_amt_diff, v_acco_avail_amt_diff, v_act_capt_margin_diff, 
        v_deal_flag, v_asset_sync_flag, v_remark_info from db_pdfutu.tb_pdfuca_asac_capit_diff where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.10.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查正常返回][@资产是否同步#=《资产是否同步-不同步资金不同步持仓》 or @资产是否同步#=《资产是否同步-不同步资金同步持仓》] */
    if v_asset_sync_flag=2 or v_asset_sync_flag=4 then
        leave label_pro;
    end if;


    /* set @同步保证金#=cast(substring(@业务控制配置串#, 29, 1) as SIGNED); */
    set v_sync_margin_amt=cast(substring(v_busi_config_str, 29, 1) as SIGNED);

    /* set @变动金额#=@账户当前金额差额#; */
    set v_occur_amt=v_acco_curr_amt_diff;

    /* if @变动金额# > 0 then */
    if v_occur_amt > 0 then

        /* set @业务标志#=《业务标志-资金蓝补》; */
        set v_busi_flag=1003002;
    else

        /* set @业务标志#=《业务标志-资金红冲》; */
        set v_busi_flag=1003001;
    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @临时_操作备注# = @操作备注#; */
    set v_tmp_oper_remark_info = v_oper_remark_info;

    /* set @临时_账户占用保证金差额# = @账户占用保证金差额#; */
    set v_tmp_act_capt_margin_diff = v_act_capt_margin_diff;

    /* if @变动金额# <> 0 or @账户可用金额差额# <>0 or @账户占用保证金差额#<>0  then */
    if v_occur_amt <> 0 or v_acco_avail_amt_diff <>0 or v_act_capt_margin_diff<>0  then

        /* set @期初金额# = 0; */
        set v_begin_amt = 0;

        /* set @当前金额# = @变动金额#; */
        set v_curr_amt = v_occur_amt;

        /* set @占用保证金# = @账户占用保证金差额#; */
        set v_capt_margin = v_act_capt_margin_diff;

        /* set @冻结金额# = 0; */
        set v_frozen_amt = 0;

        /* set @解冻金额# = 0; */
        set v_unfroz_amt = 0;

        /* set @累计应收金额# = 0; */
        set v_total_rece_amt = 0;

        /* set @累计应付金额# = 0; */
        set v_total_payab_amt = 0;

        /* set @实现盈亏# = 0; */
        set v_realize_pandl = 0;

        /* set @利率# = 0; */
        set v_intrst_rate = 0;

        /* set @利息积数# = 0; */
        set v_intrst_base_amt = 0;

        /* set @待入账利息# = 0; */
        set v_pre_entry_intrst_amt = 0;

        /* set @流水变动字段# = " "; */
        set v_jour_occur_field = " ";

        /* set @流水后信息# =" "; */
        set v_jour_after_occur_info =" ";
        #[获取流水变动][{账户占用保证金差额},{占用保证金}][@账户占用保证金差额#,@占用保证金#]

        /* set @临时_变动金额# = @变动金额#; */
        set v_tmp_occur_amt = v_occur_amt;

        /* if @同步保证金# = 《同步保证金-同步》  then */
        if v_sync_margin_amt = 1  then

              /* [插入重复更新][产品期货_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{占用保证金}={占用保证金}+@占用保证金#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_pdfutu.tb_pdfuca_exgp_capit (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                  curr_amt, capt_margin, frozen_amt, unfroz_amt, 
                  total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
                  pre_entry_intrst_amt) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                  v_curr_amt, v_capt_margin, v_frozen_amt, v_unfroz_amt, 
                  v_total_rece_amt, v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, 
                  v_pre_entry_intrst_amt) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,capt_margin=capt_margin+v_capt_margin;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdfutuA.10.2.1";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                  end if;
                  leave label_pro;
              end if;


        /* elseif @同步保证金# = 《同步保证金-不同步》  then */
        elseif v_sync_margin_amt = 0  then

              /* [插入重复更新][产品期货_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_pdfutu.tb_pdfuca_exgp_capit (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, exch_group_no, crncy_type, begin_amt, 
                  curr_amt, capt_margin, frozen_amt, unfroz_amt, 
                  total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
                  pre_entry_intrst_amt) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
                  v_curr_amt, v_capt_margin, v_frozen_amt, v_unfroz_amt, 
                  v_total_rece_amt, v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, 
                  v_pre_entry_intrst_amt) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdfutuA.10.2.1";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                  end if;
                  leave label_pro;
              end if;

        end if;

        /* [获取表记录变量][产品期货_资金_交易组资金表][{当前金额},{占用保证金}][@变动后金额#,@临时_占用保证金#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
        select curr_amt,capt_margin into v_occur_end_amt,v_tmp_capt_margin from db_pdfutu.tb_pdfuca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdfutuA.10.2.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

        #[获取流水后信息][@账户占用保证金差额#,@临时_占用保证金#]

        /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额"); */
        set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额");

        /* [插入表记录][产品期货_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdfutu.tb_pdfuca_exgp_capit_jour(
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
                    
            SET v_error_code = "pdfutuA.10.2.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* if @同步保证金# = 《同步保证金-同步》  then */
        if v_sync_margin_amt = 1  then

              /* set @操作备注#=concat(@临时_操作备注#,"|","占用保证金"); */
              set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","占用保证金");

              /* set @变动金额#=@占用保证金#; */
              set v_occur_amt=v_capt_margin;

              /* set @变动后金额#=@临时_占用保证金#; */
              set v_occur_end_amt=v_tmp_capt_margin;

             /* [插入表记录][产品期货_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
             set v_create_date = date_format(curdate(),'%Y%m%d');
             set v_create_time = date_format(curtime(),'%H%i%s');
             set v_update_date = v_create_date;
             set v_update_time = v_create_time;
             set v_update_times = 1;
             insert into db_pdfutu.tb_pdfuca_exgp_capit_jour(
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
                         
                 SET v_error_code = "pdfutuA.10.2.5";
                 SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                 leave label_pro;
             end if;

        end if;

        /* set @变动金额#=@临时_变动金额#; */
        set v_occur_amt=v_tmp_occur_amt;

        /* if @同步保证金# = 《同步保证金-同步》  then */
        if v_sync_margin_amt = 1  then

              /* [插入重复更新][产品期货_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{占用保证金}={占用保证金}+@占用保证金#][1][@资产账户编号#,@本币币种#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_pdfutu.tb_pdfuca_asac_capit (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, crncy_type, begin_amt, curr_amt, 
                  capt_margin, frozen_amt, unfroz_amt, total_rece_amt, 
                  total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
                  v_capt_margin, v_frozen_amt, v_unfroz_amt, v_total_rece_amt, 
                  v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,capt_margin=capt_margin+v_capt_margin;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdfutuA.10.2.1";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                  end if;
                  leave label_pro;
              end if;


        /* elseif @同步保证金# = 《同步保证金-不同步》  then */
        elseif v_sync_margin_amt = 0  then

              /* [插入重复更新][产品期货_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][1][@资产账户编号#,@本币币种#] */
              set v_create_date = date_format(curdate(),'%Y%m%d');
              set v_create_time = date_format(curtime(),'%H%i%s');
              set v_update_date = v_create_date;
              set v_update_time = v_create_time;
              set v_update_times = 1;
              insert into db_pdfutu.tb_pdfuca_asac_capit (
                  create_date, create_time, update_date, 
                  update_time, update_times, co_no, pd_no, 
                  asset_acco_no, crncy_type, begin_amt, curr_amt, 
                  capt_margin, frozen_amt, unfroz_amt, total_rece_amt, 
                  total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt) 
              values(
                  v_create_date, v_create_time, v_update_date, 
                  v_update_time, v_update_times, v_co_no, v_pd_no, 
                  v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
                  v_capt_margin, v_frozen_amt, v_unfroz_amt, v_total_rece_amt, 
                  v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt) 
              ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
              if v_error_code = "1" then
                          
                  SET v_error_code = "pdfutuA.10.2.1";
                  if v_mysql_message <> "" then
                      SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                  else
                      SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                  end if;
                  leave label_pro;
              end if;

        end if;

        /* [获取表记录变量][产品期货_资金_资产账户资金表][{当前金额},{占用保证金}][@变动后金额#,@临时_占用保证金#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select curr_amt,capt_margin into v_occur_end_amt,v_tmp_capt_margin from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdfutuA.10.2.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额"); */
        set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额");
        #[获取流水后信息][@账户占用保证金差额#,@临时_占用保证金#]

        /* [插入表记录][产品期货_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_pdfutu.tb_pdfuca_asac_capit_jour(
            create_date, create_time, update_date, 
            update_time, update_times, opor_co_no, opor_no, 
            oper_mac, oper_ip_addr, oper_info, oper_way, 
            oper_menu_no, oper_func_code, init_date, co_no, 
            pd_no, asset_acco_no, busi_flag, crncy_type, 
            occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
            oper_remark_info) 
        value( 
            v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
            v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
            v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
            v_pd_no, v_asset_acco_no, v_busi_flag, v_crncy_type, 
            v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
            v_oper_remark_info);
        if v_error_code = "1" then
                    
            SET v_error_code = "pdfutuA.10.2.5";
            SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;


        /* if @同步保证金# = 《同步保证金-同步》  then */
        if v_sync_margin_amt = 1  then

              /* set @操作备注#=concat(@临时_操作备注#,"|","占用保证金"); */
              set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","占用保证金");

              /* set @变动金额#=@占用保证金#; */
              set v_occur_amt=v_capt_margin;

              /* set @变动后金额#=@临时_占用保证金#; */
              set v_occur_end_amt=v_tmp_capt_margin;

             /* [插入表记录][产品期货_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
             set v_create_date = date_format(curdate(),'%Y%m%d');
             set v_create_time = date_format(curtime(),'%H%i%s');
             set v_update_date = v_create_date;
             set v_update_time = v_create_time;
             set v_update_times = 1;
             insert into db_pdfutu.tb_pdfuca_asac_capit_jour(
                 create_date, create_time, update_date, 
                 update_time, update_times, opor_co_no, opor_no, 
                 oper_mac, oper_ip_addr, oper_info, oper_way, 
                 oper_menu_no, oper_func_code, init_date, co_no, 
                 pd_no, asset_acco_no, busi_flag, crncy_type, 
                 occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
                 oper_remark_info) 
             value( 
                 v_create_date, v_create_time, v_update_date, 
                 v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
                 v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
                 v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
                 v_pd_no, v_asset_acco_no, v_busi_flag, v_crncy_type, 
                 v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
                 v_oper_remark_info);
             if v_error_code = "1" then
                         
                 SET v_error_code = "pdfutuA.10.2.5";
                 SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                 leave label_pro;
             end if;

        end if;

        /* set @变动金额#=@临时_变动金额#; */
        set v_occur_amt=v_tmp_occur_amt;

        /* [获取表记录变量][产品期货_资金_资产账户资金表][{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
        select row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdfutuA.10.2.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品期货_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
        select row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdfutuA.10.2.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;

        #体内的需 将产品库和交易库的累计。

        /* [获取表记录变量语句][产品期货_资金_交易资产账户资金表][{可用金额},{保证金},{资金余额}][@临时_可用金额#,@临时_资产账户占用保证金#,@临时_资产账户当前金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select avail_amt,margin_amt,capit_bala into v_tmp_avail_amt,v_tmp_asac_capt_margin,v_tmp_asac_curr_amt from db_pdfutu.tb_pdfuca_trd_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;

        if FOUND_ROWS() = 0 then

             /* set @临时_可用金额# =0; */
             set v_tmp_avail_amt =0;

             /* set @临时_资产账户占用保证金# =0; */
             set v_tmp_asac_capt_margin =0;

             /* set @临时_资产账户当前金额# =0; */
             set v_tmp_asac_curr_amt =0;
        end if;

        /* set @账户当前金额# = @资产账户当前金额# + @临时_资产账户当前金额#; */
        set v_acco_curr_amt = v_asac_curr_amt + v_tmp_asac_curr_amt;

        /* set @账户占用保证金# = @资产账户占用保证金# + @临时_资产账户占用保证金#; */
        set v_act_capt_margin = v_asac_capt_margin + v_tmp_asac_capt_margin;

        /* set @账户可用金额# = @资产账户当前金额#-@资产账户冻结金额#+@资产账户解冻金额#-@资产账户占用保证金# + @临时_可用金额#; */
        set v_acco_avail_amt = v_asac_curr_amt-v_asac_frozen_amt+v_asac_unfroz_amt-v_asac_capt_margin + v_tmp_avail_amt;

        /* set @账户当前金额差额# =0; */
        set v_acco_curr_amt_diff =0;

        /* set @账户可用金额差额# = 0; */
        set v_acco_avail_amt_diff = 0;

        /* set @账户占用保证金差额# = 0; */
        set v_act_capt_margin_diff = 0;
    end if;

    /* set @备注信息#="数据已成功同步！"; */
    set v_remark_info="数据已成功同步！";

    /* [更新表记录][产品期货_资金_内外资产账户资金差异表][{账户当前金额}=@账户当前金额#,{账户可用金额}=@账户可用金额#,{账户占用保证金}=@账户占用保证金#,{账户当前金额差额}=@账户当前金额差额#,{账户可用金额差额}=@账户可用金额差额#,{账户占用保证金差额}=@账户占用保证金差额#,{处理标志}=《处理标志-已处理》,{备注信息}=@备注信息#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit_diff set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, acco_curr_amt=v_acco_curr_amt,acco_avail_amt=v_acco_avail_amt,act_capt_margin=v_act_capt_margin,acco_curr_amt_diff=v_acco_curr_amt_diff,acco_avail_amt_diff=v_acco_avail_amt_diff,act_capt_margin_diff=v_act_capt_margin_diff,deal_flag=1,remark_info=v_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.10.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @账户占用保证金差额# = @临时_账户占用保证金差额#; */
    set v_act_capt_margin_diff = v_tmp_act_capt_margin_diff;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
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

# 原子_产品期货_资金运维_计算产品期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_CalcProdFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_CalcProdFutuAsset(
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
    OUT p_futu_asset decimal(18,4),
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_futu_asset = 0;
    SET v_crncy_type = "CNY";

    
    label_pro:BEGIN
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算期货资产

    /* [获取表记录变量语句][产品期货_资金_资产账户资金表][sum({占用保证金})][@期货资产#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {本币币种}=@本币币种#] */
    select sum(capt_margin) into v_futu_asset from db_pdfutu.tb_pdfuca_asac_capit where co_no=v_co_no and pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;


    /* set @期货资产#=round(ifnull(@期货资产#,0),2); */
    set v_futu_asset=round(ifnull(v_futu_asset,0),2);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_futu_asset = v_futu_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_计算交易组期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_CalcExchGroupFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_CalcExchGroupFutuAsset(
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
    OUT p_cash_asset decimal(18,4),
    OUT p_futu_asset decimal(18,4),
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
    declare v_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_begin_NAV decimal(18,4);
    declare v_nav_asset decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_cash_asset = 0;
    SET v_futu_asset = 0;
    SET v_crncy_type = "CNY";
    SET v_begin_NAV = 0;
    SET v_nav_asset = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @本币币种# = 《本币币种-人民币》; */
    set v_crncy_type = "CNY";
    #计算现金资产

    /* select sum({当前金额}+{累计应收金额}-{累计应付金额}-{占用保证金}) into @现金资产# from ~产品期货_资金_交易组资金表^ where {交易组编号}=@交易组编号# and {本币币种}=@本币币种#; */
    select sum(curr_amt+total_rece_amt-total_payab_amt-capt_margin) into v_cash_asset from db_pdfutu.tb_pdfuca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;

    /* set @现金资产#=round(ifnull(@现金资产#,0),2); */
    set v_cash_asset=round(ifnull(v_cash_asset,0),2);
    #计算期货资产

    /* select sum({占用保证金}) into @期货资产# from ~产品期货_资金_交易组资金表^ where {交易组编号}=@交易组编号# and {本币币种}=@本币币种#; */
    select sum(capt_margin) into v_futu_asset from db_pdfutu.tb_pdfuca_exgp_capit where exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;

    /* set @期货资产#=round(ifnull(@期货资产#,0),2); */
    set v_futu_asset=round(ifnull(v_futu_asset,0),2);

    /* set @期初净资产# = 0; */
    set v_begin_NAV = 0;

    /* set @净资产# = @现金资产# + @期货资产#; */
    set v_nav_asset = v_cash_asset + v_futu_asset;

    /* [插入重复更新][产品期货_资金_交易组资产表][字段][字段变量][{净资产}=@净资产#,{现金资产}=@现金资产#,{期货资产}=@期货资产#][2][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_exgp_asset (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        cash_asset, futu_asset) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_crncy_type, v_begin_NAV, v_nav_asset, 
        v_cash_asset, v_futu_asset) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, nav_asset=v_nav_asset,cash_asset=v_cash_asset,futu_asset=v_futu_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.10.13.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_cash_asset = v_cash_asset;
    SET p_futu_asset = v_futu_asset;
    SET p_crncy_type = v_crncy_type;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_清除外部资金记录差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_ClearOutCapitRecordDiffRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_ClearOutCapitRecordDiffRecord(
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
    

    /* [删除表记录][产品期货_资金_外部资产账户资金表][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and {资产账户编号}<>0 and {初始化日期}<>0 and {本币币种}<>" "][3][@机构编号#,@产品编号#] */
    delete from db_pdfutu.tb_pdfuca_out_asac_capit 
        where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and asset_acco_no<>0 and init_date<>0 and crncy_type<>" ";
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.10.14.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_内外资产账户资金差异表][{机构编号}=@机构编号# and ({产品编号}=@产品编号# or @产品编号#=0) and {本币币种}<>" " and {初始化日期}<>0][3][@机构编号#,@产品编号#] */
    delete from db_pdfutu.tb_pdfuca_asac_capit_diff 
        where co_no=v_co_no and (pd_no=v_pd_no or v_pd_no=0) and crncy_type<>" " and init_date<>0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.10.14.3";
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
use db_pdfutu;;

# 原子_产品期货_资金运维_获取外部资金账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_GetOutCapitalAsacInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_GetOutCapitalAsacInfo(
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
    declare v_out_capt_margin decimal(18,4);

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
    SET v_out_capt_margin = 0;

    
    label_pro:BEGIN
    

    /* set @临时_记录序号#=@记录序号#; */
    set v_tmp_row_id=v_row_id;

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品期货_资金_外部资产账户资金表][字段][字段变量][{初始化日期}<>0 and {通道编号}<>0 and {外部账号}<>" " and {本币币种}="CNY"and ({机构编号}=@机构编号# or @机构编号#=0) and ({产品编号}=@产品编号# or @产品编号#=0) and {记录序号}>@临时_记录序号# order by {记录序号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_capt_margin into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_out_curr_amt, v_out_enable_amt, 
        v_out_capt_margin from db_pdfutu.tb_pdfuca_out_asac_capit where init_date<>0 and pass_no<>0 and out_acco<>" " and crncy_type="CNY"and (co_no=v_co_no or v_co_no=0) and (pd_no=v_pd_no or v_pd_no=0) and row_id>v_tmp_row_id order by row_id limit 1;


    /* if @记录序号#>0  then */
    if v_row_id>0  then

      /* [检查正常返回][(@外部当前金额#+@外部可用金额#+@外部占用保证金#)=0] */
      if (v_out_curr_amt+v_out_enable_amt+v_out_capt_margin)=0 then
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
use db_pdfutu;;

# 原子_产品期货_资金运维_同步内外差异
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_QSynchronizedDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_QSynchronizedDiff(
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
    IN p_capt_margin decimal(18,4),
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
    declare v_capt_margin decimal(18,4);
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
    declare v_out_capt_margin decimal(18,4);
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_sync_capital_way int;
    declare v_sync_margin_amt int;
    declare v_remark_info varchar(255);
    declare v_acco_curr_amt decimal(18,4);
    declare v_acco_avail_amt decimal(18,4);
    declare v_act_capt_margin decimal(18,4);
    declare v_acco_avail_amt_diff decimal(18,4);
    declare v_act_capt_margin_diff decimal(18,4);
    declare v_acco_curr_amt_diff decimal(18,4);

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
    SET v_capt_margin = p_capt_margin;
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
    SET v_out_capt_margin = 0;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_sync_capital_way = 0;
    SET v_sync_margin_amt = 0;
    SET v_remark_info = " ";
    SET v_acco_curr_amt = 0;
    SET v_acco_avail_amt = 0;
    SET v_act_capt_margin = 0;
    SET v_acco_avail_amt_diff = 0;
    SET v_act_capt_margin_diff = 0;
    SET v_acco_curr_amt_diff = 0;

    
    label_pro:BEGIN
    

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品期货_资金_外部资产账户资金表][字段][字段变量][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {本币币种}=@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_capt_margin into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_out_curr_amt, v_out_enable_amt, 
        v_out_capt_margin from db_pdfutu.tb_pdfuca_out_asac_capit where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and crncy_type=v_crncy_type limit 1;


    /* if @记录序号#>0  then */
    if v_row_id>0  then

      /* [检查正常返回][(@外部当前金额#+@外部可用金额#+@外部占用保证金#)=0] */
      if (v_out_curr_amt+v_out_enable_amt+v_out_capt_margin)=0 then
          leave label_pro;
      end if;

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

    /* set @同步资金方式#=cast(substring(@资产账户业务控制配置串#, 20, 1) as SIGNED); */
    set v_sync_capital_way=cast(substring(v_asac_busi_config_str, 20, 1) as SIGNED);

    /* set @同步保证金#=cast(substring(@资产账户业务控制配置串#, 29, 1) as SIGNED); */
    set v_sync_margin_amt=cast(substring(v_asac_busi_config_str, 29, 1) as SIGNED);

    /* set @备注信息# = "外部数据转入"; */
    set v_remark_info = "外部数据转入";

    /* set @账户当前金额# = @当前金额#; */
    set v_acco_curr_amt = v_curr_amt;

    /* set @账户可用金额# = @可用金额#; */
    set v_acco_avail_amt = v_avail_amt;

    /* set @账户占用保证金# = @占用保证金#; */
    set v_act_capt_margin = v_capt_margin;

    /* set @账户可用金额差额#=@外部可用金额# - @账户可用金额#; */
    set v_acco_avail_amt_diff=v_out_enable_amt - v_acco_avail_amt;

    /* if @同步保证金# = 《同步保证金-同步》  then */
    if v_sync_margin_amt = 1  then

        /* set @账户占用保证金差额#=@外部占用保证金#-@账户占用保证金#; */
        set v_act_capt_margin_diff=v_out_capt_margin-v_act_capt_margin;

    /* elseif @同步保证金# = 《同步保证金-不同步》  then */
    elseif v_sync_margin_amt = 0  then

        /* set @账户占用保证金差额#=0; */
        set v_act_capt_margin_diff=0;
    end if;

    /* if @同步资金方式# = 《同步资金方式-同步可用金额》  then */
    if v_sync_capital_way = 0  then

         /* set @账户当前金额差额#=@账户可用金额差额# + @账户占用保证金差额#; */
         set v_acco_curr_amt_diff=v_acco_avail_amt_diff + v_act_capt_margin_diff;
    else

         /* set @账户当前金额差额#=@外部当前金额# - @账户当前金额#; */
         set v_acco_curr_amt_diff=v_out_curr_amt - v_acco_curr_amt;
    end if;

    /* [插入重复更新][产品期货_资金_内外资产账户资金差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {账户当前金额}=@账户当前金额#, {账户可用金额}=@账户可用金额#, {账户占用保证金}=@账户占用保证金#,{外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#,{外部占用保证金}=@外部占用保证金#,{账户当前金额差额}=@账户当前金额差额#, {账户可用金额差额}=@账户可用金额差额#, {账户占用保证金差额}=@账户占用保证金差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_asac_capit_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, crncy_type, acco_curr_amt, acco_avail_amt, 
        act_capt_margin, out_curr_amt, out_enable_amt, out_capt_margin, 
        acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, deal_flag, 
        asset_sync_flag, remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_acco_curr_amt, v_acco_avail_amt, 
        v_act_capt_margin, v_out_curr_amt, v_out_enable_amt, v_out_capt_margin, 
        v_acco_curr_amt_diff, v_acco_avail_amt_diff, v_act_capt_margin_diff, v_deal_flag, 
        v_asset_sync_flag, v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, acco_curr_amt=v_acco_curr_amt, acco_avail_amt=v_acco_avail_amt, act_capt_margin=v_act_capt_margin,out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt,out_capt_margin=v_out_capt_margin,acco_curr_amt_diff=v_acco_curr_amt_diff, acco_avail_amt_diff=v_acco_avail_amt_diff, act_capt_margin_diff=v_act_capt_margin_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.10.16.1";
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
use db_pdfutu;;

# 原子_产品期货_资金运维_获取差异表资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_funct_pdfucabk_GetDiffCapitalData;;
DELIMITER ;;
CREATE PROCEDURE pra_funct_pdfucabk_GetDiffCapitalData(
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
    

    /* [获取表记录变量][产品期货_资金_内外资产账户资金差异表][{交易组编号},{资产账户编号},{产品编号},{外部账号}][@交易组编号#,@资产账户编号#,@产品编号#,@外部账号#][{记录序号}=@记录序号#][4][@记录序号#] */
    select exch_group_no,asset_acco_no,pd_no,out_acco into v_exch_group_no,v_asset_acco_no,v_pd_no,v_out_acco from db_pdfutu.tb_pdfuca_asac_capit_diff where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.10.17.4";
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
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_out_acco = v_out_acco;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_QueryExgpCapital(
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
    

    /* [获取表记录][产品期货_资金_交易组资金表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, frozen_amt, 
        unfroz_amt, total_rece_amt, total_payab_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_exgp_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, frozen_amt, 
        unfroz_amt, total_rece_amt, total_payab_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_exgp_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_QueryAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_QueryAsacCapital(
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
    

    /* [获取表记录][产品期货_资金_资产账户资金表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_QueryAsacCapital_Jour(
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
    

    /* [获取表记录][产品期货_资金_资产账户资金流水表][字段][{初始化日期}<=@初始化日期# and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_jour where init_date<=v_init_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_jour where init_date<=v_init_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金运维_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfucabk_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfucabk_QueryAsacCapital_JourHis(
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
    

    /* [获取表记录][历史_产品期货_资金_资产账户资金流水表][字段][{初始化日期} = @查询日期# and (@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#)  and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfuca_asac_capit_jour_his where init_date = v_query_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfuca_asac_capit_jour_his where init_date = v_query_date and (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no)  and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


