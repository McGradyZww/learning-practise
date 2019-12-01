DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_同步资产账户资金更新产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_UpdatePdCapitalBySyncAssetCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_UpdatePdCapitalBySyncAssetCapital(
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
    IN p_occur_amt decimal(18,4),
    IN p_amt_check_diff decimal(18,4),
    IN p_sync_total_rece_payab int,
    IN p_acco_total_rece_amt_diff decimal(18,4),
    IN p_acco_total_payab_amt_diff decimal(18,4),
    IN p_crncy_type varchar(3),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
    OUT p_pd_update_times int
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
    declare v_occur_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_sync_total_rece_payab int;
    declare v_acco_total_rece_amt_diff decimal(18,4);
    declare v_acco_total_payab_amt_diff decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_pd_update_times int;
    declare v_begin_amt decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_tmp_occur_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_tmp_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_end_amt decimal(18,4);
    declare v_asset_acco_no int;
    declare v_jour_occur_info varchar(2048);
    declare v_tmp_avail_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_amt = p_occur_amt;
    SET v_amt_check_diff = p_amt_check_diff;
    SET v_sync_total_rece_payab = p_sync_total_rece_payab;
    SET v_acco_total_rece_amt_diff = p_acco_total_rece_amt_diff;
    SET v_acco_total_payab_amt_diff = p_acco_total_payab_amt_diff;
    SET v_crncy_type = p_crncy_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_pd_update_times = 0;
    SET v_begin_amt = 0;
    SET v_first_amt = 0;
    SET v_curr_amt = 0;
    SET v_tmp_occur_amt = 0;
    SET v_total_change_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_tmp_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_amt = 0;
    SET v_asset_acco_no = 0;
    SET v_jour_occur_info = " ";
    SET v_tmp_avail_amt = 0;

    
    label_pro:BEGIN
    

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @原始金额# = 0; */
    set v_first_amt = 0;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @临时_变动金额#=@变动金额#; */
    set v_tmp_occur_amt=v_occur_amt;

    /* set @产品已分配金额# = @变动金额#+@金额核对差额#; */
    set v_pd_dist_amt = v_occur_amt+v_amt_check_diff;

    /* set @产品已授权金额# = @变动金额#+@金额核对差额#; */
    set v_pd_auth_amt = v_occur_amt+v_amt_check_diff;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @累计派现金额# = 0; */
    set v_total_cash_divide = 0;

    /* set @累计计提费用# = 0; */
    set v_total_pre_fee = 0;

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

    /* set @预计利息# = 0; */
    set v_intrst_cacl_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

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

    /* set @临时_操作备注#=@操作备注#; */
    set v_tmp_oper_remark_info=v_oper_remark_info;

    /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
    set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");

    /* if  @同步累计应收应付# = 《同步累计应收应付-不同步》  then */
    if  v_sync_total_rece_payab = 0  then

         /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{产品已分配金额}={产品已分配金额}+@产品已分配金额#,{产品已授权金额}={产品已授权金额}+@产品已授权金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{红冲蓝补金额}=0][1][@产品编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             crncy_type, first_amt, begin_amt, curr_amt, 
             pd_dist_amt, pd_auth_amt, amt_check_diff, pre_settle_amt, 
             total_cash_divide, total_pre_fee, total_rece_amt, total_payab_amt, 
             total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_crncy_type, v_first_amt, v_begin_amt, v_curr_amt, 
             v_pd_dist_amt, v_pd_auth_amt, v_amt_check_diff, v_pre_settle_amt, 
             v_total_cash_divide, v_total_pre_fee, v_total_rece_amt, v_total_payab_amt, 
             v_total_change_amt, v_intrst_cacl_amt, v_pre_entry_intrst_amt) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,pd_dist_amt=pd_dist_amt+v_pd_dist_amt,pd_auth_amt=pd_auth_amt+v_pd_auth_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_change_amt=0;
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.10.1";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             else
                 SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
             end if;
             leave label_pro;
         end if;


    /* elseif @同步累计应收应付# = 《同步累计应收应付-同步》  then */
    elseif v_sync_total_rece_payab = 1  then

         /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{产品已分配金额}={产品已分配金额}+@产品已分配金额#,{产品已授权金额}={产品已授权金额}+@产品已授权金额#,{金额核对差额}={金额核对差额}+@金额核对差额#,{累计应付金额}= {累计应付金额} + @账户累计应付金额差额#,{累计应收金额}={累计应收金额}+@账户累计应收金额差额#,{红冲蓝补金额}=0][1][@产品编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit (
             create_date, create_time, update_date, 
             update_time, update_times, co_no, pd_no, 
             crncy_type, first_amt, begin_amt, curr_amt, 
             pd_dist_amt, pd_auth_amt, amt_check_diff, pre_settle_amt, 
             total_cash_divide, total_pre_fee, total_rece_amt, total_payab_amt, 
             total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt) 
         values(
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_co_no, v_pd_no, 
             v_crncy_type, v_first_amt, v_begin_amt, v_curr_amt, 
             v_pd_dist_amt, v_pd_auth_amt, v_amt_check_diff, v_pre_settle_amt, 
             v_total_cash_divide, v_total_pre_fee, v_total_rece_amt, v_total_payab_amt, 
             v_total_change_amt, v_intrst_cacl_amt, v_pre_entry_intrst_amt) 
         ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,pd_dist_amt=pd_dist_amt+v_pd_dist_amt,pd_auth_amt=pd_auth_amt+v_pd_auth_amt,amt_check_diff=amt_check_diff+v_amt_check_diff,total_payab_amt= total_payab_amt + v_acco_total_payab_amt_diff,total_rece_amt=total_rece_amt+v_acco_total_rece_amt_diff,total_change_amt=0;
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.10.1";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             else
                 SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
             end if;
             leave label_pro;
         end if;


         /* [获取表记录变量][产品_资金_产品资金表][{累计应收金额},{累计应付金额}][@累计应收金额#,@累计应付金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
         select total_rece_amt,total_payab_amt into v_total_rece_amt,v_total_payab_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
         if FOUND_ROWS() = 0 then
                     
             SET v_error_code = "prodA.6.10.4";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             else
                 SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
             end if;
             leave label_pro;
         end if;


          /* set @流水变动字段#=" "; */
          set v_jour_occur_field=" ";

          /* set @流水后信息#=" "; */
          set v_jour_after_occur_info=" ";

          /* set @操作备注#=concat(@临时_操作备注#,"|","累计应付差额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应付差额");

          /* set @变动金额#=@账户累计应付金额差额#; */
          set v_occur_amt=v_acco_total_payab_amt_diff;

          /* set @变动后金额#=@累计应付金额#; */
          set v_occur_end_amt=v_total_payab_amt;

         /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit_jour(
             create_date, create_time, update_date, 
             update_time, update_times, opor_co_no, opor_no, 
             oper_mac, oper_ip_addr, oper_info, oper_way, 
             oper_menu_no, oper_func_code, init_date, co_no, 
             pd_no, crncy_type, busi_flag, occur_amt, 
             occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
         value( 
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
             v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
             v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
             v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
             v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.10.5";
             SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             leave label_pro;
         end if;


          /* set @操作备注#=concat(@临时_操作备注#,"|","累计应收差额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","累计应收差额");

          /* set @变动金额#=@账户累计应收金额差额#; */
          set v_occur_amt=v_acco_total_rece_amt_diff;

          /* set @变动后金额#=@累计应收金额#; */
          set v_occur_end_amt=v_total_rece_amt;

         /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit_jour(
             create_date, create_time, update_date, 
             update_time, update_times, opor_co_no, opor_no, 
             oper_mac, oper_ip_addr, oper_info, oper_way, 
             oper_menu_no, oper_func_code, init_date, co_no, 
             pd_no, crncy_type, busi_flag, occur_amt, 
             occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
         value( 
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
             v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
             v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
             v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
             v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.10.5";
             SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             leave label_pro;
         end if;

    end if;
    #注释掉已分配、已授权。

    /* set @操作备注#=concat(@临时_操作备注#,"|","当前金额差额"); */
    set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","当前金额差额");
    #[获取流水变动][{产品已分配金额},{产品已授权金额},{红冲蓝补金额}][@产品已分配金额#,@产品已授权金额#,@红冲蓝补金额#]

    /* [获取流水变动][{红冲蓝补金额}][@红冲蓝补金额#] */
    set v_jour_occur_field = concat("红冲蓝补金额","|");
    set v_jour_occur_info = concat(v_total_change_amt,"|");


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{产品已分配金额},{产品已授权金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{当前金额}+{金额核对差额}+{待交收金额},{红冲蓝补金额},{更新次数}][@变动后金额#,@产品已分配金额#,@产品已授权金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@临时_可用金额#,@红冲蓝补金额#,@产品更新次数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pd_dist_amt,pd_auth_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,amt_check_diff,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,curr_amt+amt_check_diff+pre_settle_amt,total_change_amt,update_times into v_occur_end_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_amt_check_diff,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_tmp_avail_amt,v_total_change_amt,v_pd_update_times from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #[获取流水后信息][@产品已分配金额#,@产品已授权金额#,@红冲蓝补金额#]

    /* [获取流水后信息][@红冲蓝补金额#] */
    set v_jour_after_occur_info = concat(v_total_change_amt,"|");


    /* set @变动金额#=@临时_变动金额#; */
    set v_occur_amt=v_tmp_occur_amt;

    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.10.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @流水变动字段#=" "; */
    set v_jour_occur_field=" ";

    /* set @流水后信息#=" "; */
    set v_jour_after_occur_info=" ";

    /* set @操作备注#=concat(@临时_操作备注#,"|","可用金额差额"); */
    set v_oper_remark_info=concat(v_tmp_oper_remark_info,"|","可用金额差额");

    /* set @变动金额#=@金额核对差额#; */
    set v_occur_amt=v_amt_check_diff;

    /* set @变动后金额#=@临时_可用金额#; */
    set v_occur_end_amt=v_tmp_avail_amt;

    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.10.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_pd_update_times = v_pd_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_分配产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_DistrPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_DistrPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pd_dist_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_curr_amt decimal(18,4);
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pd_dist_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_curr_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{产品已分配金额}][@产品已分配金额#] */
    set v_jour_occur_field = concat("产品已分配金额","|");
    set v_jour_occur_info = concat(v_pd_dist_amt,"|");


    /* [更新表记录][产品_资金_产品资金表][{产品已分配金额}={产品已分配金额}+@变动金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_dist_amt=pd_dist_amt+v_occur_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{产品已分配金额}][@当前金额#,@产品已分配金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pd_dist_amt into v_curr_amt,v_pd_dist_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #可分配资金校验
    #[检查报错返回][@当前金额# < @产品已分配金额#][615][@产品编号#,@本币币种#]

    /* [获取流水后信息][@产品已分配金额#] */
    set v_jour_after_occur_info = concat(v_pd_dist_amt,"|");


    /* set @业务标志# = 《业务标志-资金分配》; */
    set v_busi_flag = 1004001;

    /* set @变动后金额# = @产品已分配金额#; */
    set v_occur_end_amt = v_pd_dist_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #[插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_回收产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_BackPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_BackPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pd_dist_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pd_dist_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{产品已分配金额}][@产品已分配金额#] */
    set v_jour_occur_field = concat("产品已分配金额","|");
    set v_jour_occur_info = concat(v_pd_dist_amt,"|");


    /* [更新表记录][产品_资金_产品资金表][{产品已分配金额}={产品已分配金额}-@变动金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_dist_amt=pd_dist_amt-v_occur_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.12.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{产品已分配金额}][@产品已分配金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select pd_dist_amt into v_pd_dist_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.12.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@产品已分配金额#] */
    set v_jour_after_occur_info = concat(v_pd_dist_amt,"|");


    /* set @业务标志# = 《业务标志-资金分配回收》; */
    set v_busi_flag = 1004002;

    /* set @变动金额# = -1 * @变动金额#; */
    set v_occur_amt = -1 * v_occur_amt;

    /* set @变动后金额# = @产品已分配金额#; */
    set v_occur_end_amt = v_pd_dist_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #[插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_AuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_AuthPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pd_auth_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pd_auth_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{产品已授权金额}][@产品已授权金额#] */
    set v_jour_occur_field = concat("产品已授权金额","|");
    set v_jour_occur_info = concat(v_pd_auth_amt,"|");


    /* [更新表记录][产品_资金_产品资金表][{产品已授权金额}={产品已授权金额}+@变动金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_auth_amt=pd_auth_amt+v_occur_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.13.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{产品已授权金额}][@产品已授权金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select pd_auth_amt into v_pd_auth_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.13.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@产品已授权金额#] */
    set v_jour_after_occur_info = concat(v_pd_auth_amt,"|");


    /* set @业务标志# = 《业务标志-资金授权》; */
    set v_busi_flag = 1004003;

    /* set @变动后金额# = @产品已授权金额#; */
    set v_occur_end_amt = v_pd_auth_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #[插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_回收授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_BackAuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_BackAuthPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pd_auth_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pd_auth_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{产品已授权金额}][@产品已授权金额#] */
    set v_jour_occur_field = concat("产品已授权金额","|");
    set v_jour_occur_info = concat(v_pd_auth_amt,"|");

    #先处理产品资产表

    /* [更新表记录][产品_资金_产品资金表][{产品已授权金额}={产品已授权金额}-@变动金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pd_auth_amt=pd_auth_amt-v_occur_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.14.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{产品已授权金额}][@产品已授权金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select pd_auth_amt into v_pd_auth_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.14.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@产品已授权金额#] */
    set v_jour_after_occur_info = concat(v_pd_auth_amt,"|");


    /* set @业务标志# = 《业务标志-资金授权回收》; */
    set v_busi_flag = 1004004;

    /* set @变动金额# = -1 * @变动金额#; */
    set v_occur_amt = -1 * v_occur_amt;

    /* set @变动后金额# = @产品已授权金额#; */
    set v_occur_end_amt = v_pd_auth_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;
    #[插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#]
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取资产更新产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetProdInfoByAssetUpdate;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetProdInfoByAssetUpdate(
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
    OUT p_row_id_str varchar(2048),
    OUT p_co_no_str varchar(2048),
    OUT p_pd_no_str varchar(2048)
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
    declare v_row_id_str varchar(2048);
    declare v_co_no_str varchar(2048);
    declare v_pd_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_row_id_str = " ";
    SET v_co_no_str = " ";
    SET v_pd_no_str = " ";

    
    label_pro:BEGIN
    

    /* set @记录序号串# = " "; */
    set v_row_id_str = " ";

    /* set @机构编号串# = " "; */
    set v_co_no_str = " ";

    /* set @产品编号串# = " "; */
    set v_pd_no_str = " ";

    /* SELECT
    GROUP_CONCAT(c.{记录序号} SEPARATOR ";"), 
    GROUP_CONCAT(c.{机构编号} SEPARATOR ";"),
    GROUP_CONCAT(c.{产品编号} SEPARATOR ";")  into
    @记录序号串#,
    @机构编号串#,
    @产品编号串#
FROM
(
    SELECT
    a.{记录序号},
    a.{机构编号},
    a.{产品编号}
    FROM
    ~产品_账户_产品信息表^ a,
    ~产品_账户_产品限制信息表^ b
    WHERE
    a.{产品编号} = b.{产品编号}
    AND a.{记录序号} > @查询记录序号#
    AND b.{产品状态} <> "3"
    ORDER BY
    a.{记录序号}
    LIMIT 100
) AS c; */
    SELECT
        GROUP_CONCAT(c.row_id SEPARATOR ";"), 
        GROUP_CONCAT(c.co_no SEPARATOR ";"),
        GROUP_CONCAT(c.pd_no SEPARATOR ";")  into
        v_row_id_str,
        v_co_no_str,
        v_pd_no_str
    FROM
    (
        SELECT
        a.row_id,
        a.co_no,
        a.pd_no
        FROM
        db_prod.tb_pdacco_pd_info a,
        db_prod.tb_pdacco_pd_limit b
        WHERE
        a.pd_no = b.pd_no
        AND a.row_id > v_query_row_id
        AND b.pd_status <> "3"
        ORDER BY
        a.row_id
        LIMIT 100
    ) AS c;

    /* set @记录序号串# = concat(ifnull(@记录序号串#," "),";"); */
    set v_row_id_str = concat(ifnull(v_row_id_str," "),";");

    /* set @机构编号串# = concat(ifnull(@机构编号串#," "),";"); */
    set v_co_no_str = concat(ifnull(v_co_no_str," "),";");

    /* set @产品编号串# = concat(ifnull(@产品编号串#," "),";"); */
    set v_pd_no_str = concat(ifnull(v_pd_no_str," "),";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id_str = v_row_id_str;
    SET p_co_no_str = v_co_no_str;
    SET p_pd_no_str = v_pd_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_更新产品证券资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_UpdateProdSecuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_UpdateProdSecuAsset(
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
    IN p_stock_asset decimal(18,4),
    IN p_bond_asset decimal(18,4),
    IN p_fund_asset decimal(18,4),
    IN p_money_fund_asset decimal(18,4),
    IN p_not_money_fund_asset decimal(18,4),
    IN p_repo_asset decimal(18,4),
    IN p_hk_thrgh_stock_asset decimal(18,4),
    IN p_futu_cash_asset decimal(18,4),
    IN p_futu_asset decimal(18,4),
    IN p_futu_long_market_value decimal(18,4),
    IN p_futu_short_market_value decimal(18,4),
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
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_futu_asset decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_total_loan_debt decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_begin_NAV decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
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
    SET v_crncy_type = p_crncy_type;
    SET v_stock_asset = p_stock_asset;
    SET v_bond_asset = p_bond_asset;
    SET v_fund_asset = p_fund_asset;
    SET v_money_fund_asset = p_money_fund_asset;
    SET v_not_money_fund_asset = p_not_money_fund_asset;
    SET v_repo_asset = p_repo_asset;
    SET v_hk_thrgh_stock_asset = p_hk_thrgh_stock_asset;
    SET v_futu_cash_asset = p_futu_cash_asset;
    SET v_futu_asset = p_futu_asset;
    SET v_futu_long_market_value = p_futu_long_market_value;
    SET v_futu_short_market_value = p_futu_short_market_value;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_total_loan_debt = 0;
    SET v_total_fina_debt = 0;
    SET v_begin_NAV = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_nav_asset = 0;
    SET v_other_asset = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @总融券负债#=0; */
    set v_total_loan_debt=0;

    /* set @总融资负债#=0; */
    set v_total_fina_debt=0;

    /* set @期初净资产# =0; */
    set v_begin_NAV =0;

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;
    #现金资产 区分 证券和期货 Modify by wjp 20181019

    /* [获取表记录变量语句][产品_资金_产品资金表][{当前金额}+{待交收金额}+{累计应收金额}-{累计应付金额}+{金额核对差额}][@总现金资产#][{产品编号}=@产品编号# and {本币币种}=@本币币种#] */
    select curr_amt+pre_settle_amt+total_rece_amt-total_payab_amt+amt_check_diff into v_total_cash_asset from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;

    #计算期货现金资产 Modify by wjp 20181019 期货现金 产品层级根据资产账户去统计。      跨库操作，放产品期货库。

    /* set @总现金资产# =@总现金资产# - @期货资产#; */
    set v_total_cash_asset =v_total_cash_asset - v_futu_asset;

    /* set @证券现金资产# = @总现金资产# - @期货现金资产#; */
    set v_stock_cash_asset = v_total_cash_asset - v_futu_cash_asset;

    /* set @净资产# = @总现金资产# + @期货资产# + @股票资产# + @债券资产# + @基金资产# + @回购资产# + @港股通资产#; */
    set v_nav_asset = v_total_cash_asset + v_futu_asset + v_stock_asset + v_bond_asset + v_fund_asset + v_repo_asset + v_hk_thrgh_stock_asset;

    /* set @其他资产# =0; */
    set v_other_asset =0;
    #{总现金资产}=@总现金资产#-{期货资产}？

    /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{净资产}=@净资产#,{总现金资产}=@总现金资产#,{证券现金资产}=@证券现金资产#,{期货现金资产}=@期货现金资产#,{期货资产}=@期货资产#,{股票资产}=@股票资产#,{债券资产}=@债券资产#,{基金资产}=@基金资产#,{货币基金资产}=@货币基金资产#,{非货币基金资产}=@非货币基金资产#,{回购资产}=@回购资产#,{港股通资产}=@港股通资产#,{期货多头市值}=@期货多头市值#,{期货空头市值}=@期货空头市值#][1][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_asset (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
        nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
        stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
        bond_asset, futu_asset, repo_asset, other_asset, 
        hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
        v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
        v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
        v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
        v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
        v_futu_short_market_value) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, nav_asset=v_nav_asset,total_cash_asset=v_total_cash_asset,stock_cash_asset=v_stock_cash_asset,futu_cash_asset=v_futu_cash_asset,futu_asset=v_futu_asset,stock_asset=v_stock_asset,bond_asset=v_bond_asset,fund_asset=v_fund_asset,money_fund_asset=v_money_fund_asset,not_money_fund_asset=v_not_money_fund_asset,repo_asset=v_repo_asset,hk_thrgh_stock_asset=v_hk_thrgh_stock_asset,futu_long_market_value=v_futu_long_market_value,futu_short_market_value=v_futu_short_market_value;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.23.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_更新产品期货资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_UpdateProdFutuAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_UpdateProdFutuAsset(
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
    IN p_futu_asset decimal(18,4),
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
    declare v_futu_asset decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_begin_NAV decimal(18,4);
    declare v_begin_evalu_nav_asset decimal(18,4);
    declare v_evalu_nav_asset decimal(18,4);
    declare v_total_cash_asset decimal(18,4);
    declare v_nav_asset decimal(18,4);
    declare v_stock_cash_asset decimal(18,4);
    declare v_futu_cash_asset decimal(18,4);
    declare v_stock_asset decimal(18,4);
    declare v_bond_asset decimal(18,4);
    declare v_fund_asset decimal(18,4);
    declare v_repo_asset decimal(18,4);
    declare v_hk_thrgh_stock_asset decimal(18,4);
    declare v_other_asset decimal(18,4);
    declare v_money_fund_asset decimal(18,4);
    declare v_not_money_fund_asset decimal(18,4);
    declare v_total_loan_debt decimal(18,4);
    declare v_total_fina_debt decimal(18,4);
    declare v_futu_long_market_value decimal(18,4);
    declare v_futu_short_market_value decimal(18,4);
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
    SET v_crncy_type = p_crncy_type;
    SET v_futu_asset = p_futu_asset;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_begin_NAV = 0;
    SET v_begin_evalu_nav_asset = 0;
    SET v_evalu_nav_asset = 0;
    SET v_total_cash_asset = 0;
    SET v_nav_asset = 0;
    SET v_stock_cash_asset = 0;
    SET v_futu_cash_asset = 0;
    SET v_stock_asset = 0;
    SET v_bond_asset = 0;
    SET v_fund_asset = 0;
    SET v_repo_asset = 0;
    SET v_hk_thrgh_stock_asset = 0;
    SET v_other_asset = 0;
    SET v_money_fund_asset = 0;
    SET v_not_money_fund_asset = 0;
    SET v_total_loan_debt = 0;
    SET v_total_fina_debt = 0;
    SET v_futu_long_market_value = 0;
    SET v_futu_short_market_value = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @期初净资产# =0; */
    set v_begin_NAV =0;

    /* set @期初估值净资产# = 0; */
    set v_begin_evalu_nav_asset = 0;

    /* set @估值净资产# = 0; */
    set v_evalu_nav_asset = 0;

    /* [获取表记录变量语句][产品_资金_产品资金表][{当前金额}+{待交收金额}+{累计应收金额}-{累计应付金额}+{金额核对差额}][@总现金资产#][{产品编号}=@产品编号# and {本币币种}=@本币币种#] */
    select curr_amt+pre_settle_amt+total_rece_amt-total_payab_amt+amt_check_diff into v_total_cash_asset from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;


    /* set @净资产# = @总现金资产#; */
    set v_nav_asset = v_total_cash_asset;

    /* set @总现金资产# = @总现金资产# - @期货资产#; */
    set v_total_cash_asset = v_total_cash_asset - v_futu_asset;

    /* set @证券现金资产# = 0; */
    set v_stock_cash_asset = 0;

    /* set @期货现金资产# = 0; */
    set v_futu_cash_asset = 0;

    /* set @股票资产# =0; */
    set v_stock_asset =0;

    /* set @债券资产# =0; */
    set v_bond_asset =0;

    /* set @基金资产# =0; */
    set v_fund_asset =0;

    /* set @回购资产# =0; */
    set v_repo_asset =0;

    /* set @港股通资产# =0; */
    set v_hk_thrgh_stock_asset =0;

    /* set @其他资产# =0; */
    set v_other_asset =0;

    /* set @货币基金资产# =0; */
    set v_money_fund_asset =0;

    /* set @非货币基金资产# =0; */
    set v_not_money_fund_asset =0;

    /* set @总融券负债#=0; */
    set v_total_loan_debt=0;

    /* set @总融资负债#=0; */
    set v_total_fina_debt=0;

    /* set @期货多头市值# = 0; */
    set v_futu_long_market_value = 0;

    /* set @期货空头市值# = 0; */
    set v_futu_short_market_value = 0;

    /* [插入重复更新][产品_资金_产品资产表][字段][字段变量][{净资产}={股票资产}+{债券资产}+{基金资产}+{回购资产}+{港股通资产}+{其他资产}-{总融资负债}-{总融券负债}+@总现金资产#+@期货资产#,{总现金资产}=@总现金资产#,{期货资产}=@期货资产#][1][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_asset (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
        nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
        stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
        bond_asset, futu_asset, repo_asset, other_asset, 
        hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_crncy_type, v_begin_evalu_nav_asset, v_evalu_nav_asset, v_begin_NAV, 
        v_nav_asset, v_total_cash_asset, v_stock_cash_asset, v_futu_cash_asset, 
        v_stock_asset, v_fund_asset, v_money_fund_asset, v_not_money_fund_asset, 
        v_bond_asset, v_futu_asset, v_repo_asset, v_other_asset, 
        v_hk_thrgh_stock_asset, v_total_fina_debt, v_total_loan_debt, v_futu_long_market_value, 
        v_futu_short_market_value) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, nav_asset=stock_asset+bond_asset+fund_asset+repo_asset+hk_thrgh_stock_asset+other_asset-total_fina_debt-total_loan_debt+v_total_cash_asset+v_futu_asset,total_cash_asset=v_total_cash_asset,futu_asset=v_futu_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.26.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_处理回购到期产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_DealRepoExpireProdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_DealRepoExpireProdCapital(
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
    IN p_repo_back_amt decimal(18,4),
    IN p_repo_back_intrst decimal(18,4),
    IN p_busi_flag int,
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
    declare v_repo_back_amt decimal(18,4);
    declare v_repo_back_intrst decimal(18,4);
    declare v_busi_flag int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_begin_amt decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_oper_func_code varchar(16);
    declare v_oper_menu_no int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_occur_end_amt decimal(18,4);
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
    SET v_repo_back_amt = p_repo_back_amt;
    SET v_repo_back_intrst = p_repo_back_intrst;
    SET v_busi_flag = p_busi_flag;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_occur_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_crncy_type = "CNY";
    SET v_begin_amt = 0;
    SET v_first_amt = 0;
    SET v_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_pre_settle_amt = 0;
    SET v_total_change_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_oper_func_code = " ";
    SET v_oper_menu_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_occur_end_amt = 0;
    SET v_jour_after_occur_info = " ";

    
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

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @原始金额# = 0; */
    set v_first_amt = 0;

    /* set @当前金额# = 0; */
    set v_curr_amt = 0;

    /* set @产品已分配金额# = 0; */
    set v_pd_dist_amt = 0;

    /* set @产品已授权金额# = 0; */
    set v_pd_auth_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @待交收金额# = @变动金额#; */
    set v_pre_settle_amt = v_occur_amt;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @累计派现金额# = 0; */
    set v_total_cash_divide = 0;

    /* set @累计计提费用# = 0; */
    set v_total_pre_fee = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @预计利息# = 0; */
    set v_intrst_cacl_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;
    #已分配已授权到期不处理,入账处理
    #[插入重复更新][产品_资金_产品资金表][字段][字段变量][{待交收金额}={待交收金额}+@变动金额#,{产品已分配金额}={产品已分配金额}+@变动金额#,{产品已授权金额}={产品已授权金额}+@变动金额#][1][@产品编号#,@本币币种#]

    /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{待交收金额}={待交收金额}+@变动金额#][1][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, first_amt, begin_amt, curr_amt, 
        pd_dist_amt, pd_auth_amt, amt_check_diff, pre_settle_amt, 
        total_cash_divide, total_pre_fee, total_rece_amt, total_payab_amt, 
        total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_crncy_type, v_first_amt, v_begin_amt, v_curr_amt, 
        v_pd_dist_amt, v_pd_auth_amt, v_amt_check_diff, v_pre_settle_amt, 
        v_total_cash_divide, v_total_pre_fee, v_total_rece_amt, v_total_payab_amt, 
        v_total_change_amt, v_intrst_cacl_amt, v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, pre_settle_amt=pre_settle_amt+v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.25.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{待交收金额}][@变动后金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select pre_settle_amt into v_occur_end_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.25.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@回购购回金额#,@回购购回利息#] */
    set v_jour_after_occur_info = concat(v_repo_back_amt,"|",v_repo_back_intrst,"|");


    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.25.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_处理产品资金待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_DealCapitPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_DealCapitPreEntry(
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
    IN p_crncy_type varchar(3),
    IN p_occur_amt decimal(18,4),
    IN p_busi_flag int,
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_oper_remark_info varchar(255);
    declare v_tmp_pre_settle_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_pre_settle_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_oper_remark_info = " ";
    SET v_tmp_pre_settle_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_pre_settle_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_jour_after_occur_info = " ";

    
    label_pro:BEGIN
    
    #处理待入账记录中场外基金委托与冻结金额相关 , 产品资金表中没有这个字段 , 所以不体现 , 场外基金成交是当日处理的 , 所以不存在待入账记录

    /* [检查正常返回][@业务标志# = 《业务标志-基金申购》 or @业务标志# = 《业务标志-基金赎回》] */
    if v_busi_flag = 2006001 or v_busi_flag = 2006002 then
        leave label_pro;
    end if;


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
    end if;

    /* set @临时_待交收金额# = -1 * @变动金额#; */
    set v_tmp_pre_settle_amt = -1 * v_occur_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{待交收金额},{产品已分配金额},{产品已授权金额}][@待交收金额#,@产品已分配金额#,@产品已授权金额#] */
    set v_jour_occur_field = concat("待交收金额","|","产品已分配金额","|","产品已授权金额","|");
    set v_jour_occur_info = concat(v_pre_settle_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|");


    /* [更新表记录][产品_资金_产品资金表][{当前金额}={当前金额}+@变动金额#,{待交收金额}={待交收金额}+@临时_待交收金额#,{产品已分配金额}={产品已分配金额}+@变动金额#,{产品已授权金额}={产品已授权金额}+@变动金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_occur_amt,pre_settle_amt=pre_settle_amt+v_tmp_pre_settle_amt,pd_dist_amt=pd_dist_amt+v_occur_amt,pd_auth_amt=pd_auth_amt+v_occur_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.27.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{待交收金额},{产品已分配金额},{产品已授权金额}][@变动后金额#,@待交收金额#,@产品已分配金额#,@产品已授权金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pre_settle_amt,pd_dist_amt,pd_auth_amt into v_occur_end_amt,v_pre_settle_amt,v_pd_dist_amt,v_pd_auth_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.27.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水变动][{待交收金额},{产品已分配金额},{产品已授权金额}][@待交收金额#,@产品已分配金额#,@产品已授权金额#] */
    set v_jour_occur_field = concat("待交收金额","|","产品已分配金额","|","产品已授权金额","|");
    set v_jour_occur_info = concat(v_pre_settle_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|");


    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.27.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取资产账户业务控制串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetAsacBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetAsacBusiConfigStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_busi_config_str varchar(64)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户信息表][{业务控制配置串}][@业务控制配置串#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
    select busi_config_str into v_busi_config_str from db_prod.tb_pdacco_asset_acco where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.28.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_重置待交收金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_ResetPreSettleAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_ResetPreSettleAmt(
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品_资金_产品资金表][{待交收金额}=0][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.29.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_归档更新待交收金额
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_BackUpUpdatePreSettleAmt;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_BackUpUpdatePreSettleAmt(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pd_no int,
    IN p_pre_settle_amt decimal(18,4),
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
    declare v_pre_settle_amt decimal(18,4);
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
    SET v_pd_no = p_pd_no;
    SET v_pre_settle_amt = p_pre_settle_amt;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品_资金_产品资金表][{待交收金额}={待交收金额}+@待交收金额#][{产品编号}=@产品编号# and {本币币种}="CNY"][2][@产品编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_settle_amt=pre_settle_amt+v_pre_settle_amt where pd_no=v_pd_no and crncy_type="CNY";
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.30.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_银证转账更新产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_BankTransferUpdatePdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_BankTransferUpdatePdCapital(
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
    IN p_busi_flag int,
    IN p_occur_amt decimal(18,4),
    IN p_crncy_type varchar(3),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
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
    declare v_busi_flag int;
    declare v_occur_amt decimal(18,4);
    declare v_crncy_type varchar(3);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_oper_remark_info varchar(255);
    declare v_begin_amt decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_occur_end_amt decimal(18,4);
    declare v_tmp_update_times int;
    declare v_jour_after_occur_info varchar(2048);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_busi_flag = p_busi_flag;
    SET v_occur_amt = p_occur_amt;
    SET v_crncy_type = p_crncy_type;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_oper_remark_info = " ";
    SET v_begin_amt = 0;
    SET v_first_amt = 0;
    SET v_curr_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_total_change_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_occur_end_amt = 0;
    SET v_tmp_update_times = 1;
    SET v_jour_after_occur_info = " ";
    SET v_asset_acco_no = 0;

    
    label_pro:BEGIN
    

    /* set @操作备注#="银证转账更新产品资金 !"; */
    set v_oper_remark_info="银证转账更新产品资金 !";

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @原始金额# = 0; */
    set v_first_amt = 0;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @产品已分配金额# = @变动金额#; */
    set v_pd_dist_amt = v_occur_amt;

    /* set @产品已授权金额# = @变动金额#; */
    set v_pd_auth_amt = v_occur_amt;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @累计派现金额# = 0; */
    set v_total_cash_divide = 0;

    /* set @累计计提费用# = 0; */
    set v_total_pre_fee = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @预计利息# = 0; */
    set v_intrst_cacl_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{产品已分配金额},{产品已授权金额}][@产品已分配金额#,@产品已授权金额#] */
    set v_jour_occur_field = concat("产品已分配金额","|","产品已授权金额","|");
    set v_jour_occur_info = concat(v_pd_dist_amt,"|",v_pd_auth_amt,"|");


    /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{产品已分配金额}={产品已分配金额}+@产品已分配金额#,{产品已授权金额}={产品已授权金额}+@产品已授权金额#][1][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, first_amt, begin_amt, curr_amt, 
        pd_dist_amt, pd_auth_amt, amt_check_diff, pre_settle_amt, 
        total_cash_divide, total_pre_fee, total_rece_amt, total_payab_amt, 
        total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_crncy_type, v_first_amt, v_begin_amt, v_curr_amt, 
        v_pd_dist_amt, v_pd_auth_amt, v_amt_check_diff, v_pre_settle_amt, 
        v_total_cash_divide, v_total_pre_fee, v_total_rece_amt, v_total_payab_amt, 
        v_total_change_amt, v_intrst_cacl_amt, v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,pd_dist_amt=pd_dist_amt+v_pd_dist_amt,pd_auth_amt=pd_auth_amt+v_pd_auth_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.31.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{产品已分配金额},{产品已授权金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数}][@变动后金额#,@产品已分配金额#,@产品已授权金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@临时_更新次数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pd_dist_amt,pd_auth_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,amt_check_diff,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times into v_occur_end_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_amt_check_diff,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_tmp_update_times from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.31.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@产品已分配金额#,@产品已授权金额#] */
    set v_jour_after_occur_info = concat(v_pd_dist_amt,"|",v_pd_auth_amt,"|");


    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.31.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @临时_更新次数#; */
    set v_update_times = v_tmp_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_新增产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_AddPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_AddPdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_first_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
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
    declare v_crncy_type varchar(3);
    declare v_first_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_update_times int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_first_amt = p_first_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_change_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "本币币种", "|", "原始金额", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_crncy_type, "|", v_first_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = @原始金额#; */
    set v_curr_amt = v_first_amt;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @产品已分配金额# = @原始金额#; */
    set v_pd_dist_amt = v_first_amt;

    /* set @产品已授权金额# = @原始金额#; */
    set v_pd_auth_amt = v_first_amt;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @累计派现金额# = 0; */
    set v_total_cash_divide = 0;

    /* set @累计计提费用# = 0; */
    set v_total_pre_fee = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @红冲蓝补金额# = 0; */
    set v_total_change_amt = 0;

    /* set @预计利息# = 0; */
    set v_intrst_cacl_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入表记录][产品_资金_产品资金表][字段][字段变量][1][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, first_amt, begin_amt, curr_amt, 
        pd_dist_amt, pd_auth_amt, amt_check_diff, pre_settle_amt, 
        total_cash_divide, total_pre_fee, total_rece_amt, total_payab_amt, 
        total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_crncy_type, v_first_amt, v_begin_amt, v_curr_amt, 
        v_pd_dist_amt, v_pd_auth_amt, v_amt_check_diff, v_pre_settle_amt, 
        v_total_cash_divide, v_total_pre_fee, v_total_rece_amt, v_total_payab_amt, 
        v_total_change_amt, v_intrst_cacl_amt, v_pre_entry_intrst_amt);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.32.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数}][@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@产品更新次数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@本币币种#,@产品编号#] */
    select row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,amt_check_diff,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times into v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_amt_check_diff,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_pd_update_times from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("本币币种=",v_crncy_type,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("本币币种=",v_crncy_type,",","产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_crncy_type, "|", v_first_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @业务标志# = 《业务标志-产品资金入金》; */
    set v_busi_flag = 1001001;

    /* set @变动金额# = @原始金额#; */
    set v_occur_amt = v_first_amt;

    /* set @变动后金额# = @原始金额#; */
    set v_occur_end_amt = v_first_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_pd_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, crncy_type, busi_flag, occur_amt, 
        occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
        v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.32.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @产品更新次数#; */
    set v_update_times = v_pd_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_外部账号获取产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_OutAccoGetPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_OutAccoGetPdInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_curr_share decimal(18,2),
    OUT p_first_asset decimal(18,4),
    OUT p_allow_exch varchar(64),
    OUT p_allow_stock_type varchar(2048),
    OUT p_busi_config_str varchar(64),
    OUT p_market_price_ratio decimal(18,12)
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
    declare v_out_acco varchar(32);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_curr_share decimal(18,2);
    declare v_first_asset decimal(18,4);
    declare v_allow_exch varchar(64);
    declare v_allow_stock_type varchar(2048);
    declare v_busi_config_str varchar(64);
    declare v_market_price_ratio decimal(18,12);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_out_acco = p_out_acco;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_curr_share = 0;
    SET v_first_asset = 0;
    SET v_allow_exch = " ";
    SET v_allow_stock_type = " ";
    SET v_busi_config_str = " ";
    SET v_market_price_ratio = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{产品编号},{资产账户编号}][@产品编号#,@资产账户编号#][{机构编号}=@机构编号# and {产品编号}<>0 and {外部账号}=@外部账号#][4][@机构编号#,@外部账号#] */
    select pd_no,asset_acco_no into v_pd_no,v_asset_acco_no from db_prod.tb_pdacco_asset_acco_ch where co_no=v_co_no and pd_no<>0 and out_acco=v_out_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品信息表][{原始资产},{当前份额}][@原始资产#,@当前份额#][{产品编号}=@产品编号#][4][@产品编号#] */
    select first_asset,curr_share into v_first_asset,v_curr_share from db_prod.tb_pdacco_pd_info where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品限制信息表][{允许投资市场},{允许操作证券类型},{业务控制配置串},{市价冻结浮动比例}][@允许投资市场#,@允许操作证券类型#,@业务控制配置串#,@市价冻结浮动比例#][{产品编号}=@产品编号#][4][@机构编号#,@产品编号#] */
    select allow_exch,allow_stock_type,busi_config_str,market_price_ratio into v_allow_exch,v_allow_stock_type,v_busi_config_str,v_market_price_ratio from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.33.4";
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
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_curr_share = v_curr_share;
    SET p_first_asset = v_first_asset;
    SET p_allow_exch = v_allow_exch;
    SET p_allow_stock_type = v_allow_stock_type;
    SET p_busi_config_str = v_busi_config_str;
    SET p_market_price_ratio = v_market_price_ratio;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_更新资产获取产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_UpdateAssetGetPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_UpdateAssetGetPdInfo(
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
    OUT p_co_no int,
    OUT p_pd_no int
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{记录序号},a.{机构编号},a.{产品编号}][@记录序号#,@机构编号#,@产品编号#][a.{产品编号}=b.{产品编号} and a.{记录序号}>@查询记录序号# and b.{产品状态}<>"3" order by a.{记录序号}] */
    select a.row_id,a.co_no,a.pd_no into v_row_id,v_co_no,v_pd_no from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.row_id>v_query_row_id and b.pd_status<>"3" order by a.row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取产品计算资产配置值
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetPdAssetCalcConfigValue;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetPdAssetCalcConfigValue(
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
    OUT p_hk_asset_calc_rate int
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
    declare v_hk_asset_calc_rate int;
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_hk_asset_calc_rate = 0;
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品限制信息表][{业务控制配置串}][@业务控制配置串#][{产品编号}=@产品编号#][4][@产品编号#] */
    select busi_config_str into v_busi_config_str from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* set @港股通资产计算采用汇率#=cast(substring(@业务控制配置串#, 24, 1) as SIGNED); */
    set v_hk_asset_calc_rate=cast(substring(v_busi_config_str, 24, 1) as SIGNED);
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_hk_asset_calc_rate = v_hk_asset_calc_rate;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取同步产品信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetSyncPdInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetSyncPdInfo(
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
    OUT p_busi_config_str varchar(64),
    OUT p_pd_status varchar(2),
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
    declare v_busi_config_str varchar(64);
    declare v_pd_status varchar(2);
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
    SET v_busi_config_str = " ";
    SET v_pd_status = "0";
    SET v_row_id = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句两表关联][产品_账户_产品信息表][产品_账户_产品限制信息表][a.{记录序号},a.{机构编号},a.{产品编号},b.{业务控制配置串},b.{产品状态}][@记录序号#,@机构编号#,@产品编号#,@业务控制配置串#,@产品状态#][a.{产品编号}=b.{产品编号} and a.{记录序号}>@查询记录序号# and b.{产品状态}<>"3" order by a.{记录序号}] */
    select a.row_id,a.co_no,a.pd_no,b.busi_config_str,b.pd_status into v_row_id,v_co_no,v_pd_no,v_busi_config_str,v_pd_status from db_prod.tb_pdacco_pd_info a,db_prod.tb_pdacco_pd_limit b where a.pd_no=b.pd_no and a.row_id>v_query_row_id and b.pd_status<>"3" order by a.row_id limit 1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_busi_config_str = v_busi_config_str;
    SET p_pd_status = v_pd_status;
    SET p_row_id = v_row_id;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_外部账号获取资产账户信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_OutAccoGetAssetAccoInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_OutAccoGetAssetAccoInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_asset_acco_no int,
    OUT p_allow_stock_type varchar(2048),
    OUT p_busi_limit_str varchar(2048)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_allow_stock_type varchar(2048);
    declare v_busi_limit_str varchar(2048);
    declare v_asset_acco_status varchar(2);
    declare v_pd_status varchar(2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_asset_acco_no = 0;
    SET v_allow_stock_type = " ";
    SET v_busi_limit_str = " ";
    SET v_asset_acco_status = "0";
    SET v_pd_status = "0";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户通道信息表][{机构编号},{产品编号},{资产账户编号}][@机构编号#,@产品编号#,@资产账户编号#][{通道编号}=@通道编号# and {外部账号}=@外部账号#][4][@通道编号#,@外部账号#] */
    select co_no,pd_no,asset_acco_no into v_co_no,v_pd_no,v_asset_acco_no from db_prod.tb_pdacco_asset_acco_ch where pass_no=v_pass_no and out_acco=v_out_acco limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_资产账户信息表][{允许操作证券类型},{业务限制串},{资产账户状态}][@允许操作证券类型#,@业务限制串#,@资产账户状态#][{机构编号}=@机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][4][@机构编号#,@产品编号#,@资产账户编号#] */
    select allow_stock_type,busi_limit_str,asset_acco_status into v_allow_stock_type,v_busi_limit_str,v_asset_acco_status from db_prod.tb_pdacco_asset_acco where co_no=v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("机构编号=",v_co_no,",","产品编号=",v_pd_no,",","资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-冻结》][121][@资产账户编号#,@资产账户状态#] */
    if v_asset_acco_status = "2" then
        
        SET v_error_code = "prodA.6.42.121";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@资产账户状态# = 《资产账户状态-注销》][122][@资产账户编号#,@资产账户状态#] */
    if v_asset_acco_status = "3" then
        
        SET v_error_code = "prodA.6.42.122";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","资产账户状态=",v_asset_acco_status);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_账户_产品限制信息表][{产品状态}][@产品状态#][{产品编号}=@产品编号#][4][@产品编号#] */
    select pd_status into v_pd_status from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.42.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-冻结》][101][@产品编号#,@产品状态#] */
    if v_pd_status = "2" then
        
        SET v_error_code = "prodA.6.42.101";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@产品状态# = 《产品状态-注销》][102][@产品编号#,@产品状态#] */
    if v_pd_status = "3" then
        
        SET v_error_code = "prodA.6.42.102";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","产品状态=",v_pd_status);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_allow_stock_type = v_allow_stock_type;
    SET p_busi_limit_str = v_busi_limit_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_注销回退产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_CancelRollBackProdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_CancelRollBackProdCapital(
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
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
    IN p_amt_check_diff decimal(18,4),
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
    IN p_total_change_amt decimal(18,4),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_pd_cash_id bigint,
    OUT p_pd_first_amt decimal(18,4),
    OUT p_pd_curr_amt decimal(18,4),
    OUT p_pd_dist_amt decimal(18,4),
    OUT p_pd_auth_amt decimal(18,4),
    OUT p_pd_amt_check_diff decimal(18,4),
    OUT p_pd_pre_settle_amt decimal(18,4),
    OUT p_pd_total_cash_divide decimal(18,4),
    OUT p_pd_total_pre_fee decimal(18,4),
    OUT p_pd_total_rece_amt decimal(18,4),
    OUT p_pd_total_payab_amt decimal(18,4),
    OUT p_pd_intrst_cacl_amt decimal(18,4),
    OUT p_pd_pre_entry_intrst_amt decimal(18,4),
    OUT p_pd_update_times int
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
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_pd_cash_id bigint;
    declare v_pd_first_amt decimal(18,4);
    declare v_pd_curr_amt decimal(18,4);
    declare v_pd_dist_amt decimal(18,4);
    declare v_pd_auth_amt decimal(18,4);
    declare v_pd_amt_check_diff decimal(18,4);
    declare v_pd_pre_settle_amt decimal(18,4);
    declare v_pd_total_cash_divide decimal(18,4);
    declare v_pd_total_pre_fee decimal(18,4);
    declare v_pd_total_rece_amt decimal(18,4);
    declare v_pd_total_payab_amt decimal(18,4);
    declare v_pd_intrst_cacl_amt decimal(18,4);
    declare v_pd_pre_entry_intrst_amt decimal(18,4);
    declare v_pd_update_times int;
    declare v_tmp_curr_amt decimal(18,4);
    declare v_tmp_oper_remark_info varchar(255);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_record_count int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_tmp_total_rece_amt decimal(18,4);
    declare v_tmp_total_payab_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_asset_acco_no int;
    declare v_jour_occur_info varchar(2048);
    declare v_tmp_avail_amt decimal(18,4);
    declare v_tmp_total_change_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_amt_check_diff = p_amt_check_diff;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
    SET v_total_change_amt = p_total_change_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_pd_cash_id = 0;
    SET v_pd_first_amt = 0;
    SET v_pd_curr_amt = 0;
    SET v_pd_dist_amt = 0;
    SET v_pd_auth_amt = 0;
    SET v_pd_amt_check_diff = 0;
    SET v_pd_pre_settle_amt = 0;
    SET v_pd_total_cash_divide = 0;
    SET v_pd_total_pre_fee = 0;
    SET v_pd_total_rece_amt = 0;
    SET v_pd_total_payab_amt = 0;
    SET v_pd_intrst_cacl_amt = 0;
    SET v_pd_pre_entry_intrst_amt = 0;
    SET v_pd_update_times = 0;
    SET v_tmp_curr_amt = 0;
    SET v_tmp_oper_remark_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_record_count = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_tmp_total_rece_amt = 0;
    SET v_tmp_total_payab_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_after_occur_info = " ";
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_asset_acco_no = 0;
    SET v_jour_occur_info = " ";
    SET v_tmp_avail_amt = 0;
    SET v_tmp_total_change_amt = 0;

    
    label_pro:BEGIN
    

    /* set @临时_当前金额# = @当前金额#; */
    set v_tmp_curr_amt = v_curr_amt;

    /* set @产品已分配金额# = @当前金额#+@金额核对差额#; */
    set v_pd_dist_amt = v_curr_amt+v_amt_check_diff;

    /* set @产品已授权金额# = @当前金额#+@金额核对差额#; */
    set v_pd_auth_amt = v_curr_amt+v_amt_check_diff;

    /* set @临时_操作备注#=@操作备注#; */
    set v_tmp_oper_remark_info=v_oper_remark_info;

    /* set @业务标志#=《业务标志-资金回退》; */
    set v_busi_flag=1005003;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* if @功能编码# = "pdsecuL.4.1" then */
    if v_func_code = "pdsecuL.4.1" then

         /* set @临时_操作备注#=concat(@操作备注#,"|","注销交易组"); */
         set v_tmp_oper_remark_info=concat(v_oper_remark_info,"|","注销交易组");

    /* elseif @功能编码# = "pdsecuL.1.72" then */
    elseif v_func_code = "pdsecuL.1.72" then

         /* set @临时_操作备注#=concat(@操作备注#,"|","注销资产账户"); */
         set v_tmp_oper_remark_info=concat(v_oper_remark_info,"|","注销资产账户");
    end if;

    /* set @操作备注#=concat(@临时_操作备注#,"回退当前金额"); */
    set v_oper_remark_info=concat(v_tmp_oper_remark_info,"回退当前金额");

    /* [获取表记录数量][产品_资金_产品资金表][@记录个数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#] */
    select count(1) into v_record_count from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type;


    /* if @记录个数# = 1 then */
    if v_record_count = 1 then

          /* [更新表记录][产品_资金_产品资金表][{当前金额}={当前金额}-@当前金额#,{产品已分配金额}={产品已分配金额}-@产品已分配金额#,{产品已授权金额}={产品已授权金额}-@产品已授权金额#,{金额核对差额}={金额核对差额}-@金额核对差额#,{累计应付金额}= {累计应付金额} - @累计应付金额#,{累计应收金额}={累计应收金额}-@累计应收金额#,{红冲蓝补金额}={红冲蓝补金额}-@红冲蓝补金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
          set v_update_date = date_format(curdate(),'%Y%m%d');
          set v_update_time = date_format(curtime(),'%H%i%s');
          update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_curr_amt,pd_dist_amt=pd_dist_amt-v_pd_dist_amt,pd_auth_amt=pd_auth_amt-v_pd_auth_amt,amt_check_diff=amt_check_diff-v_amt_check_diff,total_payab_amt= total_payab_amt - v_total_payab_amt,total_rece_amt=total_rece_amt-v_total_rece_amt,total_change_amt=total_change_amt-v_total_change_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
          if v_error_code = "1" then
                      
              SET v_error_code = "prodA.6.43.2";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
              end if;
              leave label_pro;
          end if;


         /* [获取表记录变量][产品_资金_产品资金表][{累计应收金额},{累计应付金额}][@临时_累计应收金额#,@临时_累计应付金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
         select total_rece_amt,total_payab_amt into v_tmp_total_rece_amt,v_tmp_total_payab_amt from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
         if FOUND_ROWS() = 0 then
                     
             SET v_error_code = "prodA.6.43.4";
             if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             else
                 SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
             end if;
             leave label_pro;
         end if;


          /* set @流水变动字段#=" "; */
          set v_jour_occur_field=" ";

          /* set @流水后信息#=" "; */
          set v_jour_after_occur_info=" ";

          /* set @操作备注#=concat(@临时_操作备注#,"回退累计应付金额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"回退累计应付金额");

          /* set @变动金额#=-1*@累计应付金额#; */
          set v_occur_amt=-1*v_total_payab_amt;

          /* set @变动后金额#=@临时_累计应付金额#; */
          set v_occur_end_amt=v_tmp_total_payab_amt;

         /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit_jour(
             create_date, create_time, update_date, 
             update_time, update_times, opor_co_no, opor_no, 
             oper_mac, oper_ip_addr, oper_info, oper_way, 
             oper_menu_no, oper_func_code, init_date, co_no, 
             pd_no, crncy_type, busi_flag, occur_amt, 
             occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
         value( 
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
             v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
             v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
             v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
             v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.43.5";
             SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             leave label_pro;
         end if;


          /* set @操作备注#=concat(@临时_操作备注#,"回退累计应收金额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"回退累计应收金额");

          /* set @变动金额#=-1*@累计应收金额#; */
          set v_occur_amt=-1*v_total_rece_amt;

          /* set @变动后金额#=@临时_累计应收金额#; */
          set v_occur_end_amt=v_tmp_total_rece_amt;

         /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit_jour(
             create_date, create_time, update_date, 
             update_time, update_times, opor_co_no, opor_no, 
             oper_mac, oper_ip_addr, oper_info, oper_way, 
             oper_menu_no, oper_func_code, init_date, co_no, 
             pd_no, crncy_type, busi_flag, occur_amt, 
             occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
         value( 
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
             v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
             v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
             v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
             v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.43.5";
             SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             leave label_pro;
         end if;


          /* set @操作备注#=concat(@临时_操作备注#,"回退当前金额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"回退当前金额");

          /* [获取流水变动][{产品已分配金额},{产品已授权金额}][@产品已分配金额#,@产品已授权金额#] */
          set v_jour_occur_field = concat("产品已分配金额","|","产品已授权金额","|");
          set v_jour_occur_info = concat(v_pd_dist_amt,"|",v_pd_auth_amt,"|");


          /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{产品已分配金额},{产品已授权金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{当前金额}+{金额核对差额}+{待交收金额},{红冲蓝补金额},{更新次数}][@变动后金额#,@产品已分配金额#,@产品已授权金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@临时_可用金额#,@临时_红冲蓝补金额#,@产品更新次数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
          select curr_amt,pd_dist_amt,pd_auth_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,amt_check_diff,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,curr_amt+amt_check_diff+pre_settle_amt,total_change_amt,update_times into v_occur_end_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_amt_check_diff,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_tmp_avail_amt,v_tmp_total_change_amt,v_pd_update_times from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "prodA.6.43.4";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
              else
                  SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
              end if;
              leave label_pro;
          end if;


          /* [获取流水后信息][@产品已分配金额#,@产品已授权金额#] */
          set v_jour_after_occur_info = concat(v_pd_dist_amt,"|",v_pd_auth_amt,"|");


          /* set @变动金额#=-1*@临时_当前金额#; */
          set v_occur_amt=-1*v_tmp_curr_amt;

         /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit_jour(
             create_date, create_time, update_date, 
             update_time, update_times, opor_co_no, opor_no, 
             oper_mac, oper_ip_addr, oper_info, oper_way, 
             oper_menu_no, oper_func_code, init_date, co_no, 
             pd_no, crncy_type, busi_flag, occur_amt, 
             occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
         value( 
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
             v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
             v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
             v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
             v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.43.5";
             SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             leave label_pro;
         end if;


          /* set @流水变动字段#=" "; */
          set v_jour_occur_field=" ";

          /* set @流水后信息#=" "; */
          set v_jour_after_occur_info=" ";

          /* set @操作备注#=concat(@临时_操作备注#,"回退可用金额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"回退可用金额");

          /* set @变动金额#=-1*@金额核对差额#; */
          set v_occur_amt=-1*v_amt_check_diff;

          /* set @变动后金额#=@临时_可用金额#; */
          set v_occur_end_amt=v_tmp_avail_amt;

         /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit_jour(
             create_date, create_time, update_date, 
             update_time, update_times, opor_co_no, opor_no, 
             oper_mac, oper_ip_addr, oper_info, oper_way, 
             oper_menu_no, oper_func_code, init_date, co_no, 
             pd_no, crncy_type, busi_flag, occur_amt, 
             occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
         value( 
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
             v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
             v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
             v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
             v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.43.5";
             SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             leave label_pro;
         end if;


          /* set @流水变动字段#=" "; */
          set v_jour_occur_field=" ";

          /* set @流水后信息#=" "; */
          set v_jour_after_occur_info=" ";

          /* set @操作备注#=concat(@临时_操作备注#,"回退红冲蓝补金额"); */
          set v_oper_remark_info=concat(v_tmp_oper_remark_info,"回退红冲蓝补金额");

          /* set @变动金额#=-1*@红冲蓝补金额#; */
          set v_occur_amt=-1*v_total_change_amt;

          /* set @变动后金额#=@临时_红冲蓝补金额#; */
          set v_occur_end_amt=v_tmp_total_change_amt;

         /* [插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
         set v_create_date = date_format(curdate(),'%Y%m%d');
         set v_create_time = date_format(curtime(),'%H%i%s');
         set v_update_date = v_create_date;
         set v_update_time = v_create_time;
         set v_update_times = 1;
         insert into db_prod.tb_pdcapit_pd_capit_jour(
             create_date, create_time, update_date, 
             update_time, update_times, opor_co_no, opor_no, 
             oper_mac, oper_ip_addr, oper_info, oper_way, 
             oper_menu_no, oper_func_code, init_date, co_no, 
             pd_no, crncy_type, busi_flag, occur_amt, 
             occur_end_amt, jour_occur_field, jour_after_occur_info, oper_remark_info) 
         value( 
             v_create_date, v_create_time, v_update_date, 
             v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
             v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
             v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
             v_pd_no, v_crncy_type, v_busi_flag, v_occur_amt, 
             v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
         if v_error_code = "1" then
                     
             SET v_error_code = "prodA.6.43.5";
             SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
             leave label_pro;
         end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_pd_cash_id = v_pd_cash_id;
    SET p_pd_first_amt = v_pd_first_amt;
    SET p_pd_curr_amt = v_pd_curr_amt;
    SET p_pd_dist_amt = v_pd_dist_amt;
    SET p_pd_auth_amt = v_pd_auth_amt;
    SET p_pd_amt_check_diff = v_pd_amt_check_diff;
    SET p_pd_pre_settle_amt = v_pd_pre_settle_amt;
    SET p_pd_total_cash_divide = v_pd_total_cash_divide;
    SET p_pd_total_pre_fee = v_pd_total_pre_fee;
    SET p_pd_total_rece_amt = v_pd_total_rece_amt;
    SET p_pd_total_payab_amt = v_pd_total_payab_amt;
    SET p_pd_intrst_cacl_amt = v_pd_intrst_cacl_amt;
    SET p_pd_pre_entry_intrst_amt = v_pd_pre_entry_intrst_amt;
    SET p_pd_update_times = v_pd_update_times;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_更新资产账户通道备注信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_UpdateAssetAccoChannelRemarkInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_UpdateAssetAccoChannelRemarkInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_remark_info varchar(255);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品_账户_资产账户通道信息表][{备注信息}=@备注信息#][{资产账户编号}=@资产账户编号#][2][@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_asset_acco_ch set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, remark_info=v_remark_info where asset_acco_no=v_asset_acco_no;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.44.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取资产账户默认交易组编号
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetAccoDefaultExgp;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetAccoDefaultExgp(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_default_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_default_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_default_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_资产账户默认交易组信息表][{交易组编号}][@默认交易组编号#][{资产账户编号}=@资产账户编号#][4][concat("该资产账户未绑定默认交易组！:",@资产账户编号#)] */
    select exch_group_no into v_default_exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where asset_acco_no=v_asset_acco_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.45.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("该资产账户未绑定默认交易组！:",v_asset_acco_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("该资产账户未绑定默认交易组！:",v_asset_acco_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取资产账户默认交易组关系
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetAccoDefaultExgpRelation;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetAccoDefaultExgpRelation(
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
    OUT p_asset_acco_no_str varchar(2048),
    OUT p_default_exch_group_no_str varchar(2048)
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
    declare v_asset_acco_no_str varchar(2048);
    declare v_default_exch_group_no_str varchar(2048);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_asset_acco_no_str = " ";
    SET v_default_exch_group_no_str = " ";

    
    label_pro:BEGIN
    

    /* set @资产账户编号串# ="; ;"; */
    set v_asset_acco_no_str ="; ;";

    /* set @默认交易组编号串# ="; ;"; */
    set v_default_exch_group_no_str ="; ;";

        /* select GROUP_CONCAT({资产账户编号} ORDER BY {记录序号} SEPARATOR ';'),GROUP_CONCAT({交易组编号} ORDER BY {记录序号} SEPARATOR ';')  into @资产账户编号串#,@默认交易组编号串# from ~产品_账户_资产账户默认交易组信息表^ where {机构编号}=@机构编号# and {产品编号}=@产品编号#; */
        select GROUP_CONCAT(asset_acco_no ORDER BY row_id SEPARATOR ';'),GROUP_CONCAT(exch_group_no ORDER BY row_id SEPARATOR ';')  into v_asset_acco_no_str,v_default_exch_group_no_str from db_prod.tb_pdacco_asset_acco_default_exgp where co_no=v_co_no and pd_no=v_pd_no;

    /* set @资产账户编号串# =concat(";",@资产账户编号串#,";"); */
    set v_asset_acco_no_str =concat(";",v_asset_acco_no_str,";");

    /* set @默认交易组编号串# =concat(";",@默认交易组编号串#,";"); */
    set v_default_exch_group_no_str =concat(";",v_default_exch_group_no_str,";");
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_asset_acco_no_str = v_asset_acco_no_str;
    SET p_default_exch_group_no_str = v_default_exch_group_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_报盘回写通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_TransWriteInPassInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_TransWriteInPassInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_offer_server_name varchar(64),
    IN p_offer_server_ip varchar(64),
    IN p_mac_addr varchar(32),
    IN p_offer_name varchar(32),
    IN p_software_start_time int,
    IN p_pass_no int,
    IN p_pass_status varchar(2),
    IN p_bkup_field_1 varchar(32),
    IN p_bkup_field_2 int,
    IN p_bkup_field_3 decimal(18,12),
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
    declare v_offer_server_name varchar(64);
    declare v_offer_server_ip varchar(64);
    declare v_mac_addr varchar(32);
    declare v_offer_name varchar(32);
    declare v_software_start_time int;
    declare v_pass_no int;
    declare v_pass_status varchar(2);
    declare v_bkup_field_1 varchar(32);
    declare v_bkup_field_2 int;
    declare v_bkup_field_3 decimal(18,12);
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
    SET v_offer_server_name = p_offer_server_name;
    SET v_offer_server_ip = p_offer_server_ip;
    SET v_mac_addr = p_mac_addr;
    SET v_offer_name = p_offer_name;
    SET v_software_start_time = p_software_start_time;
    SET v_pass_no = p_pass_no;
    SET v_pass_status = p_pass_status;
    SET v_bkup_field_1 = p_bkup_field_1;
    SET v_bkup_field_2 = p_bkup_field_2;
    SET v_bkup_field_3 = p_bkup_field_3;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品_账户_报盘回写通道信息表][字段][字段变量][{报盘服务器名称}=@报盘服务器名称#,{报盘服务器IP}=@报盘服务器IP#,{MAC地址}=@MAC地址#,{报盘标识}=@报盘标识#,{程序启动时间}=@程序启动时间#,{通道编号}=@通道编号#,{通道状态}=@通道状态#][1][@通道编号#,@报盘标识#,@MAC地址#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdacco_trans_chanel_info_writein (
        create_date, create_time, update_date, 
        update_time, update_times, offer_server_name, offer_server_ip, 
        mac_addr, offer_name, software_start_time, pass_no, 
        pass_status, bkup_field_1, bkup_field_2, bkup_field_3) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_offer_server_name, v_offer_server_ip, 
        v_mac_addr, v_offer_name, v_software_start_time, v_pass_no, 
        v_pass_status, v_bkup_field_1, v_bkup_field_2, v_bkup_field_3) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, offer_server_name=v_offer_server_name,offer_server_ip=v_offer_server_ip,mac_addr=v_mac_addr,offer_name=v_offer_name,software_start_time=v_software_start_time,pass_no=v_pass_no,pass_status=v_pass_status;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.6.47.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("通道编号=",v_pass_no,",","报盘标识=",v_offer_name,",","MAC地址=",v_mac_addr),"#",v_mysql_message);
        else
            SET v_error_info = concat("通道编号=",v_pass_no,",","报盘标识=",v_offer_name,",","MAC地址=",v_mac_addr);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_查询报盘回写通道信息
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_QueryTransWriteInPassInfo;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_QueryTransWriteInPassInfo(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_count int,
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
    declare v_row_count int;
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
    SET v_row_count = p_row_count;
    SET v_row_id = p_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_账户_报盘回写通道信息表][字段][ {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, offer_server_name, 
        offer_server_ip, mac_addr, offer_name, software_start_time, 
        pass_no, pass_status, bkup_field_1, bkup_field_2, 
        bkup_field_3 from db_prod.tb_pdacco_trans_chanel_info_writein where  row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, offer_server_name, 
        offer_server_ip, mac_addr, offer_name, software_start_time, 
        pass_no, pass_status, bkup_field_1, bkup_field_2, 
        bkup_field_3 from db_prod.tb_pdacco_trans_chanel_info_writein where  row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_资产账户串获取默认交易组串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_AsacStrGetDefaultExgpStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_AsacStrGetDefaultExgpStr(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no_str varchar(2048),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_default_exch_group_no_str varchar(2048)
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_asset_acco_no_str varchar(2048);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_default_exch_group_no_str varchar(2048);
    declare v_split_str varchar(4);
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_asset_acco_no_str = p_asset_acco_no_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_default_exch_group_no_str = " ";
    SET v_split_str = " ";
    SET v_asset_acco_no = 0;
    SET v_default_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* set @默认交易组编号串# = ""; */
    set v_default_exch_group_no_str = "";

    /* set @分隔符# = ";"; */
    set v_split_str = ";";

    /* while LOCATE(@分隔符#,@资产账户编号串#)<>0   do */
    while LOCATE(v_split_str,v_asset_acco_no_str)<>0   do

          /* set @资产账户编号#=cast(substring(@资产账户编号串#,1,LOCATE(@分隔符#,@资产账户编号串#)-1) as SIGNED); */
          set v_asset_acco_no=cast(substring(v_asset_acco_no_str,1,LOCATE(v_split_str,v_asset_acco_no_str)-1) as SIGNED);

          /* [获取表记录变量][产品_账户_资产账户默认交易组信息表][{交易组编号}][@默认交易组编号#][{资产账户编号}=@资产账户编号#][4][@资产账户编号#] */
          select exch_group_no into v_default_exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where asset_acco_no=v_asset_acco_no limit 1;
          if FOUND_ROWS() = 0 then
                      
              SET v_error_code = "prodA.6.49.4";
              if v_mysql_message <> "" then
                  SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no),"#",v_mysql_message);
              else
                  SET v_error_info = concat("资产账户编号=",v_asset_acco_no);
              end if;
              leave label_pro;
          end if;


          /* set @默认交易组编号串# = concat(@默认交易组编号串#,@默认交易组编号#,";"); */
          set v_default_exch_group_no_str = concat(v_default_exch_group_no_str,v_default_exch_group_no,";");

          /* set @资产账户编号串#=substring(@资产账户编号串#,LOCATE(@分隔符#,@资产账户编号串#)+1); */
          set v_asset_acco_no_str=substring(v_asset_acco_no_str,LOCATE(v_split_str,v_asset_acco_no_str)+1);
    end while;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_exch_group_no_str = v_default_exch_group_no_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_查询融资融券配置表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_QuerySecuMargTradConfig;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_QuerySecuMargTradConfig(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_asset_acco_no int,
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
    declare v_asset_acco_no int;
    declare v_pd_no int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pd_no = p_pd_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_count = -1;

    
    label_pro:BEGIN
    

    /* set @指定行数#=-1; */
    set v_row_count=-1;

     /* [获取表记录][产品_账户_融资融券配置表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) ][@指定行数#] */
     if v_row_count = -1 then
         select row_id, create_date, create_time, 
         update_date, update_time, update_times, co_no, 
         asset_acco_no, pd_no, fina_return_type, sell_auto_back_debt, 
         fina_limit_max, loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, 
         close_posi_keep_guarantee_ratio, fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info from db_prod.tb_pdacco_fina_loan_config where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no) ;
     else
         select row_id, create_date, create_time, 
         update_date, update_time, update_times, co_no, 
         asset_acco_no, pd_no, fina_return_type, sell_auto_back_debt, 
         fina_limit_max, loan_limit_max, fina_year_intrst_rate, secu_loan_year_intrst_rate, 
         close_posi_keep_guarantee_ratio, fill_posi_keep_guarantee_ratio, extract_guarantee_ratio, remark_info from db_prod.tb_pdacco_fina_loan_config where (v_co_no = 0 or co_no=v_co_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_pd_no = 0 or pd_no=v_pd_no)  limit v_row_count;
     end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取产品业务控制串
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetProdBusiConfigStr;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetProdBusiConfigStr(
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
    OUT p_busi_config_str varchar(64)
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
    declare v_busi_config_str varchar(64);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_busi_config_str = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品_账户_产品限制信息表][{业务控制配置串}][@业务控制配置串#][{产品编号}=@产品编号#][4][@产品编号#] */
    select busi_config_str into v_busi_config_str from db_prod.tb_pdacco_pd_limit where pd_no=v_pd_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.6.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_busi_config_str = v_busi_config_str;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_公共接口_获取资产账户默认交易组编号不报错
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdpubif_GetAccoDefaultExgpWithoutError;;
DELIMITER ;;
CREATE PROCEDURE pra_pdpubif_GetAccoDefaultExgpWithoutError(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_default_exch_group_no int
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_default_exch_group_no int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_default_exch_group_no = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品_账户_资产账户默认交易组信息表][ifnull({交易组编号},0)][@默认交易组编号#][{资产账户编号}=@资产账户编号#] */
    select ifnull(exch_group_no,0) into v_default_exch_group_no from db_prod.tb_pdacco_asset_acco_default_exgp where asset_acco_no=v_asset_acco_no limit 1;

    #取不到输出0
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_default_exch_group_no = v_default_exch_group_no;

END;;


