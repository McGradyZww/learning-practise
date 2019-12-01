DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_基础数据同步_查询公司行为表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsebasync_QueryCompanyActionTable;;
DELIMITER ;;
CREATE PROCEDURE pra_clsebasync_QueryCompanyActionTable(
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
    

    /* [获取表全记录][清算证券_结算_公司行为表][字段][1=1] */
    select row_id, create_date, create_time, 
        update_date, update_time, update_times, exch_no, 
        stock_code_no, stock_type, asset_type, crncy_type, 
        par_value, divi_cacl_num, divi_amt, divi_qty, 
        equity_trans_qty, rights_issue_qty, placement_price, notice_date, 
        reg_date, ex_date, arrive_date, begin_trade_date, 
        deal_flag, busi_flag from db_clsecu.tb_clsest_co_action where 1=1;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;



END;;


DELIMITER ;;
use db_clsecu;;

# 原子_清算证券_基础数据同步_更新公司行为表
DELIMITER ;;
DROP PROCEDURE IF EXISTS pra_clsebasync_UpdateCompanyActionTable;;
DELIMITER ;;
CREATE PROCEDURE pra_clsebasync_UpdateCompanyActionTable(
    IN p_opor_co_no int,
    IN p_opor_no int,
    IN p_oper_mac varchar(32),
    IN p_oper_ip_addr varchar(32),
    IN p_oper_info varchar(1024),
    IN p_oper_way varchar(2),
    IN p_func_code varchar(16),
    IN p_exch_no int,
    IN p_stock_code_no int,
    IN p_stock_type int,
    IN p_asset_type int,
    IN p_crncy_type varchar(3),
    IN p_par_value decimal(16,9),
    IN p_divi_cacl_num int,
    IN p_divi_amt decimal(18,4),
    IN p_divi_qty decimal(18,2),
    IN p_equity_trans_qty decimal(18,2),
    IN p_rights_issue_qty decimal(18,2),
    IN p_placement_price decimal(16,9),
    IN p_notice_date int,
    IN p_reg_date int,
    IN p_ex_date int,
    IN p_arrive_date int,
    IN p_begin_trade_date int,
    IN p_deal_flag int,
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
    declare v_exch_no int;
    declare v_stock_code_no int;
    declare v_stock_type int;
    declare v_asset_type int;
    declare v_crncy_type varchar(3);
    declare v_par_value decimal(16,9);
    declare v_divi_cacl_num int;
    declare v_divi_amt decimal(18,4);
    declare v_divi_qty decimal(18,2);
    declare v_equity_trans_qty decimal(18,2);
    declare v_rights_issue_qty decimal(18,2);
    declare v_placement_price decimal(16,9);
    declare v_notice_date int;
    declare v_reg_date int;
    declare v_ex_date int;
    declare v_arrive_date int;
    declare v_begin_trade_date int;
    declare v_deal_flag int;
    declare v_busi_flag int;
    declare v_error_code varchar(32);
    declare v_error_info varchar(255);
    declare v_create_date int;
    declare v_create_time int;
    declare v_update_date int;
    declare v_update_time int;
    declare v_update_times int;
    declare v_stock_code varchar(6);

    DECLARE v_mysql_number int DEFAULT 0;
    DECLARE v_mysql_row_count int DEFAULT 0;
    DECLARE v_mysql_sqlstate varchar(32) DEFAULT "";
    DECLARE v_mysql_message varchar(255) DEFAULT "";
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS v_mysql_number = NUMBER, v_mysql_row_count = ROW_COUNT;
        GET DIAGNOSTICS CONDITION 1 v_mysql_sqlstate = RETURNED_SQLSTATE, v_mysql_message = MESSAGE_TEXT;
        set v_error_code = "1";
        set v_error_info = v_mysql_message;
    END;


    SET v_opor_co_no = p_opor_co_no;
    SET v_opor_no = p_opor_no;
    SET v_oper_mac = p_oper_mac;
    SET v_oper_ip_addr = p_oper_ip_addr;
    SET v_oper_info = p_oper_info;
    SET v_oper_way = p_oper_way;
    SET v_func_code = p_func_code;
    SET v_exch_no = p_exch_no;
    SET v_stock_code_no = p_stock_code_no;
    SET v_stock_type = p_stock_type;
    SET v_asset_type = p_asset_type;
    SET v_crncy_type = p_crncy_type;
    SET v_par_value = p_par_value;
    SET v_divi_cacl_num = p_divi_cacl_num;
    SET v_divi_amt = p_divi_amt;
    SET v_divi_qty = p_divi_qty;
    SET v_equity_trans_qty = p_equity_trans_qty;
    SET v_rights_issue_qty = p_rights_issue_qty;
    SET v_placement_price = p_placement_price;
    SET v_notice_date = p_notice_date;
    SET v_reg_date = p_reg_date;
    SET v_ex_date = p_ex_date;
    SET v_arrive_date = p_arrive_date;
    SET v_begin_trade_date = p_begin_trade_date;
    SET v_deal_flag = p_deal_flag;
    SET v_busi_flag = p_busi_flag;
    SET v_error_code = "0";
    SET v_error_info = " ";
    SET v_create_date = date_format(curdate(),'%Y%m%d');
    SET v_create_time = date_format(curtime(),'%H%i%s');
    SET v_update_date = date_format(curdate(),'%Y%m%d');
    SET v_update_time = date_format(curtime(),'%H%i%s');
    SET v_update_times = 1;
    SET v_stock_code = " ";

    
    label_pro:BEGIN
    

    /* [插入重复更新][清算证券_结算_公司行为表][字段][字段变量][{资产类型}=@资产类型#,{本币币种}=@本币币种#,{票面面值}=@票面面值#,{行为单位}=@行为单位#,{分红金额}=@分红金额#,{红股数量}=@红股数量#,{转赠数量}=@转赠数量#,{配股数量}=@配股数量#,{配股价格}=@配股价格#,{公告日期}=@公告日期#,{登记日期}=@登记日期#,{除权日期}=@除权日期#,{到账日期}=@到账日期#,{上市日期}=@上市日期#,{处理标志}=@处理标志#,{业务标志}=@业务标志#][1][@市场编号#,@证券代码#,@证券代码编号#,@业务标志#] */
    set v_create_date = date_format(curdate(),'%Y%m%d');
    set v_create_time = date_format(curtime(),'%H%i%s');
    set v_update_date = v_create_date;
    set v_update_time = v_create_time;
    set v_update_times = 1;
    insert into db_clsecu.tb_clsest_co_action (
        create_date, create_time, update_date, 
        update_time, update_times, exch_no, stock_code_no, 
        stock_type, asset_type, crncy_type, par_value, 
        divi_cacl_num, divi_amt, divi_qty, equity_trans_qty, 
        rights_issue_qty, placement_price, notice_date, reg_date, 
        ex_date, arrive_date, begin_trade_date, deal_flag, 
        busi_flag) 
    values(
        v_create_date, v_create_time, v_update_date, 
        v_update_time, v_update_times, v_exch_no, v_stock_code_no, 
        v_stock_type, v_asset_type, v_crncy_type, v_par_value, 
        v_divi_cacl_num, v_divi_amt, v_divi_qty, v_equity_trans_qty, 
        v_rights_issue_qty, v_placement_price, v_notice_date, v_reg_date, 
        v_ex_date, v_arrive_date, v_begin_trade_date, v_deal_flag, 
        v_busi_flag) 
    ON DUPLICATE KEY UPDATE update_date = v_update_date, update_time = v_update_time, update_times = update_times+1, asset_type=v_asset_type,crncy_type=v_crncy_type,par_value=v_par_value,divi_cacl_num=v_divi_cacl_num,divi_amt=v_divi_amt,divi_qty=v_divi_qty,equity_trans_qty=v_equity_trans_qty,rights_issue_qty=v_rights_issue_qty,placement_price=v_placement_price,notice_date=v_notice_date,reg_date=v_reg_date,ex_date=v_ex_date,arrive_date=v_arrive_date,begin_trade_date=v_begin_trade_date,deal_flag=v_deal_flag,busi_flag=v_busi_flag;
    if v_error_code = "1" then
                
        SET v_error_code = "clsecuA.4.102.1";
        if v_mysql_message <> "" then
            SET v_error_info = CONCAT(concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no,",","业务标志=",v_busi_flag),"#",v_mysql_message);
        else
            SET v_error_info = concat("市场编号=",v_exch_no,",","证券代码=",v_stock_code,",","证券代码编号=",v_stock_code_no,",","业务标志=",v_busi_flag);
        end if;
        leave label_pro;
    end if;

    END;

    SET p_error_code = v_error_code;
    SET p_error_info = v_error_info;

END;;


