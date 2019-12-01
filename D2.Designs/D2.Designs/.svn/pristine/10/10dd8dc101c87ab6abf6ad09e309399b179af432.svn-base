DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_分配产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_DistrPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_DistrPdCapital(
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
    OUT p_asac_capt_margin decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
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
    declare v_asac_capt_margin decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_curr_amt decimal(18,4);
    declare v_asac_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_capt_margin decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
    declare v_pre_entry_intrst_amt decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
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
    SET v_asac_capt_margin = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_curr_amt = 0;
    SET v_asac_update_times = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_capt_margin = 0;
    SET v_begin_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
    SET v_pre_entry_intrst_amt = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* if @变动金额# = 0 then */
    if v_occur_amt = 0 then

        /* [获取表记录变量语句][产品期货_资金_资产账户资金表][{当前金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@当前金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
        select curr_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


        /* [检查正常返回][@资产账户资金序号# > 0] */
        if v_asac_cash_id > 0 then
            leave label_pro;
        end if;

    end if;
    #再处理资产账户资产表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* set @占用保证金# = 0; */
    set v_capt_margin = 0;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

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

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品期货_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.8.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_资产账户资金表][{当前金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@当前金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.8.4";
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

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

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
                
        SET v_error_code = "pdfutuA.2.8.5";
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
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_回收产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_BackPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_BackPdCapital(
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
    OUT p_asac_capt_margin decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
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
    declare v_asac_capt_margin decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_amt decimal(18,4);
    declare v_update_date int;
    declare v_update_time int;
    declare v_asac_update_times int;
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
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_amt = 0;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品期货_资金_资产账户资金表][{当前金额}={当前金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_资产账户资金表][{当前金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@当前金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.9.4";
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

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

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
                
        SET v_error_code = "pdfutuA.2.9.5";
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
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_AuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_AuthPdCapital(
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
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_capt_margin decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_realize_pandl decimal(18,4);
    declare v_intrst_rate decimal(18,12);
    declare v_intrst_base_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    SET v_exgp_capt_margin = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_capt_margin = 0;
    SET v_begin_amt = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_realize_pandl = 0;
    SET v_intrst_rate = 0;
    SET v_intrst_base_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
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
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;
    #处理交易组资金表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* set @占用保证金# = 0; */
    set v_capt_margin = 0;

    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

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

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [锁定获取表记录变量][产品期货_资金_资产账户资金表][{当前金额}][@可授权金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt into v_auth_avail_amt from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [插入重复更新][产品期货_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_交易组资金表][sum({当前金额})][@已授权金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select sum(curr_amt) into v_is_auth_amt from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.10.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;

    #[检查报错返回][@可授权金额#<@已授权金额#][619][@资产账户编号#,@可授权金额#,@已授权金额#]

    /* [获取表记录变量][产品期货_资金_交易组资金表][{当前金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@当前金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.10.4";
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

    /* [插入表记录][产品期货_资金_交易组资金流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdfutuA.2.10.5";
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
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_回收授权产品资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_BackAuthPdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_BackAuthPdCapital(
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
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_amt decimal(18,4);
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
    SET v_exgp_capt_margin = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_amt = 0;
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
    
    #处理交易组资金表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品期货_资金_交易组资金表][{当前金额}={当前金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_交易组资金表][{当前金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@当前金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.11.4";
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

    /* [插入表记录][产品期货_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
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
                
        SET v_error_code = "pdfutuA.2.11.5";
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
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_FrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_FrozenExgpCapital(
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
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
    declare v_exch_group_update_times int;
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
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
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品期货_资金_交易组资金表][{冻结金额}={冻结金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_交易组资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@冻结金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_frozen_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.32.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-冻结》; */
    set v_frozen_type = 1;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品期货_资金_交易组资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_frozen_type, v_occur_amt, v_expire_date, v_jour_status, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.32.5";
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
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_取消冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UndoFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UndoFrozenExgpCapital(
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
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
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
    SET v_exgp_capt_margin = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
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
    

    /* [锁定获取表记录变量][产品期货_资金_交易组资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.2.33.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_交易组资金表][{冻结金额}={冻结金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_交易组资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@冻结金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_frozen_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_交易组资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.33.2";
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
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UnFrozenExgpCapital(
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
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
    declare v_exch_group_update_times int;
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exgp_cash_id = 0;
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
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品期货_资金_交易组资金表][{解冻金额}={解冻金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.34.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_交易组资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@解冻金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_unfroz_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.34.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* set @流水状态# = 《流水状态-有效》; */
    set v_jour_status = "1";

    /* set @冻结解冻类型# = 《冻结解冻类型-解冻》; */
    set v_frozen_type = 2;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品期货_资金_交易组资金冻结解冻流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_frozen_type, v_occur_amt, v_expire_date, v_jour_status, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.34.5";
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
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_取消解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UndoUnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UndoUnFrozenExgpCapital(
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
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
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
    SET v_exgp_capt_margin = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_资金_交易组资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.2.35.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_交易组资金表][{解冻金额}={解冻金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.35.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_交易组资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@解冻金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_unfroz_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_交易组资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.35.2";
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
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_红冲蓝补交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_PatchExchGroupCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_PatchExchGroupCapital(
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
    OUT p_exgp_capt_margin decimal(18,4),
    OUT p_exgp_frozen_amt decimal(18,4),
    OUT p_exgp_unfroz_amt decimal(18,4),
    OUT p_exch_group_total_rece_amt decimal(18,4),
    OUT p_exch_group_total_payab_amt decimal(18,4),
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
    declare v_exgp_capt_margin decimal(18,4);
    declare v_exgp_frozen_amt decimal(18,4);
    declare v_exgp_unfroz_amt decimal(18,4);
    declare v_exch_group_total_rece_amt decimal(18,4);
    declare v_exch_group_total_payab_amt decimal(18,4);
    declare v_exch_group_intrst_rate decimal(18,4);
    declare v_exch_group_intrst_base_amt decimal(18,4);
    declare v_exch_group_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_amt decimal(18,4);
    declare v_begin_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    SET v_exgp_capt_margin = 0;
    SET v_exgp_frozen_amt = 0;
    SET v_exgp_unfroz_amt = 0;
    SET v_exch_group_total_rece_amt = 0;
    SET v_exch_group_total_payab_amt = 0;
    SET v_exch_group_intrst_rate = 0;
    SET v_exch_group_intrst_base_amt = 0;
    SET v_exch_group_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_amt = 0;
    SET v_begin_amt = 0;
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
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
    

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* set @占用保证金# = 0; */
    set v_capt_margin = 0;

    /* set @平仓盈亏# = 0; */
    set v_close_pandl = 0;

    /* set @盯市盈亏# = 0; */
    set v_marked_pandl = 0;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品期货_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.36.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_交易组资金表][{当前金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@当前金额#,@交易组资金序号#,@交易组期初金额#,@交易组当前金额#,@交易组占用保证金#,@交易组冻结金额#,@交易组解冻金额#,@交易组累计应收金额#,@交易组累计应付金额#,@交易组利率#,@交易组利息积数#,@交易组待入账利息#,@交易组更新次数#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_exgp_cash_id,v_exgp_begin_amt,v_exgp_curr_amt,v_exgp_capt_margin,v_exgp_frozen_amt,v_exgp_unfroz_amt,v_exch_group_total_rece_amt,v_exch_group_total_payab_amt,v_exch_group_intrst_rate,v_exch_group_intrst_base_amt,v_exch_group_pre_entry_intrst_amt,v_exch_group_update_times from db_pdfutu.tb_pdfuca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.36.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|");


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

    /* [插入表记录][产品期货_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@资产账户编号#,@本币币种#] */
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
                
        SET v_error_code = "pdfutuA.2.36.5";
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
    SET p_exgp_capt_margin = v_exgp_capt_margin;
    SET p_exgp_frozen_amt = v_exgp_frozen_amt;
    SET p_exgp_unfroz_amt = v_exgp_unfroz_amt;
    SET p_exch_group_total_rece_amt = v_exch_group_total_rece_amt;
    SET p_exch_group_total_payab_amt = v_exch_group_total_payab_amt;
    SET p_exch_group_intrst_rate = v_exch_group_intrst_rate;
    SET p_exch_group_intrst_base_amt = v_exch_group_intrst_base_amt;
    SET p_exch_group_pre_entry_intrst_amt = v_exch_group_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryExgpCapital(
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
    

    /* [获取表记录][产品期货_资金_交易组资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@交易组编号权限串#="; ;" or instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, frozen_amt, 
        unfroz_amt, total_rece_amt, total_payab_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_group_no_rights_str="; ;" or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, frozen_amt, 
        unfroz_amt, total_rece_amt, total_payab_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_exch_group_no_rights_str="; ;" or instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询历史交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryExgpCapital_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryExgpCapital_His(
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
    

    /* [获取表记录][产品期货_资金_历史交易组资金表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, begin_amt, curr_amt, capt_margin, 
        frozen_amt, unfroz_amt, total_rece_amt, total_payab_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdfutu_his.tb_pdfuca_exgp_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, begin_amt, curr_amt, capt_margin, 
        frozen_amt, unfroz_amt, total_rece_amt, total_payab_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdfutu_his.tb_pdfuca_exgp_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryExgpCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryExgpCapital_Jour(
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
    

    /* [获取表记录][产品期货_资金_交易组资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfuca_exgp_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfuca_exgp_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询历史交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryExgpCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryExgpCapital_JourHis(
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
    

    /* [获取表记录][历史_产品期货_资金_交易组资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfuca_exgp_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfuca_exgp_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryExgpCapitalFrozenJour(
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

        /* [获取表记录][产品期货_资金_交易组资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, oper_remark_info from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, oper_remark_info from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][产品期货_资金_交易组资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, oper_remark_info from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, exch_group_no, 
            crncy_type, frozen_type, occur_amt, expire_date, 
            jour_status, oper_remark_info from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询历史交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryExgpCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryExgpCapitalFrozenJour_His(
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
    

    /* [获取表记录][历史_产品期货_资金_交易组资金冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info from db_pdfutu_his.tb_pdfuca_exgp_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info from db_pdfutu_his.tb_pdfuca_exgp_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_获取交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_GetExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_GetExgpCapitalFrozenJour(
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
    OUT p_jour_status varchar(2)
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_资金_交易组资金冻结解冻流水表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_crncy_type, v_frozen_type, v_occur_amt, v_expire_date, 
        v_jour_status, v_oper_remark_info from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.43.4";
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

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_红冲蓝补资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_PatchAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_PatchAsacCapital(
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
    OUT p_asac_capt_margin decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
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
    declare v_asac_capt_margin decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_frozen_amt decimal(18,4);
    declare v_unfroz_amt decimal(18,4);
    declare v_total_rece_amt decimal(18,4);
    declare v_total_payab_amt decimal(18,4);
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
    SET v_asac_capt_margin = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_amt = 0;
    SET v_capt_margin = 0;
    SET v_frozen_amt = 0;
    SET v_unfroz_amt = 0;
    SET v_total_rece_amt = 0;
    SET v_total_payab_amt = 0;
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

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* set @期初金额# = 0; */
    set v_begin_amt = 0;

    /* set @占用保证金# = 0; */
    set v_capt_margin = 0;

    /* set @冻结金额# = 0; */
    set v_frozen_amt = 0;

    /* set @解冻金额# = 0; */
    set v_unfroz_amt = 0;

    /* set @累计应收金额# = 0; */
    set v_total_rece_amt = 0;

    /* set @累计应付金额# = 0; */
    set v_total_payab_amt = 0;

    /* set @利率# = 0; */
    set v_intrst_rate = 0;

    /* set @利息积数# = 0; */
    set v_intrst_base_amt = 0;

    /* set @待入账利息# = 0; */
    set v_pre_entry_intrst_amt = 0;

    /* [插入重复更新][产品期货_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.51.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("asset_acco_no=资产账户编号 and crncy_type=本币币种=",asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("asset_acco_no=资产账户编号 and crncy_type=本币币种=",asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_资产账户资金表][{当前金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@当前金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_curr_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前金额#] */
    set v_jour_after_occur_info = concat(v_curr_amt,"|");


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
                
        SET v_error_code = "pdfutuA.2.51.5";
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
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_FrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_FrozenAsacCapital(
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
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
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
    

    /* [更新表记录][产品期货_资金_资产账户资金表][{冻结金额}={冻结金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_资产账户资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@冻结金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_frozen_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.52.4";
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

    /* [插入表记录][产品期货_资金_资产账户资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_asac_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, crncy_type, frozen_type, 
        occur_amt, expire_date, jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_frozen_type, 
        v_occur_amt, v_expire_date, v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.52.5";
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
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_取消冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UndoFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UndoFrozenAsacCapital(
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
    OUT p_asac_capt_margin decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
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
    declare v_asac_capt_margin decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
    declare v_asac_intrst_rate decimal(18,4);
    declare v_asac_intrst_base_amt decimal(18,4);
    declare v_asac_pre_entry_intrst_amt decimal(18,4);
    declare v_update_times int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
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
    SET v_asac_capt_margin = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
    SET v_asac_intrst_rate = 0;
    SET v_asac_intrst_base_amt = 0;
    SET v_asac_pre_entry_intrst_amt = 0;
    SET v_update_times = 1;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_资金_资产账户资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.2.53.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_资产账户资金表][{冻结金额}={冻结金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_资产账户资金表][{冻结金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@冻结金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select frozen_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_frozen_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_资产账户资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.53.2";
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
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UnFrozenAsacCapital(
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
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
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
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
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
    

    /* [更新表记录][产品期货_资金_资产账户资金表][{解冻金额}={解冻金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_资产账户资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@解冻金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_unfroz_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.54.4";
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

    /* [插入表记录][产品期货_资金_资产账户资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_asac_capit_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, crncy_type, frozen_type, 
        occur_amt, expire_date, jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_frozen_type, 
        v_occur_amt, v_expire_date, v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.54.5";
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
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_取消解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UndoUnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UndoUnFrozenAsacCapital(
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
    OUT p_asac_capt_margin decimal(18,4),
    OUT p_asac_frozen_amt decimal(18,4),
    OUT p_asac_unfroz_amt decimal(18,4),
    OUT p_asac_total_rece_amt decimal(18,4),
    OUT p_asac_total_payab_amt decimal(18,4),
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
    declare v_asac_capt_margin decimal(18,4);
    declare v_asac_frozen_amt decimal(18,4);
    declare v_asac_unfroz_amt decimal(18,4);
    declare v_asac_total_rece_amt decimal(18,4);
    declare v_asac_total_payab_amt decimal(18,4);
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
    SET v_asac_capt_margin = 0;
    SET v_asac_frozen_amt = 0;
    SET v_asac_unfroz_amt = 0;
    SET v_asac_total_rece_amt = 0;
    SET v_asac_total_payab_amt = 0;
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
    

    /* [锁定获取表记录变量][产品期货_资金_资产账户资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.2.55.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_资产账户资金表][{解冻金额}={解冻金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_资金_资产账户资金表][{解冻金额},{记录序号},{期初金额},{当前金额},{占用保证金},{冻结金额},{解冻金额},{累计应收金额},{累计应付金额},{利率},{利息积数},{待入账利息},{更新次数}][@解冻金额#,@资产账户资金序号#,@资产账户期初金额#,@资产账户当前金额#,@资产账户占用保证金#,@资产账户冻结金额#,@资产账户解冻金额#,@资产账户累计应收金额#,@资产账户累计应付金额#,@资产账户利率#,@资产账户利息积数#,@资产账户待入账利息#,@资产账户更新次数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select unfroz_amt,row_id,begin_amt,curr_amt,capt_margin,frozen_amt,unfroz_amt,total_rece_amt,total_payab_amt,intrst_rate,intrst_base_amt,pre_entry_intrst_amt,update_times into v_unfroz_amt,v_asac_cash_id,v_asac_begin_amt,v_asac_curr_amt,v_asac_capt_margin,v_asac_frozen_amt,v_asac_unfroz_amt,v_asac_total_rece_amt,v_asac_total_payab_amt,v_asac_intrst_rate,v_asac_intrst_base_amt,v_asac_pre_entry_intrst_amt,v_asac_update_times from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_资产账户资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.55.2";
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
    SET p_asac_capt_margin = v_asac_capt_margin;
    SET p_asac_frozen_amt = v_asac_frozen_amt;
    SET p_asac_unfroz_amt = v_asac_unfroz_amt;
    SET p_asac_total_rece_amt = v_asac_total_rece_amt;
    SET p_asac_total_payab_amt = v_asac_total_payab_amt;
    SET p_asac_intrst_rate = v_asac_intrst_rate;
    SET p_asac_intrst_base_amt = v_asac_intrst_base_amt;
    SET p_asac_pre_entry_intrst_amt = v_asac_pre_entry_intrst_amt;
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryAsacCapital(
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
    

    /* [获取表记录][产品期货_资金_资产账户资金表][字段][(@机构编号# = 0 or {机构编号}=@机构编号#) and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@产品编号权限串#="; ;" or instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str="; ;" or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt from db_pdfutu.tb_pdfuca_asac_capit where (v_co_no = 0 or co_no=v_co_no) and (v_pd_no = 0 or pd_no=v_pd_no) and (v_pd_no_rights_str="; ;" or instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询历史资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryAsacCapital_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryAsacCapital_His(
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
    

    /* [获取表记录][产品期货_资金_历史资产账户资金表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, frozen_amt, 
        unfroz_amt, total_rece_amt, total_payab_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfutu_his.tb_pdfuca_asac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, frozen_amt, 
        unfroz_amt, total_rece_amt, total_payab_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfutu_his.tb_pdfuca_asac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryAsacCapital_Jour(
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
    

    /* [获取表记录][产品期货_资金_资产账户资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryAsacCapital_JourHis(
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
    

    /* [获取表记录][历史_产品期货_资金_资产账户资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfuca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfuca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryAsacCapitalFrozenJour(
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

        /* [获取表记录][产品期货_资金_资产账户资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    else

        /* [获取表记录][产品期货_资金_资产账户资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
        if v_row_count = -1 then
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
        else
            select row_id, create_date, create_time, 
            update_date, update_time, update_times, opor_co_no, 
            opor_no, oper_mac, oper_ip_addr, oper_info, 
            oper_way, oper_menu_no, oper_func_code, init_date, 
            co_no, pd_no, asset_acco_no, crncy_type, 
            frozen_type, occur_amt, expire_date, jour_status, 
            oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
        end if;

    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_查询历史资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryAsacCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryAsacCapitalFrozenJour_His(
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
    

    /* [获取表记录][历史_产品期货_资金_资产账户资金冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info from db_pdfutu_his.tb_pdfuca_asac_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info from db_pdfutu_his.tb_pdfuca_asac_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_获取资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_GetAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_GetAsacCapitalFrozenJour(
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
    OUT p_jour_status varchar(2)
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_资金_资产账户资金冻结解冻流水表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_crncy_type, 
        v_frozen_type, v_occur_amt, v_expire_date, v_jour_status, 
        v_oper_remark_info from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.63.4";
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

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_获取资产账户资金可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_GetAsacCapitalAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_GetAsacCapitalAvail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_default_exch_group_no int,
    IN p_crncy_type varchar(3),
    IN p_asac_busi_config_str varchar(64),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
    OUT p_curr_amt decimal(18,4),
    OUT p_avail_amt decimal(18,4),
    OUT p_capt_margin decimal(18,4)
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
    declare v_default_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_asac_busi_config_str varchar(64);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_sync_capital_way int;
    declare v_tmp_avail_amt decimal(18,4);
    declare v_margin_amt decimal(18,4);
    declare v_capit_bala decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_default_exch_group_no = p_default_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_asac_busi_config_str = p_asac_busi_config_str;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_curr_amt = 0;
    SET v_avail_amt = 0;
    SET v_capt_margin = 0;
    SET v_sync_capital_way = 0;
    SET v_tmp_avail_amt = 0;
    SET v_margin_amt = 0;
    SET v_capit_bala = 0;

    
    label_pro:BEGIN
    

    /* set @同步资金方式#=cast(substring(@资产账户业务控制配置串#, 20, 1) as SIGNED); */
    set v_sync_capital_way=cast(substring(v_asac_busi_config_str, 20, 1) as SIGNED);

    /* [获取表记录变量语句][产品期货_资金_资产账户资金表][ifnull({当前金额},0),ifnull({当前金额}-{冻结金额}+{解冻金额}-{占用保证金},0),ifnull({占用保证金},0)][@当前金额#,@可用金额#,@占用保证金#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select ifnull(curr_amt,0),ifnull(curr_amt-frozen_amt+unfroz_amt-capt_margin,0),ifnull(capt_margin,0) into v_curr_amt,v_avail_amt,v_capt_margin from db_pdfutu.tb_pdfuca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* [获取表记录变量语句][产品期货_资金_交易资产账户资金表][ifnull({可用金额},0),ifnull({保证金},0),ifnull({资金余额},0)][@临时_可用金额#,@保证金#,@资金余额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#] */
    select ifnull(avail_amt,0),ifnull(margin_amt,0),ifnull(capit_bala,0) into v_tmp_avail_amt,v_margin_amt,v_capit_bala from db_pdfutu.tb_pdfuca_trd_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;


    /* set @当前金额# = @当前金额# + @资金余额#; */
    set v_curr_amt = v_curr_amt + v_capit_bala;

    /* set @占用保证金# = @占用保证金# + @保证金#; */
    set v_capt_margin = v_capt_margin + v_margin_amt;
    #同步资金方式为0表示同步可用金额,为1表示同步资金余额

    /* if @同步资金方式#=0 then */
    if v_sync_capital_way=0 then

         /* set @可用金额# = @可用金额# + @临时_可用金额#; */
         set v_avail_amt = v_avail_amt + v_tmp_avail_amt;

    /* elseif @同步资金方式#=1 then */
    elseif v_sync_capital_way=1 then

         /* set @可用金额# = @当前金额#; */
         set v_avail_amt = v_curr_amt;
    end if;

    /* set @当前金额#=round(@当前金额#,2); */
    set v_curr_amt=round(v_curr_amt,2);

    /* set @可用金额#=round(@可用金额#,2); */
    set v_avail_amt=round(v_avail_amt,2);
    #期货目前资产账户 与 交易组为 1对1
    #set @记录个数= 0;
    #[获取表记录数量][产品期货_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#]
    #if @记录个数#=1 then
      #  [获取表记录变量][产品期货_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#]
    #else

        /* set @交易组编号# = @默认交易组编号#; */
        set v_exch_group_no = v_default_exch_group_no;
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_curr_amt = v_curr_amt;
    SET p_avail_amt = v_avail_amt;
    SET p_capt_margin = v_capt_margin;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_资金_转入外部资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_AddOutCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_AddOutCapital(
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
    IN p_out_capt_margin decimal(18,4),
    IN p_curr_amt decimal(18,4),
    IN p_avail_amt decimal(18,4),
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
    declare v_out_curr_amt decimal(18,4);
    declare v_out_enable_amt decimal(18,4);
    declare v_out_capt_margin decimal(18,4);
    declare v_curr_amt decimal(18,4);
    declare v_avail_amt decimal(18,4);
    declare v_capt_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
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
    SET v_out_curr_amt = p_out_curr_amt;
    SET v_out_enable_amt = p_out_enable_amt;
    SET v_out_capt_margin = p_out_capt_margin;
    SET v_curr_amt = p_curr_amt;
    SET v_avail_amt = p_avail_amt;
    SET v_capt_margin = p_capt_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
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
    

    /* [插入重复更新][产品期货_资金_外部资产账户资金表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#, {外部占用保证金}=@外部占用保证金#][1][@初始化日期#,@通道编号#,@外部账号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_out_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        crncy_type, out_curr_amt, out_enable_amt, out_capt_margin) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_crncy_type, v_out_curr_amt, v_out_enable_amt, v_out_capt_margin) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt, out_capt_margin=v_out_capt_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.101.1";
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

         /* set @账户占用保证金差额#=@外部占用保证金# - @账户占用保证金#; */
         set v_act_capt_margin_diff=v_out_capt_margin - v_act_capt_margin;

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

    /* [插入重复更新][产品期货_资金_内外资产账户资金差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {账户当前金额}=@账户当前金额#, {账户可用金额}=@账户可用金额#, {账户占用保证金}=@账户占用保证金#, {外部当前金额}=@外部当前金额#, {外部可用金额}=@外部可用金额#, {外部占用保证金}=@外部占用保证金#, {账户当前金额差额}=@账户当前金额差额#, {账户可用金额差额}=@账户可用金额差额#, {账户占用保证金差额}=@账户占用保证金差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@资产账户编号#,@本币币种#] */
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
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, acco_curr_amt=v_acco_curr_amt, acco_avail_amt=v_acco_avail_amt, act_capt_margin=v_act_capt_margin, out_curr_amt=v_out_curr_amt, out_enable_amt=v_out_enable_amt, out_capt_margin=v_out_capt_margin, acco_curr_amt_diff=v_acco_curr_amt_diff, acco_avail_amt_diff=v_acco_avail_amt_diff, act_capt_margin_diff=v_act_capt_margin_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.101.1";
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

# 原子_产品期货_资金_清除外部转入记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_ClearOutRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_ClearOutRecord(
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
    

    /* [删除表记录][产品期货_资金_外部资产账户资金表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdfutu.tb_pdfuca_out_asac_capit 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.102.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_内外资产账户资金差异表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdfutu.tb_pdfuca_asac_capit_diff 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.102.3";
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
use db_pdfutu;;

# 原子_产品期货_资金_归档产品期货资金数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_BackUpPdFutuCaptialData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_BackUpPdFutuCaptialData(
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
    

    /* [不分日期数据归历史][产品期货_资金_交易资产账户资金表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_trd_asac_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, avail_amt, margin_amt, 
        capit_bala) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, avail_amt, margin_amt, 
        capit_bala 
        from db_pdfutu.tb_pdfuca_trd_asac_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_交易资产账户资金表][1=1][2][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_trd_asac_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品期货_资金_交易库交易组资金表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_trd_exgp_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, crncy_type, avail_amt, 
        margin_amt, capit_bala) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, crncy_type, avail_amt, 
        margin_amt, capit_bala 
        from db_pdfutu.tb_pdfuca_trd_exgp_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_交易库交易组资金表][1=1][2][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_trd_exgp_capit 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_历史交易组资金表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdfutu_his.tb_pdfuca_exgp_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品期货_资金_交易组资金表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_exgp_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt 
        from db_pdfutu.tb_pdfuca_exgp_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_交易组资金表][{期初金额}={当前金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=curr_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_资金_交易组资金流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_exgp_capit_jour_his (
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
        from db_pdfutu.tb_pdfuca_exgp_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_交易组资金流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_exgp_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_资金_交易组资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_exgp_capit_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info 
        from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_交易组资金冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_历史交易组资产表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdfutu_his.tb_pdfuca_exgp_asset_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品期货_资金_交易组资产表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_exgp_asset_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        cash_asset, futu_asset) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, crncy_type, begin_NAV, nav_asset, 
        cash_asset, futu_asset 
        from db_pdfutu.tb_pdfuca_exgp_asset;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_交易组资产表][{期初净资产}={净资产}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_exgp_asset set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_NAV=nav_asset where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_历史资产账户资金表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdfutu_his.tb_pdfuca_asac_capit_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品期货_资金_资产账户资金表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_asac_capit_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, curr_amt, 
        capt_margin, frozen_amt, unfroz_amt, total_rece_amt, 
        total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, curr_amt, 
        capt_margin, frozen_amt, unfroz_amt, total_rece_amt, 
        total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt 
        from db_pdfutu.tb_pdfuca_asac_capit;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_资金_资产账户资金表][{期初金额}={当前金额}][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfuca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_amt=curr_amt where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_资金_资产账户资金流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_asac_capit_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pdfutu.tb_pdfuca_asac_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_资产账户资金流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_asac_capit_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_资金_资产账户资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_asac_capit_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info 
        from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_资产账户资金冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #[删除表记录][产品期货_资金_历史资产账户资产表][{初始化日期}=@初始化日期#][301][@初始化日期#]
    #[不分日期数据归历史][产品期货_资金_资产账户资产表][字段][302][@初始化日期#]
    #[更新表记录][产品期货_资金_资产账户资产表][{期初净资产}={净资产}][1=1][1=1][" "]

    /* [数据归历史][产品期货_资金_外部资产账户资金表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_out_asac_capit_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_capt_margin) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, out_curr_amt, out_enable_amt, 
        out_capt_margin 
        from db_pdfutu.tb_pdfuca_out_asac_capit 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_外部资产账户资金表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_out_asac_capit 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_资金_内外资产账户资金差异表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_asac_capit_diff_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, act_capt_margin, out_curr_amt, out_enable_amt, 
        out_capt_margin, acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, 
        deal_flag, asset_sync_flag, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, act_capt_margin, out_curr_amt, out_enable_amt, 
        out_capt_margin, acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, 
        deal_flag, asset_sync_flag, remark_info 
        from db_pdfutu.tb_pdfuca_asac_capit_diff 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_内外资产账户资金差异表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_asac_capit_diff 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_资金_资金入账流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfuca_capit_entry_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, busi_flag, occur_amt, 
        entry_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_crncy_type, busi_flag, occur_amt, 
        entry_status 
        from db_pdfutu.tb_pdfuca_capit_entry_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.2.111.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_资金_资金入账流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfuca_capit_entry_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.2.111.3";
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
use db_pdfutu;;

# 原子_产品期货_资金_获取日终到期交易组冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_GetCloseExgpFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_GetCloseExgpFrozenUnfrozen(
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
    

    /* [获取表记录变量][产品期货_资金_交易组资金冻结解冻流水表][{记录序号},{资产账户编号},{交易组编号},{本币币种},{冻结解冻类型},{变动金额}][@记录序号#,@资产账户编号#,@交易组编号#,@本币币种#,@冻结解冻类型#,@变动金额#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,exch_group_no,crncy_type,frozen_type,occur_amt into v_row_id,v_asset_acco_no,v_exch_group_no,v_crncy_type,v_frozen_type,v_occur_amt from db_pdfutu.tb_pdfuca_exgp_capit_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.2.255.4";
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
use db_pdfutu;;

# 原子_产品期货_资金_获取日终到期资产账户冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_GetCloseAsacFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_GetCloseAsacFrozenUnfrozen(
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
    

    /* [获取表记录变量][产品期货_资金_资产账户资金冻结解冻流水表][{记录序号},{资产账户编号},{本币币种},{冻结解冻类型},{变动金额}][@记录序号#,@资产账户编号#,@本币币种#,@冻结解冻类型#,@变动金额#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,crncy_type,frozen_type,occur_amt into v_row_id,v_asset_acco_no,v_crncy_type,v_frozen_type,v_occur_amt from db_pdfutu.tb_pdfuca_asac_capit_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.256.4";
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
use db_pdfutu;;

# 原子_产品期货_资金_更新交易资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UpdateTrdCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UpdateTrdCapital(
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
    IN p_avail_amt decimal(18,4),
    IN p_margin_amt decimal(18,4),
    IN p_capit_bala decimal(18,4),
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
    declare v_avail_amt decimal(18,4);
    declare v_margin_amt decimal(18,4);
    declare v_capit_bala decimal(18,4);
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
    SET v_avail_amt = p_avail_amt;
    SET v_margin_amt = p_margin_amt;
    SET v_capit_bala = p_capit_bala;
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

    /* [插入重复更新][产品期货_资金_交易资产账户资金表][字段][字段变量][{可用金额}=@可用金额#,{保证金}=@保证金#,{资金余额}=@资金余额#][1][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_trd_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, avail_amt, margin_amt, 
        capit_bala) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_crncy_type, v_avail_amt, v_margin_amt, 
        v_capit_bala) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, avail_amt=v_avail_amt,margin_amt=v_margin_amt,capit_bala=v_capit_bala;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.257.1";
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
use db_pdfutu;;

# 原子_产品期货_资金_更新交易库交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_UpdateTrdExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_UpdateTrdExgpCapital(
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
    IN p_avail_amt decimal(18,4),
    IN p_margin_amt decimal(18,4),
    IN p_capit_bala decimal(18,4),
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
    declare v_avail_amt decimal(18,4);
    declare v_margin_amt decimal(18,4);
    declare v_capit_bala decimal(18,4);
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
    SET v_avail_amt = p_avail_amt;
    SET v_margin_amt = p_margin_amt;
    SET v_capit_bala = p_capit_bala;
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

    /* [插入重复更新][产品期货_资金_交易库交易组资金表][字段][字段变量][{可用金额}=@可用金额#,{保证金}=@保证金#,{资金余额}=@资金余额#][1][@交易组编号#,@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfuca_trd_exgp_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        exch_group_no, asset_acco_no, crncy_type, avail_amt, 
        margin_amt, capit_bala) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_exch_group_no, v_asset_acco_no, v_crncy_type, v_avail_amt, 
        v_margin_amt, v_capit_bala) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, avail_amt=v_avail_amt,margin_amt=v_margin_amt,capit_bala=v_capit_bala;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.258.1";
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
use db_pdfutu;;

# 原子_产品期货_资金_查询资产账户内外资金差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfuca_QueryFutuCapitalDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfuca_QueryFutuCapitalDiff(
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
    

    /* [获取表记录][产品期货_资金_内外资产账户资金差异表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前金额差额}<>0 or {账户可用金额差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前金额差额}=0 and {账户可用金额差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, act_capt_margin, out_curr_amt, out_enable_amt, 
        out_capt_margin, acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdfutu.tb_pdfuca_asac_capit_diff where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, crncy_type, acco_curr_amt, 
        acco_avail_amt, act_capt_margin, out_curr_amt, out_enable_amt, 
        out_capt_margin, acco_curr_amt_diff, acco_avail_amt_diff, act_capt_margin_diff, 
        deal_flag, asset_sync_flag, remark_info from db_pdfutu.tb_pdfuca_asac_capit_diff where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_amt_diff<>0 or acco_avail_amt_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_amt_diff=0 and acco_avail_amt_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


