DELIMITER ;;
use db_prod;;

# 原子_产品_资金_新增产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_AddPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_AddPdCapital(
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

    /* set @产品已分配金额# = 0; */
    set v_pd_dist_amt = 0;

    /* set @产品已授权金额# = 0; */
    set v_pd_auth_amt = 0;

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
                
        SET v_error_code = "prodA.3.1.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数}][@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@产品更新次数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@本币币种#,@产品编号#] */
    select row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,amt_check_diff,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times into v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_amt_check_diff,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_pd_update_times from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.1.4";
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
                
        SET v_error_code = "prodA.3.1.5";
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

# 原子_产品_资金_扣除产品费用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_DeductPdFee;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_DeductPdFee(
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
    declare v_curr_amt decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_amt decimal(18,4);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_total_pre_fee = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @累计计提费用# = @变动金额#; */
    set v_total_pre_fee = v_occur_amt;

    /* [获取流水变动][{当前金额},{累计计提费用}][@当前金额#,@累计计提费用#] */
    set v_jour_occur_field = concat("当前金额","|","累计计提费用","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_total_pre_fee,"|");


    /* [更新表记录][产品_资金_产品资金表][{当前金额} = {当前金额} - @当前金额#,{累计计提费用}={累计计提费用} + @累计计提费用#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt = curr_amt - v_curr_amt,total_pre_fee=total_pre_fee + v_total_pre_fee where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.7.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{累计计提费用}][@当前金额#, @累计计提费用#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,total_pre_fee into v_curr_amt, v_total_pre_fee from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.7.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@累计计提费用#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_total_pre_fee,"|");


    /* set @业务标志# = 《业务标志-产品费用扣除》; */
    set v_busi_flag = 1011002;

    /* set @变动金额# = -1 * @变动金额#; */
    set v_occur_amt = -1 * v_occur_amt;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

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
                
        SET v_error_code = "prodA.3.7.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QueryPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QueryPdCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_资金_产品资金表][字段][(@机构编号# = 0  or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@产品编号权限串# =' '  or instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, crncy_type, first_amt, begin_amt, 
        curr_amt, pd_dist_amt, pd_auth_amt, amt_check_diff, 
        pre_settle_amt, total_cash_divide, total_pre_fee, total_rece_amt, 
        total_payab_amt, total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt from db_prod.tb_pdcapit_pd_capit where (v_co_no = 0  or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str =' '  or instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, crncy_type, first_amt, begin_amt, 
        curr_amt, pd_dist_amt, pd_auth_amt, amt_check_diff, 
        pre_settle_amt, total_cash_divide, total_pre_fee, total_rece_amt, 
        total_payab_amt, total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt from db_prod.tb_pdcapit_pd_capit where (v_co_no = 0  or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str =' '  or instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QueryPdCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QueryPdCapital_Jour(
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_资金_产品资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod.tb_pdcapit_pd_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod.tb_pdcapit_pd_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询历史产品资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QueryPdCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QueryPdCapital_JourHis(
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
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品_资金_产品资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod_his.tb_pdcapit_pd_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_prod_his.tb_pdcapit_pd_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_出入产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_ChgPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_ChgPdCapital(
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
    declare v_occur_amt decimal(18,4);
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
    declare v_curr_amt decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_update_times int;
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
    SET v_curr_amt = 0;
    SET v_first_amt = 0;
    SET v_begin_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_total_change_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{变动金额},{当前金额},{原始金额}][@变动金额#,@当前金额#,@原始金额#] */
    set v_jour_occur_field = concat("变动金额","|","当前金额","|","原始金额","|");
    set v_jour_occur_info = concat(v_occur_amt,"|",v_curr_amt,"|",v_first_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @原始金额# = @变动金额#; */
    set v_first_amt = v_occur_amt;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @产品已分配金额# = 0; */
    set v_pd_dist_amt = 0;

    /* set @产品已授权金额# = 0; */
    set v_pd_auth_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

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

    /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{当前金额} = {当前金额} + @变动金额#,{原始金额} = {原始金额} + @变动金额#][2][@产品编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = curr_amt + v_occur_amt,first_amt = first_amt + v_occur_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.8.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{原始金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数},{金额核对差额}][@当前金额#, @原始金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@产品更新次数#,@产品金额核对差额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,first_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times,amt_check_diff into v_curr_amt, v_first_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_pd_update_times,v_pd_amt_check_diff from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.8.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@变动金额#,@当前金额#,@原始金额#] */
    set v_jour_after_occur_info = concat(v_occur_amt,"|",v_curr_amt,"|",v_first_amt,"|");


    /* if @变动金额# > 0 then */
    if v_occur_amt > 0 then

        /* set @业务标志# = 《业务标志-产品资金入金》; */
        set v_busi_flag = 1001001;
    else

        /* set @业务标志# = 《业务标志-产品资金出金》; */
        set v_busi_flag = 1001002;
    end if;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

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
                
        SET v_error_code = "prodA.3.8.5";
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

# 原子_产品_资金_更新产品资金累计应收应付
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_UpdatePdCapitalRecePayab;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_UpdatePdCapitalRecePayab(
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
    IN p_total_rece_amt decimal(18,4),
    IN p_total_payab_amt decimal(18,4),
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
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_update_times int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_total_rece_amt = p_total_rece_amt;
    SET v_total_payab_amt = p_total_payab_amt;
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
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_update_times = 0;
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


    /* [更新表记录][产品_资金_产品资金表][{累计应收金额} = @累计应收金额#,{累计应付金额} = @累计应付金额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][2][@产品编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, total_rece_amt = v_total_rece_amt,total_payab_amt = v_total_payab_amt where pd_no=v_pd_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{累计应收金额},{累计应付金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数},{金额核对差额}][@累计应收金额#, @累计应付金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@产品更新次数#,@产品金额核对差额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@本币币种#,@产品编号#] */
    select total_rece_amt,total_payab_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times,amt_check_diff into v_total_rece_amt, v_total_payab_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_pd_update_times,v_pd_amt_check_diff from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.9.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("本币币种=",v_crncy_type,",","产品编号=",v_pd_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("本币币种=",v_crncy_type,",","产品编号=",v_pd_no);
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

    /* set @操作备注# = "更新产品资金累计应收应付"; */
    set v_oper_remark_info = "更新产品资金累计应收应付";

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
                
        SET v_error_code = "prodA.3.9.5";
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

# 原子_产品_资金_红冲蓝补产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_PatchProdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_PatchProdCapital(
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
    IN p_is_change_exch_group_capital int,
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
    declare v_occur_amt decimal(18,4);
    declare v_is_change_exch_group_capital int;
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
    declare v_curr_amt decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_update_times int;
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
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
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
    SET v_curr_amt = 0;
    SET v_total_change_amt = 0;
    SET v_first_amt = 0;
    SET v_begin_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{当前金额},{产品已分配金额},{产品已授权金额},{红冲蓝补金额}][@当前金额#,@产品已分配金额#,@产品已授权金额#,@红冲蓝补金额#] */
    set v_jour_occur_field = concat("当前金额","|","产品已分配金额","|","产品已授权金额","|","红冲蓝补金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|",v_total_change_amt,"|");


    /* set @原始金额# = 0; */
    set v_first_amt = 0;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

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

    /* set @红冲蓝补金额# = @变动金额#; */
    set v_total_change_amt = v_occur_amt;

    /* set @预计利息# = 0; */
    set v_intrst_cacl_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* set @产品已分配金额# = @变动金额#; */
    set v_pd_dist_amt = v_occur_amt;

    /* set @产品已授权金额# = 0; */
    set v_pd_auth_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* if @是否调整交易组资金# = 《是否调整交易组资金-是》 then */
    if v_is_change_exch_group_capital = 1 then

        /* set @产品已授权金额# = @变动金额#; */
        set v_pd_auth_amt = v_occur_amt;
    end if;

    /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{当前金额} = {当前金额}+@变动金额#,{产品已授权金额} = {产品已授权金额}+@产品已授权金额#,{产品已分配金额}={产品已分配金额}+@产品已分配金额#,{红冲蓝补金额}={红冲蓝补金额}+@红冲蓝补金额#][1][@产品编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = curr_amt+v_occur_amt,pd_auth_amt = pd_auth_amt+v_pd_auth_amt,pd_dist_amt=pd_dist_amt+v_pd_dist_amt,total_change_amt=total_change_amt+v_total_change_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{产品已授权金额},{产品已分配金额},{红冲蓝补金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数},{金额核对差额}][@当前金额#,@产品已授权金额#,@产品已分配金额#,@红冲蓝补金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@产品更新次数#,@产品金额核对差额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pd_auth_amt,pd_dist_amt,total_change_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times,amt_check_diff into v_curr_amt,v_pd_auth_amt,v_pd_dist_amt,v_total_change_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_pd_update_times,v_pd_amt_check_diff from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@产品已分配金额#,@产品已授权金额#,@红冲蓝补金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|",v_total_change_amt,"|");


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
                
        SET v_error_code = "prodA.3.10.5";
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

# 原子_产品_资金_产品资金应收应付变动
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_ProdCapitalChange;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_ProdCapitalChange(
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
    IN p_total_rece_amt_diff decimal(18,4),
    IN p_total_payab_amt_diff decimal(18,4),
    IN p_is_change_exch_group_capital int,
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
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_is_change_exch_group_capital int;
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
    declare v_first_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    SET v_total_rece_amt_diff = p_total_rece_amt_diff;
    SET v_total_payab_amt_diff = p_total_payab_amt_diff;
    SET v_is_change_exch_group_capital = p_is_change_exch_group_capital;
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
    SET v_first_amt = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_pre_settle_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_change_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
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
    

    /* [获取流水变动][{累计应收金额差额}][@累计应收金额差额#] */
    set v_jour_occur_field = concat("累计应收金额差额","|");
    set v_jour_occur_info = concat(v_total_rece_amt_diff,"|");


    /* set @原始金额# = 0; */
    set v_first_amt = 0;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = 0; */
    set v_curr_amt = 0;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @累计派现金额# = 0; */
    set v_total_cash_divide = 0;

    /* set @累计计提费用# = 0; */
    set v_total_pre_fee = 0;

    /* set @红冲蓝补金额#=0; */
    set v_total_change_amt=0;

    /* set @预计利息# = 0; */
    set v_intrst_cacl_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* set @产品已分配金额# = 0; */
    set v_pd_dist_amt = 0;

    /* set @产品已授权金额# = 0; */
    set v_pd_auth_amt = 0;

    /* set @累计应收金额#=@累计应收金额差额#; */
    set v_total_rece_amt=v_total_rece_amt_diff;

    /* set @累计应付金额#=@累计应付金额差额#; */
    set v_total_payab_amt=v_total_payab_amt_diff;

    /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{累计应收金额}={累计应收金额}+@累计应收金额#,{累计应付金额}={累计应付金额}+@累计应付金额#][1][@产品编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, total_rece_amt=total_rece_amt+v_total_rece_amt,total_payab_amt=total_payab_amt+v_total_payab_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.11.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{产品已授权金额},{产品已分配金额},{红冲蓝补金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数}][@当前金额#,@产品已授权金额#,@产品已分配金额#,@红冲蓝补金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@产品更新次数#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pd_auth_amt,pd_dist_amt,total_change_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,amt_check_diff,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_pd_auth_amt,v_pd_dist_amt,v_total_change_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_amt_check_diff,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_pd_update_times from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.11.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@累计应收金额差额#] */
    set v_jour_after_occur_info = concat(v_total_rece_amt_diff,"|");


    /* set @业务标志# = 《业务标志-应收应付调整》; */
    set v_busi_flag = 1011007;

    /* set @变动金额#=@累计应收金额差额#; */
    set v_occur_amt=v_total_rece_amt_diff;

    /* set @变动后金额# = @产品累计应收金额#; */
    set v_occur_end_amt = v_pd_total_rece_amt;

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
                
        SET v_error_code = "prodA.3.11.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水变动][{累计应付金额差额}][@累计应付金额差额#] */
    set v_jour_occur_field = concat("累计应付金额差额","|");
    set v_jour_occur_info = concat(v_total_payab_amt_diff,"|");


    /* [获取流水后信息][@累计应付金额差额#] */
    set v_jour_after_occur_info = concat(v_total_payab_amt_diff,"|");


    /* set @变动金额#=@累计应付金额差额#; */
    set v_occur_amt=v_total_payab_amt_diff;

    /* set @变动后金额# = @产品累计应付金额#; */
    set v_occur_end_amt = v_pd_total_payab_amt;

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
                
        SET v_error_code = "prodA.3.11.5";
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

# 原子_产品_资金_查询产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QueryPdAsset;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QueryPdAsset(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录两表关联][产品_资金_产品资产表][产品_账户_产品信息表][a.{记录序号},a.{机构编号},a.{产品编号},a.{本币币种},a.{期初估值净资产},a.{估值净资产},a.{期初净资产},a.{净资产},a.{总现金资产},a.{证券现金资产},a.{期货现金资产},a.{股票资产},a.{基金资产},a.{货币基金资产},a.{非货币基金资产},a.{债券资产},a.{期货资产},a.{回购资产},a.{其他资产},a.{港股通资产},a.{期货多头市值},a.{期货空头市值},b.{当前份额},b.{昨日份额}][ (@机构编号# = 0 or a.{机构编号}=@机构编号#) and (@产品编号串# = "; ;" or instr(@产品编号串#, concat(";",a.{产品编号},";"))>0) and (@产品编号权限串# = ' ' or  instr(@产品编号权限串#, concat(";",a.{产品编号},";")) > 0)  and (@本币币种串# = " " or instr(@本币币种串#, a.{本币币种}) > 0) and a.{记录序号} > @记录序号# and a.{产品编号} = b.{产品编号} order by a.{记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,a.co_no,a.pd_no,a.crncy_type,a.begin_evalu_nav_asset,a.evalu_nav_asset,a.begin_NAV,a.nav_asset,a.total_cash_asset,a.stock_cash_asset,a.futu_cash_asset,a.stock_asset,a.fund_asset,a.money_fund_asset,a.not_money_fund_asset,a.bond_asset,a.futu_asset,a.repo_asset,a.other_asset,a.hk_thrgh_stock_asset,a.futu_long_market_value,a.futu_short_market_value,b.curr_share,b.pre_share from db_prod.tb_pdcapit_pd_asset a,db_prod.tb_pdacco_pd_info b where  (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",a.pd_no,";"))>0) and (v_pd_no_rights_str = ' ' or  instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0)  and (v_crncy_type_str = " " or instr(v_crncy_type_str, a.crncy_type) > 0) and a.row_id > v_row_id and a.pd_no = b.pd_no order by a.row_id;
    else
        select a.row_id,a.co_no,a.pd_no,a.crncy_type,a.begin_evalu_nav_asset,a.evalu_nav_asset,a.begin_NAV,a.nav_asset,a.total_cash_asset,a.stock_cash_asset,a.futu_cash_asset,a.stock_asset,a.fund_asset,a.money_fund_asset,a.not_money_fund_asset,a.bond_asset,a.futu_asset,a.repo_asset,a.other_asset,a.hk_thrgh_stock_asset,a.futu_long_market_value,a.futu_short_market_value,b.curr_share,b.pre_share from db_prod.tb_pdcapit_pd_asset a,db_prod.tb_pdacco_pd_info b where  (v_co_no = 0 or a.co_no=v_co_no) and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",a.pd_no,";"))>0) and (v_pd_no_rights_str = ' ' or  instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0)  and (v_crncy_type_str = " " or instr(v_crncy_type_str, a.crncy_type) > 0) and a.row_id > v_row_id and a.pd_no = b.pd_no order by a.row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询历史产品资产
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QueryPdAsset_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QueryPdAsset_His(
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
    IN p_pd_no_str varchar(2048),
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
    declare v_pd_no_str varchar(2048);
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
    SET v_pd_no_str = p_pd_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录两表关联][产品_资金_历史产品资产表][产品_账户_历史产品信息表][a.{记录序号},a.{初始化日期},a.{机构编号},a.{产品编号},a.{本币币种},a.{期初净资产},a.{净资产},a.{总现金资产},a.{证券现金资产},a.{期货现金资产},a.{股票资产},a.{基金资产},a.{货币基金资产},a.{非货币基金资产},a.{债券资产},a.{期货资产},a.{回购资产},a.{其他资产},a.{港股通资产},a.{期货多头市值},a.{期货空头市值},b.{当前份额},b.{昨日份额}][(a.{初始化日期} between @开始日期# and @结束日期#) and a.{机构编号}=@机构编号# and (@产品编号串# = "; ;" or instr(@产品编号串#, concat(";",a.{产品编号},";"))>0) and instr(@产品编号权限串#, concat(";",a.{产品编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, a.{本币币种}) > 0) and a.{记录序号} > @记录序号# and a.{产品编号} = b.{产品编号} and a.{初始化日期} = b.{初始化日期} order by a.{记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select a.row_id,a.init_date,a.co_no,a.pd_no,a.crncy_type,a.begin_NAV,a.nav_asset,a.total_cash_asset,a.stock_cash_asset,a.futu_cash_asset,a.stock_asset,a.fund_asset,a.money_fund_asset,a.not_money_fund_asset,a.bond_asset,a.futu_asset,a.repo_asset,a.other_asset,a.hk_thrgh_stock_asset,a.futu_long_market_value,a.futu_short_market_value,b.curr_share,b.pre_share from db_prod_his.tb_pdcapit_pd_asset_his a,db_prod_his.tb_pdacco_pd_info_his b where (a.init_date between v_begin_date and v_end_date) and a.co_no=v_co_no and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",a.pd_no,";"))>0) and instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, a.crncy_type) > 0) and a.row_id > v_row_id and a.pd_no = b.pd_no and a.init_date = b.init_date order by a.row_id;
    else
        select a.row_id,a.init_date,a.co_no,a.pd_no,a.crncy_type,a.begin_NAV,a.nav_asset,a.total_cash_asset,a.stock_cash_asset,a.futu_cash_asset,a.stock_asset,a.fund_asset,a.money_fund_asset,a.not_money_fund_asset,a.bond_asset,a.futu_asset,a.repo_asset,a.other_asset,a.hk_thrgh_stock_asset,a.futu_long_market_value,a.futu_short_market_value,b.curr_share,b.pre_share from db_prod_his.tb_pdcapit_pd_asset_his a,db_prod_his.tb_pdacco_pd_info_his b where (a.init_date between v_begin_date and v_end_date) and a.co_no=v_co_no and (v_pd_no_str = "; ;" or instr(v_pd_no_str, concat(";",a.pd_no,";"))>0) and instr(v_pd_no_rights_str, concat(";",a.pd_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, a.crncy_type) > 0) and a.row_id > v_row_id and a.pd_no = b.pd_no and a.init_date = b.init_date order by a.row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_新增银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_AddbkacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_AddbkacCapital(
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
    IN p_bank_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
    IN p_intrst_rate decimal(18,12),
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
    declare v_bank_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
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
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
    SET v_intrst_rate = p_intrst_rate;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
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
    

    /* [获取流水变动][{当前金额},{利率}][@当前金额#,@利率#] */
    set v_jour_occur_field = concat("当前金额","|","利率","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_intrst_rate,"|");


    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入表记录][产品_资金_银行账户资金表][字段][字段变量][1][@产品编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_bkac_capit(
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        bank_acco_no, crncy_type, curr_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_bank_acco_no, v_crncy_type, v_curr_amt, v_intrst_rate, 
        v_intrst_base_amt, v_pre_entry_intrst_amt);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.71.1";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#,@利率#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_intrst_rate,"|");


    /* set @业务标志# = 《业务标志-银行资金入金》; */
    set v_busi_flag = 1001003;

    /* set @变动金额# = @当前金额#; */
    set v_occur_amt = v_curr_amt;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品_资金_银行账户资金流水表][字段][字段变量][5][@产品编号#,@银行账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_bkac_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, bank_acco_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_bank_acco_no, v_crncy_type, v_busi_flag, 
        v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.71.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_修改银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_ModibkacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_ModibkacCapital(
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
    IN p_bank_acco_no int,
    IN p_crncy_type varchar(3),
    IN p_curr_amt decimal(18,4),
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
    declare v_bank_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_curr_amt decimal(18,4);
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
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_occur_amt decimal(18,4);
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
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_curr_amt = p_curr_amt;
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
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "银行账户编号", "|", "本币币种", "|", "当前金额", "|", "利率", "|", "利息积数", "|", "待入账利息", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_bank_acco_no, "|", v_crncy_type, "|", v_curr_amt, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品_资金_银行账户资金表][{当前金额}=@当前金额#,{利率}=@利率#,{利息积数}=@利息积数#,{待入账利息}=@待入账利息#][{银行账户编号}=@银行账户编号# and {本币币种}=@本币币种#][2][@银行账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_bkac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=v_curr_amt,intrst_rate=v_intrst_rate,intrst_base_amt=v_intrst_base_amt,pre_entry_intrst_amt=v_pre_entry_intrst_amt where bank_acco_no=v_bank_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.72.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_银行账户资金表][字段][字段变量][{银行账户编号}=@银行账户编号# and {本币币种}=@本币币种#][4][@银行账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, bank_acco_no, crncy_type, curr_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_bank_acco_no, v_crncy_type, v_curr_amt, 
        v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_prod.tb_pdcapit_bkac_capit where bank_acco_no=v_bank_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.72.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_bank_acco_no, "|", v_crncy_type, "|", v_curr_amt, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @业务标志# = 0; */
    set v_busi_flag = 0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @变动金额# = 0; */
    set v_occur_amt = 0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* [插入表记录][产品_资金_银行账户资金流水表][字段][字段变量][5][@银行账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_bkac_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, bank_acco_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_bank_acco_no, v_crncy_type, v_busi_flag, 
        v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.72.5";
        SET v_error_info =  CONCAT(concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_删除银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_DeletebkacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_DeletebkacCapital(
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
    IN p_bank_acco_no int,
    IN p_crncy_type varchar(3),
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
    declare v_bank_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_amt decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_occur_amt decimal(18,4);
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
    SET v_bank_acco_no = p_bank_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_amt = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;

    
    label_pro:BEGIN
    

    /* set @流水变动字段# = " "; */
    set v_jour_occur_field = " ";

    /* set @流水变动信息# = " "; */
    set v_jour_occur_info = " ";

    /* [获取表记录变量][产品_资金_银行账户资金表][字段][字段变量][{银行账户编号}=@银行账户编号# and {本币币种}=@本币币种#][4][@银行账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, bank_acco_no, crncy_type, curr_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_bank_acco_no, v_crncy_type, v_curr_amt, 
        v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_prod.tb_pdcapit_bkac_capit where bank_acco_no=v_bank_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.73.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_资金_银行账户资金表][{银行账户编号}=@银行账户编号# and {本币币种}=@本币币种#][3][@银行账户编号#,@本币币种#] */
    delete from db_prod.tb_pdcapit_bkac_capit 
        where bank_acco_no=v_bank_acco_no and crncy_type=v_crncy_type;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.3.73.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水后信息# = " "; */
    set v_jour_after_occur_info = " ";

    /* set @业务标志# = 0; */
    set v_busi_flag = 0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* set @变动金额# = 0; */
    set v_occur_amt = 0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* [插入表记录][产品_资金_银行账户资金流水表][字段][字段变量][5][@银行账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_prod.tb_pdcapit_bkac_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, bank_acco_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_bank_acco_no, v_crncy_type, v_busi_flag, 
        v_occur_amt, v_occur_end_amt, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.73.5";
        SET v_error_info =  CONCAT(concat("银行账户编号=",v_bank_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QuerybkacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QuerybkacCapital(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_co_no int,
    IN p_pd_no int,
    IN p_bank_acco_no_str varchar(64),
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
    declare v_bank_acco_no_str varchar(64);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_资金_银行账户资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@银行账户编号串# = "; ;" or instr(@银行账户编号串#, concat(";",{银行账户编号},";")) > 0) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, bank_acco_no, crncy_type, curr_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_prod.tb_pdcapit_bkac_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, bank_acco_no, crncy_type, curr_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_prod.tb_pdcapit_bkac_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询历史银行账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QuerybkacCapital_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QuerybkacCapital_His(
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
    IN p_bank_acco_no_str varchar(64),
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
    declare v_bank_acco_no_str varchar(64);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_资金_历史银行账户资金表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@银行账户编号串# = "; ;" or instr(@银行账户编号串#, concat(";",{银行账户编号},";")) > 0) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        curr_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_prod_his.tb_pdcapit_bkac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        curr_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_prod_his.tb_pdcapit_bkac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询银行账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QuerybkacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QuerybkacCapital_Jour(
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
    IN p_bank_acco_no_str varchar(64),
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
    declare v_bank_acco_no_str varchar(64);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品_资金_银行账户资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@银行账户编号串# = "; ;" or instr(@银行账户编号串#, concat(";",{银行账户编号},";")) > 0) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod.tb_pdcapit_bkac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod.tb_pdcapit_bkac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_查询历史银行账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_QuerybkacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_QuerybkacCapital_JourHis(
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
    IN p_bank_acco_no_str varchar(64),
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
    declare v_bank_acco_no_str varchar(64);
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
    SET v_bank_acco_no_str = p_bank_acco_no_str;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品_资金_银行账户资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@银行账户编号串# = "; ;" or instr(@银行账户编号串#, concat(";",{银行账户编号},";")) > 0) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod_his.tb_pdcapit_bkac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_prod_his.tb_pdcapit_bkac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_bank_acco_no_str = "; ;" or instr(v_bank_acco_no_str, concat(";",bank_acco_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_归档产品资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_BackUpProdCapitalData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_BackUpProdCapitalData(
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
    

    /* [删除表记录][产品_资金_历史产品资金表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_prod_his.tb_pdcapit_pd_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.3.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品_资金_产品资金表][字段][302][@初始化日期#] */
    insert into db_prod_his.tb_pdcapit_pd_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, first_amt, begin_amt, curr_amt, 
        pd_dist_amt, pd_auth_amt, amt_check_diff, pre_settle_amt, 
        total_cash_divide, total_pre_fee, total_rece_amt, total_payab_amt, 
        total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, first_amt, begin_amt, curr_amt, 
        pd_dist_amt, pd_auth_amt, amt_check_diff, pre_settle_amt, 
        total_cash_divide, total_pre_fee, total_rece_amt, total_payab_amt, 
        total_change_amt, intrst_cacl_amt, pre_entry_intrst_amt 
        from db_prod.tb_pdcapit_pd_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品_资金_产品资金表][{当前金额}={当前金额}+{金额核对差额},{期初金额}={当前金额},{红冲蓝补金额}=0,{金额核对差额}=0][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+amt_check_diff,begin_amt=curr_amt,total_change_amt=0,amt_check_diff=0 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_资金_产品资金流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdcapit_pd_capit_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, crncy_type, busi_flag, 
        occur_amt, occur_end_amt, jour_occur_field, jour_after_occur_info, 
        oper_remark_info 
        from db_prod.tb_pdcapit_pd_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_资金_产品资金流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdcapit_pd_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_资金_历史产品资产表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_prod_his.tb_pdcapit_pd_asset_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.3.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品_资金_产品资产表][字段][302][@初始化日期#] */
    insert into db_prod_his.tb_pdcapit_pd_asset_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
        nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
        stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
        bond_asset, futu_asset, repo_asset, other_asset, 
        hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        crncy_type, begin_evalu_nav_asset, evalu_nav_asset, begin_NAV, 
        nav_asset, total_cash_asset, stock_cash_asset, futu_cash_asset, 
        stock_asset, fund_asset, money_fund_asset, not_money_fund_asset, 
        bond_asset, futu_asset, repo_asset, other_asset, 
        hk_thrgh_stock_asset, total_fina_debt, total_loan_debt, futu_long_market_value, 
        futu_short_market_value 
        from db_prod.tb_pdcapit_pd_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;

    #交易组 期初估值净资产 归档。Modify by wjp

    /* [更新表记录][产品_资金_产品资产表][{期初净资产}={净资产},{期初估值净资产}={估值净资产}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdcapit_pd_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_NAV=nav_asset,begin_evalu_nav_asset=evalu_nav_asset where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_资金_历史银行账户资金表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_prod_his.tb_pdcapit_bkac_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.3.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品_资金_银行账户资金表][字段][302][@初始化日期#] */
    insert into db_prod_his.tb_pdcapit_bkac_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        bank_acco_no, crncy_type, curr_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        bank_acco_no, crncy_type, curr_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt 
        from db_prod.tb_pdcapit_bkac_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_资金_银行账户资金流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdcapit_bkac_capit_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, bank_acco_no, crncy_type, 
        busi_flag, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_prod.tb_pdcapit_bkac_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_资金_银行账户资金流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdcapit_bkac_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品_资金_科目资金流水表][字段][{初始化日期}<=@初始化日期#][301][@初始化日期#] */
    insert into db_prod_his.tb_pdcapit_fina_capit_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, busi_flag, pd_fee_type, 
        pd_fee_name, occur_amt, occur_end_amt, crncy_type, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, busi_flag, pd_fee_type, 
        pd_fee_name, occur_amt, occur_end_amt, crncy_type, 
        oper_remark_info 
        from db_prod.tb_pdcapit_fina_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品_资金_科目资金流水表][{初始化日期}<=@初始化日期#][302][@初始化日期#] */
    delete from db_prod.tb_pdcapit_fina_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "prodA.3.101.302";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品_账户_产品信息表][{昨日份额}={当前份额},{昨日估值份额}={估值份额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_prod.tb_pdacco_pd_info set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_share=curr_share,pre_evalu_share=evalu_share where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.101.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* update ~产品_账户_产品信息表^ a ,~产品_资金_产品资产表^ b set a.{期初净资产}=b.{净资产},a.{昨日净值}=round(ifnull(b.{净资产}/a.{当前份额},0),4),a.{历史最高单位净值}=if(round(ifnull(b.{净资产}/a.{当前份额},0),4)>a.{历史最高单位净值},round(ifnull(b.{净资产}/a.{当前份额},0),4),a.{历史最高单位净值}),a.{更新次数}=a.{更新次数}+1 where a.{产品编号}=b.{产品编号} and a.{本币币种}=b.{本币币种}; */
    update db_prod.tb_pdacco_pd_info a ,db_prod.tb_pdcapit_pd_asset b set a.begin_NAV=b.nav_asset,a.pre_nav=round(ifnull(b.nav_asset/a.curr_share,0),4),a.his_max_per_nav=if(round(ifnull(b.nav_asset/a.curr_share,0),4)>a.his_max_per_nav,round(ifnull(b.nav_asset/a.curr_share,0),4),a.his_max_per_nav),a.update_times=a.update_times+1 where a.pd_no=b.pd_no and a.crncy_type=b.crncy_type;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_prod;;

# 原子_产品_资金_导入产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_ImportProdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_ImportProdCapital(
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
    IN p_target_amt decimal(18,4),
    IN p_occur_amt decimal(18,4),
    IN p_frozen_amt decimal(18,4),
    IN p_unfroz_amt decimal(18,4),
    IN p_total_rece_amt_diff decimal(18,4),
    IN p_total_payab_amt_diff decimal(18,4),
    IN p_occur_amt_check_diff decimal(18,4),
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
    declare v_target_amt decimal(18,4);
    declare v_occur_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt_diff decimal(18,4);
    declare v_total_payab_amt_diff decimal(18,4);
    declare v_occur_amt_check_diff decimal(18,4);
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
    declare v_first_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_target_amt = p_target_amt;
    SET v_occur_amt = p_occur_amt;
    SET v_frozen_amt = p_frozen_amt;
    SET v_unfroz_amt = p_unfroz_amt;
    SET v_total_rece_amt_diff = p_total_rece_amt_diff;
    SET v_total_payab_amt_diff = p_total_payab_amt_diff;
    SET v_occur_amt_check_diff = p_occur_amt_check_diff;
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
    SET v_first_amt = 0;
    SET v_begin_amt = 0;
    SET v_curr_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_pre_settle_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_change_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_oper_remark_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_busi_flag = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_jour_after_occur_info = " ";
    SET v_occur_end_amt = 0;

    
    label_pro:BEGIN
    

    /* set @原始金额#=0; */
    set v_first_amt=0;

    /* set @期初金额#=0; */
    set v_begin_amt=0;

    /* set @当前金额#=@目标金额#; */
    set v_curr_amt=v_target_amt;

    /* set @产品已分配金额#=@目标金额#; */
    set v_pd_dist_amt=v_target_amt;

    /* set @产品已授权金额#=@目标金额#; */
    set v_pd_auth_amt=v_target_amt;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

    /* set @待交收金额#=0; */
    set v_pre_settle_amt=0;

    /* set @累计应收金额#=0; */
    set v_total_rece_amt=0;

    /* set @累计应付金额#=0; */
    set v_total_payab_amt=0;

    /* set @累计派现金额#=0; */
    set v_total_cash_divide=0;

    /* set @累计计提费用#=0; */
    set v_total_pre_fee=0;

    /* set @红冲蓝补金额#=0; */
    set v_total_change_amt=0;

    /* set @预计利息#=0; */
    set v_intrst_cacl_amt=0;

    /* set @待入账利息#=0; */
    set v_pre_entry_intrst_amt=0;

    /* set @操作备注#="导入资金 !"; */
    set v_oper_remark_info="导入资金 !";

    /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{当前金额}={当前金额}+@变动金额#,{产品已分配金额}={产品已分配金额}+@变动金额#,{产品已授权金额}={产品已授权金额}+@变动金额#,{金额核对差额}={金额核对差额} - @变动金额核对差额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][1][@产品编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_occur_amt,pd_dist_amt=pd_dist_amt+v_occur_amt,pd_auth_amt=pd_auth_amt+v_occur_amt,amt_check_diff=amt_check_diff - v_occur_amt_check_diff;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.102.pd_no=v_pd_no and crncy_type=v_crncy_type";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(1,"#",v_mysql_message);
        else
            SET v_error_info = 1;
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{产品已授权金额},{产品已分配金额},{红冲蓝补金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数},{金额核对差额}][@当前金额#,@产品已授权金额#,@产品已分配金额#,@红冲蓝补金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@更新次数#,@产品金额核对差额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,pd_auth_amt,pd_dist_amt,total_change_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times,amt_check_diff into v_curr_amt,v_pd_auth_amt,v_pd_dist_amt,v_total_change_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_update_times,v_pd_amt_check_diff from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.102.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @业务标志# = 《业务标志-资金转入》; */
    set v_busi_flag = 1005002;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [获取流水变动][{当前金额},{产品已分配金额},{产品已授权金额},{金额核对差额}][@当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#] */
    set v_jour_occur_field = concat("当前金额","|","产品已分配金额","|","产品已授权金额","|","金额核对差额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|",v_pd_amt_check_diff,"|");


    /* [获取流水后信息][@当前金额#,@产品已分配金额#,@产品已授权金额#,@产品金额核对差额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|",v_pd_amt_check_diff,"|");


    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

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
                
        SET v_error_code = "prodA.3.102.5";
        SET v_error_info =  CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    #[获取流水变动][{累计应收金额差额}][@累计应收金额差额#]
    #[获取流水后信息][@累计应收金额差额#]
    #set @变动金额#=@累计应收金额差额#;
    #set @变动后金额# = @产品累计应收金额#;
    #[插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#]
    #[获取流水变动][{累计应付金额差额}][@累计应付金额差额#]
    #[获取流水后信息][@累计应付金额差额#]
    #set @变动金额#=@累计应付金额差额#;
    #set @变动后金额# = @产品累计应付金额#;
    #[插入表记录][产品_资金_产品资金流水表][字段][字段变量][5][@产品编号#,@本币币种#]
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

# 原子_产品_资金_申赎产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdcapit_ApplyPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdcapit_ApplyPdCapital(
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
    IN p_redempt_type int,
    IN p_redempt_amt decimal(18,4),
    IN p_redempt_qty decimal(18,2),
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
    declare v_redempt_type int;
    declare v_redempt_amt decimal(18,4);
    declare v_redempt_qty decimal(18,2);
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
    declare v_curr_amt decimal(18,4);
    declare v_first_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_pre_settle_amt decimal(18,4);
    declare v_amt_check_diff decimal(18,4);
    declare v_total_change_amt decimal(18,4);
    declare v_total_cash_divide decimal(18,4);
    declare v_total_pre_fee decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_intrst_cacl_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_pd_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_occur_amt decimal(18,4);
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
    SET v_redempt_type = p_redempt_type;
    SET v_redempt_amt = p_redempt_amt;
    SET v_redempt_qty = p_redempt_qty;
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
    SET v_curr_amt = 0;
    SET v_first_amt = 0;
    SET v_begin_amt = 0;
    SET v_pre_settle_amt = 0;
    SET v_amt_check_diff = 0;
    SET v_total_change_amt = 0;
    SET v_total_cash_divide = 0;
    SET v_total_pre_fee = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_intrst_cacl_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_pd_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_occur_amt = 0;
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{申赎金额},{当前金额},{原始金额},{产品已分配金额},{产品已授权金额}][@申赎金额#,@当前金额#,@原始金额#,@产品已分配金额#,@产品已授权金额#] */
    set v_jour_occur_field = concat("申赎金额","|","当前金额","|","原始金额","|","产品已分配金额","|","产品已授权金额","|");
    set v_jour_occur_info = concat(v_redempt_amt,"|",v_curr_amt,"|",v_first_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = @申赎金额#; */
    set v_curr_amt = v_redempt_amt;

    /* set @原始金额# = @申赎金额#; */
    set v_first_amt = v_redempt_amt;

    /* set @待交收金额# = 0; */
    set v_pre_settle_amt = 0;

    /* set @产品已分配金额# = @申赎金额#; */
    set v_pd_dist_amt = v_redempt_amt;

    /* set @产品已授权金额# = @申赎金额#; */
    set v_pd_auth_amt = v_redempt_amt;

    /* set @金额核对差额#=0; */
    set v_amt_check_diff=0;

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
    #申赎产品资金时，已同时把资金分配到资产账户和授权到交易组。只记一条流水

    /* [插入重复更新][产品_资金_产品资金表][字段][字段变量][{当前金额} = {当前金额} + @申赎金额#,{原始金额} = {原始金额} + @申赎金额#,{产品已分配金额}={产品已分配金额}+@申赎金额#,{产品已授权金额}={产品已授权金额}+@申赎金额#][2][@产品编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt = curr_amt + v_redempt_amt,first_amt = first_amt + v_redempt_amt,pd_dist_amt=pd_dist_amt+v_redempt_amt,pd_auth_amt=pd_auth_amt+v_redempt_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "prodA.3.103.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品_资金_产品资金表][{当前金额},{原始金额},{记录序号},{原始金额},{当前金额},{产品已分配金额},{产品已授权金额},{待交收金额},{累计派现金额},{累计计提费用},{累计应收金额},{累计应付金额},{预计利息},{待入账利息},{更新次数},{金额核对差额}][@当前金额#, @原始金额#,@产品资金序号#,@产品原始金额#,@产品当前金额#,@产品已分配金额#,@产品已授权金额#,@产品待交收金额#,@产品累计派现金额#,@产品累计计提费用#,@产品累计应收金额#,@产品累计应付金额#,@产品预计利息#,@产品待入账利息#,@产品更新次数#,@产品金额核对差额#][{产品编号}=@产品编号# and {本币币种}=@本币币种#][4][@产品编号#,@本币币种#] */
    select curr_amt,first_amt,row_id,first_amt,curr_amt,pd_dist_amt,pd_auth_amt,pre_settle_amt,total_cash_divide,total_pre_fee,total_rece_amt,total_payab_amt,intrst_cacl_amt,pre_entry_intrst_amt,update_times,amt_check_diff into v_curr_amt, v_first_amt,v_pd_cash_id,v_pd_first_amt,v_pd_curr_amt,v_pd_dist_amt,v_pd_auth_amt,v_pd_pre_settle_amt,v_pd_total_cash_divide,v_pd_total_pre_fee,v_pd_total_rece_amt,v_pd_total_payab_amt,v_pd_intrst_cacl_amt,v_pd_pre_entry_intrst_amt,v_pd_update_times,v_pd_amt_check_diff from db_prod.tb_pdcapit_pd_capit where pd_no=v_pd_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "prodA.3.103.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("产品编号=",v_pd_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@变动金额#,@当前金额#,@原始金额#,@产品已分配金额#,@产品已授权金额#] */
    set v_jour_after_occur_info = concat(v_occur_amt,"|",v_curr_amt,"|",v_first_amt,"|",v_pd_dist_amt,"|",v_pd_auth_amt,"|");


    /* if @申赎类型# = 《申赎类型-申购》  then */
    if v_redempt_type = 1  then

        /* set @业务标志# = 《业务标志-产品资金入金》; */
        set v_busi_flag = 1001001;

    /* elseif @申赎类型# = 《申赎类型-赎回》  then */
    elseif v_redempt_type = 2  then

        /* set @业务标志# = 《业务标志-产品资金出金》; */
        set v_busi_flag = 1001002;
    end if;

    /* set @变动金额# = @申赎金额#; */
    set v_occur_amt = v_redempt_amt;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

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
                
        SET v_error_code = "prodA.3.103.5";
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


