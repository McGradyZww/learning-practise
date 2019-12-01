DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_红冲蓝补交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UpdateExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UpdateExgpPosi(
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
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_sett_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_sett_flag int;
    declare v_open_amount decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_exch_group_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_sett_price = p_sett_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_rece_margin = 0;
    SET v_sett_flag = 0;
    SET v_open_amount = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_exch_group_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{当前数量}][@变动数量#] */
    set v_jour_occur_field = concat("当前数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @应收保证金# = 0; */
    set v_rece_margin = 0;

    /* set @结算价# = 0; */
    set v_sett_price = 0;

    /* set @清算结算标志# = 《清算结算标志-未处理》; */
    set v_sett_flag = 2;

    /* set @开仓金额# = 0; */
    set v_open_amount = 0;

    /* [插入重复更新][产品期货_持仓_交易组持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#][1][@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_lngsht_type, v_hedge_type, 
        v_comb_code, v_contrc_unit, v_begin_qty, v_curr_qty, 
        v_frozen_qty, v_unfroz_qty, v_pre_settle_price, v_sett_price, 
        v_rece_margin, v_sett_flag, v_open_amount) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.1.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_交易组持仓表][{当前数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@当前数量#,@结算价#,@合约乘数#,@交易组持仓序号#,@交易组合约乘数#,@交易组合约类型#,@交易组多空类型#,@交易组组合编码#,@交易组套保标志#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组昨结算价#,@交易组结算价#,@交易组应收保证金#,@交易组更新次数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select curr_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_curr_qty,v_sett_price,v_contrc_unit,v_exgp_posi_id,v_exgp_contrc_unit,v_exgp_contrc_type,v_exgp_lngsht_type,v_exgp_comb_code,v_exgp_hedge_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_pre_settle_price,v_exgp_sett_price,v_exgp_rece_margin,v_exch_group_update_times from db_pdfutu.tb_pdfupo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.1.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
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

    /* [插入表记录][产品期货_持仓_交易组持仓流水表][字段][字段变量][5][@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_exgp_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
        v_busi_flag, v_occur_qty, v_occur_end_qty, v_jour_occur_field, 
        v_jour_after_occur_info, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.1.5";
        SET v_error_info =  CONCAT(concat("交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_FrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_FrozenExgpPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品期货_持仓_交易组持仓表][{冻结数量} = {冻结数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.2.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_交易组持仓表][{冻结数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@冻结数量#,@结算价#,@合约乘数#,@交易组持仓序号#,@交易组合约乘数#,@交易组合约类型#,@交易组多空类型#,@交易组组合编码#,@交易组套保标志#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组昨结算价#,@交易组结算价#,@交易组应收保证金#,@交易组更新次数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select frozen_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_frozen_qty,v_sett_price,v_contrc_unit,v_exgp_posi_id,v_exgp_contrc_unit,v_exgp_contrc_type,v_exgp_lngsht_type,v_exgp_comb_code,v_exgp_hedge_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_pre_settle_price,v_exgp_sett_price,v_exgp_rece_margin,v_exch_group_update_times from db_pdfutu.tb_pdfupo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.2.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
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

    /* [插入表记录][产品期货_持仓_交易组持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
        v_frozen_type, v_occur_qty, v_expire_date, v_jour_status, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.2.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_取消冻结交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UndoFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UndoFrozenExgpPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_持仓_交易组持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.3.3.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_交易组持仓表][{冻结数量} = {冻结数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_交易组持仓表][{冻结数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{组合编码},{多空类型},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@冻结数量#,@结算价#,@合约乘数#,@交易组持仓序号#,@交易组合约乘数#,@交易组合约类型#,@交易组组合编码#,@交易组多空类型#,@交易组套保标志#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组昨结算价#,@交易组结算价#,@交易组应收保证金#,@交易组更新次数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select frozen_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,comb_code,lngsht_type,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_frozen_qty,v_sett_price,v_contrc_unit,v_exgp_posi_id,v_exgp_contrc_unit,v_exgp_contrc_type,v_exgp_comb_code,v_exgp_lngsht_type,v_exgp_hedge_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_pre_settle_price,v_exgp_sett_price,v_exgp_rece_margin,v_exch_group_update_times from db_pdfutu.tb_pdfupo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.3.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_交易组持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.3.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UnFrozenExgpPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_exch_group_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品期货_持仓_交易组持仓表][{解冻数量} = {解冻数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.4.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_交易组持仓表][{解冻数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@解冻数量#,@结算价#,@合约乘数#,@交易组持仓序号#,@交易组合约乘数#,@交易组合约类型#,@交易组多空类型#,@交易组组合编码#,@交易组套保标志#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组昨结算价#,@交易组结算价#,@交易组应收保证金#,@交易组更新次数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select unfroz_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_unfroz_qty,v_sett_price,v_contrc_unit,v_exgp_posi_id,v_exgp_contrc_unit,v_exgp_contrc_type,v_exgp_lngsht_type,v_exgp_comb_code,v_exgp_hedge_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_pre_settle_price,v_exgp_sett_price,v_exgp_rece_margin,v_exch_group_update_times from db_pdfutu.tb_pdfupo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.4.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
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

    /* [插入表记录][产品期货_持仓_交易组持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
        v_frozen_type, v_occur_qty, v_expire_date, v_jour_status, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.4.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_取消解冻交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UndoUnFrozenExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UndoUnFrozenExgpPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_exch_group_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_持仓_交易组持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.3.5.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_交易组持仓表][{解冻数量} = {解冻数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.5.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_交易组持仓表][{解冻数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@解冻数量#,@结算价#,@合约乘数#,@交易组持仓序号#,@交易组合约乘数#,@交易组合约类型#,@交易组多空类型#,@交易组组合编码#,@交易组套保标志#,@交易组期初数量#,@交易组当前数量#,@交易组冻结数量#,@交易组解冻数量#,@交易组昨结算价#,@交易组结算价#,@交易组应收保证金#,@交易组更新次数#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select unfroz_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_unfroz_qty,v_sett_price,v_contrc_unit,v_exgp_posi_id,v_exgp_contrc_unit,v_exgp_contrc_type,v_exgp_lngsht_type,v_exgp_comb_code,v_exgp_hedge_type,v_exch_group_begin_qty,v_exgp_curr_qty,v_exgp_frozen_qty,v_exgp_unfroz_qty,v_exgp_pre_settle_price,v_exgp_sett_price,v_exgp_rece_margin,v_exch_group_update_times from db_pdfutu.tb_pdfupo_exgp_posi where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.5.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易组编号=",v_exch_group_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_交易组持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.5.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @交易组更新次数#; */
    set v_update_times = v_exch_group_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryExgpPosi(
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_交易组持仓表][字段][{机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and ({当前数量}<>0 or {冻结数量}<>0 or {解冻数量}<>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount from db_pdfutu.tb_pdfupo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (curr_qty<>0 or frozen_qty<>0 or unfroz_qty<>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount from db_pdfutu.tb_pdfupo_exgp_posi where co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (curr_qty<>0 or frozen_qty<>0 or unfroz_qty<>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询历史交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryExgpPosi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryExgpPosi_His(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_历史交易组持仓表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        lngsht_type, hedge_type, comb_code, contrc_unit, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        pre_settle_price, sett_price, rece_margin, sett_flag, 
        open_amount from db_pdfutu_his.tb_pdfupo_exgp_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        lngsht_type, hedge_type, comb_code, contrc_unit, 
        begin_qty, curr_qty, frozen_qty, unfroz_qty, 
        pre_settle_price, sett_price, rece_margin, sett_flag, 
        open_amount from db_pdfutu_his.tb_pdfupo_exgp_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryExgpPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryExgpPosiJour(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_交易组持仓流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfupo_exgp_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfupo_exgp_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询历史交易组持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryExgpPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryExgpPosiJour_His(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品期货_持仓_交易组持仓流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfupo_exgp_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfupo_exgp_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_获取交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_GetExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_GetExgpPosiFrozenJour(
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
    

    /* [获取表记录变量][产品期货_持仓_交易组持仓冻结解冻流水表][字段][字段变量][{记录序号} = @记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_group_no, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_lngsht_type, 
        v_hedge_type, v_frozen_type, v_occur_qty, v_expire_date, 
        v_jour_status, v_oper_remark_info from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour where row_id = v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.33.4";
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
use db_pdfutu;;

# 原子_产品期货_持仓_查询交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryExgpPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryExgpPosiFrozenJour(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_交易组持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and (@流水状态# = " " or {流水状态} = @流水状态#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询历史交易组持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryExgpPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryExgpPosiFrozenJour_His(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_exch_group_no_rights_str = p_exch_group_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品期货_持仓_交易组持仓冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@交易组编号# = 0 or {交易组编号} = @交易组编号#) and instr(@交易组编号权限串#,concat(";",{交易组编号权限串},";"))>0 and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and {记录序号} > @记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info from db_pdfutu_his.tb_pdfupo_exgp_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no_rights_str,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id > v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info from db_pdfutu_his.tb_pdfupo_exgp_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and (v_exch_group_no = 0 or exch_group_no = v_exch_group_no) and instr(v_exch_group_no_rights_str,concat(";",exch_group_no_rights_str,";"))>0 and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id > v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_红冲蓝补资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UpdateAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UpdateAsacPosi(
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
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_sett_price decimal(16,9),
    IN p_pre_settle_price decimal(16,9),
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_comb_code varchar(6),
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_sett_price decimal(16,9);
    declare v_pre_settle_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_jour_occur_field varchar(2048);
    declare v_jour_occur_info varchar(2048);
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_sett_flag int;
    declare v_open_amount decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_asac_update_times int;
    declare v_jour_after_occur_info varchar(2048);
    declare v_busi_flag int;
    declare v_occur_end_qty decimal(18,2);
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_sett_price = p_sett_price;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_comb_code = p_comb_code;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_jour_occur_field = " ";
    SET v_jour_occur_info = " ";
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_rece_margin = 0;
    SET v_sett_flag = 0;
    SET v_open_amount = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_asac_update_times = 0;
    SET v_jour_after_occur_info = " ";
    SET v_busi_flag = 0;
    SET v_occur_end_qty = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";

    
    label_pro:BEGIN
    

    /* [获取流水变动][{当前数量}][@变动数量#] */
    set v_jour_occur_field = concat("当前数量","|");
    set v_jour_occur_info = concat(v_occur_qty,"|");


    /* set @期初数量# = 0; */
    set v_begin_qty = 0;

    /* set @当前数量# = @变动数量#; */
    set v_curr_qty = v_occur_qty;

    /* set @冻结数量# = 0; */
    set v_frozen_qty = 0;

    /* set @解冻数量# = 0; */
    set v_unfroz_qty = 0;

    /* set @应收保证金# = 0; */
    set v_rece_margin = 0;

    /* set @结算价# = 0; */
    set v_sett_price = 0;

    /* set @清算结算标志# = 《清算结算标志-未处理》; */
    set v_sett_flag = 2;

    /* set @开仓金额# = 0; */
    set v_open_amount = 0;

    /* [插入重复更新][产品期货_持仓_资产账户持仓表][字段][字段变量][{当前数量} = {当前数量} + @变动数量#][1][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, pre_settle_price, sett_price, rece_margin, 
        sett_flag, open_amount) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_lngsht_type, v_hedge_type, v_comb_code, 
        v_contrc_unit, v_begin_qty, v_curr_qty, v_frozen_qty, 
        v_unfroz_qty, v_pre_settle_price, v_sett_price, v_rece_margin, 
        v_sett_flag, v_open_amount) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, curr_qty = curr_qty + v_occur_qty;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.51.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;

    #[更新表记录][产品期货_持仓_资产账户持仓表][{当前数量} = {当前数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#]

    /* [获取表记录变量][产品期货_持仓_资产账户持仓表][{当前数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@当前数量#,@结算价#,@合约乘数#,@资产账户持仓序号#,@资产账户合约乘数#,@资产账户合约类型#,@资产账户多空类型#,@资产账户组合编码#,@资产账户套保标志#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户昨结算价#,@资产账户结算价#,@资产账户应收保证金#,@资产账户更新次数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select curr_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_curr_qty,v_sett_price,v_contrc_unit,v_asac_posi_id,v_asac_contrc_unit,v_asac_contrc_type,v_asac_lngsht_type,v_asac_comb_code,v_asac_hedge_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_pre_settle_price,v_asac_sett_price,v_asac_rece_margin,v_asac_update_times from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.51.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
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

    /* [插入表记录][产品期货_持仓_资产账户持仓流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, lngsht_type, hedge_type, busi_flag, 
        occur_qty, occur_end_qty, jour_occur_field, jour_after_occur_info, 
        oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_lngsht_type, v_hedge_type, v_busi_flag, 
        v_occur_qty, v_occur_end_qty, v_jour_occur_field, v_jour_after_occur_info, 
        v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.51.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_FrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_FrozenAsacPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_asac_update_times int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_asac_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品期货_持仓_资产账户持仓表][{冻结数量} = {冻结数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.52.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_资产账户持仓表][{冻结数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{结算价},{结算价},{应收保证金},{更新次数}][@冻结数量#,@结算价#,@合约乘数#,@资产账户持仓序号#,@资产账户合约乘数#,@资产账户合约类型#,@资产账户多空类型#,@资产账户组合编码#,@资产账户套保标志#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户昨结算价#,@资产账户结算价#,@资产账户应收保证金#,@资产账户更新次数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select frozen_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,sett_price,sett_price,rece_margin,update_times into v_frozen_qty,v_sett_price,v_contrc_unit,v_asac_posi_id,v_asac_contrc_unit,v_asac_contrc_type,v_asac_lngsht_type,v_asac_comb_code,v_asac_hedge_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_pre_settle_price,v_asac_sett_price,v_asac_rece_margin,v_asac_update_times from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.52.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
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

    /* [插入表记录][产品期货_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, lngsht_type, hedge_type, frozen_type, 
        occur_qty, expire_date, jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_lngsht_type, v_hedge_type, v_frozen_type, 
        v_occur_qty, v_expire_date, v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.52.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_取消冻结资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UndoFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UndoFrozenAsacPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_frozen_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_frozen_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_持仓_资产账户持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.3.53.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_资产账户持仓表][{冻结数量} = {冻结数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, frozen_qty = frozen_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.53.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_资产账户持仓表][{冻结数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@冻结数量#,@结算价#,@合约乘数#,@资产账户持仓序号#,@资产账户合约乘数#,@资产账户合约类型#,@资产账户多空类型#,@资产账户组合编码#,@资产账户套保标志#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户昨结算价#,@资产账户结算价#,@资产账户应收保证金#,@资产账户更新次数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select frozen_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_frozen_qty,v_sett_price,v_contrc_unit,v_asac_posi_id,v_asac_contrc_unit,v_asac_contrc_type,v_asac_lngsht_type,v_asac_comb_code,v_asac_hedge_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_pre_settle_price,v_asac_sett_price,v_asac_rece_margin,v_asac_update_times from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.53.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_资产账户持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][5][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.53.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UnFrozenAsacPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_expire_date int,
    IN p_oper_remark_info varchar(255),
    IN p_menu_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_expire_date int;
    declare v_oper_remark_info varchar(255);
    declare v_menu_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
    declare v_asac_update_times int;
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_expire_date = p_expire_date;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_menu_no = p_menu_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_asac_update_times = 0;
    SET v_jour_status = "0";
    SET v_frozen_type = 0;
    SET v_oper_menu_no = 0;
    SET v_oper_func_code = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][产品期货_持仓_资产账户持仓表][{解冻数量} = {解冻数量} + @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty + v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.54.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_资产账户持仓表][{解冻数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@解冻数量#,@结算价#,@合约乘数#,@资产账户持仓序号#,@资产账户合约乘数#,@资产账户合约类型#,@资产账户多空类型#,@资产账户组合编码#,@资产账户套保标志#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户昨结算价#,@资产账户结算价#,@资产账户应收保证金#,@资产账户更新次数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select unfroz_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_unfroz_qty,v_sett_price,v_contrc_unit,v_asac_posi_id,v_asac_contrc_unit,v_asac_contrc_type,v_asac_lngsht_type,v_asac_comb_code,v_asac_hedge_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_pre_settle_price,v_asac_sett_price,v_asac_rece_margin,v_asac_update_times from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.54.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
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

    /* [插入表记录][产品期货_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][5][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi_frozen_jour(
        create_date, create_time, update_date, 
        update_time, update_times, opor_co_no, opor_no, 
        oper_mac, oper_ip_addr, oper_info, oper_way, 
        oper_menu_no, oper_func_code, init_date, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, lngsht_type, hedge_type, frozen_type, 
        occur_qty, expire_date, jour_status, oper_remark_info) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_opor_co_no, v_opor_no, 
        v_oper_mac, v_oper_ip_addr, v_oper_info, v_oper_way, 
        v_oper_menu_no, v_oper_func_code, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_lngsht_type, v_hedge_type, v_frozen_type, 
        v_occur_qty, v_expire_date, v_jour_status, v_oper_remark_info);
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.54.5";
        SET v_error_info =  CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_取消解冻资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UndoUnFrozenAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UndoUnFrozenAsacPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_occur_qty decimal(18,2),
    IN p_oper_remark_info varchar(255),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_occur_qty decimal(18,2);
    declare v_oper_remark_info varchar(255);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
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
    declare v_update_times int;
    declare v_jour_status varchar(2);
    declare v_update_date int;
    declare v_update_time int;
    declare v_unfroz_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_contrc_unit int;
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_occur_qty = p_occur_qty;
    SET v_oper_remark_info = p_oper_remark_info;
    SET v_error_code = "0";
    SET v_error_info = " ";
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
    SET v_update_times = 1;
    SET v_jour_status = "0";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_unfroz_qty = 0;
    SET v_sett_price = 0;
    SET v_contrc_unit = 0;
    SET v_asac_update_times = 0;

    
    label_pro:BEGIN
    

    /* [锁定获取表记录变量][产品期货_持仓_资产账户持仓冻结解冻流水表][{流水状态}][@流水状态#][{记录序号}=@记录序号#][4][@记录序号#] */
    select jour_status into v_jour_status from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour where row_id=v_row_id limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* [检查报错返回][@流水状态# <> 《流水状态-有效》][253][@流水状态#] */
    if v_jour_status <> "1" then
        
        SET v_error_code = "pdfutuA.3.55.253";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("流水状态=",v_jour_status),"#",v_mysql_message);
        else
            SET v_error_info = concat("流水状态=",v_jour_status);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_资产账户持仓表][{解冻数量} = {解冻数量} - @变动数量#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][2][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, unfroz_qty = unfroz_qty - v_occur_qty where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.55.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量][产品期货_持仓_资产账户持仓表][{解冻数量},{结算价},{合约乘数},{记录序号},{合约乘数},{合约类型},{多空类型},{组合编码},{套保标志},{期初数量},{当前数量},{冻结数量},{解冻数量},{昨结算价},{结算价},{应收保证金},{更新次数}][@解冻数量#,@结算价#,@合约乘数#,@资产账户持仓序号#,@资产账户合约乘数#,@资产账户合约类型#,@资产账户多空类型#,@资产账户组合编码#,@资产账户套保标志#,@资产账户期初数量#,@资产账户当前数量#,@资产账户冻结数量#,@资产账户解冻数量#,@资产账户昨结算价#,@资产账户结算价#,@资产账户应收保证金#,@资产账户更新次数#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#][4][@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#] */
    select unfroz_qty,sett_price,contrc_unit,row_id,contrc_unit,contrc_type,lngsht_type,comb_code,hedge_type,begin_qty,curr_qty,frozen_qty,unfroz_qty,pre_settle_price,sett_price,rece_margin,update_times into v_unfroz_qty,v_sett_price,v_contrc_unit,v_asac_posi_id,v_asac_contrc_unit,v_asac_contrc_type,v_asac_lngsht_type,v_asac_comb_code,v_asac_hedge_type,v_asac_begin_qty,v_asac_curr_qty,v_asac_frozen_qty,v_asac_unfroz_qty,v_asac_pre_settle_price,v_asac_sett_price,v_asac_rece_margin,v_asac_update_times from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.55.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_资产账户持仓冻结解冻流水表][{流水状态} = 《流水状态-无效》,{操作备注}=@操作备注#][{记录序号}=@记录序号#][5][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi_frozen_jour set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, jour_status = "2",oper_remark_info=v_oper_remark_info where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.55.5";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("记录序号=",v_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("记录序号=",v_row_id);
        end if;
        leave label_pro;
    end if;


    /* set @更新次数# = @资产账户更新次数#; */
    set v_update_times = v_asac_update_times;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
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
    SET p_update_times = v_update_times;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryAsacPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryAsacPosi(
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
    IN p_lngsht_type int,
    IN p_hedge_type int,
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_资产账户持仓表][字段][(@机构编号#=0  or  {机构编号} = @机构编号#) and (@产品编号# = 0 or {产品编号} = @产品编号#) and (@产品编号权限串#= ' ' or  instr(@产品编号权限串#,concat(";",{产品编号},";"))>0) and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and ({当前数量}<>0 or {冻结数量}<>0 or {解冻数量}<>0) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount from db_pdfutu.tb_pdfupo_asac_posi where (v_co_no=0  or  co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_pd_no_rights_str= ' ' or  instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (curr_qty<>0 or frozen_qty<>0 or unfroz_qty<>0) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount from db_pdfutu.tb_pdfupo_asac_posi where (v_co_no=0  or  co_no = v_co_no) and (v_pd_no = 0 or pd_no = v_pd_no) and (v_pd_no_rights_str= ' ' or  instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0) and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (curr_qty<>0 or frozen_qty<>0 or unfroz_qty<>0) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询历史资产账户持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryAsacPosi_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryAsacPosi_His(
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_历史资产账户持仓表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount from db_pdfutu_his.tb_pdfupo_asac_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount from db_pdfutu_his.tb_pdfupo_asac_posi_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryAsacPosiJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryAsacPosiJour(
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_资产账户持仓流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfupo_asac_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu.tb_pdfupo_asac_posi_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询历史资产账户持仓流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryAsacPosiJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryAsacPosiJour_His(
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品期货_持仓_资产账户持仓流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfupo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info from db_pdfutu_his.tb_pdfupo_asac_posi_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_获取资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_GetAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_GetAsacPosiFrozenJour(
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
    

    /* [获取表记录变量][产品期货_持仓_资产账户持仓冻结解冻流水表][字段][字段变量][{记录序号} = @记录序号#][4][@记录序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_opor_co_no, 
        v_opor_no, v_oper_mac, v_oper_ip_addr, v_oper_info, 
        v_oper_way, v_oper_menu_no, v_oper_func_code, v_init_date, 
        v_co_no, v_pd_no, v_asset_acco_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_lngsht_type, v_hedge_type, 
        v_frozen_type, v_occur_qty, v_expire_date, v_jour_status, 
        v_oper_remark_info from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour where row_id = v_row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.83.4";
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
use db_pdfutu;;

# 原子_产品期货_持仓_查询资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryAsacPosiFrozenJour;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryAsacPosiFrozenJour(
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_jour_status = p_jour_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][产品期货_持仓_资产账户持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and (@流水状态# = " " or {流水状态} = @流水状态#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour where init_date<=v_init_date and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and (v_jour_status = " " or jour_status = v_jour_status) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询历史资产账户持仓冻结解冻流水
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryAsacPosiFrozenJour_His;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryAsacPosiFrozenJour_His(
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
    declare v_lngsht_type int;
    declare v_hedge_type int;
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
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_frozen_type = p_frozen_type;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_pd_no_rights_str = p_pd_no_rights_str;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][历史_产品期货_持仓_资产账户持仓冻结解冻流水表][字段][({初始化日期} between @开始日期# and @结束日期#) and {机构编号} = @机构编号# and (@产品编号# = 0 or {产品编号} = @产品编号#) and instr(@产品编号权限串#,concat(";",{产品编号},";"))>0 and (@资产账户编号# = 0 or {资产账户编号} = @资产账户编号#) and (@市场编号串# = "; ;" or instr(@市场编号串#, concat(";", {市场编号}, ";")) > 0) and (@交易编码编号# = 0 or {交易编码编号} = @交易编码编号#) and (@合约代码编号# = 0 or {合约代码编号} = @合约代码编号#) and (@多空类型# = 0 or {多空类型} = @多空类型#) and (@套保标志# = 0 or {套保标志} = @套保标志#) and (@冻结解冻类型# = 0 or {冻结解冻类型} = @冻结解冻类型#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info from db_pdfutu_his.tb_pdfupo_asac_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info from db_pdfutu_his.tb_pdfupo_asac_posi_frozen_jour_his where (init_date between v_begin_date and v_end_date) and co_no = v_co_no and (v_pd_no = 0 or pd_no = v_pd_no) and instr(v_pd_no_rights_str,concat(";",pd_no,";"))>0 and (v_asset_acco_no = 0 or asset_acco_no = v_asset_acco_no) and (v_exch_no_str = "; ;" or instr(v_exch_no_str, concat(";", exch_no, ";")) > 0) and (v_futu_acco_no = 0 or futu_acco_no = v_futu_acco_no) and (v_contrc_code_no = 0 or contrc_code_no = v_contrc_code_no) and (v_lngsht_type = 0 or lngsht_type = v_lngsht_type) and (v_hedge_type = 0 or hedge_type = v_hedge_type) and (v_frozen_type = 0 or frozen_type = v_frozen_type) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_获取资产账户持仓可用
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_GetAsacPosiAvail;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_GetAsacPosiAvail(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_asset_acco_no int,
    IN p_default_exch_group_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_hedge_type int,
    IN p_lngsht_type int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_exch_group_no int,
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
    declare v_asset_acco_no int;
    declare v_default_exch_group_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_hedge_type int;
    declare v_lngsht_type int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_exch_group_no int;
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_tmp_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_hedge_type = p_hedge_type;
    SET v_lngsht_type = p_lngsht_type;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_exch_group_no = 0;
    SET v_curr_qty = 0;
    SET v_avail_qty = 0;
    SET v_rece_margin = 0;
    SET v_posi_qty = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_tmp_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量语句][产品期货_持仓_资产账户持仓表][{当前数量},{当前数量}-{冻结数量}+{解冻数量},{应收保证金}][@当前数量#,@可用数量#,@应收保证金#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
    select curr_qty,curr_qty-frozen_qty+unfroz_qty,rece_margin into v_curr_qty,v_avail_qty,v_rece_margin from db_pdfutu.tb_pdfupo_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;


    /* [获取表记录变量语句][产品期货_持仓_交易资产账户持仓表][{持仓数量},{老仓成交占用数量},{应收保证金}][@持仓数量#,@老仓成交占用数量#,@临时_应收保证金#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
    select posi_qty,pre_strike_capt_qty,rece_margin into v_posi_qty,v_pre_strike_capt_qty,v_tmp_rece_margin from db_pdfutu.tb_pdfupo_trd_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;


    /* set @当前数量# = @当前数量# + @持仓数量# - @老仓成交占用数量#; */
    set v_curr_qty = v_curr_qty + v_posi_qty - v_pre_strike_capt_qty;

    /* set @可用数量# = @可用数量# + @持仓数量# - @老仓成交占用数量#; */
    set v_avail_qty = v_avail_qty + v_posi_qty - v_pre_strike_capt_qty;

    /* set @应收保证金# = @应收保证金# + @临时_应收保证金#; */
    set v_rece_margin = v_rece_margin + v_tmp_rece_margin;
    #[获取表记录数量][产品期货_资金_交易组资金表][@记录个数#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#]
    #if @记录个数#=1 then
       #[获取表记录变量][产品期货_资金_交易组资金表][{交易组编号}][@交易组编号#][{资产账户编号}=@资产账户编号# and {本币币种}=@本币币种#][4][@资产账户编号#,@本币币种#]
    #else

        /* set @交易组编号# = @默认交易组编号#; */
        set v_exch_group_no = v_default_exch_group_no;
    #end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_exch_group_no = v_exch_group_no;
    SET p_curr_qty = v_curr_qty;
    SET p_avail_qty = v_avail_qty;
    SET p_rece_margin = v_rece_margin;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_转入外部期货持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_AddOutFutuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_AddOutFutuPosi(
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
    IN p_exch_no int,
    IN p_futu_acco varchar(16),
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
    IN p_out_curr_qty decimal(18,2),
    IN p_out_enable_qty decimal(18,2),
    IN p_out_rece_margin decimal(18,4),
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
    declare v_exch_group_no int;
    declare v_asac_busi_config_str varchar(64);
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_exch_no int;
    declare v_futu_acco varchar(16);
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
    declare v_out_curr_qty decimal(18,2);
    declare v_out_enable_qty decimal(18,2);
    declare v_out_rece_margin decimal(18,4);
    declare v_curr_qty decimal(18,2);
    declare v_avail_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_acco_curr_qty decimal(18,2);
    declare v_acco_avail_qty decimal(18,2);
    declare v_acco_rece_margin decimal(18,4);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_deal_flag int;
    declare v_asset_sync_flag int;
    declare v_remark_info varchar(255);
    declare v_acco_curr_qty_diff decimal(18,2);
    declare v_acco_avail_qty_diff decimal(18,2);
    declare v_acco_rece_margin_diff decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_no = p_exch_no;
    SET v_futu_acco = p_futu_acco;
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
    SET v_out_curr_qty = p_out_curr_qty;
    SET v_out_enable_qty = p_out_enable_qty;
    SET v_out_rece_margin = p_out_rece_margin;
    SET v_curr_qty = p_curr_qty;
    SET v_avail_qty = p_avail_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_acco_curr_qty = 0;
    SET v_acco_avail_qty = 0;
    SET v_acco_rece_margin = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_deal_flag = 0;
    SET v_asset_sync_flag = 0;
    SET v_remark_info = " ";
    SET v_acco_curr_qty_diff = 0;
    SET v_acco_avail_qty_diff = 0;
    SET v_acco_rece_margin_diff = 0;

    
    label_pro:BEGIN
    

    /* set @账户当前数量#=@当前数量#; */
    set v_acco_curr_qty=v_curr_qty;

    /* set @账户可用数量#=@可用数量#; */
    set v_acco_avail_qty=v_avail_qty;

    /* set @账户应收保证金# = @应收保证金#; */
    set v_acco_rece_margin = v_rece_margin;

    /* [插入重复更新][产品期货_持仓_外部资产账户持仓表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易编码编号}=@交易编码编号#, {合约代码编号}=@合约代码编号#, {合约名称}=@合约名称#, {合约乘数}=@合约乘数#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {外部应收保证金}=@外部应收保证金#][1][@初始化日期#,@通道编号#,@外部账号#,@市场编号#,@交易编码#,@合约代码#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_out_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, pass_no, out_acco, 
        exch_no, futu_acco_no, futu_acco, contrc_code_no, 
        contrc_code, contrc_name, lngsht_type, hedge_type, 
        contrc_unit, out_curr_qty, out_enable_qty, out_rece_margin) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_pass_no, v_out_acco, 
        v_exch_no, v_futu_acco_no, v_futu_acco, v_contrc_code_no, 
        v_contrc_code, v_contrc_name, v_lngsht_type, v_hedge_type, 
        v_contrc_unit, v_out_curr_qty, v_out_enable_qty, v_out_rece_margin) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, futu_acco_no=v_futu_acco_no, contrc_code_no=v_contrc_code_no, contrc_name=v_contrc_name, contrc_unit=v_contrc_unit, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, out_rece_margin=v_out_rece_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","交易编码=",v_futu_acco,",","合约代码=",v_contrc_code,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","交易编码=",v_futu_acco,",","合约代码=",v_contrc_code,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;


    /* if @外部当前数量# = 0 then */
    if v_out_curr_qty = 0 then

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

    /* set @账户当前数量差额#=@外部当前数量# - @账户当前数量#; */
    set v_acco_curr_qty_diff=v_out_curr_qty - v_acco_curr_qty;

    /* set @账户可用数量差额#=@外部可用数量# - @账户可用数量#; */
    set v_acco_avail_qty_diff=v_out_enable_qty - v_acco_avail_qty;

    /* set @账户应收保证金差额# = @外部应收保证金# - @账户应收保证金#; */
    set v_acco_rece_margin_diff = v_out_rece_margin - v_acco_rece_margin;

    /* [插入重复更新][产品期货_持仓_内外资产账户持仓差异表][字段][字段变量][{机构编号}=@机构编号#, {产品编号}=@产品编号#, {资产账户编号}=@资产账户编号#, {交易组编号}=@交易组编号#, {交易编码编号}=@交易编码编号#, {交易编码}=@交易编码#, {合约代码编号}=@合约代码编号#, {合约名称}=@合约名称#, {合约类型}=@合约类型#, {合约乘数}=@合约乘数#, {账户当前数量}=@账户当前数量#, {账户可用数量}=@账户可用数量#, {账户应收保证金}=@账户应收保证金#, {外部当前数量}=@外部当前数量#, {外部可用数量}=@外部可用数量#, {外部应收保证金}=@外部应收保证金#, {账户当前数量差额}=@账户当前数量差额#, {账户可用数量差额}=@账户可用数量差额#, {账户应收保证金差额}=@账户应收保证金差额#, {处理标志}=@处理标志#, {资产是否同步}=@资产是否同步#, {备注信息}=@备注信息#][1][@初始化日期#,@通道编号#,@外部账号#,@交易编码#,@市场编号#,@合约代码#,@多空类型#,@套保标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_asac_posi_diff (
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, asset_acco_no, exch_group_no, pass_no, 
        out_acco, exch_no, futu_acco_no, futu_acco, 
        contrc_code_no, contrc_code, contrc_name, contrc_type, 
        lngsht_type, hedge_type, comb_code, contrc_unit, 
        pre_settle_price, acco_curr_qty, acco_avail_qty, acco_rece_margin, 
        out_curr_qty, out_enable_qty, out_rece_margin, acco_curr_qty_diff, 
        acco_avail_qty_diff, acco_rece_margin_diff, deal_flag, asset_sync_flag, 
        remark_info) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_pass_no, 
        v_out_acco, v_exch_no, v_futu_acco_no, v_futu_acco, 
        v_contrc_code_no, v_contrc_code, v_contrc_name, v_contrc_type, 
        v_lngsht_type, v_hedge_type, v_comb_code, v_contrc_unit, 
        v_pre_settle_price, v_acco_curr_qty, v_acco_avail_qty, v_acco_rece_margin, 
        v_out_curr_qty, v_out_enable_qty, v_out_rece_margin, v_acco_curr_qty_diff, 
        v_acco_avail_qty_diff, v_acco_rece_margin_diff, v_deal_flag, v_asset_sync_flag, 
        v_remark_info) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, co_no=v_co_no, pd_no=v_pd_no, asset_acco_no=v_asset_acco_no, exch_group_no=v_exch_group_no, futu_acco_no=v_futu_acco_no, futu_acco=v_futu_acco, contrc_code_no=v_contrc_code_no, contrc_name=v_contrc_name, contrc_type=v_contrc_type, contrc_unit=v_contrc_unit, acco_curr_qty=v_acco_curr_qty, acco_avail_qty=v_acco_avail_qty, acco_rece_margin=v_acco_rece_margin, out_curr_qty=v_out_curr_qty, out_enable_qty=v_out_enable_qty, out_rece_margin=v_out_rece_margin, acco_curr_qty_diff=v_acco_curr_qty_diff, acco_avail_qty_diff=v_acco_avail_qty_diff, acco_rece_margin_diff=v_acco_rece_margin_diff, deal_flag=v_deal_flag, asset_sync_flag=v_asset_sync_flag, remark_info=v_remark_info;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.171.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码=",v_futu_acco,",","市场编号=",v_exch_no,",","合约代码=",v_contrc_code,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","交易编码=",v_futu_acco,",","市场编号=",v_exch_no,",","合约代码=",v_contrc_code,",","多空类型=",v_lngsht_type,",","套保标志=",v_hedge_type);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_清除外部转入记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_ClearOutRecord;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_ClearOutRecord(
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
    
    #清除外部证券持仓表记录、内外证券持仓差异表记录

    /* [删除表记录][产品期货_持仓_外部资产账户持仓表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdfutu.tb_pdfupo_out_asac_posi 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.172.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","通道编号=",v_pass_no,",","外部账号=",v_out_acco);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_内外资产账户持仓差异表][{初始化日期}=@初始化日期# and {通道编号}=@通道编号# and {外部账号} = @外部账号#][3][@初始化日期#,@通道编号#,@外部账号#] */
    delete from db_pdfutu.tb_pdfupo_asac_posi_diff 
        where init_date=v_init_date and pass_no=v_pass_no and out_acco = v_out_acco;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.172.3";
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

# 原子_产品期货_持仓_归档产品期货持仓数据
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_BackUpPdFutuPosiData;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_BackUpPdFutuPosiData(
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
    

    /* [不分日期数据归历史][产品期货_持仓_交易资产账户持仓表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_trd_asac_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        lngsht_type, hedge_type, posi_qty, marked_pandl, 
        pre_strike_capt_qty, rece_margin) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        lngsht_type, hedge_type, posi_qty, marked_pandl, 
        pre_strike_capt_qty, rece_margin 
        from db_pdfutu.tb_pdfupo_trd_asac_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_交易资产账户持仓表][1=1][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_trd_asac_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品期货_持仓_交易库交易组持仓表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_trd_exgp_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, lngsht_type, hedge_type, posi_qty, 
        marked_pandl, pre_strike_capt_qty, rece_margin) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, lngsht_type, hedge_type, posi_qty, 
        marked_pandl, pre_strike_capt_qty, rece_margin 
        from db_pdfutu.tb_pdfupo_trd_exgp_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_交易库交易组持仓表][1=1][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_trd_exgp_posi 
        where 1=1;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_历史交易组持仓表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdfutu_his.tb_pdfupo_exgp_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品期货_持仓_交易组持仓表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_exgp_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount 
        from db_pdfutu.tb_pdfupo_exgp_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_交易组持仓表][{记录序号}>0 and {当前数量}=0 and {冻结数量}=0 and {解冻数量}=0][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_exgp_posi 
        where row_id>0 and curr_qty=0 and frozen_qty=0 and unfroz_qty=0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_交易组持仓表][{期初数量}={当前数量},{昨结算价}={结算价},{结算价}=0,{清算结算标志}=《清算结算标志-未处理》][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_exgp_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=curr_qty,pre_settle_price=sett_price,sett_price=0,sett_flag=2 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_交易组持仓流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_exgp_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, busi_flag, occur_qty, occur_end_qty, 
        jour_occur_field, jour_after_occur_info, oper_remark_info 
        from db_pdfutu.tb_pdfupo_exgp_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_交易组持仓流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_exgp_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_交易组持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_exgp_posi_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, lngsht_type, 
        hedge_type, frozen_type, occur_qty, expire_date, 
        jour_status, oper_remark_info 
        from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_交易组持仓冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_历史资产账户持仓表][{初始化日期}=@初始化日期#][301][@初始化日期#] */
    delete from db_pdfutu_his.tb_pdfupo_asac_posi_his 
        where init_date=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.301";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [不分日期数据归历史][产品期货_持仓_资产账户持仓表][字段][302][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_asac_posi_his (init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, pre_settle_price, sett_price, rece_margin, 
        sett_flag, open_amount) 
        select v_init_date,
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, begin_qty, curr_qty, frozen_qty, 
        unfroz_qty, pre_settle_price, sett_price, rece_margin, 
        sett_flag, open_amount 
        from db_pdfutu.tb_pdfupo_asac_posi;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.302";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
            else
                SET v_error_info = concat("初始化日期=",v_init_date);
            end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_资产账户持仓表][{记录序号}>0 and {当前数量}=0 and {冻结数量}=0 and {解冻数量}=0][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_asac_posi 
        where row_id>0 and curr_qty=0 and frozen_qty=0 and unfroz_qty=0;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][产品期货_持仓_资产账户持仓表][{期初数量}={当前数量},{昨结算价}={结算价},{结算价}=0,{清算结算标志}=《清算结算标志-未处理》][1=1][2][" "] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_pdfutu.tb_pdfupo_asac_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, begin_qty=curr_qty,pre_settle_price=sett_price,sett_price=0,sett_flag=2 where 1=1;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_资产账户持仓流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_asac_posi_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        busi_flag, occur_qty, occur_end_qty, jour_occur_field, 
        jour_after_occur_info, oper_remark_info 
        from db_pdfutu.tb_pdfupo_asac_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_资产账户持仓流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_asac_posi_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_资产账户持仓冻结解冻流水表][字段][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_asac_posi_frozen_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, opor_co_no, 
        opor_no, oper_mac, oper_ip_addr, oper_info, 
        oper_way, oper_menu_no, oper_func_code, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, lngsht_type, hedge_type, 
        frozen_type, occur_qty, expire_date, jour_status, 
        oper_remark_info 
        from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_资产账户持仓冻结解冻流水表][{初始化日期}<=@初始化日期# and {流水状态}=《流水状态-无效》][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour 
        where init_date<=v_init_date and jour_status="2";
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_外部资产账户持仓表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_out_asac_posi_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, futu_acco_no, futu_acco, 
        contrc_code_no, contrc_code, contrc_name, lngsht_type, 
        hedge_type, contrc_unit, out_curr_qty, out_enable_qty, 
        out_rece_margin) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, pass_no, 
        out_acco, exch_no, futu_acco_no, futu_acco, 
        contrc_code_no, contrc_code, contrc_name, lngsht_type, 
        hedge_type, contrc_unit, out_curr_qty, out_enable_qty, 
        out_rece_margin 
        from db_pdfutu.tb_pdfupo_out_asac_posi 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_外部资产账户持仓表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_out_asac_posi 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_内外资产账户持仓差异表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_asac_posi_diff_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, contrc_name, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, pre_settle_price, acco_curr_qty, acco_avail_qty, 
        acco_rece_margin, out_curr_qty, out_enable_qty, out_rece_margin, 
        acco_curr_qty_diff, acco_avail_qty_diff, acco_rece_margin_diff, deal_flag, 
        asset_sync_flag, remark_info) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, contrc_name, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, pre_settle_price, acco_curr_qty, acco_avail_qty, 
        acco_rece_margin, out_curr_qty, out_enable_qty, out_rece_margin, 
        acco_curr_qty_diff, acco_avail_qty_diff, acco_rece_margin_diff, deal_flag, 
        asset_sync_flag, remark_info 
        from db_pdfutu.tb_pdfupo_asac_posi_diff 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_内外资产账户持仓差异表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_asac_posi_diff 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_交易组持仓入账流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_exgp_posi_entry_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        lngsht_type, hedge_type, contrc_unit, busi_flag, 
        occur_qty, entry_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        lngsht_type, hedge_type, contrc_unit, busi_flag, 
        occur_qty, entry_status 
        from db_pdfutu.tb_pdfupo_exgp_posi_entry_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_交易组持仓入账流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_exgp_posi_entry_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [数据归历史][产品期货_持仓_资产账户持仓入账流水表][字段][{初始化日期}<=@初始化日期#][1][@初始化日期#] */
    insert into db_pdfutu_his.tb_pdfupo_asac_posi_entry_jour_his (
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, contrc_unit, busi_flag, occur_qty, 
        entry_status) 
        select 
        row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, contrc_unit, busi_flag, occur_qty, 
        entry_status 
        from db_pdfutu.tb_pdfupo_asac_posi_entry_jour 
        where init_date<=v_init_date;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.201.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date);
        end if;
        leave label_pro;
    end if;


    /* [删除表记录][产品期货_持仓_资产账户持仓入账流水表][{初始化日期}<=@初始化日期#][3][@初始化日期#] */
    delete from db_pdfutu.tb_pdfupo_asac_posi_entry_jour 
        where init_date<=v_init_date;
    if v_error_code = 1 then
                
        SET v_error_code = "pdfutuA.3.201.3";
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

# 原子_产品期货_持仓_获取日终到期交易组冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_GetCloseExgpFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_GetCloseExgpFrozenUnfrozen(
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
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_frozen_type int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
    declare v_occur_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_frozen_type = 0;
    SET v_occur_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_持仓_交易组持仓冻结解冻流水表][{记录序号},{资产账户编号},{交易组编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志},{冻结解冻类型},{变动数量}][@记录序号#,@资产账户编号#,@交易组编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#,@冻结解冻类型#,@变动数量#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,exch_group_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,frozen_type,occur_qty into v_row_id,v_asset_acco_no,v_exch_group_no,v_futu_acco_no,v_contrc_code_no,v_lngsht_type,v_hedge_type,v_frozen_type,v_occur_qty from db_pdfutu.tb_pdfupo_exgp_posi_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.202.4";
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
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_获取日终到期资产账户冻结解冻记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_GetCloseAsacFrozenUnfrozen;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_GetCloseAsacFrozenUnfrozen(
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
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_frozen_type int,
    OUT p_occur_qty decimal(18,2)
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_frozen_type int;
    declare v_occur_qty decimal(18,2);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_frozen_type = 0;
    SET v_occur_qty = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][产品期货_持仓_资产账户持仓冻结解冻流水表][{记录序号},{资产账户编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志},{冻结解冻类型},{变动数量}][@记录序号#,@资产账户编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#,@冻结解冻类型#,@变动数量#][{记录序号}>@查询记录序号# and {流水状态}=《流水状态-有效》 and {到期日期}<=@初始化日期# order by {记录序号}][4][@查询记录序号#,@初始化日期#] */
    select row_id,asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,frozen_type,occur_qty into v_row_id,v_asset_acco_no,v_futu_acco_no,v_contrc_code_no,v_lngsht_type,v_hedge_type,v_frozen_type,v_occur_qty from db_pdfutu.tb_pdfupo_asac_posi_frozen_jour where row_id>v_query_row_id and jour_status="1" and expire_date<=v_init_date order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.203.4";
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
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_frozen_type = v_frozen_type;
    SET p_occur_qty = v_occur_qty;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_更新交易持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UpdateTrdPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UpdateTrdPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_strike_capt_qty decimal(18,2),
    IN p_marked_pandl decimal(18,4),
    IN p_posi_qty decimal(18,2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_marked_pandl decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_strike_capt_qty = p_pre_strike_capt_qty;
    SET v_marked_pandl = p_marked_pandl;
    SET v_posi_qty = p_posi_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品期货_持仓_交易资产账户持仓表][字段][字段变量][{持仓数量}=@持仓数量#,{老仓成交占用数量}=@老仓成交占用数量#,{盯市盈亏}=@盯市盈亏#,{应收保证金}=@应收保证金#][1][@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_trd_asac_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_no, futu_acco_no, contrc_code_no, 
        lngsht_type, hedge_type, posi_qty, marked_pandl, 
        pre_strike_capt_qty, rece_margin) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_lngsht_type, v_hedge_type, v_posi_qty, v_marked_pandl, 
        v_pre_strike_capt_qty, v_rece_margin) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty=v_posi_qty,pre_strike_capt_qty=v_pre_strike_capt_qty,marked_pandl=v_marked_pandl,rece_margin=v_rece_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.301.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_更新交易库交易组持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_UpdateTrdExgpPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_UpdateTrdExgpPosi(
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
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_strike_capt_qty decimal(18,2),
    IN p_marked_pandl decimal(18,4),
    IN p_posi_qty decimal(18,2),
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
    declare v_co_no int;
    declare v_pd_no int;
    declare v_asset_acco_no int;
    declare v_exch_group_no int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_marked_pandl decimal(18,4);
    declare v_posi_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
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
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_strike_capt_qty = p_pre_strike_capt_qty;
    SET v_marked_pandl = p_marked_pandl;
    SET v_posi_qty = p_posi_qty;
    SET v_rece_margin = p_rece_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;

    
    label_pro:BEGIN
    

    /* [插入重复更新][产品期货_持仓_交易库交易组持仓表][字段][字段变量][{持仓数量}=@持仓数量#,{老仓成交占用数量}=@老仓成交占用数量#,{盯市盈亏}=@盯市盈亏#,{应收保证金}=@应收保证金#][1][@交易组编号#,@资产账户编号#,@交易编码编号#,@合约代码编号#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_pdfutu.tb_pdfupo_trd_exgp_posi (
        create_date, create_time, update_date, 
        update_time, update_times, co_no, pd_no, 
        asset_acco_no, exch_group_no, exch_no, futu_acco_no, 
        contrc_code_no, lngsht_type, hedge_type, posi_qty, 
        marked_pandl, pre_strike_capt_qty, rece_margin) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_co_no, v_pd_no, 
        v_asset_acco_no, v_exch_group_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_lngsht_type, v_hedge_type, v_posi_qty, 
        v_marked_pandl, v_pre_strike_capt_qty, v_rece_margin) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, posi_qty=v_posi_qty,pre_strike_capt_qty=v_pre_strike_capt_qty,marked_pandl=v_marked_pandl,rece_margin=v_rece_margin;
    if v_error_code = "1" then
                
        SET v_error_code = "pdfutuA.3.302.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("交易组编号=",v_exch_group_no,",","资产账户编号=",v_asset_acco_no,",","交易编码编号=",v_futu_acco_no,",","合约代码编号=",v_contrc_code_no);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_计算资产账户盯市盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_CalcAsacMarkedPandl;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_CalcAsacMarkedPandl(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_marked_pandl decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_marked_pandl decimal(18,4);
    declare v_tmp_marked_pandl decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_contrc_unit int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_sett_flag int;
    declare v_open_amount decimal(18,4);
    declare v_avail_qty decimal(18,2);
    declare v_pandl_dir_multi int;
    declare v_record_count int;
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_last_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_marked_pandl = 0;
    SET v_tmp_marked_pandl = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_comb_code = " ";
    SET v_contrc_unit = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_sett_flag = 0;
    SET v_open_amount = 0;
    SET v_avail_qty = 0;
    SET v_pandl_dir_multi = 0;
    SET v_record_count = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* set @临时_盯市盈亏# =0; */
    set v_tmp_marked_pandl =0;

    /* set @盯市盈亏# =0; */
    set v_marked_pandl =0;
    #先计算资产账户下所有老仓的盯市盈亏

    /* [声明游标][产品期货_持仓_资产账户持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号#][cursor_asacoldposi] */
    cursor_asacoldposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_asacoldposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_no, futu_acco_no, 
        contrc_code_no, contrc_type, lngsht_type, hedge_type, 
        comb_code, contrc_unit, begin_qty, curr_qty, 
        frozen_qty, unfroz_qty, pre_settle_price, sett_price, 
        rece_margin, sett_flag, open_amount 
        from db_pdfutu.tb_pdfupo_asac_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_asacoldposi][loop_asacoldposi] */
    open cursor_asacoldposi;
    loop_asacoldposi: LOOP
    fetch cursor_asacoldposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_no, v_futu_acco_no, 
        v_contrc_code_no, v_contrc_type, v_lngsht_type, v_hedge_type, 
        v_comb_code, v_contrc_unit, v_begin_qty, v_curr_qty, 
        v_frozen_qty, v_unfroz_qty, v_pre_settle_price, v_sett_price, 
        v_rece_margin, v_sett_flag, v_open_amount;
        IF v_cursor_done THEN
            LEAVE loop_asacoldposi;
        END IF;


         /* set @可用数量# = @当前数量# - @冻结数量# + @解冻数量#; */
         set v_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty;

        /* if @多空类型# = 《多空类型-多头》  then */
        if v_lngsht_type = 1  then

             /* set @盈亏方向乘数# = 1; */
             set v_pandl_dir_multi = 1;

        /* elseif @多空类型# = 《多空类型-空头》  then */
        elseif v_lngsht_type = 2  then

             /* set @盈亏方向乘数# = -1; */
             set v_pandl_dir_multi = -1;
        end if;

        /* [获取表记录变量语句][产品期货_持仓_交易资产账户持仓表][COUNT(*),{老仓成交占用数量}][@记录个数#,@老仓成交占用数量#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
        select COUNT(*),pre_strike_capt_qty into v_record_count,v_pre_strike_capt_qty from db_pdfutu.tb_pdfupo_trd_asac_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;


        /* if @记录个数# = 0 then */
        if v_record_count = 0 then

              /* set @老仓成交占用数量# = 0; */
              set v_pre_strike_capt_qty = 0;
        end if;

        /* 调用【原子_产品期货_公共接口_获取合约代码最新价】*/
        call db_pdfutu.pra_pdfupubif_GetContrcCodeLastPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_contrc_code_no,
            v_error_code,
            v_error_info,
            v_last_price);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuA.3.303.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_获取合约代码最新价出现错误！',v_mysql_message);
            end if;
            close cursor_asacoldposi;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_asacoldposi;
            leave label_pro;
        end if;


        /* if @最新价# = 0 then */
        if v_last_price = 0 then

              /* set @最新价# = @昨结算价#; */
              set v_last_price = v_pre_settle_price;
        end if;

         /* set @临时_盯市盈亏# =  (@最新价#-@昨结算价#)*(@可用数量#-@老仓成交占用数量#)*@合约乘数#*@盈亏方向乘数#; */
         set v_tmp_marked_pandl =  (v_last_price-v_pre_settle_price)*(v_avail_qty-v_pre_strike_capt_qty)*v_contrc_unit*v_pandl_dir_multi;

         /* set @盯市盈亏# =  @盯市盈亏# + @临时_盯市盈亏#; */
         set v_marked_pandl =  v_marked_pandl + v_tmp_marked_pandl;

    /* [关闭游标][cursor_asacoldposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_asacoldposi;
    end cursor_asacoldposi;

    #再计算资产账户下所有今仓的盯市盈亏

      /* [获取表记录变量语句][产品期货_持仓_交易资产账户持仓表][ifnull(sum({盯市盈亏}),0)][@临时_盯市盈亏#][{资产账户编号}=@资产账户编号# and {机构编号}=@机构编号# and {产品编号}=@产品编号#] */
      select ifnull(sum(marked_pandl),0) into v_tmp_marked_pandl from db_pdfutu.tb_pdfupo_trd_asac_posi where asset_acco_no=v_asset_acco_no and co_no=v_co_no and pd_no=v_pd_no limit 1;


       /* set @盯市盈亏# =  @盯市盈亏# + @临时_盯市盈亏#; */
       set v_marked_pandl =  v_marked_pandl + v_tmp_marked_pandl;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_marked_pandl = v_marked_pandl;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_计算交易组盯市盈亏
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_CalcExgpMarkedPandl;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_CalcExgpMarkedPandl(
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
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_marked_pandl decimal(18,4)
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
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_marked_pandl decimal(18,4);
    declare v_tmp_marked_pandl decimal(18,4);
    declare v_row_id bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_contrc_unit int;
    declare v_begin_qty decimal(18,2);
    declare v_curr_qty decimal(18,2);
    declare v_frozen_qty decimal(18,2);
    declare v_unfroz_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_sett_flag int;
    declare v_open_amount decimal(18,4);
    declare v_avail_qty decimal(18,2);
    declare v_pandl_dir_multi int;
    declare v_record_count int;
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_last_price decimal(16,9);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_marked_pandl = 0;
    SET v_tmp_marked_pandl = 0;
    SET v_row_id = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_comb_code = " ";
    SET v_contrc_unit = 0;
    SET v_begin_qty = 0;
    SET v_curr_qty = 0;
    SET v_frozen_qty = 0;
    SET v_unfroz_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_sett_flag = 0;
    SET v_open_amount = 0;
    SET v_avail_qty = 0;
    SET v_pandl_dir_multi = 0;
    SET v_record_count = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_last_price = 0;

    
    label_pro:BEGIN
    

    /* set @临时_盯市盈亏# =0; */
    set v_tmp_marked_pandl =0;

    /* set @盯市盈亏# =0; */
    set v_marked_pandl =0;
    #先计算交易组下所有老仓的盯市盈亏

    /* [声明游标][产品期货_持仓_交易组持仓表][字段][{机构编号} = @机构编号# and {产品编号}=@产品编号# and {资产账户编号}=@资产账户编号# and {交易组编号}=@交易组编号#][cursor_exgpoldposi] */
    cursor_exgpoldposi:BEGIN
    DECLARE v_cursor_done int default false;
    DECLARE cursor_exgpoldposi CURSOR FOR
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, co_no, 
        pd_no, asset_acco_no, exch_group_no, exch_no, 
        futu_acco_no, contrc_code_no, contrc_type, lngsht_type, 
        hedge_type, comb_code, contrc_unit, begin_qty, 
        curr_qty, frozen_qty, unfroz_qty, pre_settle_price, 
        sett_price, rece_margin, sett_flag, open_amount 
        from db_pdfutu.tb_pdfupo_exgp_posi 
        where co_no = v_co_no and pd_no=v_pd_no and asset_acco_no=v_asset_acco_no and exch_group_no=v_exch_group_no;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_cursor_done = TRUE;


    /* [打开游标][字段变量][cursor_exgpoldposi][loop_exgpoldposi] */
    open cursor_exgpoldposi;
    loop_exgpoldposi: LOOP
    fetch cursor_exgpoldposi into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_co_no, 
        v_pd_no, v_asset_acco_no, v_exch_group_no, v_exch_no, 
        v_futu_acco_no, v_contrc_code_no, v_contrc_type, v_lngsht_type, 
        v_hedge_type, v_comb_code, v_contrc_unit, v_begin_qty, 
        v_curr_qty, v_frozen_qty, v_unfroz_qty, v_pre_settle_price, 
        v_sett_price, v_rece_margin, v_sett_flag, v_open_amount;
        IF v_cursor_done THEN
            LEAVE loop_exgpoldposi;
        END IF;


         /* set @可用数量# = @当前数量# - @冻结数量# + @解冻数量#; */
         set v_avail_qty = v_curr_qty - v_frozen_qty + v_unfroz_qty;

        /* if @多空类型# = 《多空类型-多头》  then */
        if v_lngsht_type = 1  then

             /* set @盈亏方向乘数# = 1; */
             set v_pandl_dir_multi = 1;

        /* elseif @多空类型# = 《多空类型-空头》  then */
        elseif v_lngsht_type = 2  then

             /* set @盈亏方向乘数# = -1; */
             set v_pandl_dir_multi = -1;
        end if;

        /* [获取表记录变量语句][产品期货_持仓_交易库交易组持仓表][COUNT(*),{老仓成交占用数量}][@记录个数#,@老仓成交占用数量#][{资产账户编号}=@资产账户编号# and {交易编码编号}=@交易编码编号# and {交易组编号} =@交易组编号# and {合约代码编号}=@合约代码编号# and {多空类型}=@多空类型# and {套保标志}=@套保标志#] */
        select COUNT(*),pre_strike_capt_qty into v_record_count,v_pre_strike_capt_qty from db_pdfutu.tb_pdfupo_trd_exgp_posi where asset_acco_no=v_asset_acco_no and futu_acco_no=v_futu_acco_no and exch_group_no =v_exch_group_no and contrc_code_no=v_contrc_code_no and lngsht_type=v_lngsht_type and hedge_type=v_hedge_type limit 1;


        /* if @记录个数# = 0 then */
        if v_record_count = 0 then

              /* set @老仓成交占用数量# = 0; */
              set v_pre_strike_capt_qty = 0;
        end if;

        /* 调用【原子_产品期货_公共接口_获取合约代码最新价】*/
        call db_pdfutu.pra_pdfupubif_GetContrcCodeLastPrice(
            v_opor_co_no,
            v_opor_no,
            v_oper_mac,
            v_oper_ip_addr,
            v_oper_info,
            v_oper_way,
            v_func_code,
            v_contrc_code_no,
            v_error_code,
            v_error_info,
            v_last_price);
        if v_error_code = "1" then
            SET v_error_code = "pdfutuA.3.304.999";
            if v_mysql_message <> "" then
                 SET v_error_info = CONCAT(v_error_info,"#",'调用过程原子_产品期货_公共接口_获取合约代码最新价出现错误！',v_mysql_message);
            end if;
            close cursor_exgpoldposi;
            leave label_pro;
        elseif v_error_code <> "0" then
            close cursor_exgpoldposi;
            leave label_pro;
        end if;


        /* if @最新价# = 0 then */
        if v_last_price = 0 then

              /* set @最新价# = @昨结算价#; */
              set v_last_price = v_pre_settle_price;
        end if;

         /* set @临时_盯市盈亏# =  (@最新价#-@昨结算价#)*(@可用数量#-@老仓成交占用数量#)*@合约乘数#*@盈亏方向乘数#; */
         set v_tmp_marked_pandl =  (v_last_price-v_pre_settle_price)*(v_avail_qty-v_pre_strike_capt_qty)*v_contrc_unit*v_pandl_dir_multi;

         /* set @盯市盈亏# =  @盯市盈亏# + @临时_盯市盈亏#; */
         set v_marked_pandl =  v_marked_pandl + v_tmp_marked_pandl;

    /* [关闭游标][cursor_exgpoldposi] */
        IF v_cursor_done THEN
            set v_cursor_done = false;
        END IF;
    END LOOP;
    close cursor_exgpoldposi;
    end cursor_exgpoldposi;

    #再计算交易组下所有今仓的盯市盈亏

      /* [获取表记录变量语句][产品期货_持仓_交易库交易组持仓表][ifnull(sum({盯市盈亏}),0)][@临时_盯市盈亏#][{资产账户编号}=@资产账户编号# and {机构编号}=@机构编号# and {产品编号}=@产品编号# and {交易组编号} =@交易组编号#] */
      select ifnull(sum(marked_pandl),0) into v_tmp_marked_pandl from db_pdfutu.tb_pdfupo_trd_exgp_posi where asset_acco_no=v_asset_acco_no and co_no=v_co_no and pd_no=v_pd_no and exch_group_no =v_exch_group_no limit 1;


       /* set @盯市盈亏# =  @盯市盈亏# + @临时_盯市盈亏#; */
       set v_marked_pandl =  v_marked_pandl + v_tmp_marked_pandl;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_marked_pandl = v_marked_pandl;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_查询资产账户内外持仓差异记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_QueryFutuPosiDiff;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_QueryFutuPosiDiff(
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
    

    /* [获取表记录][产品期货_持仓_内外资产账户持仓差异表][字段][{机构编号}=@机构编号# and (@产品编号#=0 or {产品编号}=@产品编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@通道编号#=0 or {通道编号}=@通道编号#) and (@外部账号#=" " or {外部账号}=@外部账号#) and (@处理标志查询串#="; ;" or instr(@处理标志查询串#,concat(";",{处理标志},";"))>0) and (@过滤差额条件#=《过滤差额条件-不过滤》 or (@过滤差额条件#=《过滤差额条件-只显示差额不为0》 and ({账户当前数量差额}<>0 or {账户可用数量差额}<>0)) or (@过滤差额条件#=《过滤差额条件-只显示差额为0》 and ({账户当前数量差额}=0 and {账户可用数量差额}=0))) and (@资产是否同步#=0 or {资产是否同步}=@资产是否同步#) and {记录序号}>@记录序号# order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, contrc_name, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, pre_settle_price, acco_curr_qty, acco_avail_qty, 
        acco_rece_margin, out_curr_qty, out_enable_qty, out_rece_margin, 
        acco_curr_qty_diff, acco_avail_qty_diff, acco_rece_margin_diff, deal_flag, 
        asset_sync_flag, remark_info from db_pdfutu.tb_pdfupo_asac_posi_diff where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, asset_acco_no, exch_group_no, 
        pass_no, out_acco, exch_no, futu_acco_no, 
        futu_acco, contrc_code_no, contrc_code, contrc_name, 
        contrc_type, lngsht_type, hedge_type, comb_code, 
        contrc_unit, pre_settle_price, acco_curr_qty, acco_avail_qty, 
        acco_rece_margin, out_curr_qty, out_enable_qty, out_rece_margin, 
        acco_curr_qty_diff, acco_avail_qty_diff, acco_rece_margin_diff, deal_flag, 
        asset_sync_flag, remark_info from db_pdfutu.tb_pdfupo_asac_posi_diff where co_no=v_co_no and (v_pd_no=0 or pd_no=v_pd_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_pass_no=0 or pass_no=v_pass_no) and (v_out_acco=" " or out_acco=v_out_acco) and (v_deal_flag_query_str="; ;" or instr(v_deal_flag_query_str,concat(";",deal_flag,";"))>0) and (v_filter_diff_cond=1 or (v_filter_diff_cond=2 and (acco_curr_qty_diff<>0 or acco_avail_qty_diff<>0)) or (v_filter_diff_cond=3 and (acco_curr_qty_diff=0 and acco_avail_qty_diff=0))) and (v_asset_sync_flag=0 or asset_sync_flag=v_asset_sync_flag) and row_id>v_row_id order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_pdfutu;;

# 原子_产品期货_持仓_获取机构内部期货持仓记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_pdfupo_GetCoInFutuPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_pdfupo_GetCoInFutuPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_co_no int,
    IN p_query_row_id bigint,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
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
    declare v_co_no int;
    declare v_query_row_id bigint;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
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
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_posi_qty decimal(18,2);
    declare v_pre_strike_capt_qty decimal(18,2);
    declare v_tmp_rece_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_query_row_id = p_query_row_id;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
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
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_posi_qty = 0;
    SET v_pre_strike_capt_qty = 0;
    SET v_tmp_rece_margin = 0;

    
    label_pro:BEGIN
    

    /* if @查询记录序号# = 0 then */
    if v_query_row_id = 0 then

        /* delete from  ~产品期货_持仓_内部资产账户持仓核对表^  where {初始化日期}=@初始化日期# and  {机构编号}=@机构编号#; */
        delete from  db_pdfutu.tb_pdfupo_asac_posi_check  where init_date=v_init_date and  co_no=v_co_no;

        /* insert into ~产品期货_持仓_内部资产账户持仓核对表^ ({创建日期},{创建时间},{更新日期},{更新时间},{更新次数},{初始化日期},{机构编号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志},{当前数量},{可用数量},{应收保证金})  select @创建日期#,@创建时间#,@更新日期#,@更新时间#,1,@初始化日期#,a.{机构编号},a.{产品编号},a.{资产账户编号},a.{市场编号},a.{交易编码编号},a.{合约代码编号},a.{多空类型},a.{套保标志},a.{当前数量},a.{当前数量}-a.{冻结数量}+a.{解冻数量},a.{应收保证金} from ~产品期货_持仓_资产账户持仓表^ a where (a.{资产账户编号},a.{交易编码编号},a.{合约代码编号},a.{多空类型},a.{套保标志}) not in (select {资产账户编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志} from ~产品期货_持仓_外部资产账户持仓表^ where {初始化日期}=@初始化日期# and {机构编号}=@机构编号#) and a.{机构编号}=@机构编号# and (a.{当前数量}<>0 or (a.{当前数量}-a.{冻结数量}+a.{解冻数量})<>0 or IFNULL((select {持仓数量} from ~产品期货_持仓_交易资产账户持仓表^ b where b.{资产账户编号}=a.{资产账户编号} and b.{交易编码编号}=a.{交易编码编号} and b.{合约代码编号}=a.{合约代码编号} and b.{多空类型}=a.{多空类型} and b.{套保标志}=a.{套保标志}),0)<>0 or IFNULL((select {老仓成交占用数量} from ~产品期货_持仓_交易资产账户持仓表^ b where b.{资产账户编号}=a.{资产账户编号} and b.{交易编码编号}=a.{交易编码编号} and b.{合约代码编号}=a.{合约代码编号} and b.{多空类型}=a.{多空类型} and b.{套保标志}=a.{套保标志}),0)<>0) order by a.{资产账户编号},a.{交易编码编号},a.{合约代码编号}; */
        insert into db_pdfutu.tb_pdfupo_asac_posi_check (create_date,create_time,update_date,update_time,update_times,init_date,co_no,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,avail_qty,rece_margin)  select v_create_date,v_create_time,v_update_date,v_update_time,1,v_init_date,a.co_no,a.pd_no,a.asset_acco_no,a.exch_no,a.futu_acco_no,a.contrc_code_no,a.lngsht_type,a.hedge_type,a.curr_qty,a.curr_qty-a.frozen_qty+a.unfroz_qty,a.rece_margin from db_pdfutu.tb_pdfupo_asac_posi a where (a.asset_acco_no,a.futu_acco_no,a.contrc_code_no,a.lngsht_type,a.hedge_type) not in (select asset_acco_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type from db_pdfutu.tb_pdfupo_out_asac_posi where init_date=v_init_date and co_no=v_co_no) and a.co_no=v_co_no and (a.curr_qty<>0 or (a.curr_qty-a.frozen_qty+a.unfroz_qty)<>0 or IFNULL((select posi_qty from db_pdfutu.tb_pdfupo_trd_asac_posi b where b.asset_acco_no=a.asset_acco_no and b.futu_acco_no=a.futu_acco_no and b.contrc_code_no=a.contrc_code_no and b.lngsht_type=a.lngsht_type and b.hedge_type=a.hedge_type),0)<>0 or IFNULL((select pre_strike_capt_qty from db_pdfutu.tb_pdfupo_trd_asac_posi b where b.asset_acco_no=a.asset_acco_no and b.futu_acco_no=a.futu_acco_no and b.contrc_code_no=a.contrc_code_no and b.lngsht_type=a.lngsht_type and b.hedge_type=a.hedge_type),0)<>0) order by a.asset_acco_no,a.futu_acco_no,a.contrc_code_no;
    end if;

    /* [获取表记录变量][产品期货_持仓_内部资产账户持仓核对表][{记录序号},{产品编号},{资产账户编号},{市场编号},{交易编码编号},{合约代码编号},{多空类型},{套保标志},{当前数量},{可用数量},{应收保证金}][@记录序号#,@产品编号#,@资产账户编号#,@市场编号#,@交易编码编号#,@合约代码编号#,@多空类型#,@套保标志#,@当前数量#,@可用数量#,@应收保证金#][{初始化日期}=@初始化日期# and {机构编号}=@机构编号# and {记录序号} > @查询记录序号# order by {记录序号}][4][@初始化日期#,@机构编号#,@查询记录序号#] */
    select row_id,pd_no,asset_acco_no,exch_no,futu_acco_no,contrc_code_no,lngsht_type,hedge_type,curr_qty,avail_qty,rece_margin into v_row_id,v_pd_no,v_asset_acco_no,v_exch_no,v_futu_acco_no,v_contrc_code_no,v_lngsht_type,v_hedge_type,v_curr_qty,v_avail_qty,v_rece_margin from db_pdfutu.tb_pdfupo_asac_posi_check where init_date=v_init_date and co_no=v_co_no and row_id > v_query_row_id order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "pdfutuA.3.88.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","查询记录序号=",v_query_row_id),"#",v_mysql_message);
        else
            SET v_error_info = concat("初始化日期=",v_init_date,",","机构编号=",v_co_no,",","查询记录序号=",v_query_row_id);
        end if;
        leave label_pro;
    end if;


    /* [获取表记录变量语句][产品期货_持仓_交易资产账户持仓表][{持仓数量},{老仓成交占用数量},{应收保证金}][@持仓数量#,@老仓成交占用数量#,@临时_应收保证金#][{资产账户编号} = @资产账户编号# and {交易编码编号} = @交易编码编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志#] */
    select posi_qty,pre_strike_capt_qty,rece_margin into v_posi_qty,v_pre_strike_capt_qty,v_tmp_rece_margin from db_pdfutu.tb_pdfupo_trd_asac_posi where asset_acco_no = v_asset_acco_no and futu_acco_no = v_futu_acco_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type limit 1;


    /* set @当前数量# = @当前数量# + @持仓数量# - @老仓成交占用数量#; */
    set v_curr_qty = v_curr_qty + v_posi_qty - v_pre_strike_capt_qty;

    /* set @可用数量# = @可用数量# + @持仓数量# - @老仓成交占用数量#; */
    set v_avail_qty = v_avail_qty + v_posi_qty - v_pre_strike_capt_qty;

    /* set @应收保证金# = @应收保证金# + @临时_应收保证金#; */
    set v_rece_margin = v_rece_margin + v_tmp_rece_margin;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_row_id = v_row_id;
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


