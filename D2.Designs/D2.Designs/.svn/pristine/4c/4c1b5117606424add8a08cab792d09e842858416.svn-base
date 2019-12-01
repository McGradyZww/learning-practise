DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_分配产品资金
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
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
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
    declare v_update_times int;
    declare v_row_id bigint;
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
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;
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
    SET v_update_times = 1;
    SET v_row_id = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;
    #再处理资产账户资产表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* set @占用保证金# = 0; */
    set v_capt_margin = 0;

    /* set @平仓盈亏# = 0; */
    set v_close_pandl = 0;

    /* set @盯市盈亏# = 0; */
    set v_marked_pandl = 0;

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

    /* [插入重复更新][产品外盘期货_资金_资产账户资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_asac_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, crncy_type, begin_amt, curr_amt, 
        capt_margin, close_pandl, marked_pandl, frozen_amt, 
        unfroz_amt, total_rece_amt, total_payab_amt, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_crncy_type, v_begin_amt, v_curr_amt, 
        v_capt_margin, v_close_pandl, v_marked_pandl, v_frozen_amt, 
        v_unfroz_amt, v_total_rece_amt, v_total_payab_amt, v_intrst_rate, 
        v_intrst_base_amt, v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.8.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, close_pandl, marked_pandl, 
        frozen_amt, unfroz_amt, total_rece_amt, total_payab_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_capt_margin, v_close_pandl, v_marked_pandl, 
        v_frozen_amt, v_unfroz_amt, v_total_rece_amt, v_total_payab_amt, 
        v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.8.4";
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

    /* [插入表记录][产品外盘期货_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_asac_capit_jour(
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
                
        SET v_error_code = "pdfofuA.2.8.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_回收产品资金
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
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_amt = 0;
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
    

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{当前金额}={当前金额}-@当前金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_curr_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.9.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][{当前金额}][@当前金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt into v_curr_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.9.4";
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

    /* [插入表记录][产品外盘期货_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_asac_capit_jour(
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
                
        SET v_error_code = "pdfofuA.2.9.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_授权产品资金
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
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
    declare v_update_times int;
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
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_capt_margin = 0;
    SET v_close_pandl = 0;
    SET v_marked_pandl = 0;
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
    SET v_update_times = 1;
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

    /* set @平仓盈亏# = 0; */
    set v_close_pandl = 0;

    /* set @盯市盈亏# = 0; */
    set v_marked_pandl = 0;

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

    /* [插入重复更新][产品外盘期货_资金_交易组资金表][字段][字段变量][{当前金额}={当前金额}+@当前金额#][1][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_exgp_capit (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, close_pandl, marked_pandl, 
        frozen_amt, unfroz_amt, total_rece_amt, total_payab_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_capt_margin, v_close_pandl, v_marked_pandl, 
        v_frozen_amt, v_unfroz_amt, v_total_rece_amt, v_total_payab_amt, 
        v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_amt=curr_amt+v_curr_amt;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.10.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][{当前金额}][@当前金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt into v_curr_amt from db_pdfofu.tb_pdfoca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.10.4";
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

    /* [插入表记录][产品外盘期货_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_exgp_capit_jour(
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
                
        SET v_error_code = "pdfofuA.2.10.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_回收授权产品资金
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_curr_amt decimal(18,4);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_curr_amt = 0;
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
    
    #处理交易组资金表

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品外盘期货_资金_交易组资金表][{当前金额}={当前金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.11.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][{当前金额}][@当前金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select curr_amt into v_curr_amt from db_pdfofu.tb_pdfoca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.11.4";
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

    /* [插入表记录][产品外盘期货_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_exgp_capit_jour(
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
                
        SET v_error_code = "pdfofuA.2.11.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_FrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_FrozenExgpCapital(
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_资金_交易组资金表][{冻结金额}={冻结金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.32.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][{冻结金额}][@冻结金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select frozen_amt into v_frozen_amt from db_pdfofu.tb_pdfoca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.32.4";
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

    /* [插入表记录][产品外盘期货_资金_交易组资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour(
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
                
        SET v_error_code = "pdfofuA.2.32.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_取消冻结交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_UndoFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_UndoFrozenExgpCapital(
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_资金_交易组资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.2.33.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_交易组资金表][{冻结金额}={冻结金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][{冻结金额}][@冻结金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select frozen_amt into v_frozen_amt from db_pdfofu.tb_pdfoca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.33.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_交易组资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.33.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_UnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_UnFrozenExgpCapital(
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
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_资金_交易组资金表][{解冻金额}={解冻金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.34.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][{解冻金额}][@解冻金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select unfroz_amt into v_unfroz_amt from db_pdfofu.tb_pdfoca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.34.4";
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

    /* [插入表记录][产品外盘期货_资金_交易组资金冻结解冻流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour(
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
                
        SET v_error_code = "pdfofuA.2.34.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_取消解冻交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_UndoUnFrozenExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_UndoUnFrozenExgpCapital(
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_资金_交易组资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.2.35.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_交易组资金表][{解冻金额}={解冻金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.35.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][{解冻金额}][@解冻金额#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@交易组编号#,@本币币种#] */
    select unfroz_amt into v_unfroz_amt from db_pdfofu.tb_pdfoca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.35.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_交易组资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#,@交易组编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.35.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id,",","资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_修改交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_ModiExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_ModiExgpCapital(
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
    IN p_capt_margin decimal(18,4),
    IN p_close_pandl decimal(18,4),
    IN p_marked_pandl decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_crncy_type varchar(3);
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
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
    SET v_capt_margin = p_capt_margin;
    SET v_close_pandl = p_close_pandl;
    SET v_marked_pandl = p_marked_pandl;
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
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "交易组编号", "|", "本币币种", "|", "占用保证金", "|", "平仓盈亏", "|", "盯市盈亏", "|", "累计应收金额", "|", "累计应付金额", "|", "实现盈亏", "|", "利率", "|", "利息积数", "|", "待入账利息", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_exch_group_no, "|", v_crncy_type, "|", v_capt_margin, "|", v_close_pandl, "|", v_marked_pandl, "|", v_total_rece_amt, "|", v_total_payab_amt, "|", v_realize_pandl, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品外盘期货_资金_交易组资金表][{占用保证金}=@占用保证金#,{平仓盈亏}=@平仓盈亏#,{盯市盈亏}=@盯市盈亏#,{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#,{实现盈亏}=@实现盈亏#,{利率}=@利率#,{利息积数}=@利息积数#,{待入账利息}=@待入账利息#][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@交易组编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_exgp_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, capt_margin=v_capt_margin,close_pandl=v_close_pandl,marked_pandl=v_marked_pandl,total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt,realize_pandl=v_realize_pandl,intrst_rate=v_intrst_rate,intrst_base_amt=v_intrst_base_amt,pre_entry_intrst_amt=v_pre_entry_intrst_amt where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.36.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_交易组资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@交易组编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, close_pandl, 
        marked_pandl, frozen_amt, unfroz_amt, total_rece_amt, 
        total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_crncy_type, 
        v_begin_amt, v_curr_amt, v_capt_margin, v_close_pandl, 
        v_marked_pandl, v_frozen_amt, v_unfroz_amt, v_total_rece_amt, 
        v_total_payab_amt, v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_exgp_capit where asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.36.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_exch_group_no, "|", v_crncy_type, "|", v_capt_margin, "|", v_close_pandl, "|", v_marked_pandl, "|", v_total_rece_amt, "|", v_total_payab_amt, "|", v_realize_pandl, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* set @业务标志# = 0; */
    set v_busi_flag = 0;

    /* set @变动金额# = 0; */
    set v_occur_amt = 0;

    /* set @变动后金额# = 0; */
    set v_occur_end_amt = 0;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品外盘期货_资金_交易组资金流水表][字段][字段变量][5][@交易组编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_exgp_capit_jour(
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
                
        SET v_error_code = "pdfofuA.2.36.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryExgpCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryExgpCapital(
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
    

    /* [获取表记录][产品外盘期货_资金_交易组资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, close_pandl, 
        marked_pandl, frozen_amt, unfroz_amt, total_rece_amt, 
        total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, close_pandl, 
        marked_pandl, frozen_amt, unfroz_amt, total_rece_amt, 
        total_payab_amt, intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_exgp_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询历史交易组资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryExgpCapital_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryExgpCapital_His(
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
    

    /* [获取表记录][产品外盘期货_资金_历史交易组资金表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, begin_amt, curr_amt, capt_margin, 
        close_pandl, marked_pandl, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfofu_his.tb_pdfoca_exgp_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, begin_amt, curr_amt, capt_margin, 
        close_pandl, marked_pandl, frozen_amt, unfroz_amt, 
        total_rece_amt, total_payab_amt, realize_pandl, intrst_rate, 
        intrst_base_amt, pre_entry_intrst_amt from db_pdfofu_his.tb_pdfoca_exgp_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryExgpCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryExgpCapital_Jour(
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
    

    /* [获取表记录][产品外盘期货_资金_交易组资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfoca_exgp_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfoca_exgp_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询历史交易组资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryExgpCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryExgpCapital_JourHis(
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
    

    /* [获取表记录][历史_产品外盘期货_资金_交易组资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfoca_exgp_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, busi_flag, occur_amt, occur_end_amt, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfoca_exgp_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryExgpCapitalFrozenJour(
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
    

    /* [获取表记录][产品外盘期货_资金_交易组资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#)  and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info from db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info from db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no)  and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询历史交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryExgpCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryExgpCapitalFrozenJour_His(
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
    

    /* [获取表记录][历史_产品外盘期货_资金_交易组资金冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@交易组编号# = 0 or {交易组编号}=@交易组编号#) and instr(@交易组编号权限串#, concat(";",{交易组编号},";")) > 0 and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info from db_pdfofu_his.tb_pdfoca_exgp_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        crncy_type, frozen_type, occur_amt, expire_date, 
        jour_status, oper_remark_info from db_pdfofu_his.tb_pdfoca_exgp_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_exch_group_no = 0 or exch_group_no=v_exch_group_no) and instr(v_exch_group_no_rights_str, concat(";",exch_group_no,";")) > 0 and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_获取交易组资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_GetExgpCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_GetExgpCapitalFrozenJour(
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
    

    /* [获取表记录变量][产品外盘期货_资金_交易组资金冻结解冻流水表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
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
        v_jour_status, v_oper_remark_info from db_pdfofu.tb_pdfoca_exgp_capit_frozen_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.43.4";
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
use db_pdfofu;;

# 原子_产品外盘期货_资金_红冲蓝补资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_PatchAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_PatchAsacCapital(
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
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_curr_amt decimal(18,4);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_exch_crncy_type varchar(3);
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_curr_amt = 0;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_occur_end_amt = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* set @当前金额# = @变动金额#; */
    set v_curr_amt = v_occur_amt;

    /* [获取流水变动][{当前金额}][@当前金额#] */
    set v_jour_occur_field = concat("当前金额","|");
    set v_jour_occur_info = concat(v_curr_amt,"|");


    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{当前金额}={当前金额}+@当前金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_amt=curr_amt+v_curr_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.51.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][{当前金额}][@当前金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select curr_amt into v_curr_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.51.4";
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

    /* set @交易币种# = @本币币种#; */
    set v_exch_crncy_type = v_crncy_type;

    /* set @变动后金额# = @当前金额#; */
    set v_occur_end_amt = v_curr_amt;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品外盘期货_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_asac_capit_jour(
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
                
        SET v_error_code = "pdfofuA.2.51.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_FrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_FrozenAsacCapital(
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
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{冻结金额}={冻结金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][{冻结金额}][@冻结金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select frozen_amt into v_frozen_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.52.4";
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

    /* [插入表记录][产品外盘期货_资金_资产账户资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_asac_capit_frozen_jour(
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
                
        SET v_error_code = "pdfofuA.2.52.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_取消冻结资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_UndoFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_UndoFrozenAsacCapital(
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_amt = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_资金_资产账户资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfoca_asac_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.2.53.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{冻结金额}={冻结金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_amt=frozen_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][{冻结金额}][@冻结金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select frozen_amt into v_frozen_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_资产账户资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.53.2";
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

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_UnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_UnFrozenAsacCapital(
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
    declare v_occur_amt decimal(18,4);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);
    declare v_occur_end_amt decimal(18,4);
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
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
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type = p_crncy_type;
    SET v_occur_amt = p_occur_amt;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{解冻金额}={解冻金额}+@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt+v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][{解冻金额}][@解冻金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select unfroz_amt into v_unfroz_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.54.4";
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

    /* [插入表记录][产品外盘期货_资金_资产账户资金冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_asac_capit_frozen_jour(
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
                
        SET v_error_code = "pdfofuA.2.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_取消解冻资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_UndoUnFrozenAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_UndoUnFrozenAsacCapital(
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
    declare v_row_id bigint;
    declare v_asset_acco_no int;
    declare v_crncy_type varchar(3);
    declare v_occur_amt decimal(18,4);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_amt = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_资金_资产账户资金冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfoca_asac_capit_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.2.55.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{解冻金额}={解冻金额}-@变动金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_amt=unfroz_amt-v_occur_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][{解冻金额}][@解冻金额#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select unfroz_amt into v_unfroz_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_资金_资产账户资金冻结解冻流水表][{流水状态}=《流水状态-无效》 ,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#,@资产账户编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status="2" ,oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.55.2";
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

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_修改资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_ModiAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_ModiAsacCapital(
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
    IN p_capt_margin decimal(18,4),
    IN p_close_pandl decimal(18,4),
    IN p_marked_pandl decimal(18,4),
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
    declare v_capt_margin decimal(18,4);
    declare v_close_pandl decimal(18,4);
    declare v_marked_pandl decimal(18,4);
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
    SET v_capt_margin = p_capt_margin;
    SET v_close_pandl = p_close_pandl;
    SET v_marked_pandl = p_marked_pandl;
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
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_amt = 0;
    SET v_occur_end_amt = 0;
    SET v_exch_crncy_type = "CNY";
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][字段][字段变量] */
    set v_jour_occur_field = concat("初始化日期", "|", "机构编号", "|", "产品编号", "|", "资产账户编号", "|", "本币币种", "|", "占用保证金", "|", "平仓盈亏", "|", "盯市盈亏", "|", "累计应收金额", "|", "累计应付金额", "|", "实现盈亏", "|", "利率", "|", "利息积数", "|", "待入账利息", "|", "操作备注", "|", "菜单编号", "|");
    set v_jour_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_crncy_type, "|", v_capt_margin, "|", v_close_pandl, "|", v_marked_pandl, "|", v_total_rece_amt, "|", v_total_payab_amt, "|", v_realize_pandl, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


    /* [更新表记录][产品外盘期货_资金_资产账户资金表][{占用保证金}=@占用保证金#,{平仓盈亏}=@平仓盈亏#,{盯市盈亏}=@盯市盈亏#,{累计应收金额}=@累计应收金额#,{累计应付金额}=@累计应付金额#,{实现盈亏}=@实现盈亏#,{利率}=@利率#,{利息积数}=@利息积数#,{待入账利息}=@待入账利息#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][2][@资产账户编号#,@本币币种#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfoca_asac_capit set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, capt_margin=v_capt_margin,close_pandl=v_close_pandl,marked_pandl=v_marked_pandl,total_rece_amt=v_total_rece_amt,total_payab_amt=v_total_payab_amt,realize_pandl=v_realize_pandl,intrst_rate=v_intrst_rate,intrst_base_amt=v_intrst_base_amt,pre_entry_intrst_amt=v_pre_entry_intrst_amt where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.56.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_资金_资产账户资金表][字段][字段变量][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, close_pandl, marked_pandl, 
        frozen_amt, unfroz_amt, total_rece_amt, total_payab_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_crncy_type, v_begin_amt, 
        v_curr_amt, v_capt_margin, v_close_pandl, v_marked_pandl, 
        v_frozen_amt, v_unfroz_amt, v_total_rece_amt, v_total_payab_amt, 
        v_intrst_rate, v_intrst_base_amt, v_pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_asac_capit where asset_acco_no=v_asset_acco_no and crncy_type=v_crncy_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.56.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][字段变量] */
    set v_jour_after_occur_info = concat(v_init_date, "|", v_co_no, "|", v_pd_no, "|", v_asset_acco_no, "|", v_crncy_type, "|", v_capt_margin, "|", v_close_pandl, "|", v_marked_pandl, "|", v_total_rece_amt, "|", v_total_payab_amt, "|", v_realize_pandl, "|", v_intrst_rate, "|", v_intrst_base_amt, "|", v_pre_entry_intrst_amt, "|", v_oper_remark_info, "|", v_menu_no, "|");


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

    /* [插入表记录][产品外盘期货_资金_资产账户资金流水表][字段][字段变量][5][@资产账户编号#,@本币币种#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_asac_capit_jour(
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
                
        SET v_error_code = "pdfofuA.2.56.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","本币币种=",v_crncy_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryAsacCapital;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryAsacCapital(
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
    

    /* [获取表记录][产品外盘期货_资金_资产账户资金表][字段][{机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, close_pandl, marked_pandl, 
        frozen_amt, unfroz_amt, total_rece_amt, total_payab_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_asac_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, crncy_type, begin_amt, 
        curr_amt, capt_margin, close_pandl, marked_pandl, 
        frozen_amt, unfroz_amt, total_rece_amt, total_payab_amt, 
        intrst_rate, intrst_base_amt, pre_entry_intrst_amt from db_pdfofu.tb_pdfoca_asac_capit where co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询历史资产账户资金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryAsacCapital_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryAsacCapital_His(
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
    

    /* [获取表记录][产品外盘期货_资金_历史资产账户资金表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, close_pandl, 
        marked_pandl, frozen_amt, unfroz_amt, total_rece_amt, 
        total_payab_amt, realize_pandl, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt from db_pdfofu_his.tb_pdfoca_asac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        begin_amt, curr_amt, capt_margin, close_pandl, 
        marked_pandl, frozen_amt, unfroz_amt, total_rece_amt, 
        total_payab_amt, realize_pandl, intrst_rate, intrst_base_amt, 
        pre_entry_intrst_amt from db_pdfofu_his.tb_pdfoca_asac_capit_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryAsacCapital_Jour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryAsacCapital_Jour(
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
    

    /* [获取表记录][产品外盘期货_资金_资产账户资金流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfoca_asac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfoca_asac_capit_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询历史资产账户资金流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryAsacCapital_JourHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryAsacCapital_JourHis(
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
    

    /* [获取表记录][历史_产品外盘期货_资金_资产账户资金流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfoca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, busi_flag, 
        crncy_type, occur_amt, occur_end_amt, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfoca_asac_capit_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryAsacCapitalFrozenJour(
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
    

    /* [获取表记录][产品外盘期货_资金_资产账户资金冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@流水状态# = " " or {流水状态}=@流水状态#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info from db_pdfofu.tb_pdfoca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info from db_pdfofu.tb_pdfoca_asac_capit_frozen_jour where init_date<=v_init_date and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_jour_status = " " or jour_status=v_jour_status) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询历史资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryAsacCapitalFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryAsacCapitalFrozenJour_His(
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
    

    /* [获取表记录][历史_产品外盘期货_资金_资产账户资金冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号}=@机构编号# and (@产品编号# = 0 or {产品编号}=@产品编号#) and instr(@产品编号权限串#, concat(";",{产品编号},";")) > 0 and (@资产账户编号# = 0 or {资产账户编号}=@资产账户编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型}=@冻结解冻类型#) and (@本币币种串# = " " or instr(@本币币种串#, {本币币种}) > 0) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info from db_pdfofu_his.tb_pdfoca_asac_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, crncy_type, 
        frozen_type, occur_amt, expire_date, jour_status, 
        oper_remark_info from db_pdfofu_his.tb_pdfoca_asac_capit_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no=v_co_no and (v_pd_no = 0 or pd_no=v_pd_no) and instr(v_pd_no_rights_str, concat(";",pd_no,";")) > 0 and (v_asset_acco_no = 0 or asset_acco_no=v_asset_acco_no) and (v_frozen_type = 0 or frozen_type=v_frozen_type) and (v_crncy_type_str = " " or instr(v_crncy_type_str, crncy_type) > 0) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_获取资产账户资金冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_GetAsacCapitalFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_GetAsacCapitalFrozenJour(
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
    

    /* [获取表记录变量][产品外盘期货_资金_资产账户资金冻结解冻流水表][字段][字段变量][{记录序号}=@记录序号#][4][@记录序号#] */
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
        v_oper_remark_info from db_pdfofu.tb_pdfoca_asac_capit_frozen_jour where row_id=v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.63.4";
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
use db_pdfofu;;

# 原子_产品外盘期货_资金_外部外盘期货资金流水记录处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_DealOutFoFutuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_DealOutFoFutuCapitalJour(
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
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
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
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
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
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
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

    /* [插入表记录][产品外盘期货_资金_外部外盘期货资金流水表][字段][字段变量][1][@通道编号#,@通道资金流水号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_out_fofu_capit_jour(
        create_date, create_time, update_date, 
        update_time, update_times, pass_no, out_acco, 
        init_date, pass_money_jour_no, busi_flag, crncy_type, 
        entry_amt, entry_end_amt, exch_no, futu_acco, 
        contrc_code, remark_info, deal_flag) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_pass_no, v_out_acco, 
        v_init_date, v_pass_money_jour_no, v_busi_flag, v_crncy_type, 
        v_entry_amt, v_entry_end_amt, v_exch_no, v_futu_acco, 
        v_contrc_code, v_remark_info, v_deal_flag);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.106.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","通道资金流水号=",v_pass_money_jour_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_获取外部外盘期货资金流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_GetOutFoFutuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_GetOutFoFutuCapitalJour(
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
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
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
    SET v_futu_acco = " ";
    SET v_contrc_code = " ";
    SET v_remark_info = " ";
    SET v_deal_flag = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品外盘期货_资金_外部外盘期货资金流水表][字段][字段变量][{记录序号}=@查询记录序号#][1][@查询记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        out_acco, init_date, pass_money_jour_no, busi_flag, 
        crncy_type, entry_amt, entry_end_amt, exch_no, 
        futu_acco, contrc_code, remark_info, deal_flag into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_pass_no, 
        v_out_acco, v_init_date, v_pass_money_jour_no, v_busi_flag, 
        v_crncy_type, v_entry_amt, v_entry_end_amt, v_exch_no, 
        v_futu_acco, v_contrc_code, v_remark_info, v_deal_flag from db_pdfofu.tb_pdfoca_out_fofu_capit_jour where row_id=v_query_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.2.107.1";
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
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询外部外盘期货资金流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryOutFoFutuCapitalJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryOutFoFutuCapitalJour(
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
    

    /* [获取表记录][产品外盘期货_资金_外部外盘期货资金流水表][字段][(@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}>@外部账号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        out_acco, init_date, pass_money_jour_no, busi_flag, 
        crncy_type, entry_amt, entry_end_amt, exch_no, 
        futu_acco, contrc_code, remark_info, deal_flag from db_pdfofu.tb_pdfoca_out_fofu_capit_jour where (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco>v_out_acco) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, pass_no, 
        out_acco, init_date, pass_money_jour_no, busi_flag, 
        crncy_type, entry_amt, entry_end_amt, exch_no, 
        futu_acco, contrc_code, remark_info, deal_flag from db_pdfofu.tb_pdfoca_out_fofu_capit_jour where (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco>v_out_acco) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_资金_清算资金数据统计
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_ClearCapitalDataTotal;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_ClearCapitalDataTotal(
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    
    #为避免插入重复，先删除证券资金统计表数据

    /* [删除表记录][产品外盘期货_资金_资金统计表][{初始化日期}=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfofu.tb_pdfoca_capit_total 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfofuA.2.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #从清算证券资金表统计
    #统计产品相关数据, 本币币种

    /* set @机构编号# = 0; */
    set v_co_no = 0;

    /* set @产品编号# = 0; */
    set v_pd_no = 0;

    /* set @交易组编号# = 0; */
    set v_exch_group_no = 0;

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* [读取插入表记录][产品外盘期货_资金_资金统计表][产品外盘期货_资金_资产账户资金表][{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{记录个数},{当前金额}][@初始化日期#, @机构编号#, @产品编号#, @交易组编号#, @资产账户编号#, {本币币种}, count(*), sum({当前金额})][1=1 group by {本币币种}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_capit_total (
        init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,record_count,curr_amt) 
        select 
        v_init_date, v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, crncy_type, count(*), sum(curr_amt) 
        from db_pdfofu.tb_pdfoca_asac_capit 
        where 1=1 group by crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计产品相关数据，机构编号、产品编号、本币币种

    /* set @交易组编号# = 0; */
    set v_exch_group_no = 0;

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* [读取插入表记录][产品外盘期货_资金_资金统计表][产品外盘期货_资金_资产账户资金表][{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{记录个数},{当前金额}][@初始化日期#, {机构编号}, {产品编号}, @交易组编号#, @资产账户编号#, {本币币种}, count(*), sum({当前金额})][1=1 group by {机构编号}, {产品编号}, {本币币种}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_capit_total (
        init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,record_count,curr_amt) 
        select 
        v_init_date, co_no, pd_no, v_exch_group_no, v_asset_acco_no, crncy_type, count(*), sum(curr_amt) 
        from db_pdfofu.tb_pdfoca_asac_capit 
        where 1=1 group by co_no, pd_no, crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计资产账户相关数据，机构编号、产品编号、资产账户、本币币种

    /* [读取插入表记录][产品外盘期货_资金_资金统计表][产品外盘期货_资金_资产账户资金表][{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{记录个数},{当前金额}][@初始化日期#, {机构编号}, {产品编号}, @交易组编号#, {资产账户编号}, {本币币种}, count(*), sum({当前金额})][1=1 group by {机构编号}, {产品编号}, {资产账户编号}, {本币币种}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_capit_total (
        init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,record_count,curr_amt) 
        select 
        v_init_date, co_no, pd_no, v_exch_group_no, asset_acco_no, crncy_type, count(*), sum(curr_amt) 
        from db_pdfofu.tb_pdfoca_asac_capit 
        where 1=1 group by co_no, pd_no, asset_acco_no, crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;

    #统计交易组相关数据，机构编号、产品编号、交易组编号、本币币种

    /* set @资产账户编号# = 0; */
    set v_asset_acco_no = 0;

    /* [读取插入表记录][产品外盘期货_资金_资金统计表][产品外盘期货_资金_交易组资金表][{初始化日期},{机构编号},{产品编号},{交易组编号},{资产账户编号},{本币币种},{记录个数},{当前金额}][@初始化日期#, {机构编号}, {产品编号}, {交易组编号}, @资产账户编号#, {本币币种}, count(*), sum({当前金额})][1=1 group by {机构编号}, {产品编号}, {交易组编号}, {本币币种}][1][@初始化日期#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfoca_capit_total (
        init_date,co_no,pd_no,exch_group_no,asset_acco_no,crncy_type,record_count,curr_amt) 
        select 
        v_init_date, co_no, pd_no, exch_group_no, v_asset_acco_no, crncy_type, count(*), sum(curr_amt) 
        from db_pdfofu.tb_pdfoca_exgp_capit 
        where 1=1 group by co_no, pd_no, exch_group_no, crncy_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.2.201.1";
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
use db_pdfofu;;

# 原子_产品外盘期货_资金_查询清算资金统计数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfoca_QueryClearCapitalTotalData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfoca_QueryClearCapitalTotalData(
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
    declare v_exch_group_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_资金_资金统计表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#编号) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, record_count, curr_amt from db_pdfofu.tb_pdfoca_capit_total where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no编号) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, record_count, curr_amt from db_pdfofu.tb_pdfoca_capit_total where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no编号) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


