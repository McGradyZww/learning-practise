DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_分配产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_DistrPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_DistrPdCapital(
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
    declare v_curr_amt decimal(18,4);
    declare v_asac_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
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
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_exch_crncy_type varchar(3);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

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
    SET v_curr_amt = 0;
    SET v_asac_update_times = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
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
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* if @变动金额# = 0 then */
    if v_occur_amt = 0 then

        /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select curr_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


        /* [检查正常返回][@资产账户资金序号#>0] */
        if v_asac_cash_id>0 then
            leave label_pro;
        end if;

    end if;
    #再处理资产账户资产表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

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

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.8.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|");


    /* set @业务标志# = 《业务标志-资金分配》; */
    set v_busi_flag = 1004001;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @交易币种# = @本币币种#; */
    set v_exch_crncy_type = v_crncy_type;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

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
                
        SET v_error_code = "pdsecuA.2.8.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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

# 原子_产品证券_资金_回收产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_BackPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_BackPdCapital(
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
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_asac_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_exch_crncy_type varchar(3);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品证券_资金_资产账户资金表][{当前金额}={当前金额}-@当前金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_curr_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|");


    /* set @业务标志# = 《业务标志-资金分配回收》; */
    set v_busi_flag = 1004002;

    /* set @变动金额# = -1 * @变动金额#; */
    set v_occur_amt = -1 * v_occur_amt;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @交易币种# = @本币币种#; */
    set v_exch_crncy_type = v_crncy_type;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

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
                
        SET v_error_code = "pdsecuA.2.9.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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

# 原子_产品证券_资金_授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_AuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_AuthPdCapital(
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
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
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
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_auth_avail_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_is_auth_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

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
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
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
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_auth_avail_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_is_auth_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    
    #[检查正常返回][@变动金额#=0]

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;
    #处理交易组资金表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

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

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [锁定获取表记录变量][产品证券_资金_资产账户资金表][{当前金额}][@可授权金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt into v_auth_avail_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][sum({当前金额})][@已授权金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select sum(curr_amt) into v_is_auth_amt from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@可授权金额#<@已授权金额#][619][@资产账户编号#,@可授权金额#,@已授权金额#]

    /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|");


    /* set @业务标志# = 《业务标志-资金授权》; */
    set v_busi_flag = 1004003;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.10.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_回收授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_BackAuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_BackAuthPdCapital(
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
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [检查正常返回][@变动金额#=0] */
    if v_occur_amt=0 then
        leave label_pro;
    end if;


    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;
    #处理交易组资金表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品证券_资金_交易组资金表][{当前金额}={当前金额}-@当前金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_curr_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|");


    /* set @业务标志# = 《业务标志-资金授权回收》; */
    set v_busi_flag = 1004004;

    /* set @变动金额# = -1 * @变动金额#; */
    set v_occur_amt = -1 * v_occur_amt;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.11.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_资产账户资金应收应付变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_AsacCapitalChange;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_AsacCapitalChange(
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
    OUT p_total_rece_amt_diff decimal(18,4),
    OUT p_total_payab_amt_diff decimal(18,4),
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
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_asac_update_times int;
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
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
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

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
    SET v_total_rece_amt_diff = 0;
    SET v_total_payab_amt_diff = 0;
    SET v_asac_update_times = 0;
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
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
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @当前金额# = 0; */
    set v_curr_amt = 0;

    /* [获取流水变动][{累计应收金额}][@累计应收金额#] */
    set v_jour_occur_field = concat("累计应收金额","|");
    set v_jour_occur_info = concat(v_total_rece_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额#=0; */
    set v_curr_amt=0;

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

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

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

    /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{累计应收金额},{累计应付金额}][@临时_累计应收金额#,@临时_累计应付金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select total_rece_amt,total_payab_amt into v_tmp_total_rece_amt,v_tmp_total_payab_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* set @累计应收金额差额#=@累计应收金额#-@临时_累计应收金额#; */
    set v_total_rece_amt_diff=v_total_rece_amt-v_tmp_total_rece_amt;

    /* set @累计应付金额差额#=@累计应付金额#-@临时_累计应付金额#; */
    set v_total_payab_amt_diff=v_total_payab_amt-v_tmp_total_payab_amt;

    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#][1][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.30.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额},{红冲蓝补金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@红冲蓝补金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,total_change_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_total_change_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.30.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt,"|");


    /* set @业务标志# = 《业务标志-应收应付调整》; */
    set v_busi_flag = 1011007;

    /* set @变动金额#=@累计应收金额差额#; */
    set v_occur_amt=v_total_rece_amt_diff;

    /* set @变动后金额# =@累计应收金额#; */
    set v_occur_end_amt =v_total_rece_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

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
                
        SET v_error_code = "pdsecuA.2.30.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应付金额}][@累计应付金额#] */
    set v_jour_occur_field = concat("累计应付金额","|");
    set v_jour_occur_info = concat(v_total_payab_amt,"|");


    /* [获取流水后信息][@累计应付金额#] */
    set v_jour_after_occur_info = concat(v_total_payab_amt,"|");


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;

    /* set @变动金额#=@累计应付金额差额#; */
    set v_occur_amt=v_total_payab_amt_diff;

    /* set @变动后金额# =@累计应付金额#; */
    set v_occur_end_amt =v_total_payab_amt;

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
                
        SET v_error_code = "pdsecuA.2.30.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

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
    SET p_total_rece_amt_diff = v_total_rece_amt_diff;
    SET p_total_payab_amt_diff = v_total_payab_amt_diff;
    SET p_asac_update_times = v_asac_update_times;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_交易组资金应收应付变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_ExchGroupCapitalChange;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_ExchGroupCapitalChange(
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
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
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
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

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
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
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
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_total_rece_amt_diff = 0;
    SET v_total_payab_amt_diff = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{累计应收金额}][@累计应收金额#] */
    set v_jour_occur_field = concat("累计应收金额","|");
    set v_jour_occur_info = concat(v_total_rece_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = 0; */
    set v_curr_amt = 0;

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

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

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

    /* [获取表记录变量语句][产品证券_资金_交易组资金表][{累计应收金额},{累计应付金额}][@临时_累计应收金额#,@临时_累计应付金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select total_rece_amt,total_payab_amt into v_tmp_total_rece_amt,v_tmp_total_payab_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* set @累计应收金额差额#=@累计应收金额#-@临时_累计应收金额#; */
    set v_total_rece_amt_diff=v_total_rece_amt-v_tmp_total_rece_amt;

    /* set @累计应付金额差额#=@累计应付金额#-@临时_累计应付金额#; */
    set v_total_payab_amt_diff=v_total_payab_amt-v_tmp_total_payab_amt;

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.31.asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(1,"#",v_mysql_message);
        else
            SET v_error_info = 1;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额},{红冲蓝补金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@红冲蓝补金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,total_change_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_total_change_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt,"|");


    /* set @业务标志# = 《业务标志-应收应付调整》; */
    set v_busi_flag = 1011007;

    /* set @变动金额#=@累计应收金额差额#; */
    set v_occur_amt=v_total_rece_amt_diff;

    /* set @变动后金额#=@累计应收金额#; */
    set v_occur_end_amt=v_total_rece_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.31.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应付金额}][@累计应付金额#] */
    set v_jour_occur_field = concat("累计应付金额","|");
    set v_jour_occur_info = concat(v_total_payab_amt,"|");


    /* [获取流水后信息][@累计应付金额#] */
    set v_jour_after_occur_info = concat(v_total_payab_amt,"|");


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;

    /* set @变动金额#=@累计应付金额差额#; */
    set v_occur_amt=v_total_payab_amt_diff;

    /* set @变动后金额#=@累计应付金额#; */
    set v_occur_end_amt=v_total_payab_amt;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.31.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

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

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_FrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_FrozenExgpCapital(
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
    IN p_asac_frozen_no bigint,
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
    declare v_asac_frozen_no bigint;
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
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_asac_frozen_no = p_asac_frozen_no;
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_交易组资金表][{冻结金额}={冻结金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@冻结金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_frozen_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后金额# = @冻结金额#; */
    set v_occur_end_amt = v_frozen_amt;

    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-冻结》; */
    set v_frozen_type = 1;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_交易组资金冻结解冻流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_exgp_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        asac_frozen_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_frozen_type, v_occur_amt, v_expire_date, v_jour_status, 
        v_asac_frozen_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.32.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_取消冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UndoFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UndoFrozenExgpCapital(
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
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
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
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_资金_交易组资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.2.33.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_交易组资金表][{冻结金额}={冻结金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@冻结金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组累计应收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_frozen_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exch_group_total_rece_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_交易组资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UnFrozenExgpCapital(
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
    IN p_asac_frozen_no bigint,
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
    declare v_asac_frozen_no bigint;
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
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_asac_frozen_no = p_asac_frozen_no;
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_交易组资金表][{解冻金额}={解冻金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.34.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@解冻金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_unfroz_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后金额# = @解冻金额#; */
    set v_occur_end_amt = v_unfroz_amt;

    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-解冻》; */
    set v_frozen_type = 2;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_交易组资金冻结解冻流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_exgp_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        asac_frozen_no, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_frozen_type, v_occur_amt, v_expire_date, v_jour_status, 
        v_asac_frozen_no, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.34.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_取消解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UndoUnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UndoUnFrozenExgpCapital(
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
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
    declare v_exch_group_update_times int;
    declare v_co_no int;
    declare v_pd_no int;

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
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_资金_交易组资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.2.35.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_交易组资金表][{解冻金额}={解冻金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.35.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@解冻金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_unfroz_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_交易组资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@机构编号#,@产品编号#,@资产账户编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.35.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_红冲蓝补交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_PatchExchGroupCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_PatchExchGroupCapital(
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

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
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_amt = 0;
    SET v_total_change_amt = 0;
    SET v_begin_amt = 0;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{当前金额},{红冲蓝补金额}][@当前金额#,@红冲蓝补金额#] */
    set v_jour_occur_field = concat("当前金额","|","红冲蓝补金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_total_change_amt,"|");


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

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = @变动金额#; */
    set v_total_change_amt = v_occur_amt;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt,total_change_amt=total_change_amt+v_total_change_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.36.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额},{红冲蓝补金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@红冲蓝补金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,total_change_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_total_change_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.36.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@红冲蓝补金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_total_change_amt,"|");


    /* if @变动金额# > 0 then */
    if v_occur_amt > 0 then

        /* set @业务标志# = 《业务标志-资金蓝补》; */
        set v_busi_flag = 1003002;
    else

        /* set @业务标志# = 《业务标志-资金红冲》; */
        set v_busi_flag = 1003001;
    end if;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.36.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpCapital(
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
    

    /* [获取表记录][产品证券_资金_交易组资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询历史交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpCapital_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpCapital_His(
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
    

    /* [获取表记录][产品证券_资金_历史交易组资金表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, 
        amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, 
        T1_hk_sell_total_amt, total_change_amt, total_rece_amt, total_payab_amt, 
        realize_pandl, intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu_his.tb_pdseca_exgp_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, begin_amt, curr_amt, frozen_amt, 
        unfroz_amt, pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, 
        amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, 
        T1_hk_sell_total_amt, total_change_amt, total_rece_amt, total_payab_amt, 
        realize_pandl, intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu_his.tb_pdseca_exgp_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpCapital_Jour(
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
    

    /* [获取表记录][产品证券_资金_交易组资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseca_exgp_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseca_exgp_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询历史交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpCapital_JourHis(
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
    

    /* [获取表记录][历史_产品证券_资金_交易组资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseca_exgp_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseca_exgp_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpCapitalFrozenJour(
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
    

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* [获取表记录][产品证券_资金_交易组资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, asac_frozen_no, oper_remark_info from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, asac_frozen_no, oper_remark_info from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][产品证券_资金_交易组资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, asac_frozen_no, oper_remark_info from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, asac_frozen_no, oper_remark_info from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询历史交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpCapitalFrozenJour_His(
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
    

    /* [获取表记录][历史_产品证券_资金_交易组资金冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, asac_frozen_no, oper_remark_info from db_pdsecu_his.tb_pdseca_exgp_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, asac_frozen_no, oper_remark_info from db_pdsecu_his.tb_pdseca_exgp_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetExgpCapitalFrozenJour(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_remark_info varchar(255);

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_交易组资金冻结解冻流水表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, asac_frozen_no, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_crncy_type, v_frozen_type, v_occur_amt, v_expire_date, 
        v_jour_status, v_asac_frozen_no, v_oper_remark_info from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.43.4";
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

# 原子_产品证券_资金_获取资产账户关联交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetAascExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetAascExgpCapitalFrozenJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_asac_frozen_no bigint,
    IN p_frozen_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_asac_frozen_no bigint;
    declare v_frozen_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_exch_group_no int;
    declare v_occur_amt decimal(18,4);
    declare v_jour_status varchar(2);

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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_asac_frozen_no = p_asac_frozen_no;
    SET v_frozen_type = p_frozen_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_exch_group_no = 0;
    SET v_occur_amt = 0;
    SET v_jour_status = "0";

    
    label_pro:BEGIN
    

    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* [获取表记录变量][产品证券_资金_交易组资金冻结解冻流水表][{记录序号},{交易组编号},{变动金额}][@记录序号#,@交易组编号#,@变动金额#][{资产账户冻结解冻流水号}=@资产账户冻结解冻流水号# and {冻结解冻类型}=@冻结解冻类型# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种# and {流水状态}=@流水状态#][4][@资产账户冻结解冻流水号#,@资产账户编号#,@冻结解冻类型#,@本币币种#,@流水状态#] */
    select row_id,exch_group_no,occur_amt into v_row_id,v_exch_group_no,v_occur_amt from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where asac_frozen_no=v_asac_frozen_no and frozen_type=v_frozen_type and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type and jour_status=v_jour_status limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.46.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户冻结解冻流水号=",v_asac_frozen_no,",","资产账户编号=",v_asset_acco_no,",","冻结解冻类型=",v_frozen_type,",","本币币种=",v_crncy_type,",","流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户冻结解冻流水号=",v_asac_frozen_no,",","资产账户编号=",v_asset_acco_no,",","冻结解冻类型=",v_frozen_type,",","本币币种=",v_crncy_type,",","流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_exch_group_no = v_exch_group_no;
    SET p_occur_amt = v_occur_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_更新交易组资金累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UpdateExchGroupCapitalRecePayab;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UpdateExchGroupCapitalRecePayab(
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_total_rece_amt_diff = 0;
    SET v_total_payab_amt_diff = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][{累计应收金额}][@累计应收金额#] */
    set v_jour_occur_field = concat("累计应收金额","|");
    set v_jour_occur_info = concat(v_total_rece_amt,"|");


    /* [获取表记录变量语句][产品证券_资金_交易组资金表][{累计应收金额},{累计应付金额}][@临时_累计应收金额#,@临时_累计应付金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select total_rece_amt,total_payab_amt into v_tmp_total_rece_amt,v_tmp_total_payab_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* set @累计应收金额差额#=@累计应收金额#-@临时_累计应收金额#; */
    set v_total_rece_amt_diff=v_total_rece_amt-v_tmp_total_rece_amt;

    /* set @累计应付金额差额#=@累计应付金额#-@临时_累计应付金额#; */
    set v_total_payab_amt_diff=v_total_payab_amt-v_tmp_total_payab_amt;

    /* [更新表记录][产品证券_资金_交易组资金表][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.44.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{累计应收金额},{累计应付金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@累计应收金额#,@累计应付金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select total_rece_amt,total_payab_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_total_rece_amt,v_total_payab_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.44.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt,"|");


    /* set @业务标志# = 《业务标志-应收应付调整》; */
    set v_busi_flag = 1011007;

    /* set @变动金额# = @累计应收金额差额#; */
    set v_occur_amt = v_total_rece_amt_diff;

    /* set @变动后金额# = @累计应收金额#; */
    set v_occur_end_amt = v_total_rece_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "更新交易组资金累计应收应付"; */
    set v_oper_remark_info = "更新交易组资金累计应收应付";

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.44.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应付金额}][@累计应付金额#] */
    set v_jour_occur_field = concat("累计应付金额","|");
    set v_jour_occur_info = concat(v_total_payab_amt,"|");


    /* [获取流水后信息][@累计应付金额#] */
    set v_jour_after_occur_info = concat(v_total_payab_amt,"|");


    /* set @变动金额# = @累计应付金额差额#; */
    set v_occur_amt = v_total_payab_amt_diff;

    /* set @变动后金额# = @累计应付金额#; */
    set v_occur_end_amt = v_total_payab_amt;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.44.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
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

# 原子_产品证券_资金_查询交易组资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpGroupAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpGroupAsset(
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
    

    /* [获取表记录][产品证券_资金_交易组资产表][{记录序号},{机构编号},{产品编号},{交易组编号},{本币币种},{期初净资产},{净资产},{现金资产},{股票资产},{基金资产},{债券资产},{回购资产},{其他资产},{港股通资产}][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种# = " " or {本币币种}=@本币币种#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,cash_asset,stock_asset,fund_asset,bond_asset,repo_asset,other_asset,hk_thrgh_stock_asset from db_pdsecu.tb_pdseca_exgp_asset where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id;
    else
        select row_id,co_no,pd_no,exch_group_no,crncy_type,begin_NAV,nav_asset,cash_asset,stock_asset,fund_asset,bond_asset,repo_asset,other_asset,hk_thrgh_stock_asset from db_pdsecu.tb_pdseca_exgp_asset where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type = " " or crncy_type=v_crncy_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_红冲蓝补资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_PatchAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_PatchAsacCapital(
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
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_total_change_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_asac_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

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
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_total_change_amt = 0;
    SET v_begin_amt = 0;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* [获取流水变动][{当前金额},{红冲蓝补金额}][@当前金额#,@红冲蓝补金额#] */
    set v_jour_occur_field = concat("当前金额","|","红冲蓝补金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_total_change_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

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

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = @变动金额#; */
    set v_total_change_amt = v_occur_amt;

    /* set @实现盈亏# = 0; */
    set v_realize_pandl = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#][1][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt,total_change_amt=total_change_amt+v_total_change_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.51.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额},{红冲蓝补金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@当前金额#,@红冲蓝补金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,total_change_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_curr_amt,v_total_change_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@红冲蓝补金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_total_change_amt,"|");


    /* if @变动金额# > 0 then */
    if v_occur_amt > 0 then

        /* set @业务标志# = 《业务标志-资金蓝补》; */
        set v_busi_flag = 1003002;
    else

        /* set @业务标志# = 《业务标志-资金红冲》; */
        set v_busi_flag = 1003001;
    end if;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

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
                
        SET v_error_code = "pdsecuA.2.51.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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

# 原子_产品证券_资金_冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_FrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_FrozenAsacCapital(
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
    OUT p_update_times int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_is_change_exch_group_capital int;
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
    declare v_asac_frozen_no bigint;
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
    declare v_asac_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
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
    SET v_asac_frozen_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_asac_update_times = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_资产账户资金表][{冻结金额}={冻结金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@冻结金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_frozen_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后金额# = @冻结金额#; */
    set v_occur_end_amt = v_frozen_amt;

    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-冻结》; */
    set v_frozen_type = 1;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_资产账户资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, crncy_type, frozen_type, 
        occur_amt, expire_date, jour_status, is_change_exch_group_capital, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_frozen_type, 
        v_occur_amt, v_expire_date, v_jour_status, v_is_change_exch_group_capital, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.52.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@资产账户冻结解冻流水号#] */
    select LAST_INSERT_ID() into v_asac_frozen_no;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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
    SET p_asac_frozen_no = v_asac_frozen_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_取消冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UndoFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UndoFrozenAsacCapital(
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
    IN p_occur_amt decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
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
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
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
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_资金_资产账户资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.2.53.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{冻结金额}={冻结金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@冻结金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_frozen_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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

# 原子_产品证券_资金_解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UnFrozenAsacCapital(
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
    OUT p_update_times int,
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_is_change_exch_group_capital int;
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
    declare v_asac_frozen_no bigint;
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
    declare v_asac_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
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
    SET v_asac_frozen_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_asac_update_times = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品证券_资金_资产账户资金表][{解冻金额}={解冻金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@解冻金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_unfroz_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.54.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后金额# = @解冻金额#; */
    set v_occur_end_amt = v_unfroz_amt;

    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-解冻》; */
    set v_frozen_type = 2;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_资产账户资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_asac_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, crncy_type, frozen_type, 
        occur_amt, expire_date, jour_status, is_change_exch_group_capital, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_frozen_type, 
        v_occur_amt, v_expire_date, v_jour_status, v_is_change_exch_group_capital, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@资产账户冻结解冻流水号#] */
    select LAST_INSERT_ID() into v_asac_frozen_no;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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
    SET p_asac_frozen_no = v_asac_frozen_no;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_取消解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UndoUnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UndoUnFrozenAsacCapital(
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
    IN p_occur_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
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
    declare v_update_times int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
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
    SET v_update_times = 1;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_资金_资产账户资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdsecuA.2.55.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{解冻金额}={解冻金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@解冻金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_unfroz_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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

# 原子_产品证券_资金_修改资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_ModiAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_ModiAsacCapital(
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
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
    declare v_total_change_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_exch_crncy_type varchar(3);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);

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
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
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
    SET v_total_change_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "本币币种", "|", "累计应收金额", "|", "累计应付金额", "|", "实现盈亏", "|", "利率", "|", "利息积数", "|", "待入账利息", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_crncy_type, "|", v_total_rece_amt, "|", v_total_payab_amt, "|", v_realize_pandl, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品证券_资金_资产账户资金表][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#,{实现盈亏}=@实现盈亏#,{利率}=@利率#,{利息积数}=@利息积数#,{待入账利息}=@待入账利息#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt,realize_pandl=v_realize_pandl,intrst_rate=v_intrst_rate,intrst_base_amt=v_intrst_base_amt,pre_entry_intrst_amt=v_pre_entry_intrst_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.56.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_frozen_amt, v_unfroz_amt, v_pre_settle_amt, 
        v_shsz_avail_change_amt, v_hk_avail_change_amt, v_amt_check_diff, v_T_hk_buy_total_amt, 
        v_T_hk_sell_total_amt, v_T1_hk_buy_total_amt, v_T1_hk_sell_total_amt, v_total_rece_amt, 
        v_total_payab_amt, v_total_change_amt, v_realize_pandl, v_intrst_rate, 
        v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.56.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_crncy_type, "|", v_total_rece_amt, "|", v_total_payab_amt, "|", v_realize_pandl, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @业务标志# = 0; */
    set v_busi_flag = 0;

    /* set @变动金额# = 0; */
    set v_occur_amt = 0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* set @交易币种# = @本币币种#; */
    set v_exch_crncy_type = v_crncy_type;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

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
                
        SET v_error_code = "pdsecuA.2.56.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryAsacCapital(
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
    

    /* [获取表记录][产品证券_资金_资产账户资金表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@产品编号权限串# = ' '  or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str = ' '  or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str = ' '  or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询历史资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryAsacCapital_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryAsacCapital_His(
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
    

    /* [获取表记录][产品证券_资金_历史资产账户资金表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu_his.tb_pdseca_asac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu_his.tb_pdseca_asac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryAsacCapital_Jour(
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
    

    /* [获取表记录][产品证券_资金_资产账户资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryAsacCapital_JourHis(
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
    

    /* [获取表记录][历史_产品证券_资金_资产账户资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdsecu_his.tb_pdseca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryAsacCapitalFrozenJour(
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
    

    /* if @操作员机构编号# = 9999 then */
    if v_opor_co_no = 9999 then

        /* [获取表记录][产品证券_资金_资产账户资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and  (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            is_change_exch_group_capital, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and  (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            is_change_exch_group_capital, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and  (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][产品证券_资金_资产账户资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            is_change_exch_group_capital, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            is_change_exch_group_capital, oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询历史资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryAsacCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryAsacCapitalFrozenJour_His(
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
    

    /* [获取表记录][历史_产品证券_资金_资产账户资金冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        is_change_exch_group_capital, oper_remark_info from db_pdsecu_his.tb_pdseca_asac_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        is_change_exch_group_capital, oper_remark_info from db_pdsecu_his.tb_pdseca_asac_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetAsacCapitalFrozenJour(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_oper_remark_info varchar(255);

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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_资产账户资金冻结解冻流水表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        is_change_exch_group_capital, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_crncy_type, 
        v_frozen_type, v_occur_amt, v_expire_date, v_jour_status, 
        v_is_change_exch_group_capital, v_oper_remark_info from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.63.4";
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

# 原子_产品证券_资金_获取资产账户资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetAsacCapitalAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetAsacCapitalAvail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_crncy_type varchar(3),
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
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_asac_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_sync_capital_way int;
    declare v_hk_cash_avail_date_type int;
    declare v_sync_hk_capital int;
    declare v_acco_avail_amt decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_tmp_avail_amt decimal(18,4);
    declare v_hk_avail_amt decimal(18,4);
    declare v_shsz_avail_amt decimal(18,4);
    declare v_static_avail_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_avail_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_sync_capital_way = 0;
    SET v_hk_cash_avail_date_type = 0;
    SET v_sync_hk_capital = 0;
    SET v_acco_avail_amt = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_tmp_avail_amt = 0;
    SET v_hk_avail_amt = 0;
    SET v_shsz_avail_amt = 0;
    SET v_static_avail_amt = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @同步资金方式#=cast(substring(@资产账户业务控制配置串#, 20, 1) as SIGNED); */
    set v_sync_capital_way=cast(substring(v_asac_busi_config_str, 20, 1) as SIGNED);

    /* set @港股通资金可用日期#=cast(substring(@资产账户业务控制配置串#, 21, 1) as SIGNED); */
    set v_hk_cash_avail_date_type=cast(substring(v_asac_busi_config_str, 21, 1) as SIGNED);

    /* set @同步港股资金#=cast(substring(@资产账户业务控制配置串#, 27, 1) as SIGNED); */
    set v_sync_hk_capital=cast(substring(v_asac_busi_config_str, 27, 1) as SIGNED);

    /* if @本币币种# = "HKD" and @同步港股资金# = 《同步港股资金-同步》  then */
    if v_crncy_type = "HKD" and v_sync_hk_capital = 1  then

        /* set @本币币种# = "CNY"; */
        set v_crncy_type = "CNY";
    end if;
    #[获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额}+{港股通可用调整金额}+{金额核对差额},{当前金额},{当前金额}+{沪深可用调整金额}-{冻结金额}+{解冻金额}+{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应付金额},{累计应收金额}][@账户可用金额#,@当前金额#,@可用金额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应付金额#,@累计应收金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#]
    #内部可用不考虑冻结解冻。

    /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额}+{港股通可用调整金额}+{金额核对差额},{当前金额},{当前金额}+{沪深可用调整金额}+{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应付金额},{累计应收金额}][@账户可用金额#,@当前金额#,@可用金额#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@累计应付金额#,@累计应收金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select curr_amt+hk_avail_change_amt+amt_check_diff,curr_amt,curr_amt+shsz_avail_change_amt+amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_payab_amt,total_rece_amt into v_acco_avail_amt,v_curr_amt,v_avail_amt,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_total_payab_amt,v_total_rece_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


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

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;

    #没有多条的情况，统一插入重复更新至默认交易组。Mby wjp 20190131
    #if @记录个数#=1 or @记录个数#=0  then
       # [获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#]
    #elseif @记录个数#=0 then
    #    set @交易组编号# = @默认交易组编号#;
    #elseif @记录个数#>1 then
     #   set @交易组编号# = 0;
    #end if;
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

# 原子_产品证券_资金_更新资产账户资金累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UpdateAsacCapitalRecePayab;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UpdateAsacCapitalRecePayab(
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
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_asac_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
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
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][{累计应收金额},{累计应付金额}][@累计应收金额#,@累计应付金额#] */
    set v_jour_occur_field = concat("累计应收金额","|","累计应付金额","|");
    set v_jour_occur_info = concat(v_total_rece_amt,"|",v_total_payab_amt,"|");


    /* [更新表记录][产品证券_资金_资产账户资金表][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.65.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{累计应收金额},{累计应付金额},{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@累计应收金额#,@累计应付金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select total_rece_amt,total_payab_amt,row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_total_rece_amt,v_total_payab_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.65.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额#,@累计应付金额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt,"|",v_total_payab_amt,"|");


    /* set @业务标志# = 《业务标志-应收应付调整》; */
    set v_busi_flag = 1011007;

    /* set @变动金额# = 0; */
    set v_occur_amt = 0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "更新资产账户资金累计应收应付"; */
    set v_oper_remark_info = "更新资产账户资金累计应收应付";

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
                
        SET v_error_code = "pdsecuA.2.65.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
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

# 原子_产品证券_资金_新增银证转账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_AddBankTransferRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_AddBankTransferRecord(
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
    declare v_bank_acco_no int;
    declare v_record_count int;
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
    SET v_bank_acco_no = 0;
    SET v_record_count = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @银行账户编号#=0; */
    set v_bank_acco_no=0;

    /* [获取表记录数量][产品证券_资金_银证转账流水表][@记录个数#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {银行账户编号}=@银行账户编号# and {本币币种}=@本币币种# and {银证流水号}=@银证流水号#] */
    select count(1) into v_record_count from db_pdsecu.tb_pdseca_bank_transfer where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and bank_acco_no=v_bank_acco_no and crncy_type=v_crncy_type and bank_jour_no=v_bank_jour_no;


    /* [检查报错返回][@记录个数#<>0][1]["该银证转账记录已存在 !"] */
    if v_record_count<>0 then
        
        SET v_error_code = "pdsecuA.2.66.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("该银证转账记录已存在 !","#",v_mysql_message);
        else
            SET v_error_info = "该银证转账记录已存在 !";
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][产品证券_资金_银证转账流水表][字段][字段变量][1][@机构编号#,@产品编号#,@资产账户编号#,@银行账户编号#,@本币币种#,@银证流水号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_bank_transfer(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, trans_date, 
        trans_time, co_no, pd_no, asset_acco_no, 
        pass_no, out_acco, bank_acco_no, crncy_type, 
        busi_flag, occur_amt, trans_status, bank_jour_no, 
        remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_trans_date, 
        v_trans_time, v_co_no, v_pd_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_bank_acco_no, v_crncy_type, 
        v_busi_flag, v_occur_amt, v_trans_status, v_bank_jour_no, 
        v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.66.1";
        SET v_error_info =  CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type,",","银证流水号=",v_bank_jour_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    #set @记录个数#=0;
    #[获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{交易组编号}<>0 and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"]
    #set @交易组编号串#=" ";
    #set @交易组编号#=0;
    #if @记录个数#>1 then
        #select GROUP_CONCAT(exch_group_no ORDER BY row_id SEPARATOR ';') into @交易组编号串# from tb_pdseca_exgp_capit where asset_acco_no=@资产账户编号#;
        #set @交易组编号串#=concat(@交易组编号串#,";;");
    #elseif @记录个数#=1 then
        #[获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{交易组编号}<>0 and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"][4][@资产账户编号#]
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_处理银证转账资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_DealBankTransferCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_DealBankTransferCapit(
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
    declare v_oper_remark_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_tmp_exch_group_no_str varchar(2048);
    declare v_tmp_weight_value_str varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
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
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_total_weight_value decimal(18,4);
    declare v_weight_value decimal(18,4);

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
    SET v_oper_remark_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_tmp_occur_amt = 0;
    SET v_tmp_exch_group_no_str = " ";
    SET v_tmp_weight_value_str = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
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
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_amt = 0;
    SET v_total_weight_value = 0;
    SET v_weight_value = 0;

    
    label_pro:BEGIN
    

    /* set @操作备注#="银证转账资金变动 !"; */
    set v_oper_remark_info="银证转账资金变动 !";

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @临时_变动金额#=@变动金额#; */
    set v_tmp_occur_amt=v_occur_amt;

    /* set @临时_交易组编号串#=@交易组编号串#; */
    set v_tmp_exch_group_no_str=v_exch_group_no_str;

    /* set @临时_权重串#=@权重串#; */
    set v_tmp_weight_value_str=v_weight_value_str;

    /* set @流水变动字段#=" "; */
    set v_jour_occur_field=" ";

    /* set @流水后信息#=" "; */
    set v_jour_after_occur_info=" ";

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

        /* set @金额核对差额#=0; */
        set v_amt_check_diff=0;

        /* set @T日当日港股买入金额#=0; */
        set v_T_hk_buy_total_amt=0;

        /* set @T日当日港股卖出金额#=0; */
        set v_T_hk_sell_total_amt=0;

        /* set @T1日当日港股买入金额#=0; */
        set v_T1_hk_buy_total_amt=0;

        /* set @T1日当日港股卖出金额#=0; */
        set v_T1_hk_sell_total_amt=0;

        /* set @累计应收金额# = 0; */
        set v_total_rece_amt = 0;

        /* set @累计应付金额# = 0; */
        set v_total_payab_amt = 0;

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
        #set @交易组编号#=@默认交易组编号#;
    #产品下只有一个交易组，且为资产账户的默认交易组 直接更新。

    /* if @交易组编号#  <> 0 then */
    if v_exch_group_no  <> 0 then

        /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
        ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
        if v_error_code = "1" then
                    
            SET v_error_code = "pdsecuA.2.67.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额},{交易组编号}][@变动后金额#,@交易组编号#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
        select curr_amt,exch_group_no into v_occur_end_amt,v_exch_group_no from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "pdsecuA.2.67.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
            end if;
            leave label_pro;
        end if;


        /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                    
            SET v_error_code = "pdsecuA.2.67.5";
            SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
            leave label_pro;
        end if;


    /* elseif @交易组编号# = 0  then */
    elseif v_exch_group_no = 0  then
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

            /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
            ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
            if v_error_code = "1" then
                        
                SET v_error_code = "pdsecuA.2.67.1";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


            /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}][@变动后金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
            select curr_amt into v_occur_end_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
            if FOUND_ROWS() = 0 then
                        
                SET v_error_code = "pdsecuA.2.67.4";
                if v_mysql_message <> "" then
                    SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                else
                    SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                end if;
                leave label_pro;
            end if;


            /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                        
                SET v_error_code = "pdsecuA.2.67.5";
                SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
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

                    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
                    if v_error_code = "1" then
                                
                        SET v_error_code = "pdsecuA.2.67.1";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
                        end if;
                        leave label_pro;
                    end if;


                    /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额}][@变动后金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
                    select curr_amt into v_occur_end_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
                    if FOUND_ROWS() = 0 then
                                
                        SET v_error_code = "pdsecuA.2.67.4";
                        if v_mysql_message <> "" then
                            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
                        else
                            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
                        end if;
                        leave label_pro;
                    end if;


                    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                                
                        SET v_error_code = "pdsecuA.2.67.5";
                        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
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
    #新增对资产账户的资金处理

    /* set @变动金额#=@临时_变动金额#; */
    set v_occur_amt=v_tmp_occur_amt;

    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][2][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.67.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{更新次数}][@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户港股通可用调整金额#,@资产账户金额核对差额#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_hk_avail_change_amt,v_asac_amt_check_diff,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.67.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @变动后金额#=@资产账户当前金额#; */
    set v_occur_end_amt=v_asac_curr_amt;

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
                
        SET v_error_code = "pdsecuA.2.67.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

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

# 原子_产品证券_资金_外部证券资金流水记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_DealOutSecuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_DealOutSecuCapitalJour(
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
    declare v_deal_flag int;
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
    SET v_deal_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @处理标志#=《处理标志-未处理》; */
    set v_deal_flag=2;

    /* [插入表记录][产品证券_资金_外部证券资金流水表][字段][字段变量][1][@通道编号#,@通道资金流水号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_out_secu_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, out_acco, 
        init_date, pass_money_jour_no, busi_flag, crncy_type, 
        entry_amt, entry_end_amt, exch_no, stock_acco, 
        stock_code, remark_info, deal_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_out_acco, 
        v_init_date, v_pass_money_jour_no, v_busi_flag, v_crncy_type, 
        v_entry_amt, v_entry_end_amt, v_exch_no, v_stock_acco, 
        v_stock_code, v_remark_info, v_deal_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.101.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","通道资金流水号=",v_pass_money_jour_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取外部证券资金流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetOutSecuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetOutSecuCapitalJour(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_init_date int;
    declare v_pass_money_jour_no bigint;
    declare v_busi_flag int;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_pass_money_jour_no = 0;
    SET v_busi_flag = 0;
    SET v_crncy_type = "CNY";
    SET v_entry_amt = 0;
    SET v_entry_end_amt = 0;
    SET v_exch_no = 0;
    SET v_stock_acco = " ";
    SET v_stock_code = " ";
    SET v_remark_info = " ";
    SET v_deal_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_外部证券资金流水表][字段][字段变量][{记录序号}=@查询记录序号#][1][@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        out_acco, init_date, pass_money_jour_no, busi_flag, 
        crncy_type, entry_amt, entry_end_amt, exch_no, 
        stock_acco, stock_code, remark_info, deal_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_pass_no, 
        v_out_acco, v_init_date, v_pass_money_jour_no, v_busi_flag, 
        v_crncy_type, v_entry_amt, v_entry_end_amt, v_exch_no, 
        v_stock_acco, v_stock_code, v_remark_info, v_deal_flag from db_pdsecu.tb_pdseca_out_secu_capit_jour where row_id=v_query_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.102.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询外部证券资金流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryOutSecuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryOutSecuCapitalJour(
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
    

    /* [获取表记录][产品证券_资金_外部证券资金流水表][字段][(@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        out_acco, init_date, pass_money_jour_no, busi_flag, 
        crncy_type, entry_amt, entry_end_amt, exch_no, 
        stock_acco, stock_code, remark_info, deal_flag from db_pdsecu.tb_pdseca_out_secu_capit_jour where (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        out_acco, init_date, pass_money_jour_no, busi_flag, 
        crncy_type, entry_amt, entry_end_amt, exch_no, 
        stock_acco, stock_code, remark_info, deal_flag from db_pdsecu.tb_pdseca_out_secu_capit_jour where (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_归档产品证券资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_BackUpPdSecuCaptialData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_BackUpPdSecuCaptialData(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [不分日期数据归历史][产品证券_资金_交易资产账户资金表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_trd_asac_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, shsz_avail_amt, hk_avail_amt, 
        static_avail_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, shsz_avail_amt, hk_avail_amt, 
        static_avail_amt 
        from db_pdsecu.tb_pdseca_trd_asac_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_交易资产账户资金表][1=1][2][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_trd_asac_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_资金_交易库交易组资金表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_trd_exgp_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, crncy_type, shsz_avail_amt, 
        hk_avail_amt, static_avail_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, crncy_type, shsz_avail_amt, 
        hk_avail_amt, static_avail_amt 
        from db_pdsecu.tb_pdseca_trd_exgp_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_交易库交易组资金表][1=1][2][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_trd_exgp_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #[更新表记录][产品证券_资金_交易组资金表][{当前金额}={当前金额}+{金额核对差额},{红冲蓝补金额}=0,{金额核对差额}=0][1=1][2][" "]

    /* [删除表记录][产品证券_资金_历史交易组资金表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdseca_exgp_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_资金_交易组资金表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_exgp_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        curr_amt, frozen_amt, unfroz_amt, pre_settle_amt, 
        shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, 
        T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, 
        total_payab_amt, total_change_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt 
        from db_pdsecu.tb_pdseca_exgp_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_交易组资金表][{当前金额}={当前金额}+{金额核对差额},{红冲蓝补金额}=0,{金额核对差额}=0][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+amt_check_diff,total_change_amt=0,amt_check_diff=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_交易组资金流水表][字段][{初始化日期}<=@初始化日期#][1a][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_exgp_capit_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pdsecu.tb_pdseca_exgp_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1a";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_交易组资金流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_exgp_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_交易组资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1b][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_exgp_capit_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, asac_frozen_no, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, asac_frozen_no, oper_remark_info 
        from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1b";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_交易组资金冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_历史交易组资产表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdseca_exgp_asset_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_资金_交易组资产表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_exgp_asset_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        cash_asset, stock_asset, fund_asset, bond_asset, 
        repo_asset, other_asset, hk_thrgh_stock_asset) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        cash_asset, stock_asset, fund_asset, bond_asset, 
        repo_asset, other_asset, hk_thrgh_stock_asset 
        from db_pdsecu.tb_pdseca_exgp_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_交易组资产表][{期初净资产}={净资产}][1=1][1=1][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_NAV=nav_asset where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1=1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    #[更新表记录][产品证券_资金_资产账户资金表][{当前金额}={当前金额}+{金额核对差额},{红冲蓝补金额}=0,{金额核对差额}=0][1=1][2][" "]

    /* [删除表记录][产品证券_资金_历史资产账户资金表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdseca_asac_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_资金_资产账户资金表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_asac_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
        hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
        T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
        total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, curr_amt, 
        frozen_amt, unfroz_amt, pre_settle_amt, shsz_avail_change_amt, 
        hk_avail_change_amt, amt_check_diff, T_hk_buy_total_amt, T_hk_sell_total_amt, 
        T1_hk_buy_total_amt, T1_hk_sell_total_amt, total_rece_amt, total_payab_amt, 
        total_change_amt, realize_pandl, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt 
        from db_pdsecu.tb_pdseca_asac_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{当前金额}={当前金额}+{金额核对差额},{红冲蓝补金额}=0,{金额核对差额}=0][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+amt_check_diff,total_change_amt=0,amt_check_diff=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_资产账户资金流水表][字段][{初始化日期}<=@初始化日期#][1c][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_asac_capit_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pdsecu.tb_pdseca_asac_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1c";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_资产账户资金流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_asac_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_资产账户资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1d][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_asac_capit_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        is_change_exch_group_capital, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        is_change_exch_group_capital, oper_remark_info 
        from db_pdsecu.tb_pdseca_asac_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1d";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_资产账户资金冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_asac_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_历史资产账户资产表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdseca_asac_asset_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品证券_资金_资产账户资产表][字段][302][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_asac_asset_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_NAV, nav_asset, 
        cash_asset, stock_asset, fund_asset, bond_asset, 
        repo_asset, other_asset) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_NAV, nav_asset, 
        cash_asset, stock_asset, fund_asset, bond_asset, 
        repo_asset, other_asset 
        from db_pdsecu.tb_pdseca_asac_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资产表][{期初净资产}={净资产}][1=1][1=1][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_NAV=nav_asset where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1=1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_资金_外部资产账户资金表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdseca_out_asac_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_外部资产账户资金表][字段][{初始化日期}<=@初始化日期#][1e][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_out_asac_capit_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt, out_total_payab_amt, out_total_rece_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt, out_total_payab_amt, out_total_rece_amt 
        from db_pdsecu.tb_pdseca_out_asac_capit 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1e";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_外部资产账户资金表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_out_asac_capit 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_估值外部资产账户资金表][字段][{初始化日期}<=@初始化日期#][1f][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_evalu_out_asac_capit_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_frozen_amt, out_unfroz_amt 
        from db_pdsecu.tb_pdseca_evalu_out_asac_capit 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1f";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_估值外部资产账户资金表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_evalu_out_asac_capit 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][历史_产品证券_资金_内外资产账户资金差异表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdsecu_his.tb_pdseca_asac_capit_diff_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_内外资产账户资金差异表][字段][{初始化日期}<=@初始化日期#][1g][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_asac_capit_diff_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info 
        from db_pdsecu.tb_pdseca_asac_capit_diff 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1g";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_内外资产账户资金差异表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_asac_capit_diff 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_资金入账流水表][字段][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][1h][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_capit_entry_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, crncy_type, exch_crncy_type, busi_flag, 
        occur_amt, old_arrive_date, arrive_date, order_no, 
        entry_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, crncy_type, exch_crncy_type, busi_flag, 
        occur_amt, old_arrive_date, arrive_date, order_no, 
        entry_status 
        from db_pdsecu.tb_pdseca_capit_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1h";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_资金入账流水表][{初始化日期}<=@初始化日期# and {入账状态}<>《入账状态-未入账》][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_capit_entry_jour 
        where init_date<=v_init_date and entry_status<>"2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_银证转账流水表][字段][1=1][1i][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_bank_transfer_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        trans_date, trans_time, co_no, pd_no, 
        asset_acco_no, pass_no, out_acco, bank_acco_no, 
        crncy_type, busi_flag, occur_amt, trans_status, 
        bank_jour_no, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        trans_date, trans_time, co_no, pd_no, 
        asset_acco_no, pass_no, out_acco, bank_acco_no, 
        crncy_type, busi_flag, occur_amt, trans_status, 
        bank_jour_no, remark_info 
        from db_pdsecu.tb_pdseca_bank_transfer 
        where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1i";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_银证转账流水表][1=1][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_bank_transfer 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品证券_资金_产品申赎流水表][字段][{初始化日期}<=@初始化日期#][1j][@初始化日期#] */
    insert into db_pdsecu_his.tb_pdseca_pd_apply_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, record_batch_no, 
        redempt_type, redempt_amt, redempt_qty, exch_group_no_str, 
        exgp_dist_amt_str, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, record_batch_no, 
        redempt_type, redempt_amt, redempt_qty, exch_group_no_str, 
        exgp_dist_amt_str, oper_remark_info 
        from db_pdsecu.tb_pdseca_pd_apply_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.111.1j";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_产品申赎流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdsecu.tb_pdseca_pd_apply_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_转入外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_AddOutCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_AddOutCapital(
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
    IN p_out_curr_amt decimal(18,4),
    IN p_out_enable_amt decimal(18,4),
    IN p_out_frozen_amt decimal(18,4),
    IN p_out_unfroz_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_avail_amt decimal(18,4),
    IN p_out_total_payab_amt decimal(18,4),
    IN p_out_total_rece_amt decimal(18,4),
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
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_out_total_rece_amt decimal(18,4);
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
    declare v_sync_hk_capital int;
    declare v_tmp_out_curr_amt decimal(18,4);
    declare v_tmp_out_enable_amt decimal(18,4);
    declare v_tmp_out_frozen_amt decimal(18,4);
    declare v_tmp_out_unfroz_amt decimal(18,4);
    declare v_tmp_out_total_payab_amt decimal(18,4);
    declare v_tmp_out_total_rece_amt decimal(18,4);
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_remark_info varchar(255);
    declare v_sync_total_rece_payab int;
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
    SET v_out_curr_amt = p_out_curr_amt;
    SET v_out_enable_amt = p_out_enable_amt;
    SET v_out_frozen_amt = p_out_frozen_amt;
    SET v_out_unfroz_amt = p_out_unfroz_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_avail_amt = p_avail_amt;
    SET v_out_total_payab_amt = p_out_total_payab_amt;
    SET v_out_total_rece_amt = p_out_total_rece_amt;
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
    SET v_sync_hk_capital = 0;
    SET v_tmp_out_curr_amt = 0;
    SET v_tmp_out_enable_amt = 0;
    SET v_tmp_out_frozen_amt = 0;
    SET v_tmp_out_unfroz_amt = 0;
    SET v_tmp_out_total_payab_amt = 0;
    SET v_tmp_out_total_rece_amt = 0;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_remark_info = " ";
    SET v_sync_total_rece_payab = 0;
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

    /* [获取表记录变量语句][产品证券_资金_外部资产账户资金表][{记录序号}][@记录序号#][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {本币币种}=@本币币种#] */
    select row_id into v_row_id from db_pdsecu.tb_pdseca_out_asac_capit where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and crncy_type=v_crncy_type limit 1;


    /* if @记录序号#>0  then */
    if v_row_id>0  then

      /* [检查正常返回][(@外部当前金额#+@外部可用金额#+@外部冻结金额#+@外部解冻金额#)=0] */
      if (v_out_curr_amt+v_out_enable_amt+v_out_frozen_amt+v_out_unfroz_amt)=0 then
          leave label_pro;
      end if;

    end if;

    /* [检查正常返回][@本币币种#<>"CNY" and @本币币种#<>"HKD"] */
    if v_crncy_type<>"CNY" and v_crncy_type<>"HKD" then
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_资金_外部资产账户资金表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#, {外部冻结金额}=@外部冻结金额#, {外部解冻金额}=@外部解冻金额#,{外部累计应付金额}=@外部累计应付金额#,{外部累计应收金额}=@外部累计应收金额#][1][@初始化日期#,@通道编号#,@外部账号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_out_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        crncy_type, out_curr_amt, out_enable_amt, out_frozen_amt, 
        out_unfroz_amt, out_total_payab_amt, out_total_rece_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_crncy_type, v_out_curr_amt, v_out_enable_amt, v_out_frozen_amt, 
        v_out_unfroz_amt, v_out_total_payab_amt, v_out_total_rece_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt, out_frozen_amt=v_out_frozen_amt, out_unfroz_amt=v_out_unfroz_amt,out_total_payab_amt=v_out_total_payab_amt,out_total_rece_amt=v_out_total_rece_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @同步港股资金#=cast(substring(@资产账户业务控制配置串#, 27, 1) as SIGNED); */
    set v_sync_hk_capital=cast(substring(v_asac_busi_config_str, 27, 1) as SIGNED);
    #拦住不需要同步的港股资金

      /* [检查正常返回][@同步港股资金# = 《同步港股资金-不同步》 and @本币币种# = "HKD"] */
      if v_sync_hk_capital = 0 and v_crncy_type = "HKD" then
          leave label_pro;
      end if;

    #同步港股账户资金时，换算成CNY；遍历累计账户下各币种的资金和。

    /* if @同步港股资金# = 《同步港股资金-同步》 then */
    if v_sync_hk_capital = 1 then

      /* [检查报错返回][@中国人行汇率#=0 and @本币币种# ="HKD"][1][concat("中国人行汇率不能为0！")] */
      if v_pboc_rate=0 and v_crncy_type ="HKD" then
          
          SET v_error_code = "pdsecuA.2.171.1";
          if v_mysql_message <> "" then
              SET v_error_info = CONCAT(concat("中国人行汇率不能为0！"),"#",v_mysql_message);
          else
              SET v_error_info = concat("中国人行汇率不能为0！");
          end if;
          leave label_pro;
      end if;


        /* set @临时_外部当前金额# = 0; */
        set v_tmp_out_curr_amt = 0;

        /* set @临时_外部可用金额# = 0; */
        set v_tmp_out_enable_amt = 0;

        /* set @临时_外部冻结金额# = 0; */
        set v_tmp_out_frozen_amt = 0;

        /* set @临时_外部解冻金额# = 0; */
        set v_tmp_out_unfroz_amt = 0;

        /* set @临时_外部累计应付金额# = 0; */
        set v_tmp_out_total_payab_amt = 0;

        /* set @临时_外部累计应收金额# = 0; */
        set v_tmp_out_total_rece_amt = 0;

        /* [声明游标][产品证券_资金_外部资产账户资金表][{本币币种},{外部当前金额},{外部可用金额},{外部冻结金额},{外部解冻金额},{外部累计应付金额},{外部累计应收金额}][{机构编号} = @机构编号# and {初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# ][cursor_outasac] */
        cursor_outasac:BEGIN
        DECLARE v_cursor_done int default false;
        DECLARE cursor_outasac CURSOR FOR
            select crncy_type,out_curr_amt,out_enable_amt,out_frozen_amt,out_unfroz_amt,out_total_payab_amt,out_total_rece_amt 
            from db_pdsecu.tb_pdseca_out_asac_capit 
            where co_no = v_co_no and init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco ;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


        /* [打开游标][@本币币种#,@外部当前金额#,@外部可用金额#,@外部冻结金额#,@外部解冻金额#,@外部累计应付金额#,@外部累计应收金额#][cursor_outasac][loop_outasac] */
        open cursor_outasac;
        loop_outasac: LOOP
        fetch cursor_outasac into v_crncy_type,v_out_curr_amt,v_out_enable_amt,v_out_frozen_amt,v_out_unfroz_amt,v_out_total_payab_amt,v_out_total_rece_amt;
            IF v_cursor_done THEN
                LEAVE loop_outasac;
            END IF;


            /* if @本币币种# = "CNY"  then */
            if v_crncy_type = "CNY"  then

                 /* set @临时_外部当前金额# = @临时_外部当前金额# + @外部当前金额#; */
                 set v_tmp_out_curr_amt = v_tmp_out_curr_amt + v_out_curr_amt;

                 /* set @临时_外部可用金额# = @临时_外部可用金额# + @外部可用金额#; */
                 set v_tmp_out_enable_amt = v_tmp_out_enable_amt + v_out_enable_amt;

                 /* set @临时_外部冻结金额# = @临时_外部冻结金额# + @外部冻结金额#; */
                 set v_tmp_out_frozen_amt = v_tmp_out_frozen_amt + v_out_frozen_amt;

                 /* set @临时_外部解冻金额# = @临时_外部解冻金额# + @外部解冻金额#; */
                 set v_tmp_out_unfroz_amt = v_tmp_out_unfroz_amt + v_out_unfroz_amt;

                 /* set @临时_外部累计应付金额# = @临时_外部累计应付金额# + @外部累计应付金额#; */
                 set v_tmp_out_total_payab_amt = v_tmp_out_total_payab_amt + v_out_total_payab_amt;

                 /* set @临时_外部累计应收金额# = @临时_外部累计应收金额# + @外部累计应收金额#; */
                 set v_tmp_out_total_rece_amt = v_tmp_out_total_rece_amt + v_out_total_rece_amt;

            /* elseif @本币币种# = "HKD"  then */
            elseif v_crncy_type = "HKD"  then

                 /* set @临时_外部当前金额# = @临时_外部当前金额# + @外部当前金额#* @中国人行汇率#; */
                 set v_tmp_out_curr_amt = v_tmp_out_curr_amt + v_out_curr_amt* v_pboc_rate;

                 /* set @临时_外部可用金额# = @临时_外部可用金额# + @外部可用金额#* @中国人行汇率#; */
                 set v_tmp_out_enable_amt = v_tmp_out_enable_amt + v_out_enable_amt* v_pboc_rate;

                 /* set @临时_外部冻结金额# = @临时_外部冻结金额# + @外部冻结金额#* @中国人行汇率#; */
                 set v_tmp_out_frozen_amt = v_tmp_out_frozen_amt + v_out_frozen_amt* v_pboc_rate;

                 /* set @临时_外部解冻金额# = @临时_外部解冻金额# + @外部解冻金额#* @中国人行汇率#; */
                 set v_tmp_out_unfroz_amt = v_tmp_out_unfroz_amt + v_out_unfroz_amt* v_pboc_rate;

                 /* set @临时_外部累计应付金额# = @临时_外部累计应付金额# + @外部累计应付金额#* @中国人行汇率#; */
                 set v_tmp_out_total_payab_amt = v_tmp_out_total_payab_amt + v_out_total_payab_amt* v_pboc_rate;

                 /* set @临时_外部累计应收金额# = @临时_外部累计应收金额# + @外部累计应收金额#* @中国人行汇率#; */
                 set v_tmp_out_total_rece_amt = v_tmp_out_total_rece_amt + v_out_total_rece_amt* v_pboc_rate;
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

          /* set @外部冻结金额# = @临时_外部冻结金额# ; */
          set v_out_frozen_amt = v_tmp_out_frozen_amt ;

          /* set @外部解冻金额# = @临时_外部解冻金额# ; */
          set v_out_unfroz_amt = v_tmp_out_unfroz_amt ;

          /* set @外部累计应付金额# = @临时_外部累计应付金额#; */
          set v_out_total_payab_amt = v_tmp_out_total_payab_amt;

          /* set @外部累计应收金额# = @临时_外部累计应收金额#; */
          set v_out_total_rece_amt = v_tmp_out_total_rece_amt;
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

    /* set @同步累计应收应付#=cast(substring(@资产账户业务控制配置串#, 26, 1) as SIGNED); */
    set v_sync_total_rece_payab=cast(substring(v_asac_busi_config_str, 26, 1) as SIGNED);

    /* if @本币币种# = "HKD" and @同步港股资金# = 《同步港股资金-同步》  then */
    if v_crncy_type = "HKD" and v_sync_hk_capital = 1  then

        /* set @本币币种# = "CNY"; */
        set v_crncy_type = "CNY";
    end if;

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
        #set @外部累计应付金额差额#=@累计应付差额#;
      #  set @外部累计应收金额差额#=@累计应收差额#;

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
                
        SET v_error_code = "pdsecuA.2.171.1";
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

# 原子_产品证券_资金_清除外部转入记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_ClearOutRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_ClearOutRecord(
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
    

    /* [删除表记录][产品证券_资金_外部资产账户资金表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdseca_out_asac_capit 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_内外资产账户资金差异表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdsecu.tb_pdseca_asac_capit_diff 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取日终到期交易组冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetCloseExgpFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetCloseExgpFrozenUnfrozen(
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
    OUT p_asset_acco_no int,
    OUT p_exch_group_no int,
    OUT p_crncy_type varchar(3),
    OUT p_frozen_type int,
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
    declare v_init_date int;
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_frozen_type int;
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
    SET v_init_date = p_init_date;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_group_no = 0;
    SET v_crncy_type = "CNY";
    SET v_frozen_type = 0;
    SET v_occur_amt = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_交易组资金冻结解冻流水表][{记录序号},{资产账户编号},{交易组编号},{本币币种},{冻结解冻类型},{变动金额}][@记录序号#,@资产账户编号#,@交易组编号#,@本币币种#,@冻结解冻类型#,@变动金额#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,exch_group_no,crncy_type,frozen_type,occur_amt into v_row_id,v_asset_acco_no,v_exch_group_no,v_crncy_type,v_frozen_type,v_occur_amt from db_pdsecu.tb_pdseca_exgp_capit_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.255.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_crncy_type = v_crncy_type;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_amt = v_occur_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取日终到期资产账户冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetCloseAsacFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetCloseAsacFrozenUnfrozen(
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
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_frozen_type int,
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
    declare v_init_date int;
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_frozen_type int;
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
    SET v_init_date = p_init_date;
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_frozen_type = 0;
    SET v_occur_amt = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_资产账户资金冻结解冻流水表][{记录序号},{资产账户编号},{本币币种},{冻结解冻类型},{变动金额}][@记录序号#,@资产账户编号#,@本币币种#,@冻结解冻类型#,@变动金额#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,crncy_type,frozen_type,occur_amt into v_row_id,v_asset_acco_no,v_crncy_type,v_frozen_type,v_occur_amt from db_pdsecu.tb_pdseca_asac_capit_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.256.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询记录序号=",v_query_row_id,",","初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_amt = v_occur_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_处理回购到期资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_DealRepoExpireCash;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_DealRepoExpireCash(
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
    IN p_busi_flag int,
    IN p_repo_back_amt decimal(18,4),
    IN p_repo_back_intrst decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_busi_flag int;
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_order_no int;
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
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
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_oper_func_code varchar(16);
    declare v_oper_menu_no int;
    declare v_arrive_date int;
    declare v_old_arrive_date int;
    declare v_entry_status varchar(2);

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
    SET v_busi_flag = p_busi_flag;
    SET v_repo_back_amt = p_repo_back_amt;
    SET v_repo_back_intrst = p_repo_back_intrst;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_occur_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_order_no = 0;
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
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
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_oper_func_code = " ";
    SET v_oper_menu_no = 0;
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{回购购回金额},{回购购回利息}][@回购购回金额#,@回购购回利息#] */
    set v_jour_occur_field = concat("回购购回金额","|","回购购回利息","|");
    set v_jour_occur_info = concat(v_repo_back_amt,"|",v_repo_back_intrst,"|");


    /* if @业务标志# = 《业务标志-融资回购到期》 then */
    if v_busi_flag = 2004003 then

        /* set @变动金额# = -1 * (@回购购回金额# + @回购购回利息#); */
        set v_occur_amt = -1 * (v_repo_back_amt + v_repo_back_intrst);

        /* set @操作备注# = "融资回购到期处理"; */
        set v_oper_remark_info = "融资回购到期处理";
    else

        /* set @变动金额# = @回购购回金额# + @回购购回利息#; */
        set v_occur_amt = v_repo_back_amt + v_repo_back_intrst;

        /* set @操作备注# = "融券回购到期处理"; */
        set v_oper_remark_info = "融券回购到期处理";
    end if;

    /* set @订单编号#=0; */
    set v_order_no=0;

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @交易币种# = "CNY"; */
    set v_exch_crncy_type = "CNY";

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = 0; */
    set v_curr_amt = 0;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @待交收金额# = @变动金额#; */
    set v_pre_settle_amt = v_occur_amt;

    /* set @沪深可用调整金额# = 0; */
    set v_shsz_avail_change_amt = 0;

    /* set @港股通可用调整金额# = 0; */
    set v_hk_avail_change_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

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

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{待交收金额}={待交收金额}+@变动金额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_settle_amt=pre_settle_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.257.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #注意获取当前金额赋值为当前金额会把原先的值冲掉

    /* [获取表记录变量][产品证券_资金_交易组资金表][{待交收金额}][@变动后金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select pre_settle_amt into v_occur_end_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.257.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@回购购回金额#,@回购购回利息#] */
    set v_jour_after_occur_info = concat(v_repo_back_amt,"|",v_repo_back_intrst,"|");


    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.257.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @待交收金额# = @变动金额#; */
    set v_pre_settle_amt = v_occur_amt;

    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{待交收金额}={待交收金额}+@变动金额#][2][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_settle_amt=pre_settle_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.257.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{待交收金额}][@变动后金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select pre_settle_amt into v_occur_end_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.257.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@回购购回金额#,@回购购回利息#] */
    set v_jour_after_occur_info = concat(v_repo_back_amt,"|",v_repo_back_intrst,"|");


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
                
        SET v_error_code = "pdsecuA.2.257.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @到账日期# = @初始化日期#; */
    set v_arrive_date = v_init_date;

    /* set @原到账日期# = @到账日期#; */
    set v_old_arrive_date = v_arrive_date;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* [插入表记录][产品证券_资金_资金入账流水表][字段][字段变量][5][@交易组编号#,@业务标志#,@本币币种#,@变动金额#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_capit_entry_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, exch_no, 
        crncy_type, exch_crncy_type, busi_flag, occur_amt, 
        old_arrive_date, arrive_date, order_no, entry_status) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_exch_no, 
        v_crncy_type, v_exch_crncy_type, v_busi_flag, v_occur_amt, 
        v_old_arrive_date, v_arrive_date, v_order_no, v_entry_status);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.257.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","业务标志=",v_busi_flag,",","本币币种=",v_crncy_type,",","变动金额=",v_occur_amt),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取红利到期记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetDividendRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetDividendRecord(
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
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_occur_amt decimal(18,4),
    OUT p_busi_flag int
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_old_arrive_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);

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
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_occur_amt = 0;
    SET v_busi_flag = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_资金_资金入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and {业务标志}=《业务标志-红利登记》  and {入账状态}=《入账状态-未入账》][4][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, crncy_type, exch_crncy_type, busi_flag, 
        occur_amt, old_arrive_date, arrive_date, order_no, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_crncy_type, v_exch_crncy_type, v_busi_flag, 
        v_occur_amt, v_old_arrive_date, v_arrive_date, v_order_no, 
        v_entry_status from db_pdsecu.tb_pdseca_capit_entry_jour where row_id>v_query_row_id and arrive_date<=v_init_date and busi_flag=2001013  and entry_status="2" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.258.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资金入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.258.2";
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_occur_amt = v_occur_amt;
    SET p_busi_flag = v_busi_flag;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_处理红利到期更新资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_DealDividendUpdateCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_DealDividendUpdateCapital(
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
    IN p_occur_amt decimal(18,4),
    IN p_menu_no int,
    IN p_busi_flag int,
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_menu_no int;
    declare v_busi_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);

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
    SET v_occur_amt = p_occur_amt;
    SET v_menu_no = p_menu_no;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    

    /* set @变动金额# = -1 * @变动金额#; */
    set v_occur_amt = -1 * v_occur_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作备注# = "红利到账处理"; */
    set v_oper_remark_info = "红利到账处理";
    #set @业务标志# = 《业务标志-红利入账》;

    /* [更新表记录][产品证券_资金_交易组资金表][{冻结金额}={冻结金额}+@变动金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.259.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{冻结金额}][@变动后金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select frozen_amt into v_occur_end_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.259.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.259.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{冻结金额}={冻结金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.259.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{冻结金额}][@变动后金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select frozen_amt into v_occur_end_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.259.4";
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
                
        SET v_error_code = "pdsecuA.2.259.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取资金待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdsepo_GetCapitPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_pdsepo_GetCapitPreEntry(
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
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_crncy_type varchar(3),
    OUT p_busi_flag int,
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
    declare v_init_date int;
    declare v_query_row_id bigint;
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_no int;
    declare v_exch_crncy_type varchar(3);
    declare v_old_arrive_date int;
    declare v_arrive_date int;
    declare v_order_no int;
    declare v_entry_status varchar(2);

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
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_crncy_type = "CNY";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_no = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_old_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_arrive_date = date_format(curdate(),'%Y%m%d');
    SET v_order_no = 0;
    SET v_entry_status = "0";

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品证券_资金_资金入账流水表][字段][字段变量][{记录序号}>@查询记录序号# and {到账日期}<=@初始化日期# and ((({市场编号}=《市场编号-沪港通证券交易所》 or {市场编号}=《市场编号-深港通证券交易所》 or {市场编号}=《市场编号-场外交易市场》) and ({业务标志}=《业务标志-股票买入》 or {业务标志}=《业务标志-股票卖出》 or {业务标志}=《业务标志-基金申购》 or {业务标志}=《业务标志-基金赎回》 or {业务标志}=《业务标志-基金转换》)) or {业务标志}=《业务标志-融资回购到期》 or {业务标志}=《业务标志-融券回购到期》) and {入账状态}=《入账状态-未入账》][1][@初始化日期#,@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        exch_no, crncy_type, exch_crncy_type, busi_flag, 
        occur_amt, old_arrive_date, arrive_date, order_no, 
        entry_status into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_exch_no, v_crncy_type, v_exch_crncy_type, v_busi_flag, 
        v_occur_amt, v_old_arrive_date, v_arrive_date, v_order_no, 
        v_entry_status from db_pdsecu.tb_pdseca_capit_entry_jour where row_id>v_query_row_id and arrive_date<=v_init_date and (((exch_no=3 or exch_no=4 or exch_no=5) and (busi_flag=2001001 or busi_flag=2001002 or busi_flag=2006001 or busi_flag=2006002 or busi_flag=2006003)) or busi_flag=2004003 or busi_flag=2004004) and entry_status="2" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.260.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资金入账流水表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_capit_entry_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.260.2";
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
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_crncy_type = v_crncy_type;
    SET p_busi_flag = v_busi_flag;
    SET p_occur_amt = v_occur_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_处理资金待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_DealCapitPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_DealCapitPreEntry(
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
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_tmp_pre_settle_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pre_settle_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_amt decimal(18,4);
    declare v_tmp_frozen_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_remark_info = " ";
    SET v_curr_amt = 0;
    SET v_frozen_amt = 0;
    SET v_tmp_pre_settle_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pre_settle_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_amt = 0;
    SET v_tmp_frozen_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* if @业务标志# = 《业务标志-股票买入》 then */
    if v_busi_flag = 2001001 then

        /* set @业务标志# = 《业务标志-港股买入交收》; */
        set v_busi_flag = 2001015;

        /* set @操作备注# = "港股买入到账处理"; */
        set v_oper_remark_info = "港股买入到账处理";

    /* elseif @业务标志# = 《业务标志-股票卖出》 then */
    elseif v_busi_flag = 2001002 then

        /* set @业务标志# = 《业务标志-港股卖出交收》; */
        set v_busi_flag = 2001016;

        /* set @操作备注# = "港股卖出到账处理"; */
        set v_oper_remark_info = "港股卖出到账处理";

    /* elseif @业务标志# = 《业务标志-融资回购到期》 then */
    elseif v_busi_flag = 2004003 then

        /* set @业务标志# = 《业务标志-融资回购到期入账》; */
        set v_busi_flag = 2004005;

        /* set @操作备注# = "融资回购到账处理"; */
        set v_oper_remark_info = "融资回购到账处理";

    /* elseif @业务标志# = 《业务标志-融券回购到期》 then */
    elseif v_busi_flag = 2004004 then

        /* set @业务标志# = 《业务标志-融券回购到期入账》; */
        set v_busi_flag = 2004006;

        /* set @操作备注# = "融券回购到账处理"; */
        set v_oper_remark_info = "融券回购到账处理";

    /* elseif @业务标志# = 《业务标志-基金申购》 then */
    elseif v_busi_flag = 2006001 then

        /* set @操作备注# = "基金申购委托冻结处理"; */
        set v_oper_remark_info = "基金申购委托冻结处理";
    end if;

    /* set @当前金额#=@变动金额#; */
    set v_curr_amt=v_occur_amt;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @临时_待交收金额# = -1 * @变动金额#; */
    set v_tmp_pre_settle_amt = -1 * v_occur_amt;

    /* if (@业务标志# = 《业务标志-基金申购》 or @业务标志#=《业务标志-基金赎回》 or @业务标志#=《业务标志-基金转换》) then */
    if (v_busi_flag = 2006001 or v_busi_flag=2006002 or v_busi_flag=2006003) then

        /* set @冻结金额#=-1*@变动金额#; */
        set v_frozen_amt=-1*v_occur_amt;

        /* set @临时_待交收金额# =0; */
        set v_tmp_pre_settle_amt =0;

        /* set @当前金额#=0; */
        set v_curr_amt=0;
    end if;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{待交收金额}][@待交收金额#] */
    set v_jour_occur_field = concat("待交收金额","|");
    set v_jour_occur_info = concat(v_pre_settle_amt,"|");


    /* [更新表记录][产品证券_资金_交易组资金表][{当前金额}={当前金额}+@当前金额#,{待交收金额}={待交收金额}+@临时_待交收金额#,{冻结金额}={冻结金额}+@冻结金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_curr_amt,pre_settle_amt=pre_settle_amt+v_tmp_pre_settle_amt,frozen_amt=frozen_amt+v_frozen_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.261.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{当前金额},{待交收金额},{冻结金额}][@变动后金额#,@待交收金额#,@临时_冻结金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select curr_amt,pre_settle_amt,frozen_amt into v_occur_end_amt,v_pre_settle_amt,v_tmp_frozen_amt from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.261.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@待交收金额#] */
    set v_jour_after_occur_info = concat(v_pre_settle_amt,"|");


    /* if (@业务标志# = 《业务标志-基金申购》 or @业务标志#=《业务标志-基金赎回》 or @业务标志#=《业务标志-基金转换》) then */
    if (v_busi_flag = 2006001 or v_busi_flag=2006002 or v_busi_flag=2006003) then

        /* set @变动金额#=-1*@变动金额#; */
        set v_occur_amt=-1*v_occur_amt;

        /* set @变动后金额#=@临时_冻结金额#; */
        set v_occur_end_amt=v_tmp_frozen_amt;
    end if;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.261.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [更新表记录][产品证券_资金_资产账户资金表][{当前金额}={当前金额}+@当前金额#,{待交收金额}={待交收金额}+@临时_待交收金额#,{冻结金额}={冻结金额}+@冻结金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_curr_amt,pre_settle_amt=pre_settle_amt+v_tmp_pre_settle_amt,frozen_amt=frozen_amt+v_frozen_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.261.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{当前金额},{待交收金额},{冻结金额}][@变动后金额#,@待交收金额#,@临时_冻结金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,pre_settle_amt,frozen_amt into v_occur_end_amt,v_pre_settle_amt,v_tmp_frozen_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.261.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@待交收金额#] */
    set v_jour_after_occur_info = concat(v_pre_settle_amt,"|");


    /* if (@业务标志# = 《业务标志-基金申购》 or @业务标志#=《业务标志-基金赎回》 or @业务标志#=《业务标志-基金转换》) then */
    if (v_busi_flag = 2006001 or v_busi_flag=2006002 or v_busi_flag=2006003) then

        /* set @变动金额#=-1*@变动金额#; */
        set v_occur_amt=-1*v_occur_amt;

        /* set @变动后金额#=@临时_冻结金额#; */
        set v_occur_end_amt=v_tmp_frozen_amt;
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
                
        SET v_error_code = "pdsecuA.2.261.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_更新交易资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UpdateTrdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UpdateTrdCapital(
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
    declare v_crncy_type varchar(3);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_shsz_avail_amt = p_shsz_avail_amt;
    SET v_hk_avail_amt = p_hk_avail_amt;
    SET v_static_avail_amt = p_static_avail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* [插入重复更新][产品证券_资金_交易资产账户资金表][字段][字段变量][{沪深可用金额}=@沪深可用金额#,{港股可用金额}=@港股可用金额#,{静态可用金额}=@静态可用金额#][1][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_trd_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, shsz_avail_amt, hk_avail_amt, 
        static_avail_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_crncy_type, v_shsz_avail_amt, v_hk_avail_amt, 
        v_static_avail_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, shsz_avail_amt=v_shsz_avail_amt,hk_avail_amt=v_hk_avail_amt,static_avail_amt=v_static_avail_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.262.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_更新交易库交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_UpdateTrdExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_UpdateTrdExgpCapital(
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
    declare v_crncy_type varchar(3);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_shsz_avail_amt = p_shsz_avail_amt;
    SET v_hk_avail_amt = p_hk_avail_amt;
    SET v_static_avail_amt = p_static_avail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* [插入重复更新][产品证券_资金_交易库交易组资金表][字段][字段变量][{沪深可用金额}=@沪深可用金额#,{港股可用金额}=@港股可用金额#,{静态可用金额}=@静态可用金额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_trd_exgp_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, crncy_type, shsz_avail_amt, 
        hk_avail_amt, static_avail_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_crncy_type, v_shsz_avail_amt, 
        v_hk_avail_amt, v_static_avail_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, shsz_avail_amt=v_shsz_avail_amt,hk_avail_amt=v_hk_avail_amt,static_avail_amt=v_static_avail_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.263.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_估值更新累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_EvaluUpdateTotalRece;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_EvaluUpdateTotalRece(
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
    declare v_co_no int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_oper_remark_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_co_no = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_oper_remark_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_total_rece_amt_diff = 0;
    SET v_total_payab_amt_diff = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @机构编号#=left(@产品编号#,4); */
    set v_co_no=left(v_pd_no,4);

    /* set @操作菜单#=0; */
    set v_oper_menu_no=0;
    #set @操作功能#="pdsecuL.7.14";

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @操作备注#="估值更新累计应收应付 !"; */
    set v_oper_remark_info="估值更新累计应收应付 !";

    /* [获取流水变动][{累计应收金额}][@累计应收金额#] */
    set v_jour_occur_field = concat("累计应收金额","|");
    set v_jour_occur_info = concat(v_total_rece_amt,"|");


    /* [获取表记录变量语句][产品证券_资金_交易组资金表][min({资产账户编号})][@资产账户编号#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#] */
    select min(asset_acco_no) into v_asset_acco_no from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;

    #期货账户的累计应收应付不更新，直接返回。

    /* if  ifnull(@资产账户编号#,0) =0 then */
    if  ifnull(v_asset_acco_no,0) =0 then

        /* [检查正常返回][1=1] */
        if 1=1 then
            leave label_pro;
        end if;

    end if;

    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{累计应收金额},{累计应付金额}][@记录序号#,@临时_累计应收金额#,@临时_累计应付金额#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种# and {资产账户编号}=@资产账户编号#][4][@机构编号#,@产品编号#,@交易组编号#,@本币币种#,@资产账户编号#] */
    select row_id,total_rece_amt,total_payab_amt into v_row_id,v_tmp_total_rece_amt,v_tmp_total_payab_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and pd_no=v_pd_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type and asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.264.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* set @累计应收金额差额#=@累计应收金额#-@临时_累计应收金额#; */
    set v_total_rece_amt_diff=v_total_rece_amt-v_tmp_total_rece_amt;

    /* set @累计应付金额差额#=@累计应付金额#-@临时_累计应付金额#; */
    set v_total_payab_amt_diff=v_total_payab_amt-v_tmp_total_payab_amt;

    /* [更新表记录][产品证券_资金_交易组资金表][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.264.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组金额核对差额#,@交易组港股通可用调整金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_amt_check_diff,v_exgp_hk_avail_change_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.264.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt,"|");


    /* set @业务标志# = 《业务标志-应收应付调整》; */
    set v_busi_flag = 1011007;

    /* set @变动金额#=@累计应收金额差额#; */
    set v_occur_amt=v_total_rece_amt_diff;

    /* set @变动后金额#=@累计应收金额#; */
    set v_occur_end_amt=v_total_rece_amt;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.264.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应付金额}][@累计应付金额#] */
    set v_jour_occur_field = concat("累计应付金额","|");
    set v_jour_occur_info = concat(v_total_payab_amt,"|");


    /* [获取流水后信息][@累计应付金额#] */
    set v_jour_after_occur_info = concat(v_total_payab_amt,"|");


    /* set @变动金额#=@累计应付金额差额#; */
    set v_occur_amt=v_total_payab_amt_diff;

    /* set @变动后金额#=@累计应付金额#; */
    set v_occur_end_amt=v_total_payab_amt;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.264.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应收金额}][@累计应收金额#] */
    set v_jour_occur_field = concat("累计应收金额","|");
    set v_jour_occur_info = concat(v_total_rece_amt,"|");


    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量][产品证券_资金_资产账户资金表][{记录序号},{累计应收金额},{累计应付金额}][@记录序号#,@临时_累计应收金额#,@临时_累计应付金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id,total_rece_amt,total_payab_amt into v_row_id,v_tmp_total_rece_amt,v_tmp_total_payab_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.264.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @累计应收金额差额#=@累计应收金额#-@临时_累计应收金额#; */
    set v_total_rece_amt_diff=v_total_rece_amt-v_tmp_total_rece_amt;

    /* set @累计应付金额差额#=@累计应付金额#-@临时_累计应付金额#; */
    set v_total_payab_amt_diff=v_total_payab_amt-v_tmp_total_payab_amt;

    /* [更新表记录][产品证券_资金_资产账户资金表][{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.264.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{金额核对差额},{港股通可用调整金额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户金额核对差额#,@资产账户港股通可用调整金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,amt_check_diff,hk_avail_change_amt,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_amt_check_diff,v_asac_hk_avail_change_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.264.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt,"|");


    /* set @变动金额#=@累计应收金额差额#; */
    set v_occur_amt=v_total_rece_amt_diff;

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
                
        SET v_error_code = "pdsecuA.2.264.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应付金额}][@累计应付金额#] */
    set v_jour_occur_field = concat("累计应付金额","|");
    set v_jour_occur_info = concat(v_total_payab_amt,"|");


    /* [获取流水后信息][@累计应付金额#] */
    set v_jour_after_occur_info = concat(v_total_payab_amt,"|");


    /* set @变动金额#=@累计应付金额差额#; */
    set v_occur_amt=v_total_payab_amt_diff;

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
                
        SET v_error_code = "pdsecuA.2.264.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

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

# 原子_产品证券_资金_导入资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_ImportCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_ImportCapital(
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
    IN p_target_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
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
    OUT p_exch_group_update_times int,
    OUT p_occur_amt decimal(18,4),
    OUT p_total_rece_amt_diff decimal(18,4),
    OUT p_total_payab_amt_diff decimal(18,4),
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
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_target_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
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
    declare v_exch_group_update_times int;
    declare v_occur_amt decimal(18,4);
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
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
    declare v_curr_amt decimal(18,4);
    declare v_tmp_frozen_amt decimal(18,4);
    declare v_tmp_unfroz_amt decimal(18,4);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_frozen_amt_diff decimal(18,4);
    declare v_unfrozen_amt_diff decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_shsz_avail_change_amt decimal(18,4);
    declare v_hk_avail_change_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_T_hk_buy_total_amt decimal(18,4);
    declare v_T_hk_sell_total_amt decimal(18,4);
    declare v_T1_hk_buy_total_amt decimal(18,4);
    declare v_T1_hk_sell_total_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_amt decimal(18,4);

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
    SET v_target_amt = p_target_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
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
    SET v_exch_group_update_times = 0;
    SET v_occur_amt = 0;
    SET v_total_rece_amt_diff = 0;
    SET v_total_payab_amt_diff = 0;
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
    SET v_curr_amt = 0;
    SET v_tmp_frozen_amt = 0;
    SET v_tmp_unfroz_amt = 0;
    SET v_tmp_occur_amt = 0;
    SET v_frozen_amt_diff = 0;
    SET v_unfrozen_amt_diff = 0;
    SET v_begin_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_shsz_avail_change_amt = 0;
    SET v_hk_avail_change_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_T_hk_buy_total_amt = 0;
    SET v_T_hk_sell_total_amt = 0;
    SET v_T1_hk_buy_total_amt = 0;
    SET v_T1_hk_sell_total_amt = 0;
    SET v_total_change_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_amt = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额},{冻结金额},{解冻金额}][@当前金额#,@临时_冻结金额#,@临时_解冻金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select curr_amt,frozen_amt,unfroz_amt into v_curr_amt,v_tmp_frozen_amt,v_tmp_unfroz_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{金额核对差额}][@变动金额核对差额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select amt_check_diff into v_occur_amt_check_diff from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.265.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @累计应收金额#=0; */
    set v_total_rece_amt=0;

    /* set @累计应付金额#=0; */
    set v_total_payab_amt=0;

    /* set @变动金额#=@目标金额#-@当前金额#; */
    set v_occur_amt=v_target_amt-v_curr_amt;

    /* set @临时_变动金额#=@变动金额#; */
    set v_tmp_occur_amt=v_occur_amt;

    /* set @冻结金额差额#=@冻结金额#-@临时_冻结金额#; */
    set v_frozen_amt_diff=v_frozen_amt-v_tmp_frozen_amt;

    /* set @解冻金额差额#=@解冻金额#-@临时_解冻金额#; */
    set v_unfrozen_amt_diff=v_unfroz_amt-v_tmp_unfroz_amt;

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=@目标金额#; */
    set v_curr_amt=v_target_amt;

    /* set @待交收金额#=0; */
    set v_pre_settle_amt=0;

    /* set @沪深可用调整金额#=0; */
    set v_shsz_avail_change_amt=0;

    /* set @港股通可用调整金额#=0; */
    set v_hk_avail_change_amt=0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @红冲蓝补金额#=0; */
    set v_total_change_amt=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @利率#=0; */
    set v_intrst_rate=0;

    /* set @利息积数#=0; */
    set v_intrst_base_amt=0;

    /* set @待入账利息#=0; */
    set v_pre_entry_intrst_amt=0;

    /* set @操作备注#="导入资金 !"; */
    set v_oper_remark_info="导入资金 !";

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{冻结金额}={冻结金额}+@冻结金额差额#,{解冻金额}={解冻金额}+@解冻金额差额#,{金额核对差额}=0][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@交易组编号#,@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,frozen_amt=frozen_amt+v_frozen_amt_diff,unfroz_amt=unfroz_amt+v_unfrozen_amt_diff,amt_check_diff=0;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.265.exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(2,"#",v_mysql_message);
        else
            SET v_error_info = 2;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组港股通可用调整金额#,@交易组金额核对差额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_hk_avail_change_amt,v_exgp_amt_check_diff,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.265.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][产品证券_资金_资产账户资金表][字段][字段变量][{当前金额}=@目标金额#,{冻结金额}=@冻结金额#,{解冻金额}=@解冻金额#,{金额核对差额}={金额核对差额} - @变动金额核对差额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=v_target_amt,frozen_amt=v_frozen_amt,unfroz_amt=v_unfroz_amt,amt_check_diff=amt_check_diff - v_occur_amt_check_diff;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.265.asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(2,"#",v_mysql_message);
        else
            SET v_error_info = 2;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_资产账户资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户待交收金额#,@资产账户沪深可用调整金额#,@资产账户港股通可用调整金额#,@资产账户金额核对差额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户实现盈亏#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户T日当日港股买入金额#,@资产账户T日当日港股卖出金额#,@资产账户T1日当日港股买入金额#,@资产账户T1日当日港股卖出金额#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_pre_settle_amt,v_asac_shsz_avail_change_amt,v_asac_hk_avail_change_amt,v_asac_amt_check_diff,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_realize_pandl,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_T_hk_buy_total_amt,v_asac_T_hk_sell_total_amt,v_asac_T1_hk_buy_total_amt,v_asac_T1_hk_sell_total_amt,v_asac_update_times from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.265.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @业务标志# = 《业务标志-资金蓝补》; */
    set v_busi_flag = 1003002;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{当前金额},{冻结金额},{解冻金额},{金额核对差额}][@当前金额#,@冻结金额#,@解冻金额#,@金额核对差额#] */
    set v_jour_occur_field = concat("当前金额","|","冻结金额","|","解冻金额","|","金额核对差额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_frozen_amt,"|",v_unfroz_amt,"|",v_amt_check_diff,"|");


    /* [获取流水后信息][@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组金额核对差额#] */
    set v_jour_after_occur_info = concat(v_exgp_curr_amt,"|",v_exgp_frozen_amt,"|",v_exgp_unfroz_amt,"|",v_exgp_amt_check_diff,"|");


    /* set @变动后金额#=@交易组当前金额#; */
    set v_occur_end_amt=v_exgp_curr_amt;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdsecuA.2.265.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][@资产账户当前金额#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户金额核对差额#] */
    set v_jour_after_occur_info = concat(v_asac_curr_amt,"|",v_asac_frozen_amt,"|",v_asac_unfroz_amt,"|",v_asac_amt_check_diff,"|");


    /* set @变动后金额#=@资产账户当前金额#; */
    set v_occur_end_amt=v_asac_curr_amt;

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
                
        SET v_error_code = "pdsecuA.2.265.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    #[获取流水变动][{累计应收金额}][@累计应收金额#]
    #[获取流水后信息][@交易组累计应收金额#]
    #set @变动金额# = @累计应收金额差额#;
    #set @变动后金额# = @交易组累计应收金额#;
    #[插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#]
    #[获取流水后信息][@资产账户累计应收金额#]
    #set @变动后金额#=@资产账户累计应收金额#;
    #[插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#]
    #[获取流水变动][{累计应付金额}][@累计应付金额#]
    #[获取流水后信息][@交易组累计应付金额#]
    #set @变动金额# = @累计应付金额差额#;
    #set @变动后金额# = @交易组累计应付金额#;
    #[插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#]
    #[获取流水后信息][@资产账户累计应付金额#]
    #set @变动后金额# = @资产账户累计应付金额#;
    #[插入表记录][产品证券_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#]
    #set @变动金额#=@临时_变动金额#;
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
    SET p_occur_amt = v_occur_amt;
    SET p_total_rece_amt_diff = v_total_rece_amt_diff;
    SET p_total_payab_amt_diff = v_total_payab_amt_diff;
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

# 原子_产品证券_资金_获取交易组对应资产账户
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetAssectStrsForExgp;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetAssectStrsForExgp(
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
    

    /* select a.{资产账户编号},b.{股东代码},b.{市场编号} from ~产品证券_资金_交易组资金表^ a,~产品证券_账户_证券账户信息表^ b where a.{交易组编号}=@交易组编号# and a.{资产账户编号}=b.{资产账户编号}; */
    select a.asset_acco_no,b.stock_acco,b.exch_no from db_pdsecu.tb_pdseca_exgp_capit a,db_pdsecu.tb_pdseac_secu_acco b where a.exch_group_no=v_exch_group_no and a.asset_acco_no=b.asset_acco_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_交易组资金划转
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_TransferExgpCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_TransferExgpCapit(
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
    declare v_tmp_exch_group_no int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_occur_end_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_busi_flag int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_amt decimal(18,4);

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
    SET v_tmp_exch_group_no = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_occur_end_amt = 0;
    SET v_total_change_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_busi_flag = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_amt = 0;

    
    label_pro:BEGIN
    

    /* set @临时_交易组编号#=@交易组编号#; */
    set v_tmp_exch_group_no=v_exch_group_no;

    /* [更新表记录][产品证券_资金_交易组资金表][{当前金额}={当前金额}-@变动金额#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"][2][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdsecu.tb_pdseca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_occur_amt where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type="CNY";
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.267.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{机构编号},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@记录序号#,@机构编号#,@本币币种#,@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@累计应收金额#,@累计应付金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select row_id,co_no,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_row_id,v_co_no,v_crncy_type,v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_total_rece_amt,v_total_payab_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type="CNY" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.267.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @临时_变动后金额# = @当前金额#; */
    set v_tmp_occur_end_amt = v_curr_amt;

    /* set @交易组编号#=@目标交易组编号#; */
    set v_exch_group_no=v_target_exch_group_no;

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=@变动金额#; */
    set v_curr_amt=v_occur_amt;

    /* set @冻结金额#=0; */
    set v_frozen_amt=0;

    /* set @解冻金额#=0; */
    set v_unfroz_amt=0;

    /* set @待交收金额#=0; */
    set v_pre_settle_amt=0;

    /* set @沪深可用调整金额#=0; */
    set v_shsz_avail_change_amt=0;

    /* set @港股通可用调整金额#=0; */
    set v_hk_avail_change_amt=0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @T日当日港股买入金额#=0; */
    set v_T_hk_buy_total_amt=0;

    /* set @T日当日港股卖出金额#=0; */
    set v_T_hk_sell_total_amt=0;

    /* set @T1日当日港股买入金额#=0; */
    set v_T1_hk_buy_total_amt=0;

    /* set @T1日当日港股卖出金额#=0; */
    set v_T1_hk_sell_total_amt=0;

    /* set @累计应收金额#=0; */
    set v_total_rece_amt=0;

    /* set @累计应付金额#=0; */
    set v_total_payab_amt=0;

    /* set @红冲蓝补金额#=0; */
    set v_total_change_amt=0;

    /* set @实现盈亏#=0; */
    set v_realize_pandl=0;

    /* set @利率#=0; */
    set v_intrst_rate=0;

    /* set @利息积数#=0; */
    set v_intrst_base_amt=0;

    /* set @待入账利息#=0; */
    set v_pre_entry_intrst_amt=0;

    /* [插入重复更新][产品证券_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.267.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组冻结金额#,@交易组解冻金额#,@交易组待交收金额#,@交易组沪深可用调整金额#,@交易组港股通可用调整金额#,@交易组金额核对差额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组实现盈亏#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组T日当日港股买入金额#,@交易组T日当日港股卖出金额#,@交易组T1日当日港股买入金额#,@交易组T1日当日港股卖出金额#,@交易组更新次数#][{交易组编号}=@交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"][4][@交易组编号#,@资产账户编号#,@本币币种#] */
    select row_id,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exgp_pre_settle_amt,v_exgp_shsz_avail_change_amt,v_exgp_hk_avail_change_amt,v_exgp_amt_check_diff,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exgp_realize_pandl,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exgp_T_hk_buy_total_amt,v_exgp_T_hk_sell_total_amt,v_exgp_T1_hk_buy_total_amt,v_exgp_T1_hk_sell_total_amt,v_exch_group_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type="CNY" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.267.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @操作菜单#=@菜单编号#; */
    set v_oper_menu_no=v_menu_no;

    /* set @操作功能#=@功能编码#; */
    set v_oper_func_code=v_func_code;

    /* set @业务标志#=《业务标志-资金划转》; */
    set v_busi_flag=1005001;
    #源交易组的资金流水

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [获取流水后信息][@临时_变动后金额#] */
    set v_jour_after_occur_info = concat(v_tmp_occur_end_amt,"|");


    /* set @变动金额#=-1*@变动金额#; */
    set v_occur_amt=-1*v_occur_amt;

    /* set @变动后金额#=@临时_变动后金额#; */
    set v_occur_end_amt=v_tmp_occur_end_amt;

    /* set @交易组编号#=@临时_交易组编号#; */
    set v_exch_group_no=v_tmp_exch_group_no;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#,@操作功能#] */
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
                
        SET v_error_code = "pdsecuA.2.267.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","操作功能=",v_oper_func_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    #目标交易组的资金流水

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [获取流水后信息][@交易组当前金额#] */
    set v_jour_after_occur_info = concat(v_exgp_curr_amt,"|");


    /* set @变动金额#=-1*@变动金额#; */
    set v_occur_amt=-1*v_occur_amt;

    /* set @变动后金额#=@交易组当前金额#; */
    set v_occur_end_amt=v_exgp_curr_amt;

    /* set @交易组编号#=@目标交易组编号#; */
    set v_exch_group_no=v_target_exch_group_no;

    /* [插入表记录][产品证券_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#,@操作功能#] */
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
                
        SET v_error_code = "pdsecuA.2.267.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type,",","操作功能=",v_oper_func_code),"#",v_mysql_message);
        leave label_pro;
    end if;

    #获取源 交易组变动后的信息供主推

    /* [获取表记录变量][产品证券_资金_交易组资金表][{记录序号},{机构编号},{本币币种},{期初金额},{当前金额},{冻结金额},{解冻金额},{待交收金额},{沪深可用调整金额},{港股通可用调整金额},{金额核对差额},{累计应收金额},{累计应付金额},{实现盈亏},{利率},{利息积数},{待入账利息},{T日当日港股买入金额},{T日当日港股卖出金额},{T1日当日港股买入金额},{T1日当日港股卖出金额},{更新次数}][@记录序号#,@机构编号#,@本币币种#,@期初金额#,@当前金额#,@冻结金额#,@解冻金额#,@待交收金额#,@沪深可用调整金额#,@港股通可用调整金额#,@金额核对差额#,@累计应收金额#,@累计应付金额#,@实现盈亏#,@利率#,@利息积数#,@待入账利息#,@T日当日港股买入金额#,@T日当日港股卖出金额#,@T1日当日港股买入金额#,@T1日当日港股卖出金额#,@更新次数#][{交易组编号}=@临时_交易组编号# and {资产账户编号}=@资产账户编号# and {本币币种}="CNY"][4][@临时_交易组编号#,@资产账户编号#,@本币币种#] */
    select row_id,co_no,crncy_type,begin_amt,curr_amt,frozen_amt,unfroz_amt,pre_settle_amt,shsz_avail_change_amt,hk_avail_change_amt,amt_check_diff,total_rece_amt,total_payab_amt,realize_pandl,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,T_hk_buy_total_amt,T_hk_sell_total_amt,T1_hk_buy_total_amt,T1_hk_sell_total_amt,update_times into v_row_id,v_co_no,v_crncy_type,v_begin_amt,v_curr_amt,v_frozen_amt,v_unfroz_amt,v_pre_settle_amt,v_shsz_avail_change_amt,v_hk_avail_change_amt,v_amt_check_diff,v_total_rece_amt,v_total_payab_amt,v_realize_pandl,v_intrst_rate,v_intrst_base_amt,v_pre_entry_intrst_amt,v_T_hk_buy_total_amt,v_T_hk_sell_total_amt,v_T1_hk_buy_total_amt,v_T1_hk_sell_total_amt,v_update_times from db_pdsecu.tb_pdseca_exgp_capit where exch_group_no=v_tmp_exch_group_no and asset_acco_no=v_asset_acco_no and crncy_type="CNY" limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.267.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("临时_交易组编号=",v_tmp_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("临时_交易组编号=",v_tmp_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

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

# 原子_产品证券_资金_归档获取资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_BackUpGetAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_BackUpGetAsacCapit(
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
    

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{记录序号},{产品编号},{待交收金额}][@记录序号#,@产品编号#,@待交收金额#][{记录序号}>@查询记录序号#] */
    select row_id,pd_no,pre_settle_amt into v_row_id,v_pd_no,v_pre_settle_amt from db_pdsecu.tb_pdseca_asac_capit where row_id>v_query_row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_no = v_pd_no;
    SET p_pre_settle_amt = v_pre_settle_amt;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_归档查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_BackUpQueryAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_BackUpQueryAsacCapit(
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
    
    select pd_no,sum(pre_settle_amt) as pre_settle_amt from tb_pdseca_asac_capit group by pd_no;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询银行证券转账转入转出金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryBankStockInOutAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryBankStockInOutAmt(
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
    

    /* [获取表记录变量语句][产品证券_资金_银证转账流水表][{变动金额}][@T日转入金额#][{产品编号}=@产品编号# and {业务标志} = '1010001'] */
    select occur_amt into v_tday_in_amt from db_pdsecu.tb_pdseca_bank_transfer where pd_no=v_pd_no and busi_flag = '1010001' limit 1;


    /* [获取表记录变量语句][产品证券_资金_银证转账流水表][{变动金额}][@T日转出金额#][{产品编号}=@产品编号# and {业务标志} = '1010002'] */
    select occur_amt into v_tday_out_amt from db_pdsecu.tb_pdseca_bank_transfer where pd_no=v_pd_no and busi_flag = '1010002' limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_tday_in_amt = v_tday_in_amt;
    SET p_tday_out_amt = v_tday_out_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_删除交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_DeleteExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_DeleteExgpCapital(
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
    declare v_pre_settle_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
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
    SET v_pre_settle_amt = 0;
    SET v_curr_amt = 0;
    SET v_amt_check_diff = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品证券_资金_交易组资金表][{待交收金额},{当前金额},{金额核对差额}][@待交收金额#,@当前金额#,@金额核对差额#][{记录序号}=@记录序号#][4][@资产账户编号#,@本币币种#,@交易组编号#,@记录序号#] */
    select pre_settle_amt,curr_amt,amt_check_diff into v_pre_settle_amt,v_curr_amt,v_amt_check_diff from db_pdsecu.tb_pdseca_exgp_capit where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdsecuA.2.271.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type,",","交易组编号=",v_exch_group_no,",","记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type,",","交易组编号=",v_exch_group_no,",","记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@待交收金额# <> 0 or @金额核对差额#<>0][3][concat("该交易组资金存在在途业务,不能删除！记录序号为：",@记录序号#)] */
    if v_pre_settle_amt <> 0 or v_amt_check_diff<>0 then
        
        SET v_error_code = "pdsecuA.2.271.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("该交易组资金存在在途业务,不能删除！记录序号为：",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("该交易组资金存在在途业务,不能删除！记录序号为：",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@当前金额# <> 0][3][concat("该交易组存在待回收资金,不能删除！记录序号为：",@记录序号#)] */
    if v_curr_amt <> 0 then
        
        SET v_error_code = "pdsecuA.2.271.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("该交易组存在待回收资金,不能删除！记录序号为：",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("该交易组存在待回收资金,不能删除！记录序号为：",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品证券_资金_交易组资金表][{记录序号}=@记录序号#][3][@记录序号#] */
    delete from db_pdsecu.tb_pdseca_exgp_capit 
        where row_id=v_row_id;
    if v_error_code = 1 then
                
        SET v_error_code = "pdsecuA.2.271.3";
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

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_同步场外基金外部基金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_SyncOffSetFundOutFund;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_SyncOffSetFundOutFund(
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
    SET v_out_total_payab_amt = p_out_total_payab_amt;
    SET v_out_total_rece_amt = p_out_total_rece_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品证券_资金_外部资产账户资金表][字段][字段变量][1][@外部账号#  , @机构编号# , @资产账户编号# , @产品编号# , @通道编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_out_asac_capit(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        crncy_type, out_curr_amt, out_enable_amt, out_frozen_amt, 
        out_unfroz_amt, out_total_payab_amt, out_total_rece_amt) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_crncy_type, v_out_curr_amt, v_out_enable_amt, v_out_frozen_amt, 
        v_out_unfroz_amt, v_out_total_payab_amt, v_out_total_rece_amt);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.272.1";
        SET v_error_info =  CONCAT(concat("外部账号  =",v_out_acco  ,","," 机构编号 =", v_co_no ,","," 资产账户编号 =", v_asset_acco_no ,","," 产品编号 =", v_pd_no ,","," 通道编号=", v_pass_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取场外基金资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetOffSetFundAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetOffSetFundAsacCapit(
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
    

    /* [获取表全记录][产品证券_资金_场外基金资产账户资金表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, out_acco, 
        crncy_type, out_curr_amt, out_enable_amt, out_frozen_amt, 
        out_unfroz_amt, out_total_payab_amt, out_total_rece_amt from db_pdsecu.tb_pdseca_off_side_fund_asac_capit where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_清空外部资产账户资金表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_ClearOutAsacCapit;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_ClearOutAsacCapit(
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
    

    /* [清空表记录][产品证券_资金_外部资产账户资金表] */
    truncate table db_pdsecu.tb_pdseca_out_asac_capit;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_获取资产账户资金可用信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_GetAsacCapitalAvailInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_GetAsacCapitalAvailInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_asac_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_curr_amt decimal(18,4),
    OUT p_avail_amt decimal(18,4)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_sync_capital_way int;
    declare v_acco_avail_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_tmp_avail_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_avail_amt = 0;
    SET v_sync_capital_way = 0;
    SET v_acco_avail_amt = 0;
    SET v_crncy_type = "CNY";
    SET v_tmp_avail_amt = 0;
    SET v_record_count = 0;

    
    label_pro:BEGIN
    

    /* set @同步资金方式#=cast(substring(@资产账户业务控制配置串#, 20, 1) as SIGNED); */
    set v_sync_capital_way=cast(substring(v_asac_busi_config_str, 20, 1) as SIGNED);

    /* [获取表记录变量语句][产品证券_资金_资产账户资金表][{当前金额}+{金额核对差额},{当前金额},{当前金额}-{冻结金额}+{解冻金额}+{金额核对差额}][@账户可用金额#,@当前金额#,@可用金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select curr_amt+amt_check_diff,curr_amt,curr_amt-frozen_amt+unfroz_amt+amt_check_diff into v_acco_avail_amt,v_curr_amt,v_avail_amt from db_pdsecu.tb_pdseca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* set @临时_可用金额#=@可用金额#; */
    set v_tmp_avail_amt=v_avail_amt;

    /* set @当前金额#=round(@当前金额#,2); */
    set v_curr_amt=round(v_curr_amt,2);

    /* set @可用金额#=round(@可用金额#,2); */
    set v_avail_amt=round(v_avail_amt,2);

    /* set @本币币种#="CNY"; */
    set v_crncy_type="CNY";

    /* set @记录个数# = 0; */
    set v_record_count = 0;
    #[获取表记录数量][产品证券_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#]
    #if @记录个数#=1 or @记录个数#=0  then
       # [获取表记录变量][产品证券_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#]
    #elseif @记录个数#=0 then
      #  set @交易组编号# = @默认交易组编号#;
    #elseif @记录个数#>1 then
      #  set @交易组编号# = 0;
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_curr_amt = v_curr_amt;
    SET p_avail_amt = v_avail_amt;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_转入外部资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_AddOutAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_AddOutAsacCapital(
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
    IN p_out_curr_amt decimal(18,4),
    IN p_out_enable_amt decimal(18,4),
    IN p_out_frozen_amt decimal(18,4),
    IN p_out_unfroz_amt decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_avail_amt decimal(18,4),
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
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_frozen_amt decimal(18,4);
    declare v_out_unfroz_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_crncy_type varchar(3);
    declare v_out_total_rece_amt decimal(18,4);
    declare v_out_total_payab_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_remark_info varchar(255);
    declare v_sync_total_rece_payab int;
    declare v_acco_curr_amt decimal(18,4);
    declare v_acco_avail_amt decimal(18,4);
    declare v_sys_avail_amt_diff decimal(18,4);
    declare v_acco_curr_amt_diff decimal(18,4);
    declare v_acco_avail_amt_diff decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
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
    SET v_out_curr_amt = p_out_curr_amt;
    SET v_out_enable_amt = p_out_enable_amt;
    SET v_out_frozen_amt = p_out_frozen_amt;
    SET v_out_unfroz_amt = p_out_unfroz_amt;
    SET v_curr_amt = p_curr_amt;
    SET v_avail_amt = p_avail_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_crncy_type = "CNY";
    SET v_out_total_rece_amt = 0;
    SET v_out_total_payab_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_remark_info = " ";
    SET v_sync_total_rece_payab = 0;
    SET v_acco_curr_amt = 0;
    SET v_acco_avail_amt = 0;
    SET v_sys_avail_amt_diff = 0;
    SET v_acco_curr_amt_diff = 0;
    SET v_acco_avail_amt_diff = 0;
    SET v_total_payab_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_acco_total_payab_amt_diff = 0;
    SET v_acco_total_rece_amt_diff = 0;

    
    label_pro:BEGIN
    

    /* set @记录序号#=0; */
    set v_row_id=0;

    /* [获取表记录变量语句][产品证券_资金_外部资产账户资金表][{记录序号}][@记录序号#][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号}=@外部账号# and {本币币种}=@本币币种#] */
    select row_id into v_row_id from db_pdsecu.tb_pdseca_out_asac_capit where init_date=v_init_date and pass_no=v_pass_no and out_acco=v_out_acco and crncy_type=v_crncy_type limit 1;


    /* if @记录序号#>0  then */
    if v_row_id>0  then

      /* [检查正常返回][(@外部当前金额#+@外部可用金额#+@外部冻结金额#+@外部解冻金额#)=0] */
      if (v_out_curr_amt+v_out_enable_amt+v_out_frozen_amt+v_out_unfroz_amt)=0 then
          leave label_pro;
      end if;

    end if;

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @外部累计应收金额# = 0; */
    set v_out_total_rece_amt = 0;

    /* set @外部累计应付金额# = 0; */
    set v_out_total_payab_amt = 0;

    /* [插入重复更新][产品证券_资金_外部资产账户资金表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#, {外部冻结金额}=@外部冻结金额#, {外部解冻金额}=@外部解冻金额#,{外部累计应付金额}=@外部累计应付金额#,{外部累计应收金额}=@外部累计应收金额#][1][@初始化日期#,@通道编号#,@外部账号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_out_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        crncy_type, out_curr_amt, out_enable_amt, out_frozen_amt, 
        out_unfroz_amt, out_total_payab_amt, out_total_rece_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_crncy_type, v_out_curr_amt, v_out_enable_amt, v_out_frozen_amt, 
        v_out_unfroz_amt, v_out_total_payab_amt, v_out_total_rece_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt, out_frozen_amt=v_out_frozen_amt, out_unfroz_amt=v_out_unfroz_amt,out_total_payab_amt=v_out_total_payab_amt,out_total_rece_amt=v_out_total_rece_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.276.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
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

    /* set @同步累计应收应付#=cast(substring(@资产账户业务控制配置串#, 26, 1) as SIGNED); */
    set v_sync_total_rece_payab=cast(substring(v_asac_busi_config_str, 26, 1) as SIGNED);

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

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @外部累计应付金额# = 0; */
    set v_out_total_payab_amt = 0;

    /* set @外部累计应收金额# = 0; */
    set v_out_total_rece_amt = 0;

    /* set @账户累计应付金额差额#=0; */
    set v_acco_total_payab_amt_diff=0;

    /* set @账户累计应收金额差额#=0; */
    set v_acco_total_rece_amt_diff=0;

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
                
        SET v_error_code = "pdsecuA.2.276.1";
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

# 原子_产品证券_资金_转入外部资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_EntryOutAsac;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_EntryOutAsac(
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品证券_资金_外部转入资产表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {外部净资产}=@外部净资产#,{外部股票资产}=@外部股票资产#,{外部债券资产}=@外部债券资产#,{外部基金资产}=@外部基金资产#,{外部回购资产}=@外部回购资产#,{外部累计应收金额}=@外部累计应收金额#,{外部累计应付金额}=@外部累计应付金额#,{外部其他资产}=@外部其他资产#,{外部期权资产}=@外部期权资产#,{外部融资负债}=@外部融资负债#,{外部融券负债}=@外部融券负债#,{外部期货资产}=@外部期货资产#,{外部期货保证金}=@外部期货保证金#,{外部沪深T+0可用}=@外部沪深T+0可用#,{外部沪深T+1可用}=@外部沪深T+1可用#,{外部沪港通可用}=@外部沪港通可用#,{外部深港通可用}=@外部深港通可用#,{外部现金资产}=@外部现金资产#,{外部期货盈亏}=@外部期货盈亏#][1][@外部账号#,@通道编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_out_entry_asac (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, pass_no, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        out_acco, out_nav_asset, out_stock_asset, out_bond_asset, 
        out_fund_asset, out_repo_asset, out_total_rece_amt, out_total_payab_amt, 
        out_other_asset, out_option_asset, out_fina_debt, out_loan_debt, 
        out_futu_asset, out_margin_amt, out_shsz_T0_avail, out_shsz_T1_avail, 
        out_shhk_avail_amt, out_szhk_avail_amt, out_cash_asset, out_futu_pandl_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_pass_no, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_out_acco, v_out_nav_asset, v_out_stock_asset, v_out_bond_asset, 
        v_out_fund_asset, v_out_repo_asset, v_out_total_rece_amt, v_out_total_payab_amt, 
        v_out_other_asset, v_out_option_asset, v_out_fina_debt, v_out_loan_debt, 
        v_out_futu_asset, v_out_margin_amt, v_out_shsz_T0_avail, v_out_shsz_T1_avail, 
        v_out_shhk_avail_amt, v_out_szhk_avail_amt, v_out_cash_asset, v_out_futu_pandl_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, out_nav_asset=v_out_nav_asset,out_stock_asset=v_out_stock_asset,out_bond_asset=v_out_bond_asset,out_fund_asset=v_out_fund_asset,out_repo_asset=v_out_repo_asset,out_total_rece_amt=v_out_total_rece_amt,out_total_payab_amt=v_out_total_payab_amt,out_other_asset=v_out_other_asset,out_option_asset=v_out_option_asset,out_fina_debt=v_out_fina_debt,out_loan_debt=v_out_loan_debt,out_futu_asset=v_out_futu_asset,out_margin_amt=v_out_margin_amt,out_shsz_T0_avail=v_out_shsz_T0_avail,out_shsz_T1_avail=v_out_shsz_T1_avail,out_shhk_avail_amt=v_out_shhk_avail_amt,out_szhk_avail_amt=v_out_szhk_avail_amt,out_cash_asset=v_out_cash_asset,out_futu_pandl_amt=v_out_futu_pandl_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.277.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("外部账号=",v_out_acco,",","通道编号=",v_pass_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("外部账号=",v_out_acco,",","通道编号=",v_pass_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_新增产品申赎流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_AddPdApplyJourRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_AddPdApplyJourRecord(
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
    IN p_redempt_amt decimal(18,4),
    IN p_redempt_qty decimal(18,2),
    IN p_exch_group_no_str varchar(2048),
    IN p_exgp_dist_amt_str varchar(4096),
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
    declare v_redempt_type int;
    declare v_redempt_amt decimal(18,4);
    declare v_redempt_qty decimal(18,2);
    declare v_exch_group_no_str varchar(2048);
    declare v_exgp_dist_amt_str varchar(4096);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_batch_no int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_redempt_type = p_redempt_type;
    SET v_redempt_amt = p_redempt_amt;
    SET v_redempt_qty = p_redempt_qty;
    SET v_exch_group_no_str = p_exch_group_no_str;
    SET v_exgp_dist_amt_str = p_exgp_dist_amt_str;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_batch_no = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品证券_资金_产品申赎流水表][IFNULL(max({记录批号}),0)][@记录批号#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#] */
    select IFNULL(max(record_batch_no),0) into v_record_batch_no from db_pdsecu.tb_pdseca_pd_apply_jour where init_date=v_init_date and co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;


    /* set @记录批号# = @记录批号#+1; */
    set v_record_batch_no = v_record_batch_no+1;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品证券_资金_产品申赎流水表][字段][字段变量][5][@初始化日期#,@机构编号#,@产品编号#,@资产账户编号#,@记录批号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdsecu.tb_pdseca_pd_apply_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, record_batch_no, redempt_type, 
        redempt_amt, redempt_qty, exch_group_no_str, exgp_dist_amt_str, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_record_batch_no, v_redempt_type, 
        v_redempt_amt, v_redempt_qty, v_exch_group_no_str, v_exgp_dist_amt_str, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdsecuA.2.278.5";
        SET v_error_info =  CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no,",","记录批号=",v_record_batch_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_根据产品查询资产账户资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryAsacCapitInfoByPd;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryAsacCapitInfoByPd(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_资金_资产账户资金表][{资产账户编号},{记录序号} as {资产账户资金序号},{期初金额} as {资产账户期初金额},{当前金额} as {资产账户当前金额},{冻结金额} as {资产账户冻结金额},{解冻金额} as {资产账户解冻金额},{待交收金额} as {资产账户待交收金额},{沪深可用调整金额} as {资产账户沪深可用调整金额},{港股通可用调整金额} as {资产账户港股通可用调整金额},{金额核对差额} as {资产账户金额核对差额},{T日当日港股买入金额} as {资产账户T日当日港股买入金额},{T日当日港股卖出金额} as {资产账户T日当日港股卖出金额},{T1日当日港股买入金额} as {资产账户T1日当日港股买入金额},{T1日当日港股卖出金额} as {资产账户T1日当日港股卖出金额},{累计应收金额} as {资产账户累计应收金额},{累计应付金额} as {资产账户累计应付金额},{实现盈亏} as {资产账户实现盈亏},{利率} as {资产账户利率},{利息积数} as {资产账户利息积数},{待入账利息} as {资产账户待入账利息},{更新次数}][{机构编号}=@机构编号#  and {产品编号}=@产品编号# and {本币币种}=@本币币种#][@指定行数#] */
    if v_row_count = -1 then
        select asset_acco_no,row_id as asac_cash_id,begin_amt as asac_begin_amt,curr_amt as asac_curr_amt,frozen_amt as asac_frozen_amt,unfroz_amt as asac_unfroz_amt,pre_settle_amt as asac_pre_settle_amt,shsz_avail_change_amt as asac_shsz_avail_change_amt,hk_avail_change_amt as asac_hk_avail_change_amt,amt_check_diff as asac_amt_check_diff,T_hk_buy_total_amt as asac_T_hk_buy_total_amt,T_hk_sell_total_amt as asac_T_hk_sell_total_amt,T1_hk_buy_total_amt as asac_T1_hk_buy_total_amt,T1_hk_sell_total_amt as asac_T1_hk_sell_total_amt,total_rece_amt as asac_total_rece_amt,total_payab_amt as asac_total_payab_amt,realize_pandl as asac_realize_pandl,intrst_rate as asac_intrst_rate,intrst_base_amt as asac_intrst_base_amt,pre_entry_intrst_amt as asac_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no  and pd_no=v_pd_no and crncy_type=v_crncy_type;
    else
        select asset_acco_no,row_id as asac_cash_id,begin_amt as asac_begin_amt,curr_amt as asac_curr_amt,frozen_amt as asac_frozen_amt,unfroz_amt as asac_unfroz_amt,pre_settle_amt as asac_pre_settle_amt,shsz_avail_change_amt as asac_shsz_avail_change_amt,hk_avail_change_amt as asac_hk_avail_change_amt,amt_check_diff as asac_amt_check_diff,T_hk_buy_total_amt as asac_T_hk_buy_total_amt,T_hk_sell_total_amt as asac_T_hk_sell_total_amt,T1_hk_buy_total_amt as asac_T1_hk_buy_total_amt,T1_hk_sell_total_amt as asac_T1_hk_sell_total_amt,total_rece_amt as asac_total_rece_amt,total_payab_amt as asac_total_payab_amt,realize_pandl as asac_realize_pandl,intrst_rate as asac_intrst_rate,intrst_base_amt as asac_intrst_base_amt,pre_entry_intrst_amt as asac_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_asac_capit where co_no=v_co_no  and pd_no=v_pd_no and crncy_type=v_crncy_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_根据产品查询交易组资金信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryExgpCapitInfoByPd;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryExgpCapitInfoByPd(
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
    declare v_row_count int;

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
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数# = -1; */
    set v_row_count = -1;

    /* [获取表记录][产品证券_资金_交易组资金表][{资产账户编号},{记录序号} as {交易组资金序号},{交易组编号},{期初金额} as {交易组期初金额},{当前金额} as {交易组当前金额},{冻结金额} as {交易组冻结金额},{解冻金额}  as {交易组解冻金额},{待交收金额} as {交易组待交收金额},{沪深可用调整金额} as {交易组沪深可用调整金额},{港股通可用调整金额} as {交易组港股通可用调整金额},{金额核对差额} as {交易组金额核对差额},{T日当日港股买入金额} as {交易组T日当日港股买入金额},{T日当日港股卖出金额} as {交易组T日当日港股卖出金额},{T1日当日港股买入金额} as {交易组T1日当日港股买入金额},{T1日当日港股卖出金额} as {交易组T1日当日港股卖出金额},{累计应收金额} as {交易组累计应收金额},{累计应付金额} as {交易组累计应付金额},{实现盈亏} as {交易组实现盈亏},{利率} as {交易组利率},{利息积数} as {交易组利息积数},{待入账利息} as {交易组待入账利息},{更新次数}][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {本币币种}=@本币币种#][@指定行数#] */
    if v_row_count = -1 then
        select asset_acco_no,row_id as exgp_cash_id,exch_group_no,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt  as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and pd_no=v_pd_no and crncy_type=v_crncy_type;
    else
        select asset_acco_no,row_id as exgp_cash_id,exch_group_no,begin_amt as exgp_begin_amt,curr_amt as exgp_curr_amt,frozen_amt as exgp_frozen_amt,unfroz_amt  as exgp_unfroz_amt,pre_settle_amt as exgp_pre_settle_amt,shsz_avail_change_amt as exgp_shsz_avail_change_amt,hk_avail_change_amt as exgp_hk_avail_change_amt,amt_check_diff as exgp_amt_check_diff,T_hk_buy_total_amt as exgp_T_hk_buy_total_amt,T_hk_sell_total_amt as exgp_T_hk_sell_total_amt,T1_hk_buy_total_amt as exgp_T1_hk_buy_total_amt,T1_hk_sell_total_amt as exgp_T1_hk_sell_total_amt,total_rece_amt as exch_group_total_rece_amt,total_payab_amt as exch_group_total_payab_amt,realize_pandl as exgp_realize_pandl,intrst_rate as exch_group_intrst_rate,intrst_base_amt as exch_group_intrst_base_amt,pre_entry_intrst_amt as exch_group_pre_entry_intrst_amt,update_times from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and pd_no=v_pd_no and crncy_type=v_crncy_type limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询产品申赎流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryPdApplyJourRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryPdApplyJourRecord(
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
    

    /* [获取表记录][产品证券_资金_产品申赎流水表][字段][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@申赎类型#=0 or {申赎类型}=@申赎类型#)  and (@记录批号# = 0 or {记录批号}=@记录批号#)  and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and  {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, record_batch_no, 
        redempt_type, redempt_amt, redempt_qty, exch_group_no_str, 
        exgp_dist_amt_str, oper_remark_info from db_pdsecu.tb_pdseca_pd_apply_jour where init_date=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_redempt_type=0 or redempt_type=v_redempt_type)  and (v_record_batch_no = 0 or record_batch_no=v_record_batch_no)  and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, record_batch_no, 
        redempt_type, redempt_amt, redempt_qty, exch_group_no_str, 
        exgp_dist_amt_str, oper_remark_info from db_pdsecu.tb_pdseca_pd_apply_jour where init_date=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_redempt_type=0 or redempt_type=v_redempt_type)  and (v_record_batch_no = 0 or record_batch_no=v_record_batch_no)  and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询产品申赎流水历史记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryPdApplyJourHisRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryPdApplyJourHisRecord(
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
    

    /* [获取表记录][历史_产品证券_资金_产品申赎流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@申赎类型#=0 or {申赎类型}=@申赎类型#) and (@记录批号# = 0 or {记录批号}=@记录批号#)  and (@产品编号权限串#=" " or instr(@产品编号权限串#, concat(";",{产品编号},";"))>0) and  {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, record_batch_no, 
        redempt_type, redempt_amt, redempt_qty, exch_group_no_str, 
        exgp_dist_amt_str, oper_remark_info from db_pdsecu_his.tb_pdseca_pd_apply_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_redempt_type=0 or redempt_type=v_redempt_type) and (v_record_batch_no = 0 or record_batch_no=v_record_batch_no)  and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, record_batch_no, 
        redempt_type, redempt_amt, redempt_qty, exch_group_no_str, 
        exgp_dist_amt_str, oper_remark_info from db_pdsecu_his.tb_pdseca_pd_apply_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_redempt_type=0 or redempt_type=v_redempt_type) and (v_record_batch_no = 0 or record_batch_no=v_record_batch_no)  and (v_pd_no_rights_str=" " or instr(v_pd_no_rights_str, concat(";",pd_no,";"))>0) and  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询外部转入资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QueryEntryOutAsac;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QueryEntryOutAsac(
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
    

    /* [获取表记录][产品证券_资金_外部转入资产表][字段][(@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号# = 0 or {外部账号}=@外部账号#) and (@初始化日期# = 0 or  {初始化日期}= @初始化日期#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, out_acco, out_nav_asset, out_stock_asset, 
        out_bond_asset, out_fund_asset, out_repo_asset, out_total_rece_amt, 
        out_total_payab_amt, out_other_asset, out_option_asset, out_fina_debt, 
        out_loan_debt, out_futu_asset, out_margin_amt, out_shsz_T0_avail, 
        out_shsz_T1_avail, out_shhk_avail_amt, out_szhk_avail_amt, out_cash_asset, 
        out_futu_pandl_amt from db_pdsecu.tb_pdseca_out_entry_asac where (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco = 0 or out_acco=v_out_acco) and (v_init_date = 0 or  init_date= v_init_date) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        pass_no, co_no, pd_no, asset_acco_no, 
        exch_group_no, out_acco, out_nav_asset, out_stock_asset, 
        out_bond_asset, out_fund_asset, out_repo_asset, out_total_rece_amt, 
        out_total_payab_amt, out_other_asset, out_option_asset, out_fina_debt, 
        out_loan_debt, out_futu_asset, out_margin_amt, out_shsz_T0_avail, 
        out_shsz_T1_avail, out_shhk_avail_amt, out_szhk_avail_amt, out_cash_asset, 
        out_futu_pandl_amt from db_pdsecu.tb_pdseca_out_entry_asac where (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco = 0 or out_acco=v_out_acco) and (v_init_date = 0 or  init_date= v_init_date) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_查询资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_QuerySecuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_QuerySecuCapitalDiff(
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
    

    /* [获取表记录][产品证券_资金_内外资产账户资金差异表][字段][{机构编号}=@机构编号# and (@产品编号串#="; ;" or instr(@产品编号串#, concat(";",{产品编号},";"))>0) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前金额差额}<>0 or {账户可用金额差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前金额差额}=0 and {账户可用金额差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where co_no=v_co_no and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, out_curr_amt, out_enable_amt, acco_curr_amt_diff, 
        acco_avail_amt_diff, sys_avail_amt_diff, total_payab_amt, total_rece_amt, 
        out_total_payab_amt, out_total_rece_amt, acco_total_payab_amt_diff, acco_total_rece_amt_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdsecu.tb_pdseca_asac_capit_diff where co_no=v_co_no and (v_pd_no_str="; ;" or instr(v_pd_no_str, concat(";",pd_no,";"))>0) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdsecu;;

# 原子_产品证券_资金_运维端查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdseca_OperQueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdseca_OperQueryExgpCapital(
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
    

    /* [获取表记录][产品证券_资金_交易组资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 or @交易组编号权限串#= ' ') and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 or v_exch_group_no_rights_str= ' ') and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, frozen_amt, unfroz_amt, 
        pre_settle_amt, shsz_avail_change_amt, hk_avail_change_amt, amt_check_diff, 
        T_hk_buy_total_amt, T_hk_sell_total_amt, T1_hk_buy_total_amt, T1_hk_sell_total_amt, 
        total_rece_amt, total_payab_amt, total_change_amt, realize_pandl, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdsecu.tb_pdseca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 or v_exch_group_no_rights_str= ' ') and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


