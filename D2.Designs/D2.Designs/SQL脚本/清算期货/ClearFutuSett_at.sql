DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_更新获取清算持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_UpdateGetPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_UpdateGetPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_out_acco varchar(32),
    OUT p_futu_acco_no int,
    OUT p_contrc_unit int,
    OUT p_posi_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_pass_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_comb_code varchar(6),
    OUT p_curr_qty decimal(18,2),
    OUT p_sett_price decimal(16,9),
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_deliv_flag int,
    OUT p_margin_pref int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_out_acco varchar(32);
    declare v_futu_acco_no int;
    declare v_contrc_unit int;
    declare v_posi_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_comb_code varchar(6);
    declare v_curr_qty decimal(18,2);
    declare v_sett_price decimal(16,9);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_deliv_flag int;
    declare v_margin_pref int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_flag int;
    declare v_open_amount decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_out_acco = " ";
    SET v_futu_acco_no = 0;
    SET v_contrc_unit = 0;
    SET v_posi_amt = 0;
    SET v_rece_margin = 0;
    SET v_pass_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_comb_code = " ";
    SET v_curr_qty = 0;
    SET v_sett_price = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_deliv_flag = 0;
    SET v_margin_pref = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_pre_settle_price = 0;
    SET v_sett_flag = 0;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    

    /* [获取表记录变量][清算期货_清算_持仓表][字段][字段变量][{记录序号} > @查询序号#  and {清算结算标志} <> 《清算结算标志-已处理》 order by {记录序号}][1][@查询序号#] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, margin_pref, comb_code, lngsht_type, 
        hedge_type, curr_qty, contrc_unit, posi_amt, 
        pre_settle_price, sett_price, rece_margin, sett_flag, 
        deliv_flag, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_margin_pref, v_comb_code, v_lngsht_type, 
        v_hedge_type, v_curr_qty, v_contrc_unit, v_posi_amt, 
        v_pre_settle_price, v_sett_price, v_rece_margin, v_sett_flag, 
        v_deliv_flag, v_open_amount from db_clfutu.tb_clfucl_posi where row_id > v_qry_no  and sett_flag <> 1 order by row_id limit 1;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clfutuA.3.1.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("查询序号=",v_qry_no),"#",v_mysql_message);
        else
            SET v_error_info = concat("查询序号=",v_qry_no);
        end if;
        leave label_pro;
    end if;


    /* [更新表记录][清算期货_清算_持仓表][{清算结算标志} = 《清算结算标志-已处理》][{记录序号}=@记录序号#][2]["更新记录失败"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_flag = 1 where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.1.2";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新记录失败","#",v_mysql_message);
        else
            SET v_error_info = "更新记录失败";
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
    SET p_out_acco = v_out_acco;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_unit = v_contrc_unit;
    SET p_posi_amt = v_posi_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_pass_no = v_pass_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_comb_code = v_comb_code;
    SET p_curr_qty = v_curr_qty;
    SET p_sett_price = v_sett_price;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_deliv_flag = v_deliv_flag;
    SET p_margin_pref = v_margin_pref;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_更新持仓保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_UpdateHoldMargin;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_UpdateHoldMargin(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_margin_pref int,
    IN p_comb_code varchar(6),
    IN p_sett_price decimal(16,9),
    IN p_rece_margin decimal(18,4),
    IN p_contrc_unit int,
    IN p_deliv_flag int,
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
    declare v_margin_pref int;
    declare v_comb_code varchar(6);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_contrc_unit int;
    declare v_deliv_flag int;
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
    SET v_row_id = p_row_id;
    SET v_margin_pref = p_margin_pref;
    SET v_comb_code = p_comb_code;
    SET v_sett_price = p_sett_price;
    SET v_rece_margin = p_rece_margin;
    SET v_contrc_unit = p_contrc_unit;
    SET v_deliv_flag = p_deliv_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_清算_持仓表][{结算价} = @结算价#, {应收保证金} = @应收保证金#, {合约乘数} = @合约乘数#, {交割标志} = @交割标志#][{记录序号} = @记录序号#][1]["更新持仓保证金失败"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, sett_price = v_sett_price, rece_margin = v_rece_margin, contrc_unit = v_contrc_unit, deliv_flag = v_deliv_flag where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.2.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新持仓保证金失败","#",v_mysql_message);
        else
            SET v_error_info = "更新持仓保证金失败";
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_获取清算持仓
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_GetPosi;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_GetPosi(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_row_id bigint,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_futu_acco_no int,
    OUT p_pass_no int,
    OUT p_asset_acco_no int,
    OUT p_exch_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_curr_qty decimal(18,2),
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_comb_code varchar(6),
    OUT p_margin_pref int
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_row_id bigint;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_futu_acco_no int;
    declare v_pass_no int;
    declare v_asset_acco_no int;
    declare v_exch_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_curr_qty decimal(18,2);
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_comb_code varchar(6);
    declare v_margin_pref int;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_init_date int;
    declare v_crncy_type varchar(3);
    declare v_contrc_unit int;
    declare v_posi_amt decimal(18,4);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_rece_margin decimal(18,4);
    declare v_sett_flag int;
    declare v_deliv_flag int;
    declare v_open_amount decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_row_id = 0;
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_futu_acco_no = 0;
    SET v_pass_no = 0;
    SET v_asset_acco_no = 0;
    SET v_exch_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_curr_qty = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_comb_code = " ";
    SET v_margin_pref = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_crncy_type = "CNY";
    SET v_contrc_unit = 0;
    SET v_posi_amt = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_rece_margin = 0;
    SET v_sett_flag = 0;
    SET v_deliv_flag = 0;
    SET v_open_amount = 0;

    
    label_pro:BEGIN
    

    /* set @记录序号# = 0; */
    set v_row_id = 0;

    /* [获取表记录变量语句][清算期货_清算_持仓表][字段][字段变量][{记录序号} > @查询序号# and  {当前数量} > 0 and {结算价} <> 0.00000001 order by {记录序号}] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        crncy_type, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, margin_pref, comb_code, lngsht_type, 
        hedge_type, curr_qty, contrc_unit, posi_amt, 
        pre_settle_price, sett_price, rece_margin, sett_flag, 
        deliv_flag, open_amount into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_crncy_type, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_margin_pref, v_comb_code, v_lngsht_type, 
        v_hedge_type, v_curr_qty, v_contrc_unit, v_posi_amt, 
        v_pre_settle_price, v_sett_price, v_rece_margin, v_sett_flag, 
        v_deliv_flag, v_open_amount from db_clfutu.tb_clfucl_posi where row_id > v_qry_no and  curr_qty > 0 and sett_price <> 0.00000001 order by row_id limit 1;


    /* [检查正常返回][FOUND_ROWS() = 0] */
    if FOUND_ROWS() = 0 then
        leave label_pro;
    end if;


    /* if @组合编码# <> ' ' then */
    if v_comb_code <> ' ' then

        /* set @保证金优惠# ＝ 《保证金优惠-优惠》; */
        set v_margin_pref = 1;
    end if;

    /* [更新表记录][清算期货_清算_持仓表][ {保证金优惠} = @保证金优惠#][{记录序号} = @记录序号#][1]["更新持仓保证金失败"] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfucl_posi set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1,  margin_pref = v_margin_pref where row_id = v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.3.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT("更新持仓保证金失败","#",v_mysql_message);
        else
            SET v_error_info = "更新持仓保证金失败";
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
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_exch_no = v_exch_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_curr_qty = v_curr_qty;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_comb_code = v_comb_code;
    SET p_margin_pref = v_margin_pref;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_计算占用保证金
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_CaclPosiMargin;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_CaclPosiMargin(
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
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_long_hold_margin decimal(18,4),
    IN p_short_hold_margin decimal(18,4),
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_sett_capt_margin decimal(18,4)
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
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_sett_capt_margin decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_long_hold_margin = p_long_hold_margin;
    SET v_short_hold_margin = p_short_hold_margin;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_sett_capt_margin = 0;

    
    label_pro:BEGIN
    
    #目前计算占用保证金，暂时只计算大边保证金，其他规则暂不支持

    /* if @多头持仓保证金# > @空头持仓保证金# then */
    if v_long_hold_margin > v_short_hold_margin then

        /* set @清算占用保证金# = @多头持仓保证金#; */
        set v_sett_capt_margin = v_long_hold_margin;
    else

        /* set @清算占用保证金# =@空头持仓保证金#; */
        set v_sett_capt_margin =v_short_hold_margin;
    end if;
    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;
    SET p_sett_capt_margin = v_sett_capt_margin;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_持仓处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_PosiHoldDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_PosiHoldDeal(
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
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_curr_qty decimal(18,2),
    IN p_posi_amt decimal(18,4),
    IN p_rece_margin decimal(18,4),
    IN p_margin_pref int,
    IN p_comb_code varchar(6),
    IN p_comb_type int,
    IN p_deliv_flag int,
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
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_curr_qty decimal(18,2);
    declare v_posi_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_margin_pref int;
    declare v_comb_code varchar(6);
    declare v_comb_type int;
    declare v_deliv_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_entry_jour_no bigint;
    declare v_tmp_exch_group_no int;
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_tmp_lngsht_type int;
    declare v_tmp_hedge_type int;
    declare v_tmp_pre_entry_amt decimal(18,4);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_curr_qty = p_curr_qty;
    SET v_posi_amt = p_posi_amt;
    SET v_rece_margin = p_rece_margin;
    SET v_margin_pref = p_margin_pref;
    SET v_comb_code = p_comb_code;
    SET v_comb_type = p_comb_type;
    SET v_deliv_flag = p_deliv_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_entry_jour_no = 0;
    SET v_tmp_exch_group_no = 0;
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_tmp_lngsht_type = 0;
    SET v_tmp_hedge_type = 0;
    SET v_tmp_pre_entry_amt = 0;

    
    label_pro:BEGIN
    

    /* set @本币币种# = "CNY"; */
    set v_crncy_type = "CNY";

    /* set @交易币种# = "CNY"; */
    set v_exch_crncy_type = "CNY";

    /* set @汇率# = 1; */
    set v_exch_rate = 1;
    #生成盯市盈亏流水

    /* set @待入账金额# = 0; */
    set v_pre_entry_amt = 0;

    /* set @待入账数量# = 0; */
    set v_pre_entry_qty = 0;

    /* if @当前数量# >0 then */
    if v_curr_qty >0 then

        /* if @多空类型# = 《多空类型-多头》 then */
        if v_lngsht_type = 1 then

            /* set @待入账金额# = @结算价#*@当前数量#*@合约乘数# - @持仓金额#; */
            set v_pre_entry_amt = v_sett_price*v_curr_qty*v_contrc_unit - v_posi_amt;
        else

            /* set @待入账金额# = @持仓金额# - @结算价#*@当前数量#*@合约乘数#; */
            set v_pre_entry_amt = v_posi_amt - v_sett_price*v_curr_qty*v_contrc_unit;
        end if;
    end if;

    /* if @待入账金额# <> 0 then */
    if v_pre_entry_amt <> 0 then

        /* set @业务标志# =《业务标志-期货盯市盈亏》; */
        set v_busi_flag =3001007;

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

        /* set @回滚状态# = 《回滚状态-未回滚》; */
        set v_undo_status = "2";

        /* set @入账资金流水号# = 0; */
        set v_entry_money_jour_no = 0;

        /* set @入账交易组持仓流水号# = 0; */
        set v_entry_exgp_posi_jour_no = 0;

        /* set @入账资产账户持仓流水号# = 0; */
        set v_entry_asac_posi_jour_no = 0;

        /* set @对账流水号# = 0; */
        set v_deli_jour_no = 0;
        #交割持仓处理

        /* if @交割标志# = 1 then */
        if v_deliv_flag = 1 then

            /* set @业务标志# =《业务标志-期货现金交割》; */
            set v_busi_flag =3001010;

            /* set @待入账数量# = -1*@当前数量#; */
            set v_pre_entry_qty = -1*v_curr_qty;
        end if;

        /* [记录不存在插入表记录][清算期货_结算_待入账记录表][字段][字段变量][{交易组编号} = @交易组编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志# and {业务标志} = 《业务标志-期货盯市盈亏》][1][@交易组编号#, @合约代码编号#, @多空类型#, @套保标志#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clfutu.tb_clfust_pre_entry (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_crncy_type, exch_rate, 
            exch_no, futu_acco_no, contrc_code_no, contrc_type, 
            contrc_unit, lngsht_type, curr_qty, hedge_type, 
            pre_settle_price, sett_price, pre_entry_qty, pre_entry_amt, 
            busi_flag, entry_status, undo_status, entry_money_jour_no, 
            entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
            v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
            v_contrc_unit, v_lngsht_type, v_curr_qty, v_hedge_type, 
            v_pre_settle_price, v_sett_price, v_pre_entry_qty, v_pre_entry_amt, 
            v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
            v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no 
            from dual 
            where not exists(select * from db_clfutu.tb_clfust_pre_entry where exch_group_no = v_exch_group_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type and busi_flag = 3001007);
        if v_error_code <> "0" then
                    
            SET v_error_code = "clfutuA.3.27.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type);
            end if;
            leave label_pro;
        end if;


        /* [更新表记录][清算期货_结算_待入账记录表][{待入账金额} = @待入账金额#,{待入账数量}=@待入账数量#][{交易组编号} = @交易组编号# and {合约代码编号} = @合约代码编号# and {多空类型} = @多空类型# and {套保标志} = @套保标志# and {业务标志} = 《业务标志-期货盯市盈亏》 ][2][@交易组编号#, @合约代码编号#, @多空类型#, @套保标志#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_entry_amt = v_pre_entry_amt,pre_entry_qty=v_pre_entry_qty where exch_group_no = v_exch_group_no and contrc_code_no = v_contrc_code_no and lngsht_type = v_lngsht_type and hedge_type = v_hedge_type and busi_flag = 3001007 ;
        if v_error_code = "1" then
                    
            SET v_error_code = "clfutuA.3.27.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type);
            end if;
            leave label_pro;
        end if;


        /* [获取记录序号][@入账流水号#] */
        select LAST_INSERT_ID() into v_entry_jour_no;

    end if;
    #开始处理占用保证金

    /* set @市场编号# = 0; */
    set v_exch_no = 0;

    /* set @交易编码编号# = 0; */
    set v_futu_acco_no = 0;

    /* set @合约代码编号# = 0; */
    set v_contrc_code_no = 0;

    /* set @合约类型# = 0; */
    set v_contrc_type = 0;

    /* set @合约乘数# = 0; */
    set v_contrc_unit = 0;
    #计算资产账户保证金

    /* set @待入账金额# = 0; */
    set v_pre_entry_amt = 0;

    /* set @待入账数量# = 0; */
    set v_pre_entry_qty = 0;

    /* set @临时_交易组编号# = @交易组编号#; */
    set v_tmp_exch_group_no = v_exch_group_no;

    /* set @交易组编号# = 0; */
    set v_exch_group_no = 0;

    /* if @保证金优惠# = 《保证金优惠-优惠》 then */
    if v_margin_pref = 1 then

        /* set @多头持仓保证金# = 0; */
        set v_long_hold_margin = 0;

        /* set @空头持仓保证金# = 0; */
        set v_short_hold_margin = 0;

        /* [获取表记录变量语句][清算期货_清算_持仓表][IFNULL(sum({应收保证金}), 0)][@多头持仓保证金#][ {资产账户编号} = @资产账户编号# and {多空类型} = 《多空类型-多头》 and {套保标志} = @套保标志# and {组合编码} = @组合编码#] */
        select IFNULL(sum(rece_margin), 0) into v_long_hold_margin from db_clfutu.tb_clfucl_posi where  asset_acco_no = v_asset_acco_no and lngsht_type = 1 and hedge_type = v_hedge_type and comb_code = v_comb_code limit 1;


        /* [获取表记录变量语句][清算期货_清算_持仓表][IFNULL(sum({应收保证金}), 0)][@空头持仓保证金#][ {资产账户编号} = @资产账户编号# and {多空类型} = 《多空类型-空头》 and {套保标志} = @套保标志# and {组合编码} = @组合编码#] */
        select IFNULL(sum(rece_margin), 0) into v_short_hold_margin from db_clfutu.tb_clfucl_posi where  asset_acco_no = v_asset_acco_no and lngsht_type = 2 and hedge_type = v_hedge_type and comb_code = v_comb_code limit 1;


        /* if (@多空类型# = 《多空类型-多头》 and @多头持仓保证金# >= @空头持仓保证金#) or (@多空类型# = 《多空类型-空头》 and @多头持仓保证金# < @空头持仓保证金#) then */
        if (v_lngsht_type = 1 and v_long_hold_margin >= v_short_hold_margin) or (v_lngsht_type = 2 and v_long_hold_margin < v_short_hold_margin) then

            /* set @待入账金额# = @应收保证金#; */
            set v_pre_entry_amt = v_rece_margin;
        end if;
    else

        /* set @待入账金额# = @应收保证金#; */
        set v_pre_entry_amt = v_rece_margin;
    end if;

    /* set @临时_多空类型# = @多空类型#; */
    set v_tmp_lngsht_type = v_lngsht_type;

    /* set @临时_套保标志# = @套保标志#; */
    set v_tmp_hedge_type = v_hedge_type;
    #生成保证金变动流水

        /* set @业务标志# =《业务标志-期货占用保证金入账》; */
        set v_busi_flag =3001009;

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

        /* set @回滚状态# = 《回滚状态-未回滚》; */
        set v_undo_status = "2";

        /* set @入账资金流水号# = 0; */
        set v_entry_money_jour_no = 0;

        /* set @入账交易组持仓流水号# = 0; */
        set v_entry_exgp_posi_jour_no = 0;

        /* set @入账资产账户持仓流水号# = 0; */
        set v_entry_asac_posi_jour_no = 0;

        /* set @对账流水号# = 0; */
        set v_deli_jour_no = 0;

        /* set @临时_待入账金额# = @待入账金额#; */
        set v_tmp_pre_entry_amt = v_pre_entry_amt;

        /* set @待入账金额# = 0; */
        set v_pre_entry_amt = 0;

        /* set @当前数量# = 0; */
        set v_curr_qty = 0;

        /* set @多空类型# = 0; */
        set v_lngsht_type = 0;

        /* set @套保标志# = 0; */
        set v_hedge_type = 0;

        /* [记录不存在插入表记录][清算期货_结算_待入账记录表][字段][字段变量][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号#][1][@交易组编号#, @合约代码编号#, @多空类型#, @套保标志#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clfutu.tb_clfust_pre_entry (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_crncy_type, exch_rate, 
            exch_no, futu_acco_no, contrc_code_no, contrc_type, 
            contrc_unit, lngsht_type, curr_qty, hedge_type, 
            pre_settle_price, sett_price, pre_entry_qty, pre_entry_amt, 
            busi_flag, entry_status, undo_status, entry_money_jour_no, 
            entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
            v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
            v_contrc_unit, v_lngsht_type, v_curr_qty, v_hedge_type, 
            v_pre_settle_price, v_sett_price, v_pre_entry_qty, v_pre_entry_amt, 
            v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
            v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no 
            from dual 
            where not exists(select * from db_clfutu.tb_clfust_pre_entry where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no);
        if v_error_code <> "0" then
                    
            SET v_error_code = "clfutuA.3.27.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type);
            end if;
            leave label_pro;
        end if;


        /* set @待入账金额# = @临时_待入账金额#; */
        set v_pre_entry_amt = v_tmp_pre_entry_amt;

        /* [更新表记录][清算期货_结算_待入账记录表][{待入账金额} = {待入账金额} + @待入账金额#][{交易组编号} = @交易组编号# and {资产账户编号} = @资产账户编号#][2][@交易组编号#, @合约代码编号#, @多空类型#, @套保标志#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_entry_amt = pre_entry_amt + v_pre_entry_amt where exch_group_no = v_exch_group_no and asset_acco_no = v_asset_acco_no;
        if v_error_code = "1" then
                    
            SET v_error_code = "clfutuA.3.27.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type);
            end if;
            leave label_pro;
        end if;


        /* [获取记录序号][@入账流水号#] */
        select LAST_INSERT_ID() into v_entry_jour_no;


    /* set @多空类型# = @临时_多空类型#; */
    set v_lngsht_type = v_tmp_lngsht_type;

    /* set @套保标志# = @临时_套保标志#; */
    set v_hedge_type = v_tmp_hedge_type;
    #计算交易组保证金

    /* set @待入账金额# = 0; */
    set v_pre_entry_amt = 0;

    /* set @待入账数量# = 0; */
    set v_pre_entry_qty = 0;

    /* set @交易组编号# = @临时_交易组编号#; */
    set v_exch_group_no = v_tmp_exch_group_no;

    /* if @保证金优惠# = 《保证金优惠-优惠》 then */
    if v_margin_pref = 1 then

        /* set @多头持仓保证金# = 0; */
        set v_long_hold_margin = 0;

        /* set @空头持仓保证金# = 0; */
        set v_short_hold_margin = 0;

        /* [获取表记录变量语句][清算期货_清算_持仓表][IFNULL(sum({应收保证金}), 0)][@多头持仓保证金#][{交易组编号} = @交易组编号# and {多空类型} = 《多空类型-多头》 and {套保标志} = @套保标志# and {组合编码} = @组合编码#] */
        select IFNULL(sum(rece_margin), 0) into v_long_hold_margin from db_clfutu.tb_clfucl_posi where exch_group_no = v_exch_group_no and lngsht_type = 1 and hedge_type = v_hedge_type and comb_code = v_comb_code limit 1;


        /* [获取表记录变量语句][清算期货_清算_持仓表][IFNULL(sum({应收保证金}), 0)][@空头持仓保证金#][{交易组编号} = @交易组编号# and {多空类型} = 《多空类型-空头》  and {套保标志} = @套保标志# and {组合编码} = @组合编码#] */
        select IFNULL(sum(rece_margin), 0) into v_short_hold_margin from db_clfutu.tb_clfucl_posi where exch_group_no = v_exch_group_no and lngsht_type = 2  and hedge_type = v_hedge_type and comb_code = v_comb_code limit 1;


        /* if (@多空类型# = 《多空类型-多头》 and @多头持仓保证金# >= @空头持仓保证金#) or (@多空类型# = 《多空类型-空头》 and @多头持仓保证金# < @空头持仓保证金#) then */
        if (v_lngsht_type = 1 and v_long_hold_margin >= v_short_hold_margin) or (v_lngsht_type = 2 and v_long_hold_margin < v_short_hold_margin) then

            /* set @待入账金额# = @应收保证金#; */
            set v_pre_entry_amt = v_rece_margin;
        end if;
    else

        /* set @待入账金额# = @应收保证金#; */
        set v_pre_entry_amt = v_rece_margin;
    end if;
    #生成保证金变动流水

        /* set @业务标志# =《业务标志-期货占用保证金入账》; */
        set v_busi_flag =3001009;

        /* set @入账状态# = 《入账状态-未入账》; */
        set v_entry_status = "2";

        /* set @回滚状态# = 《回滚状态-未回滚》; */
        set v_undo_status = "2";

        /* set @入账资金流水号# = 0; */
        set v_entry_money_jour_no = 0;

        /* set @入账交易组持仓流水号# = 0; */
        set v_entry_exgp_posi_jour_no = 0;

        /* set @入账资产账户持仓流水号# = 0; */
        set v_entry_asac_posi_jour_no = 0;

        /* set @对账流水号# = 0; */
        set v_deli_jour_no = 0;

        /* set @临时_待入账金额# = @待入账金额#; */
        set v_tmp_pre_entry_amt = v_pre_entry_amt;

        /* set @待入账金额# = 0; */
        set v_pre_entry_amt = 0;

        /* set @当前数量# = 0; */
        set v_curr_qty = 0;

        /* set @多空类型# = 0; */
        set v_lngsht_type = 0;

        /* set @套保标志# = 0; */
        set v_hedge_type = 0;

        /* [记录不存在插入表记录][清算期货_结算_待入账记录表][字段][字段变量][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {业务标志} = 《业务标志-期货占用保证金入账》][1][@交易组编号#, @合约代码编号#, @多空类型#, @套保标志#] */
        set v_create_date = date_format(curdate(),'%Y%m%d');
        set v_create_time = date_format(curtime(),'%H%i%s');
        set v_update_date = v_create_date;
        set v_update_time = v_create_time;
        set v_update_times = 1;
        insert into db_clfutu.tb_clfust_pre_entry (
            create_date, create_time, update_date, 
            update_time, update_times, init_date, co_no, 
            pd_no, exch_group_no, asset_acco_no, pass_no, 
            out_acco, crncy_type, exch_crncy_type, exch_rate, 
            exch_no, futu_acco_no, contrc_code_no, contrc_type, 
            contrc_unit, lngsht_type, curr_qty, hedge_type, 
            pre_settle_price, sett_price, pre_entry_qty, pre_entry_amt, 
            busi_flag, entry_status, undo_status, entry_money_jour_no, 
            entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no) 
            select v_create_date, v_create_time, v_update_date, 
            v_update_time, v_update_times, v_init_date, v_co_no, 
            v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
            v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
            v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
            v_contrc_unit, v_lngsht_type, v_curr_qty, v_hedge_type, 
            v_pre_settle_price, v_sett_price, v_pre_entry_qty, v_pre_entry_amt, 
            v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
            v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no 
            from dual 
            where not exists(select * from db_clfutu.tb_clfust_pre_entry where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and busi_flag = 3001009);
        if v_error_code <> "0" then
                    
            SET v_error_code = "clfutuA.3.27.1";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type);
            end if;
            leave label_pro;
        end if;


        /* set @待入账金额# = @临时_待入账金额#; */
        set v_pre_entry_amt = v_tmp_pre_entry_amt;

        /* [更新表记录][清算期货_结算_待入账记录表][{待入账金额} = {待入账金额} + @待入账金额#][{资产账户编号} = @资产账户编号# and {交易组编号} = @交易组编号# and {业务标志} = 《业务标志-期货占用保证金入账》][2][@交易组编号#, @合约代码编号#, @多空类型#, @套保标志#] */
        set v_update_date = date_format(curdate(),'%Y%m%d');
        set v_update_time = date_format(curtime(),'%H%i%s');
        update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, pre_entry_amt = pre_entry_amt + v_pre_entry_amt where asset_acco_no = v_asset_acco_no and exch_group_no = v_exch_group_no and busi_flag = 3001009;
        if v_error_code = "1" then
                    
            SET v_error_code = "clfutuA.3.27.2";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type),"#",v_mysql_message);
            else
                SET v_error_info = concat("交易组编号=",v_exch_group_no,","," 合约代码编号=", v_contrc_code_no,","," 多空类型=", v_lngsht_type,","," 套保标志=", v_hedge_type);
            end if;
            leave label_pro;
        end if;


        /* [获取记录序号][@入账流水号#] */
        select LAST_INSERT_ID() into v_entry_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_持仓盯市盈亏处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_MarkedPandlDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_MarkedPandlDeal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_curr_qty decimal(18,2),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_curr_qty decimal(18,2);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_strike_aver_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_num int;
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_deal_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_entry_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_curr_qty = p_curr_qty;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_rece_margin = 0;
    SET v_strike_price = 0;
    SET v_strike_aver_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_num = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_deal_flag = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_entry_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @成交日期# = 0; */
    set v_strike_date = 0;

    /* set @成交时间# = 0; */
    set v_strike_time = 0;

    /* set @成交编号# = 0; */
    set v_strike_no = 0;

    /* set @申报日期# = 0; */
    set v_report_date = 0;

    /* set @申报时间# = 0; */
    set v_report_time = 0;

    /* set @申报编号# = 0; */
    set v_report_no = 0;

    /* set @订单日期# = 0; */
    set v_order_date = 0;

    /* set @订单时间# = 0; */
    set v_order_time = 0;

    /* set @订单编号# = 0; */
    set v_order_no = 0;

    /* set @订单方向# = "0"; */
    set v_order_dir = "0";

    /* set @开平方向# = "0"; */
    set v_contrc_dir = "0";

    /* set @订单价格# = 0; */
    set v_order_price = 0;

    /* set @订单数量# = 0; */
    set v_order_qty = 0;

    /* set @组合编码# = " "; */
    set v_comb_code = " ";

    /* set @多头持仓保证金# = 0; */
    set v_long_hold_margin = 0;

    /* set @空头持仓保证金# = 0; */
    set v_short_hold_margin = 0;

    /* set @清算占用保证金# = 0; */
    set v_sett_capt_margin = 0;
    #处理盯市盈亏

    /* if @多空类型# = 《多空类型-空头》 then */
    if v_lngsht_type = 2 then

        /* set @清算盯市盈亏#=@当前数量#*(@昨结算价# - @结算价#)*@合约乘数#; */
        set v_sett_marked_pandl=v_curr_qty*(v_pre_settle_price - v_sett_price)*v_contrc_unit;
    else

        /* set @清算盯市盈亏#=@当前数量#*(@结算价# - @昨结算价#)*@合约乘数#; */
        set v_sett_marked_pandl=v_curr_qty*(v_sett_price - v_pre_settle_price)*v_contrc_unit;
    end if;

    /* set @清算平仓盈亏# = 0; */
    set v_sett_close_pandl = 0;

    /* set @清算平今仓盈亏# = 0; */
    set v_sett_close_pandl_today = 0;

    /* set @待入账金额#=@清算盯市盈亏#; */
    set v_pre_entry_amt=v_sett_marked_pandl;

    /* set @待入账数量#=0; */
    set v_pre_entry_qty=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @成交价格# = @结算价#; */
    set v_strike_price = v_sett_price;

    /* set @成交均价# = @结算价#; */
    set v_strike_aver_price = v_sett_price;

    /* set @成交数量# = @当前数量#; */
    set v_strike_qty = v_curr_qty;

    /* set @成交笔数# = 1; */
    set v_strike_num = 1;

    /* set @成交金额# = @当前数量# * @结算价# *@合约乘数#; */
    set v_strike_amt = v_curr_qty * v_sett_price *v_contrc_unit;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @申报费用# = 0; */
    set v_report_fee = 0;

    /* set @撤单费用# = 0; */
    set v_wtdraw_fee = 0;

    /* set @交割费用# = 0; */
    set v_deli_fee = 0;

    /* set @手续费用# = 0; */
    set v_service_fee = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @外部申报费用# = 0; */
    set v_out_report_fee = 0;

    /* set @外部撤单费用# = 0; */
    set v_out_cancel_fee = 0;

    /* set @外部交割费用# = 0; */
    set v_out_deli_fee = 0;

    /* set @外部手续费用# = 0; */
    set v_out_service_fee = 0;

    /* set @外部其他费用# = 0; */
    set v_out_other_fee = 0;

    /* set @外部交易佣金# = 0; */
    set v_out_brkage_commis = 0;

    /* set @外部其他佣金# = 0; */
    set v_out_other_commis = 0;

    /* set @外部全部费用#=0; */
    set v_out_all_fee=0;
    #对资金处理取2位小数

    /* set @待入账金额# = round(@待入账金额#, 2); */
    set v_pre_entry_amt = round(v_pre_entry_amt, 2);

    /* set @成交金额# = round(@成交金额#, 2); */
    set v_strike_amt = round(v_strike_amt, 2);

    /* set @清算盯市盈亏# = round(@清算盯市盈亏#, 2); */
    set v_sett_marked_pandl = round(v_sett_marked_pandl, 2);
    #业务标志

    /* set @业务标志#=《期货盯市盈亏》; */
    set v_busi_flag=期货盯市盈亏;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* set @回滚状态# = 《回滚状态-未回滚》; */
    set v_undo_status = "2";

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* set @对账流水号# = 0; */
    set v_deli_jour_no = 0;

    /* [插入表记录][清算期货_结算_待入账记录表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#,@开平方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfust_pre_entry(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_crncy_type, exch_rate, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, lngsht_type, curr_qty, hedge_type, 
        pre_settle_price, sett_price, pre_entry_qty, pre_entry_amt, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_lngsht_type, v_curr_qty, v_hedge_type, 
        v_pre_settle_price, v_sett_price, v_pre_entry_qty, v_pre_entry_amt, 
        v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
        v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.28.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir,",","开平方向=",v_contrc_dir),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账流水号#] */
    select LAST_INSERT_ID() into v_entry_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_持仓到期交割处理
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_AutoDeliDeal;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_AutoDeliDeal(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_row_id bigint,
    IN p_init_date int,
    IN p_co_no int,
    IN p_pd_no int,
    IN p_exch_group_no int,
    IN p_asset_acco_no int,
    IN p_pass_no int,
    IN p_out_acco varchar(32),
    IN p_crncy_type varchar(3),
    IN p_exch_crncy_type varchar(3),
    IN p_exch_rate decimal(18,12),
    IN p_exch_no int,
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_contrc_type int,
    IN p_contrc_unit int,
    IN p_lngsht_type int,
    IN p_hedge_type int,
    IN p_pre_settle_price decimal(16,9),
    IN p_sett_price decimal(16,9),
    IN p_curr_qty decimal(18,2),
    IN p_deli_fee decimal(18,4),
    IN p_out_deli_fee decimal(18,4),
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
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_curr_qty decimal(18,2);
    declare v_deli_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_comb_code varchar(6);
    declare v_comb_type int;
    declare v_comb_name varchar(64);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_pre_entry_amt decimal(18,4);
    declare v_pre_entry_qty decimal(18,2);
    declare v_rece_margin decimal(18,4);
    declare v_strike_price decimal(16,9);
    declare v_strike_aver_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_num int;
    declare v_strike_amt decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_deal_flag int;
    declare v_entry_money_jour_no bigint;
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_entry_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_init_date = p_init_date;
    SET v_co_no = p_co_no;
    SET v_pd_no = p_pd_no;
    SET v_exch_group_no = p_exch_group_no;
    SET v_asset_acco_no = p_asset_acco_no;
    SET v_pass_no = p_pass_no;
    SET v_out_acco = p_out_acco;
    SET v_crncy_type = p_crncy_type;
    SET v_exch_crncy_type = p_exch_crncy_type;
    SET v_exch_rate = p_exch_rate;
    SET v_exch_no = p_exch_no;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_contrc_type = p_contrc_type;
    SET v_contrc_unit = p_contrc_unit;
    SET v_lngsht_type = p_lngsht_type;
    SET v_hedge_type = p_hedge_type;
    SET v_pre_settle_price = p_pre_settle_price;
    SET v_sett_price = p_sett_price;
    SET v_curr_qty = p_curr_qty;
    SET v_deli_fee = p_deli_fee;
    SET v_out_deli_fee = p_out_deli_fee;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_comb_code = " ";
    SET v_comb_type = 0;
    SET v_comb_name = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_pre_entry_amt = 0;
    SET v_pre_entry_qty = 0;
    SET v_rece_margin = 0;
    SET v_strike_price = 0;
    SET v_strike_aver_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_num = 0;
    SET v_strike_amt = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_deal_flag = 0;
    SET v_entry_money_jour_no = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_entry_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @成交日期# = 0; */
    set v_strike_date = 0;

    /* set @成交时间# = 0; */
    set v_strike_time = 0;

    /* set @成交编号# = 0; */
    set v_strike_no = 0;

    /* set @申报日期# = 0; */
    set v_report_date = 0;

    /* set @申报时间# = 0; */
    set v_report_time = 0;

    /* set @申报编号# = 0; */
    set v_report_no = 0;

    /* set @订单日期# = 0; */
    set v_order_date = 0;

    /* set @订单时间# = 0; */
    set v_order_time = 0;

    /* set @订单编号# = 0; */
    set v_order_no = 0;

    /* set @订单方向# = "0"; */
    set v_order_dir = "0";

    /* set @开平方向# = "0"; */
    set v_contrc_dir = "0";

    /* set @订单价格# = 0; */
    set v_order_price = 0;

    /* set @订单数量# = 0; */
    set v_order_qty = 0;

    /* set @组合编码# = " "; */
    set v_comb_code = " ";

    /* set @组合类型# = 0; */
    set v_comb_type = 0;

    /* set @组合名称# = " "; */
    set v_comb_name = " ";

    /* set @多头持仓保证金# = 0; */
    set v_long_hold_margin = 0;

    /* set @空头持仓保证金# = 0; */
    set v_short_hold_margin = 0;

    /* set @清算占用保证金# = 0; */
    set v_sett_capt_margin = 0;
    #处理自动到期交割，当日不再处理盯市盈亏

    /* if @多空类型# = 《多空类型-空头》 then */
    if v_lngsht_type = 2 then

        /* set @清算盯市盈亏#=@当前数量#*(@昨结算价# - @结算价#)*@合约乘数#; */
        set v_sett_marked_pandl=v_curr_qty*(v_pre_settle_price - v_sett_price)*v_contrc_unit;
    else

        /* set @清算盯市盈亏#=@当前数量#*(@结算价# - @昨结算价#)*@合约乘数#; */
        set v_sett_marked_pandl=v_curr_qty*(v_sett_price - v_pre_settle_price)*v_contrc_unit;
    end if;

    /* set @清算平仓盈亏# = 0; */
    set v_sett_close_pandl = 0;

    /* set @清算平今仓盈亏# = 0; */
    set v_sett_close_pandl_today = 0;

    /* set @待入账金额#=@清算盯市盈亏# + @交割费用#; */
    set v_pre_entry_amt=v_sett_marked_pandl + v_deli_fee;

    /* set @待入账数量#=0; */
    set v_pre_entry_qty=0;

    /* set @应收保证金#=0; */
    set v_rece_margin=0;

    /* set @成交价格# = @结算价#; */
    set v_strike_price = v_sett_price;

    /* set @成交均价# = @结算价#; */
    set v_strike_aver_price = v_sett_price;

    /* set @成交数量# = @当前数量#; */
    set v_strike_qty = v_curr_qty;

    /* set @成交笔数# = 1; */
    set v_strike_num = 1;

    /* set @成交金额# = @当前数量# * @结算价# * @合约乘数#; */
    set v_strike_amt = v_curr_qty * v_sett_price * v_contrc_unit;

    /* set @全部费用# = 0; */
    set v_all_fee = 0;

    /* set @申报费用# = 0; */
    set v_report_fee = 0;

    /* set @撤单费用# = 0; */
    set v_wtdraw_fee = 0;

    /* set @交割费用# = 0; */
    set v_deli_fee = 0;

    /* set @手续费用# = 0; */
    set v_service_fee = 0;

    /* set @其他费用# = 0; */
    set v_other_fee = 0;

    /* set @交易佣金# = 0; */
    set v_trade_commis = 0;

    /* set @其他佣金# = 0; */
    set v_other_commis = 0;

    /* set @外部申报费用# = 0; */
    set v_out_report_fee = 0;

    /* set @外部撤单费用# = 0; */
    set v_out_cancel_fee = 0;

    /* set @外部手续费用# = 0; */
    set v_out_service_fee = 0;

    /* set @外部其他费用# = 0; */
    set v_out_other_fee = 0;

    /* set @外部交易佣金# = 0; */
    set v_out_brkage_commis = 0;

    /* set @外部其他佣金# = 0; */
    set v_out_other_commis = 0;

    /* set @外部全部费用#=0; */
    set v_out_all_fee=0;
    #对资金处理取2位小数

    /* set @待入账金额# = round(@待入账金额#, 2); */
    set v_pre_entry_amt = round(v_pre_entry_amt, 2);

    /* set @成交金额# = round(@成交金额#, 2); */
    set v_strike_amt = round(v_strike_amt, 2);

    /* set @清算盯市盈亏# = round(@清算盯市盈亏#, 2); */
    set v_sett_marked_pandl = round(v_sett_marked_pandl, 2);

    /* set @交割费用# = round(@交割费用#, 2); */
    set v_deli_fee = round(v_deli_fee, 2);

    /* set @外部交割费用# = round(@外部交割费用#, 2); */
    set v_out_deli_fee = round(v_out_deli_fee, 2);
    #业务标志

    /* set @业务标志#=《期货现金交割》; */
    set v_busi_flag=期货现金交割;

    /* set @入账状态# = 《入账状态-未入账》; */
    set v_entry_status = "2";

    /* set @回滚状态# = 《回滚状态-未回滚》; */
    set v_undo_status = "2";

    /* set @处理标志# = 《处理标志-未处理》; */
    set v_deal_flag = 2;

    /* set @入账资金流水号# = 0; */
    set v_entry_money_jour_no = 0;

    /* set @入账交易组持仓流水号# = 0; */
    set v_entry_exgp_posi_jour_no = 0;

    /* set @入账资产账户持仓流水号# = 0; */
    set v_entry_asac_posi_jour_no = 0;

    /* set @对账流水号# = 0; */
    set v_deli_jour_no = 0;

    /* [插入表记录][清算期货_结算_待入账记录表][字段][字段变量][1][@通道编号#,@外部账号#,@市场编号#,@成交日期#,@成交编号#,@订单方向#,@开平方向#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clfutu.tb_clfust_pre_entry(
        create_date, create_time, update_date, 
        update_time, update_times, init_date, co_no, 
        pd_no, exch_group_no, asset_acco_no, pass_no, 
        out_acco, crncy_type, exch_crncy_type, exch_rate, 
        exch_no, futu_acco_no, contrc_code_no, contrc_type, 
        contrc_unit, lngsht_type, curr_qty, hedge_type, 
        pre_settle_price, sett_price, pre_entry_qty, pre_entry_amt, 
        busi_flag, entry_status, undo_status, entry_money_jour_no, 
        entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no) 
    value( 
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_init_date, v_co_no, 
        v_pd_no, v_exch_group_no, v_asset_acco_no, v_pass_no, 
        v_out_acco, v_crncy_type, v_exch_crncy_type, v_exch_rate, 
        v_exch_no, v_futu_acco_no, v_contrc_code_no, v_contrc_type, 
        v_contrc_unit, v_lngsht_type, v_curr_qty, v_hedge_type, 
        v_pre_settle_price, v_sett_price, v_pre_entry_qty, v_pre_entry_amt, 
        v_busi_flag, v_entry_status, v_undo_status, v_entry_money_jour_no, 
        v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no);
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.29.1";
        SET v_error_info =  CONCAT(concat("通道编号=",v_pass_no,",","外部账号=",v_out_acco,",","市场编号=",v_exch_no,",","成交日期=",v_strike_date,",","成交编号=",v_strike_no,",","订单方向=",v_order_dir,",","开平方向=",v_contrc_dir),"#",v_mysql_message);
        leave label_pro;
    end if;


    /* [获取记录序号][@入账流水号#] */
    select LAST_INSERT_ID() into v_entry_jour_no;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_更新待入账记录入账状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_UpdatePreEntryEntryStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_UpdatePreEntryEntryStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_entry_status varchar(2),
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
    declare v_row_id bigint;
    declare v_entry_status varchar(2);
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
    SET v_row_id = p_row_id;
    SET v_entry_status = p_entry_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_结算_待入账记录表][{入账状态}=@入账状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status=v_entry_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.40.2";
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
use db_clfutu;;

# 原子_清算期货_结算_更新待入账记录回滚状态
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_UpdatePreEntryUndoStatus;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_UpdatePreEntryUndoStatus(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_undo_status varchar(2),
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
    declare v_row_id bigint;
    declare v_undo_status varchar(2);
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
    SET v_row_id = p_row_id;
    SET v_undo_status = p_undo_status;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_结算_待入账记录表][{回滚状态}=@回滚状态#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, undo_status=v_undo_status where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.41.2";
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
use db_clfutu;;

# 原子_清算期货_结算_更新待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_UpdatePreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_UpdatePreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_init_date int,
    IN p_row_id bigint,
    IN p_entry_money_jour_no bigint,
    IN p_entry_posi_jour_no bigint,
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
    declare v_row_id bigint;
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
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
    SET v_row_id = p_row_id;
    SET v_entry_money_jour_no = p_entry_money_jour_no;
    SET v_entry_posi_jour_no = p_entry_posi_jour_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');

    
    label_pro:BEGIN
    

    /* [更新表记录][清算期货_结算_待入账记录表][{入账资金流水号}=@入账资金流水号#, {入账持仓流水号}=@入账持仓流水号#][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_money_jour_no=v_entry_money_jour_no, entry_posi_jour_no=v_entry_posi_jour_no where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.42.2";
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
use db_clfutu;;

# 原子_清算期货_结算_更新获取待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_UpdateGetPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_UpdateGetPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_query_row_id bigint,
    IN p_ctrl_flag int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint
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
    declare v_ctrl_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
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
    SET v_ctrl_flag = p_ctrl_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_sett_capt_margin = 0;
    SET v_sett_marked_pandl = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* if @控制标志# = 1 then */
    if v_ctrl_flag = 1 then

        /* [锁定获取表记录变量][清算期货_结算_待入账记录表][字段][字段变量][{记录序号} = @查询记录序号# and {入账状态} <>《入账状态-已入账》][4][" "] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, out_acco, crncy_type, exch_crncy_type, 
            exch_rate, exch_no, futu_acco_no, contrc_code_no, 
            contrc_type, contrc_unit, lngsht_type, curr_qty, 
            hedge_type, pre_settle_price, sett_price, pre_entry_qty, 
            pre_entry_amt, busi_flag, entry_status, undo_status, 
            entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
            v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
            v_contrc_type, v_contrc_unit, v_lngsht_type, v_curr_qty, 
            v_hedge_type, v_pre_settle_price, v_sett_price, v_pre_entry_qty, 
            v_pre_entry_amt, v_busi_flag, v_entry_status, v_undo_status, 
            v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no from db_clfutu.tb_clfust_pre_entry where row_id = v_query_row_id and entry_status <>"1" limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clfutuA.3.43.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(" ","#",v_mysql_message);
            else
                SET v_error_info = " ";
            end if;
            leave label_pro;
        end if;

    else

        /* [锁定获取表记录变量][清算期货_结算_待入账记录表][字段][字段变量][{入账状态} <>《入账状态-已入账》 order by {记录序号}][4][" "] */
        select row_id, create_date, create_time, 
            update_date, update_time, update_times, init_date, 
            co_no, pd_no, exch_group_no, asset_acco_no, 
            pass_no, out_acco, crncy_type, exch_crncy_type, 
            exch_rate, exch_no, futu_acco_no, contrc_code_no, 
            contrc_type, contrc_unit, lngsht_type, curr_qty, 
            hedge_type, pre_settle_price, sett_price, pre_entry_qty, 
            pre_entry_amt, busi_flag, entry_status, undo_status, 
            entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no into v_row_id, v_create_date, v_create_time, 
            v_update_date, v_update_time, v_update_times, v_init_date, 
            v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
            v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
            v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
            v_contrc_type, v_contrc_unit, v_lngsht_type, v_curr_qty, 
            v_hedge_type, v_pre_settle_price, v_sett_price, v_pre_entry_qty, 
            v_pre_entry_amt, v_busi_flag, v_entry_status, v_undo_status, 
            v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no from db_clfutu.tb_clfust_pre_entry where entry_status <>"1" order by row_id limit 1 for update;
        if FOUND_ROWS() = 0 then
                    
            SET v_error_code = "clfutuA.3.43.4";
            if v_mysql_message <> "" then
                SET v_error_info = CONCAT(" ","#",v_mysql_message);
            else
                SET v_error_info = " ";
            end if;
            leave label_pro;
        end if;

    end if;

    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* [更新表记录][清算期货_结算_待入账记录表][{入账状态}=《入账状态-已入账》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.43.2";
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
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_更新获取回滚待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_UpdateGetUndoPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_UpdateGetUndoPreEntry(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_qry_no int,
    OUT p_error_code varchar(32),
    OUT p_error_info varchar(255),
    OUT p_record_count int,
    OUT p_row_id bigint,
    OUT p_init_date int,
    OUT p_co_no int,
    OUT p_pd_no int,
    OUT p_exch_group_no int,
    OUT p_asset_acco_no int,
    OUT p_pass_no int,
    OUT p_out_acco varchar(32),
    OUT p_crncy_type varchar(3),
    OUT p_exch_crncy_type varchar(3),
    OUT p_exch_rate decimal(18,12),
    OUT p_exch_no int,
    OUT p_futu_acco_no int,
    OUT p_contrc_code_no int,
    OUT p_contrc_type int,
    OUT p_contrc_unit int,
    OUT p_strike_date int,
    OUT p_strike_time int,
    OUT p_strike_no varchar(64),
    OUT p_report_date int,
    OUT p_report_time int,
    OUT p_report_no varchar(32),
    OUT p_order_date int,
    OUT p_order_time int,
    OUT p_order_no int,
    OUT p_order_dir int,
    OUT p_contrc_dir int,
    OUT p_lngsht_type int,
    OUT p_hedge_type int,
    OUT p_order_price decimal(16,9),
    OUT p_order_qty decimal(18,2),
    OUT p_pre_settle_price decimal(16,9),
    OUT p_sett_price decimal(16,9),
    OUT p_strike_price decimal(16,9),
    OUT p_strike_qty decimal(18,2),
    OUT p_strike_amt decimal(18,4),
    OUT p_strike_num int,
    OUT p_pre_entry_qty decimal(18,2),
    OUT p_pre_entry_amt decimal(18,4),
    OUT p_rece_margin decimal(18,4),
    OUT p_comb_code varchar(6),
    OUT p_long_hold_margin decimal(18,4),
    OUT p_short_hold_margin decimal(18,4),
    OUT p_sett_capt_margin decimal(18,4),
    OUT p_sett_close_pandl decimal(18,4),
    OUT p_sett_marked_pandl decimal(18,4),
    OUT p_sett_close_pandl_today decimal(18,4),
    OUT p_all_fee decimal(18,4),
    OUT p_report_fee decimal(18,4),
    OUT p_wtdraw_fee decimal(18,4),
    OUT p_deli_fee decimal(18,4),
    OUT p_service_fee decimal(18,4),
    OUT p_other_fee decimal(18,4),
    OUT p_trade_commis decimal(18,4),
    OUT p_other_commis decimal(18,4),
    OUT p_out_all_fee decimal(18,4),
    OUT p_out_report_fee decimal(18,4),
    OUT p_out_cancel_fee decimal(18,4),
    OUT p_out_deli_fee decimal(18,4),
    OUT p_out_service_fee decimal(18,4),
    OUT p_out_other_fee decimal(18,4),
    OUT p_out_brkage_commis decimal(18,4),
    OUT p_out_other_commis decimal(18,4),
    OUT p_busi_flag int,
    OUT p_entry_status varchar(2),
    OUT p_undo_status varchar(2),
    OUT p_entry_money_jour_no bigint,
    OUT p_entry_posi_jour_no bigint,
    OUT p_deli_jour_no bigint
   )
BEGIN
    declare v_opor_co_no int;
    declare v_opor_no int;
    declare v_oper_mac varchar(32);
    declare v_oper_ip_addr varchar(32);
    declare v_oper_info varchar(1024);
    declare v_oper_way varchar(2);
    declare v_func_code varchar(16);
    declare v_qry_no int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_record_count int;
    declare v_row_id bigint;
    declare v_init_date int;
    declare v_co_no int;
    declare v_pd_no int;
    declare v_exch_group_no int;
    declare v_asset_acco_no int;
    declare v_pass_no int;
    declare v_out_acco varchar(32);
    declare v_crncy_type varchar(3);
    declare v_exch_crncy_type varchar(3);
    declare v_exch_rate decimal(18,12);
    declare v_exch_no int;
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_contrc_type int;
    declare v_contrc_unit int;
    declare v_strike_date int;
    declare v_strike_time int;
    declare v_strike_no varchar(64);
    declare v_report_date int;
    declare v_report_time int;
    declare v_report_no varchar(32);
    declare v_order_date int;
    declare v_order_time int;
    declare v_order_no int;
    declare v_order_dir int;
    declare v_contrc_dir int;
    declare v_lngsht_type int;
    declare v_hedge_type int;
    declare v_order_price decimal(16,9);
    declare v_order_qty decimal(18,2);
    declare v_pre_settle_price decimal(16,9);
    declare v_sett_price decimal(16,9);
    declare v_strike_price decimal(16,9);
    declare v_strike_qty decimal(18,2);
    declare v_strike_amt decimal(18,4);
    declare v_strike_num int;
    declare v_pre_entry_qty decimal(18,2);
    declare v_pre_entry_amt decimal(18,4);
    declare v_rece_margin decimal(18,4);
    declare v_comb_code varchar(6);
    declare v_long_hold_margin decimal(18,4);
    declare v_short_hold_margin decimal(18,4);
    declare v_sett_capt_margin decimal(18,4);
    declare v_sett_close_pandl decimal(18,4);
    declare v_sett_marked_pandl decimal(18,4);
    declare v_sett_close_pandl_today decimal(18,4);
    declare v_all_fee decimal(18,4);
    declare v_report_fee decimal(18,4);
    declare v_wtdraw_fee decimal(18,4);
    declare v_deli_fee decimal(18,4);
    declare v_service_fee decimal(18,4);
    declare v_other_fee decimal(18,4);
    declare v_trade_commis decimal(18,4);
    declare v_other_commis decimal(18,4);
    declare v_out_all_fee decimal(18,4);
    declare v_out_report_fee decimal(18,4);
    declare v_out_cancel_fee decimal(18,4);
    declare v_out_deli_fee decimal(18,4);
    declare v_out_service_fee decimal(18,4);
    declare v_out_other_fee decimal(18,4);
    declare v_out_brkage_commis decimal(18,4);
    declare v_out_other_commis decimal(18,4);
    declare v_busi_flag int;
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
    declare v_entry_money_jour_no bigint;
    declare v_entry_posi_jour_no bigint;
    declare v_deli_jour_no bigint;
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_curr_qty decimal(18,2);
    declare v_entry_exgp_posi_jour_no bigint;
    declare v_entry_asac_posi_jour_no bigint;

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_qry_no = p_qry_no;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_record_count = 0;
    SET v_row_id = 0;
    SET v_init_date = date_format(curdate(),'%Y%m%d');
    SET v_co_no = 0;
    SET v_pd_no = 0;
    SET v_exch_group_no = 0;
    SET v_asset_acco_no = 0;
    SET v_pass_no = 0;
    SET v_out_acco = " ";
    SET v_crncy_type = "CNY";
    SET v_exch_crncy_type = "CNY";
    SET v_exch_rate = 0;
    SET v_exch_no = 0;
    SET v_futu_acco_no = 0;
    SET v_contrc_code_no = 0;
    SET v_contrc_type = 0;
    SET v_contrc_unit = 0;
    SET v_strike_date = date_format(curdate(),'%Y%m%d');
    SET v_strike_time = date_format(curtime(),'%H%i%s');
    SET v_strike_no = " ";
    SET v_report_date = date_format(curdate(),'%Y%m%d');
    SET v_report_time = date_format(curtime(),'%H%i%s');
    SET v_report_no = " ";
    SET v_order_date = date_format(curdate(),'%Y%m%d');
    SET v_order_time = date_format(curtime(),'%H%i%s');
    SET v_order_no = 0;
    SET v_order_dir = 0;
    SET v_contrc_dir = 0;
    SET v_lngsht_type = 0;
    SET v_hedge_type = 0;
    SET v_order_price = 0;
    SET v_order_qty = 0;
    SET v_pre_settle_price = 0;
    SET v_sett_price = 0;
    SET v_strike_price = 0;
    SET v_strike_qty = 0;
    SET v_strike_amt = 0;
    SET v_strike_num = 0;
    SET v_pre_entry_qty = 0;
    SET v_pre_entry_amt = 0;
    SET v_rece_margin = 0;
    SET v_comb_code = " ";
    SET v_long_hold_margin = 0;
    SET v_short_hold_margin = 0;
    SET v_sett_capt_margin = 0;
    SET v_sett_close_pandl = 0;
    SET v_sett_marked_pandl = 0;
    SET v_sett_close_pandl_today = 0;
    SET v_all_fee = 0;
    SET v_report_fee = 0;
    SET v_wtdraw_fee = 0;
    SET v_deli_fee = 0;
    SET v_service_fee = 0;
    SET v_other_fee = 0;
    SET v_trade_commis = 0;
    SET v_other_commis = 0;
    SET v_out_all_fee = 0;
    SET v_out_report_fee = 0;
    SET v_out_cancel_fee = 0;
    SET v_out_deli_fee = 0;
    SET v_out_service_fee = 0;
    SET v_out_other_fee = 0;
    SET v_out_brkage_commis = 0;
    SET v_out_other_commis = 0;
    SET v_busi_flag = 0;
    SET v_entry_status = "0";
    SET v_undo_status = "0";
    SET v_entry_money_jour_no = 0;
    SET v_entry_posi_jour_no = 0;
    SET v_deli_jour_no = 0;
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_curr_qty = 0;
    SET v_entry_exgp_posi_jour_no = 0;
    SET v_entry_asac_posi_jour_no = 0;

    
    label_pro:BEGIN
    

    /* set @记录个数# = 0; */
    set v_record_count = 0;

    /* [锁定获取表记录变量][清算期货_结算_待入账记录表][字段][字段变量][{记录序号} = @查询序号# and {回滚状态}=《回滚状态-未回滚》][4][" "] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, lngsht_type, curr_qty, 
        hedge_type, pre_settle_price, sett_price, pre_entry_qty, 
        pre_entry_amt, busi_flag, entry_status, undo_status, 
        entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no into v_row_id, v_create_date, v_create_time, 
        v_update_date, v_update_time, v_update_times, v_init_date, 
        v_co_no, v_pd_no, v_exch_group_no, v_asset_acco_no, 
        v_pass_no, v_out_acco, v_crncy_type, v_exch_crncy_type, 
        v_exch_rate, v_exch_no, v_futu_acco_no, v_contrc_code_no, 
        v_contrc_type, v_contrc_unit, v_lngsht_type, v_curr_qty, 
        v_hedge_type, v_pre_settle_price, v_sett_price, v_pre_entry_qty, 
        v_pre_entry_amt, v_busi_flag, v_entry_status, v_undo_status, 
        v_entry_money_jour_no, v_entry_exgp_posi_jour_no, v_entry_asac_posi_jour_no, v_deli_jour_no from db_clfutu.tb_clfust_pre_entry where row_id = v_qry_no and undo_status="2" limit 1 for update;
    if FOUND_ROWS() = 0 then
                
        SET v_error_code = "clfutuA.3.44.4";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(" ","#",v_mysql_message);
        else
            SET v_error_info = " ";
        end if;
        leave label_pro;
    end if;


    /* set @记录个数# = 1; */
    set v_record_count = 1;

    /* [更新表记录][清算期货_结算_待入账记录表][{入账状态} = 《入账状态-未入账》, {回滚状态} =《回滚状态-已回滚》][{记录序号}=@记录序号#][2][@记录序号#] */
    set v_update_date = date_format(curdate(),'%Y%m%d');
    set v_update_time = date_format(curtime(),'%H%i%s');
    update db_clfutu.tb_clfust_pre_entry set update_date = v_update_date, update_time = v_update_time, update_times = update_times + 1, entry_status = "2", undo_status ="1" where row_id=v_row_id;
    if v_error_code = "1" then
                
        SET v_error_code = "clfutuA.3.44.2";
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
    SET p_record_count = v_record_count;
    SET p_row_id = v_row_id;
    SET p_init_date = v_init_date;
    SET p_co_no = v_co_no;
    SET p_pd_no = v_pd_no;
    SET p_exch_group_no = v_exch_group_no;
    SET p_asset_acco_no = v_asset_acco_no;
    SET p_pass_no = v_pass_no;
    SET p_out_acco = v_out_acco;
    SET p_crncy_type = v_crncy_type;
    SET p_exch_crncy_type = v_exch_crncy_type;
    SET p_exch_rate = v_exch_rate;
    SET p_exch_no = v_exch_no;
    SET p_futu_acco_no = v_futu_acco_no;
    SET p_contrc_code_no = v_contrc_code_no;
    SET p_contrc_type = v_contrc_type;
    SET p_contrc_unit = v_contrc_unit;
    SET p_strike_date = v_strike_date;
    SET p_strike_time = v_strike_time;
    SET p_strike_no = v_strike_no;
    SET p_report_date = v_report_date;
    SET p_report_time = v_report_time;
    SET p_report_no = v_report_no;
    SET p_order_date = v_order_date;
    SET p_order_time = v_order_time;
    SET p_order_no = v_order_no;
    SET p_order_dir = v_order_dir;
    SET p_contrc_dir = v_contrc_dir;
    SET p_lngsht_type = v_lngsht_type;
    SET p_hedge_type = v_hedge_type;
    SET p_order_price = v_order_price;
    SET p_order_qty = v_order_qty;
    SET p_pre_settle_price = v_pre_settle_price;
    SET p_sett_price = v_sett_price;
    SET p_strike_price = v_strike_price;
    SET p_strike_qty = v_strike_qty;
    SET p_strike_amt = v_strike_amt;
    SET p_strike_num = v_strike_num;
    SET p_pre_entry_qty = v_pre_entry_qty;
    SET p_pre_entry_amt = v_pre_entry_amt;
    SET p_rece_margin = v_rece_margin;
    SET p_comb_code = v_comb_code;
    SET p_long_hold_margin = v_long_hold_margin;
    SET p_short_hold_margin = v_short_hold_margin;
    SET p_sett_capt_margin = v_sett_capt_margin;
    SET p_sett_close_pandl = v_sett_close_pandl;
    SET p_sett_marked_pandl = v_sett_marked_pandl;
    SET p_sett_close_pandl_today = v_sett_close_pandl_today;
    SET p_all_fee = v_all_fee;
    SET p_report_fee = v_report_fee;
    SET p_wtdraw_fee = v_wtdraw_fee;
    SET p_deli_fee = v_deli_fee;
    SET p_service_fee = v_service_fee;
    SET p_other_fee = v_other_fee;
    SET p_trade_commis = v_trade_commis;
    SET p_other_commis = v_other_commis;
    SET p_out_all_fee = v_out_all_fee;
    SET p_out_report_fee = v_out_report_fee;
    SET p_out_cancel_fee = v_out_cancel_fee;
    SET p_out_deli_fee = v_out_deli_fee;
    SET p_out_service_fee = v_out_service_fee;
    SET p_out_other_fee = v_out_other_fee;
    SET p_out_brkage_commis = v_out_brkage_commis;
    SET p_out_other_commis = v_out_other_commis;
    SET p_busi_flag = v_busi_flag;
    SET p_entry_status = v_entry_status;
    SET p_undo_status = v_undo_status;
    SET p_entry_money_jour_no = v_entry_money_jour_no;
    SET p_entry_posi_jour_no = v_entry_posi_jour_no;
    SET p_deli_jour_no = v_deli_jour_no;

END;;


DELIMITER ;;
use db_clfutu;;

# 原子_清算期货_结算_查询待入账记录
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clfust_QueryPreEntry;;
DELIMITER ;;
CREATE PROCEDURE pra_clfust_QueryPreEntry(
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
    IN p_exch_no_str varchar(2048),
    IN p_futu_acco_no int,
    IN p_contrc_code_no int,
    IN p_crncy_type_str varchar(2048),
    IN p_entry_status varchar(2),
    IN p_undo_status varchar(2),
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
    declare v_exch_no_str varchar(2048);
    declare v_futu_acco_no int;
    declare v_contrc_code_no int;
    declare v_crncy_type_str varchar(2048);
    declare v_entry_status varchar(2);
    declare v_undo_status varchar(2);
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
    SET v_exch_no_str = p_exch_no_str;
    SET v_futu_acco_no = p_futu_acco_no;
    SET v_contrc_code_no = p_contrc_code_no;
    SET v_crncy_type_str = p_crncy_type_str;
    SET v_entry_status = p_entry_status;
    SET v_undo_status = p_undo_status;
    SET v_row_id = p_row_id;
    SET v_row_count = p_row_count;
    SET v_error_code = "0";
    SET v_error_info = " ";

    
    label_pro:BEGIN
    

    /* [获取表记录][清算期货_结算_待入账记录表][字段][(@机构编号#=0 or {机构编号}=@机构编号#) and (@产品编号#=0 or {产品编号}=@产品编号#) and (@交易组编号#=0 or {交易组编号}=@交易组编号#) and (@资产账户编号#=0 or {资产账户编号}=@资产账户编号#) and (@市场编号串#=" " or instr(@市场编号串#, concat(";",{市场编号},";"))>0) and (@交易编码编号#=0 or {交易编码编号}=@交易编码编号#) and (@合约代码编号#=0 or {合约代码编号}=@合约代码编号#) and (@本币币种串#=" " or instr(@本币币种串#, concat(";",{本币币种},";"))>0) and (@记录序号#=0 or {记录序号}>@记录序号#) and (@入账状态# = " " or {入账状态}=@入账状态#) and (@回滚状态# = " " or {回滚状态}=@回滚状态#) order by {记录序号}][@指定行数#] */
    if v_row_count = -1 then
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, lngsht_type, curr_qty, 
        hedge_type, pre_settle_price, sett_price, pre_entry_qty, 
        pre_entry_amt, busi_flag, entry_status, undo_status, 
        entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no from db_clfutu.tb_clfust_pre_entry where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) order by row_id;
    else
        select row_id, create_date, create_time, 
        update_date, update_time, update_times, init_date, 
        co_no, pd_no, exch_group_no, asset_acco_no, 
        pass_no, out_acco, crncy_type, exch_crncy_type, 
        exch_rate, exch_no, futu_acco_no, contrc_code_no, 
        contrc_type, contrc_unit, lngsht_type, curr_qty, 
        hedge_type, pre_settle_price, sett_price, pre_entry_qty, 
        pre_entry_amt, busi_flag, entry_status, undo_status, 
        entry_money_jour_no, entry_exgp_posi_jour_no, entry_asac_posi_jour_no, deli_jour_no from db_clfutu.tb_clfust_pre_entry where (v_co_no=0 or co_no=v_co_no) and (v_pd_no=0 or pd_no=v_pd_no) and (v_exch_group_no=0 or exch_group_no=v_exch_group_no) and (v_asset_acco_no=0 or asset_acco_no=v_asset_acco_no) and (v_exch_no_str=" " or instr(v_exch_no_str, concat(";",exch_no,";"))>0) and (v_futu_acco_no=0 or futu_acco_no=v_futu_acco_no) and (v_contrc_code_no=0 or contrc_code_no=v_contrc_code_no) and (v_crncy_type_str=" " or instr(v_crncy_type_str, concat(";",crncy_type,";"))>0) and (v_row_id=0 or row_id>v_row_id) and (v_entry_status = " " or entry_status=v_entry_status) and (v_undo_status = " " or undo_status=v_undo_status) order by row_id limit v_row_count;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


