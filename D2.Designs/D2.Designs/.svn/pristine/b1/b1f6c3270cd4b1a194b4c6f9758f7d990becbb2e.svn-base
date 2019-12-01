DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_红冲蓝补交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UpdateExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UpdateExgpPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_curr_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_lngsht_type int;
    declare v_hedge_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_curr_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{当前数量}][@变动数量#] */
    set v_jour_occur_field = concat("当前数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


    /* [更新表记录][产品外盘期货_持仓_交易组持仓表][{当前数量} = {当前数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.1.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][{当前数量},{结算价},{合约乘数}][@当前数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select curr_qty,sett_price,contrc_unit into v_curr_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|");


    /* if @变动数量# > 0 then */
    if v_occur_qty > 0 then

        /* set @业务标志# = 《业务标志-持仓蓝补》; */
        set v_busi_flag = 1103002;
    else

        /* set @业务标志# = 《业务标志-持仓红冲》; */
        set v_busi_flag = 1103001;
    end if;

    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品外盘期货_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_exgp_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_busi_flag, v_occur_qty, 
        v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.1.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_FrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_FrozenExgpPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_持仓_交易组持仓表][{冻结数量} = {冻结数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][{冻结数量},{结算价},{合约乘数}][@冻结数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select frozen_qty,sett_price,contrc_unit into v_frozen_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
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

    /* [插入表记录][产品外盘期货_持仓_交易组持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_frozen_type, v_occur_qty, 
        v_expire_date, v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.2.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_取消冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UndoFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UndoFrozenExgpPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_持仓_交易组持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.3.3.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_交易组持仓表][{冻结数量} = {冻结数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][{冻结数量},{结算价},{合约乘数}][@冻结数量#,@结算价#,@合约乘数#][{资产账户编号}=@资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select frozen_qty,sett_price,contrc_unit into v_frozen_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_exgp_posi where asset_acco_no=v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_交易组持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.3.2";
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
use db_pdfofu;;

# 原子_产品外盘期货_持仓_解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UnFrozenExgpPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_持仓_交易组持仓表][{解冻数量} = {解冻数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][{解冻数量},{结算价},{合约乘数}][@解冻数量#,@结算价#,@合约乘数#][{资产账户编号}=@资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select unfroz_qty,sett_price,contrc_unit into v_unfroz_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_exgp_posi where asset_acco_no=v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
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

    /* [插入表记录][产品外盘期货_持仓_交易组持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_frozen_type, v_occur_qty, 
        v_expire_date, v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.4.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_取消解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UndoUnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UndoUnFrozenExgpPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_持仓_交易组持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.3.5.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_交易组持仓表][{解冻数量} = {解冻数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.5.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓表][{解冻数量},{结算价},{合约乘数}][@解冻数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#] */
    select unfroz_qty,sett_price,contrc_unit into v_unfroz_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_交易组持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.5.2";
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
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryExgpPosi(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_交易组持仓表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        sett_price, rece_margin, realize_pandl from db_pdfofu.tb_pdfopo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        sett_price, rece_margin, realize_pandl from db_pdfofu.tb_pdfopo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询历史交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryExgpPosi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryExgpPosi_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_历史交易组持仓表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#)  and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, sett_price, rece_margin, realize_pandl from db_pdfofu_his.tb_pdfopo_exgp_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no)  and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, sett_price, rece_margin, realize_pandl from db_pdfofu_his.tb_pdfopo_exgp_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no)  and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryExgpPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryExgpPosiJour(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_交易组持仓流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",@交易组编号#,";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pdfofu.tb_pdfopo_exgp_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",v_exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pdfofu.tb_pdfopo_exgp_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",v_exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询历史交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryExgpPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryExgpPosiJour_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品外盘期货_持仓_交易组持仓流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",@交易组编号#,";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and  {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pdfofu_his.tb_pdfopo_exgp_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",v_exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and  row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info from db_pdfofu_his.tb_pdfopo_exgp_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",v_exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and  row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_获取交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_GetExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_GetExgpPosiFrozenJour(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_init_date int;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品外盘期货_持仓_交易组持仓冻结解冻流水表][字段][字段变量][{记录序号} = @记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_frozen_type, 
        v_occur_qty, v_expire_date, v_jour_status, v_oper_remark_info from db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour where row_id = v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.33.4";
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
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryExgpPosiFrozenJour(
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
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_交易组持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and (@流水状态# = " " or {流水状态} = @流水状态#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, oper_remark_info from db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, oper_remark_info from db_pdfofu.tb_pdfopo_exgp_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询历史交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryExgpPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryExgpPosiFrozenJour_His(
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
    SET v_frozen_type = p_frozen_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品外盘期货_持仓_交易组持仓冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号权限串},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, oper_remark_info from db_pdfofu_his.tb_pdfopo_exgp_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no_rights_str,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, frozen_type, 
        occur_qty, expire_date, jour_status, oper_remark_info from db_pdfofu_his.tb_pdfopo_exgp_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no_rights_str,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_红冲蓝补资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UpdateAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UpdateAsacPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_update_date int;
    declare v_update_time int;
    declare v_curr_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_curr_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [获取流水变动][{当前数量}][@变动数量#] */
    set v_jour_occur_field = concat("当前数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


    /* [更新表记录][产品外盘期货_持仓_资产账户持仓表][{当前数量} = {当前数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, curr_qty = curr_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.51.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][{当前数量},{结算价},{合约乘数}][@当前数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select curr_qty,sett_price,contrc_unit into v_curr_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取流水后信息][@当前数量#] */
    set v_jour_after_occur_info = concat(v_curr_qty,"|");


    /* if @变动数量# > 0 then */
    if v_occur_qty > 0 then

        /* set @业务标志# = 《业务标志-持仓蓝补》; */
        set v_busi_flag = 1103002;
    else

        /* set @业务标志# = 《业务标志-持仓红冲》; */
        set v_busi_flag = 1103001;
    end if;

    /* set @变动后数量# = @当前数量#; */
    set v_occur_end_qty = v_curr_qty;

    /* set @操作菜单# = @菜单编号#; */
    set v_oper_menu_no = v_menu_no;

    /* set @操作功能# = @功能编码#; */
    set v_oper_func_code = v_func_code;

    /* [插入表记录][产品外盘期货_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_asac_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_busi_flag, v_occur_qty, v_occur_end_qty, 
        v_jour_occur_field, v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.51.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_FrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_FrozenAsacPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_持仓_资产账户持仓表][{冻结数量} = {冻结数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][{冻结数量},{结算价},{合约乘数}][@冻结数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select frozen_qty,sett_price,contrc_unit into v_frozen_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
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

    /* [插入表记录][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_asac_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_frozen_type, v_occur_qty, v_expire_date, 
        v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.52.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_取消冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UndoFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UndoFrozenAsacPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfopo_asac_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.3.53.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_资产账户持仓表][{冻结数量} = {冻结数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][{冻结数量},{结算价},{合约乘数}][@冻结数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select frozen_qty,sett_price,contrc_unit into v_frozen_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.53.2";
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
use db_pdfofu;;

# 原子_产品外盘期货_持仓_解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UnFrozenAsacPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_jour_status varchar(2);
    declare v_frozen_type int;
    declare v_oper_menu_no int;
    declare v_oper_func_code varchar(16);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_times int;
    declare v_lngsht_type int;
    declare v_hedge_type int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;

    
    label_pro:BEGIN
    

    /* [更新表记录][产品外盘期货_持仓_资产账户持仓表][{解冻数量} = {解冻数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][{解冻数量},{结算价},{合约乘数}][@解冻数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select unfroz_qty,sett_price,contrc_unit into v_unfroz_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.54.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
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

    /* [插入表记录][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_asac_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_frozen_type, v_occur_qty, v_expire_date, 
        v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_取消解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_UndoUnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_UndoUnFrozenAsacPosi(
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
    IN p_occur_qty decimal(18,2),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfofu.tb_pdfopo_asac_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfofuA.3.55.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_资产账户持仓表][{解冻数量} = {解冻数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓表][{解冻数量},{结算价},{合约乘数}][@解冻数量#,@结算价#,@合约乘数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    select unfroz_qty,sett_price,contrc_unit into v_unfroz_qty,v_sett_price,v_contrc_unit from db_pdfofu.tb_pdfopo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfofu.tb_pdfopo_asac_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.55.2";
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
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryAsacPosi(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_资产账户持仓表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, sett_price, 
        rece_margin, realize_pandl from db_pdfofu.tb_pdfopo_asac_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, sett_price, 
        rece_margin, realize_pandl from db_pdfofu.tb_pdfopo_asac_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询历史资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryAsacPosi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryAsacPosi_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_历史资产账户持仓表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        sett_price, rece_margin, realize_pandl from db_pdfofu_his.tb_pdfopo_asac_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, contrc_unit, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        sett_price, rece_margin, realize_pandl from db_pdfofu_his.tb_pdfopo_asac_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryAsacPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryAsacPosiJour(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_资产账户持仓流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfopo_asac_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu.tb_pdfopo_asac_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询历史资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryAsacPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryAsacPosiJour_His(
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
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品外盘期货_持仓_资产账户持仓流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfopo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, busi_flag, occur_qty, 
        occur_end_qty, jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfofu_his.tb_pdfopo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_获取资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_GetAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_GetAsacPosiFrozenJour(
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_oper_menu_no int;
    declare v_init_date int;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_oper_menu_no = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_oper_remark_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][{记录序号} = @记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_frozen_type, v_occur_qty, 
        v_expire_date, v_jour_status, v_oper_remark_info from db_pdfofu.tb_pdfopo_asac_posi_frozen_jour where row_id = v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfofuA.3.83.4";
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
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryAsacPosiFrozenJour(
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
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_资产账户持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and (@流水状态# = " " or {流水状态} = @流水状态#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, oper_remark_info from db_pdfofu.tb_pdfopo_asac_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, oper_remark_info from db_pdfofu.tb_pdfopo_asac_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询历史资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryAsacPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryAsacPosiFrozenJour_His(
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
    SET v_frozen_type = p_frozen_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品外盘期货_持仓_资产账户持仓冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, oper_remark_info from db_pdfofu_his.tb_pdfopo_asac_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, frozen_type, occur_qty, 
        expire_date, jour_status, oper_remark_info from db_pdfofu_his.tb_pdfopo_asac_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_转入外部持仓流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_AddOutPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_AddOutPosiJour(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_pass_stock_jour_no int,
    IN p_busi_flag int,
    IN p_sett_price decimal(16,9),
    IN p_entry_qty decimal(18,2),
    IN p_entry_end_qty decimal(18,2),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_pass_stock_jour_no int;
    declare v_busi_flag int;
    declare v_sett_price decimal(16,9);
    declare v_entry_qty decimal(18,2);
    declare v_entry_end_qty decimal(18,2);
    declare v_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_pass_stock_jour_no = p_pass_stock_jour_no;
    SET v_busi_flag = p_busi_flag;
    SET v_sett_price = p_sett_price;
    SET v_entry_qty = p_entry_qty;
    SET v_entry_end_qty = p_entry_end_qty;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品外盘期货_持仓_外部持仓流水表][字段][字段变量][1][@通道编号#,@外部账号#,@通道持仓流水号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_out_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_no, futu_acco, contrc_code, 
        pass_stock_jour_no, busi_flag, sett_price, entry_qty, 
        entry_end_qty, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_no, v_futu_acco, v_contrc_code, 
        v_pass_stock_jour_no, v_busi_flag, v_sett_price, v_entry_qty, 
        v_entry_end_qty, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.101.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","通道持仓流水号=",v_pass_stock_jour_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询外部持仓流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryOutPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryOutPosiJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_外部持仓流水表][字段][{初始化日期}<=@初始化日期# and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#)  and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, pass_stock_jour_no, busi_flag, sett_price, 
        entry_qty, entry_end_qty, remark_info from db_pdfofu.tb_pdfopo_out_posi_jour where init_date<=v_init_date and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code)  and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, pass_stock_jour_no, busi_flag, sett_price, 
        entry_qty, entry_end_qty, remark_info from db_pdfofu.tb_pdfopo_out_posi_jour where init_date<=v_init_date and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code)  and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_转入外部订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_AddOutOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_AddOutOrder(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品外盘期货_持仓_外部订单表][字段][字段变量][1][@通道编号#,@外部账号#,@申报日期#,@申报编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_out_order(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_no, futu_acco, contrc_code, 
        report_date, report_time, report_no, order_dir, 
        order_price, order_qty, strike_price, strike_qty, 
        strike_amt, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_no, v_futu_acco, v_contrc_code, 
        v_report_date, v_report_time, v_report_no, v_order_dir, 
        v_order_price, v_order_qty, v_strike_price, v_strike_qty, 
        v_strike_amt, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.111.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","申报日期=",v_report_date,",","申报编号=",v_report_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询外部订单记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryOutOrder;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryOutOrder(
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
    IN p_report_date int,
    IN p_report_no varchar(32),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_report_date int;
    declare v_report_no varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_report_date = p_report_date;
    SET v_report_no = p_report_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_外部订单表][字段][{初始化日期}<=@初始化日期# and (@通道编号#=0 or {通道编号}=@通道编号#) and (@申报日期#=0 or {申报日期}=@申报日期#) and (@申报编号#=0 or {申报编号}>@申报编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_dir, order_price, order_qty, strike_price, 
        strike_qty, strike_amt, remark_info from db_pdfofu.tb_pdfopo_out_order where init_date<=v_init_date and (v_pass_no=0 or pass_no=v_pass_no) and (v_report_date=0 or report_date=v_report_date) and (v_report_no=0 or report_no>v_report_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, report_date, report_time, report_no, 
        order_dir, order_price, order_qty, strike_price, 
        strike_qty, strike_amt, remark_info from db_pdfofu.tb_pdfopo_out_order where init_date<=v_init_date and (v_pass_no=0 or pass_no=v_pass_no) and (v_report_date=0 or report_date=v_report_date) and (v_report_no=0 or report_no>v_report_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_转入外部成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_AddOutBusi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_AddOutBusi(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_dir int,
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_dir int;
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_dir = p_order_dir;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品外盘期货_持仓_外部成交表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_out_busi(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, exch_no, futu_acco, contrc_code, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_dir, strike_price, 
        strike_qty, strike_amt, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_exch_no, v_futu_acco, v_contrc_code, 
        v_strike_date, v_strike_time, v_strike_no, v_report_date, 
        v_report_time, v_report_no, v_order_dir, v_strike_price, 
        v_strike_qty, v_strike_amt, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.121.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询外部成交记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryOutBusi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryOutBusi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_strike_date int,
    IN p_strike_no varchar(64),
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_order_dir_str varchar(1024),
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
    declare v_strike_date int;
    declare v_strike_no varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_order_dir_str varchar(1024);
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
    SET v_strike_date = p_strike_date;
    SET v_strike_no = p_strike_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_order_dir_str = p_order_dir_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_外部成交表][字段][{初始化日期}<=@初始化日期# and (@通道编号#=0 or {通道编号}=@通道编号#) and (@成交日期#=0 or {成交日期}=@成交日期#) and (@成交编号#=0 or {成交编号}>@成交编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#) and (@订单方向串#=" " or instr(@订单方向串#, concat(";",{订单方向},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_dir, 
        strike_price, strike_qty, strike_amt, remark_info from db_pdfofu.tb_pdfopo_out_busi where init_date<=v_init_date and (v_pass_no=0 or pass_no=v_pass_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, exch_no, futu_acco, 
        contrc_code, strike_date, strike_time, strike_no, 
        report_date, report_time, report_no, order_dir, 
        strike_price, strike_qty, strike_amt, remark_info from db_pdfofu.tb_pdfopo_out_busi where init_date<=v_init_date and (v_pass_no=0 or pass_no=v_pass_no) and (v_strike_date=0 or strike_date=v_strike_date) and (v_strike_no=0 or strike_no>v_strike_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_order_dir_str=" " or instr(v_order_dir_str, concat(";",order_dir,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_转入外部交割流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_AddOutDeliJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_AddOutDeliJour(
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
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
    IN p_pass_deli_jour_no bigint,
    IN p_strike_date int,
    IN p_strike_time int,
    IN p_strike_no varchar(64),
    IN p_report_date int,
    IN p_report_time int,
    IN p_report_no varchar(32),
    IN p_order_dir int,
    IN p_order_price decimal(16,9),
    IN p_order_qty decimal(18,2),
    IN p_sett_price decimal(16,9),
    IN p_strike_price decimal(16,9),
    IN p_strike_qty decimal(18,2),
    IN p_strike_amt decimal(18,4),
    IN p_strike_num int,
    IN p_rece_margin decimal(18,4),
    IN p_out_all_fee decimal(18,4),
    IN p_out_report_fee decimal(18,4),
    IN p_out_cancel_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
    IN p_out_other_fee decimal(18,4),
    IN p_out_brkage_commis decimal(18,4),
    IN p_out_other_commis decimal(18,4),
    IN p_entry_end_qty decimal(18,2),
    IN p_entry_end_amt decimal(18,4),
    IN p_busi_flag int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
    declare v_pass_deli_jour_no bigint;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_rece_margin decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_entry_end_qty decimal(18,2);
    declare v_entry_end_amt decimal(18,4);
    declare v_busi_flag int;
    declare v_remark_info varchar(255);
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_pass_deli_jour_no = p_pass_deli_jour_no;
    SET v_strike_date = p_strike_date;
    SET v_strike_time = p_strike_time;
    SET v_strike_no = p_strike_no;
    SET v_report_date = p_report_date;
    SET v_report_time = p_report_time;
    SET v_report_no = p_report_no;
    SET v_order_dir = p_order_dir;
    SET v_order_price = p_order_price;
    SET v_order_qty = p_order_qty;
    SET v_sett_price = p_sett_price;
    SET v_strike_price = p_strike_price;
    SET v_strike_qty = p_strike_qty;
    SET v_strike_amt = p_strike_amt;
    SET v_strike_num = p_strike_num;
    SET v_rece_margin = p_rece_margin;
    SET v_out_all_fee = p_out_all_fee;
    SET v_out_report_fee = p_out_report_fee;
    SET v_out_cancel_fee = p_out_cancel_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_out_other_fee = p_out_other_fee;
    SET v_out_brkage_commis = p_out_brkage_commis;
    SET v_out_other_commis = p_out_other_commis;
    SET v_entry_end_qty = p_entry_end_qty;
    SET v_entry_end_amt = p_entry_end_amt;
    SET v_busi_flag = p_busi_flag;
    SET v_remark_info = p_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入表记录][产品外盘期货_持仓_外部交割流水表][字段][字段变量][1][@通道编号#,@外部账号#,@初始化日期#,@通道交割流水号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfofu.tb_pdfopo_out_deli_jour(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_no, futu_acco, 
        contrc_code, pass_deli_jour_no, strike_date, strike_time, 
        strike_no, report_date, report_time, report_no, 
        order_dir, order_price, order_qty, sett_price, 
        strike_price, strike_qty, strike_amt, strike_num, 
        entry_end_qty, entry_end_amt, rece_margin, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_other_fee, 
        out_brkage_commis, out_other_commis, busi_flag, remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_no, v_futu_acco, 
        v_contrc_code, v_pass_deli_jour_no, v_strike_date, v_strike_time, 
        v_strike_no, v_report_date, v_report_time, v_report_no, 
        v_order_dir, v_order_price, v_order_qty, v_sett_price, 
        v_strike_price, v_strike_qty, v_strike_amt, v_strike_num, 
        v_entry_end_qty, v_entry_end_amt, v_rece_margin, v_out_all_fee, 
        v_out_report_fee, v_out_cancel_fee, v_out_deli_fee, v_out_other_fee, 
        v_out_brkage_commis, v_out_other_commis, v_busi_flag, v_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfofuA.3.131.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","初始化日期=",v_init_date,",","通道交割流水号=",v_pass_deli_jour_no),"#",v_mysql_message);
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询外部交割流水记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryOutDeliJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryOutDeliJour(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco varchar(16),
    IN p_contrc_code varchar(6),
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
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco varchar(16);
    declare v_contrc_code varchar(6);
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
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco = p_futu_acco;
    SET v_contrc_code = p_contrc_code;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_外部交割流水表][字段][{初始化日期}<=@初始化日期# and {通道编号}=@通道编号# and {初始化日期}=@初始化日期# and (@外部账号#=" " or {外部账号}=@外部账号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码#=" " or {交易编码}=@交易编码#) and (@合约代码#=" " or {合约代码}=@合约代码#) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_no, 
        futu_acco, contrc_code, pass_deli_jour_no, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_dir, order_price, order_qty, 
        sett_price, strike_price, strike_qty, strike_amt, 
        strike_num, entry_end_qty, entry_end_amt, rece_margin, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, busi_flag, 
        remark_info from db_pdfofu.tb_pdfopo_out_deli_jour where init_date<=v_init_date and pass_no=v_pass_no and init_date=v_init_date and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_no, 
        futu_acco, contrc_code, pass_deli_jour_no, strike_date, 
        strike_time, strike_no, report_date, report_time, 
        report_no, order_dir, order_price, order_qty, 
        sett_price, strike_price, strike_qty, strike_amt, 
        strike_num, entry_end_qty, entry_end_amt, rece_margin, 
        out_all_fee, out_report_fee, out_cancel_fee, out_deli_fee, 
        out_other_fee, out_brkage_commis, out_other_commis, busi_flag, 
        remark_info from db_pdfofu.tb_pdfopo_out_deli_jour where init_date<=v_init_date and pass_no=v_pass_no and init_date=v_init_date and (v_out_acco=" " or out_acco=v_out_acco) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco=" " or futu_acco=v_futu_acco) and (v_contrc_code=" " or contrc_code=v_contrc_code) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询对账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryDeli;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryDeli(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
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
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
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
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品外盘期货_持仓_对账表][字段][{初始化日期}<=@初始化日期# and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码编号#=0 or {交易编码编号}=@交易编码编号#) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, entry_jour_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        sett_price, strike_price, strike_qty, strike_amt, 
        strike_num, entry_qty, entry_amt, rece_margin, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_other_fee, 
        out_brkage_commis, out_other_commis, busi_flag, deli_status, 
        remark_info from db_pdfofu.tb_pdfopo_deli where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, entry_jour_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        sett_price, strike_price, strike_qty, strike_amt, 
        strike_num, entry_qty, entry_amt, rece_margin, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_other_fee, 
        out_brkage_commis, out_other_commis, busi_flag, deli_status, 
        remark_info from db_pdfofu.tb_pdfopo_deli where init_date<=v_init_date and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfofu;;

# 原子_产品外盘期货_持仓_查询历史对账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfopo_QueryDeliHis;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfopo_QueryDeliHis(
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
    IN p_asset_acco_no int,
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品外盘期货_持仓_对账表][字段][({初始化日期} between @开始日期# and @结束日期#) and (@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码编号#=0 or {交易编码编号}=@交易编码编号#) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, entry_jour_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        sett_price, strike_price, strike_qty, strike_amt, 
        strike_num, entry_qty, entry_amt, rece_margin, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_other_fee, 
        out_brkage_commis, out_other_commis, busi_flag, deli_status, 
        remark_info from db_pdfofu_his.tb_pdfopo_deli_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, entry_jour_no, 
        strike_date, strike_time, strike_no, report_date, 
        report_time, report_no, order_date, order_time, 
        order_no, order_dir, order_price, order_qty, 
        sett_price, strike_price, strike_qty, strike_amt, 
        strike_num, entry_qty, entry_amt, rece_margin, 
        all_fee, report_fee, wtdraw_fee, deli_fee, 
        other_fee, trade_commis, other_commis, out_all_fee, 
        out_report_fee, out_cancel_fee, out_deli_fee, out_other_fee, 
        out_brkage_commis, out_other_commis, busi_flag, deli_status, 
        remark_info from db_pdfofu_his.tb_pdfopo_deli_his where (init_date between v_begin_date and v_end_date) and (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


